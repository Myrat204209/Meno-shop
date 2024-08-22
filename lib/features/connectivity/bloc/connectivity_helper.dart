// part of 'connectivity_bloc.dart';

// class ConnectivityHelper {
//   static void monitorNetwork() {
//     Connectivity()
//         .onConnectivityChanged
//         .listen((List<ConnectivityResult> result) {
//       // if (result == ConnectivityResult.)
//       log('connectionState is: ${result.toString()}');
//       if (result.last == ConnectivityResult.none) {
//         ConnectivityBloc().add(const ConnectivityInformed());
//       } else {
//         ConnectivityBloc()
//             .add(const ConnectivityInformed(hasConnectivity: true));
//       }
//     });
//     // Connectivity().onConnectivityChanged.listen(
//     //   (ConnectivityResult result) {
//     //   if (result == ConnectivityResult.none) {
//     //     ConnectivityBloc().add(const ConnectivityInformed());
//     //   } else {
//     //     ConnectivityBloc().add(const ConnectivityInformed(hasConnectivity: true));
//     //   }
//     // });
//   }
// }
