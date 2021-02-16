// import 'package:firebase_remote_config/firebase_remote_config.dart';

// // Initialise RemoteConfigService in main.dart
// // RemoteConfigService configService = await RemoteConfigService.getInstance();
// //   await configService.initialise();

// // Get the values by 
// // String example = configService.example;

// const String Example = "example";

// class RemoteConfigService {
//   final RemoteConfig _remoteConfig;
//   final defaults = <String, dynamic>{
//     Example: "example_list",
//   };

//   static RemoteConfigService _instance;
//   static Future<RemoteConfigService> getInstance() async {
//     if (_instance == null) {
//       _instance = RemoteConfigService(
//         remoteConfig: await RemoteConfig.instance,
//       );
//     }

//     return _instance;
//   }

//   RemoteConfigService({RemoteConfig remoteConfig})
//       : _remoteConfig = remoteConfig;

//   dynamic get example => _remoteConfig.getString(Example);

//   Future initialise() async {
//     try {
//       await _remoteConfig.setDefaults(defaults);
//       await _fetchAndActivate();
//     } on FetchThrottledException catch (e) {
//       print('Remote config fetch throttled: $e');
//     } catch (e) {
//       print(
//           'Unable to fetch remote config. Cached or default values will be used');
//     }
//   }

//   Future _fetchAndActivate() async {
//     await _remoteConfig.fetch(expiration: const Duration(hours: 1));
//     await _remoteConfig.activateFetched();
//   }
// }
