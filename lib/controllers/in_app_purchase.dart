import 'dart:async';
import 'dart:io';

import 'package:in_app_purchase/in_app_purchase.dart';

class InAppPurchaseService {
  final InAppPurchaseConnection _inAppPurchaseConnection =
      InAppPurchaseConnection.instance;
  StreamSubscription _subscription;

  static String _productId1 = 'product_id1';
  final Set<String> _productIds = <String>{_productId1};

  InAppPurchaseService() {
    _startSubscriptionStream();
  }

  StreamSubscription get subscription => _subscription;

  Future _startSubscriptionStream() async {
    final Stream purchaseUpdates =
        _inAppPurchaseConnection.purchaseUpdatedStream;
    _subscription = purchaseUpdates.listen((purchases) async {
      _listenToPurchases(purchases);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      print(error);
    });
  }

  void _listenToPurchases(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((purchaseDetails) async {
      if (purchaseDetails == null && Platform.isIOS) {
        await _inAppPurchaseConnection.refreshPurchaseVerificationData();
      }

      if (purchaseDetails.status != null) {
        switch (purchaseDetails.status) {
          case PurchaseStatus.pending:
            print("pending");
            break;
          case PurchaseStatus.purchased:
            await _inAppPurchaseConnection.completePurchase(purchaseDetails);
            // update your database or app_preference by marking purchased
            print("purchased");
            break;
          case PurchaseStatus.error:
            // Additionally on iOS, the purchase needs to be completed if the [PurchaseDetails.status] is [PurchaseStatus.error].
            if (Platform.isIOS)
              await _inAppPurchaseConnection.completePurchase(purchaseDetails);
            print("error");
            break;
        }

        if (Platform.isAndroid) {
          await _inAppPurchaseConnection.consumePurchase(purchaseDetails);
        }

        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchaseConnection.completePurchase(purchaseDetails);
        }
      }
    });
  }

  Future<bool> isAvailable() async =>
      await _inAppPurchaseConnection.isAvailable();

  Future<bool> buyConsumable(ProductDetails productDetails,
      {bool sandboxTesting = false}) async {
    final PurchaseParam purchaseParam = PurchaseParam(
        productDetails: productDetails, sandboxTesting: sandboxTesting);
    bool status = await _inAppPurchaseConnection.buyConsumable(
        purchaseParam: purchaseParam);
    return status;
  }

  Future<bool> buyNonConsumable(ProductDetails productDetails,
      {bool sandboxTesting = false}) async {
    final PurchaseParam purchaseParam = PurchaseParam(
        productDetails: productDetails, sandboxTesting: sandboxTesting);
    bool status = await _inAppPurchaseConnection.buyNonConsumable(
        purchaseParam: purchaseParam);
    return status;
  }

  Future<List<ProductDetails>> getAvailableProducts() async {
    ProductDetailsResponse productDetailQueryResponse =
        await _inAppPurchaseConnection.queryProductDetails(_productIds);

    print("Not found Id's ${productDetailQueryResponse.notFoundIDs}");

    return Future.value(productDetailQueryResponse.error == null
        ? productDetailQueryResponse.productDetails
        : <ProductDetails>[]);
  }

  Future<List<PurchaseDetails>> getPastPurchases() async {
    QueryPurchaseDetailsResponse purchaseDetailsResponse =
        await _inAppPurchaseConnection.queryPastPurchases();

    return Future.value(purchaseDetailsResponse.error == null
        ? purchaseDetailsResponse.pastPurchases
        : <PurchaseDetails>[]);
  }
}
