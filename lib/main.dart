import 'package:flutter/material.dart';
import 'package:flutter_apra/app_routing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: AppRouting());
  }
}
