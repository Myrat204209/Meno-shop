// import 'package:app_ui/app_ui.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'view/view.dart';

void main() {
//   bootStrap((
//     sharedPreferences,
//     exceptionStream,
//   ) async {
//     /// Constants
//     /// TODO: Change baseURL with ENV URL
//     const defaultBaseUrl = 'http://192.168.43.28:3000/api/v1';

//     /// Storages
//     final tokenStorage = InMemoryTokenStorage();
//     const secureStorage = SecureStorage();
//     const userStorage = UserStorage(storage: secureStorage);

//     /// HTTP Client
//     final httpClient = Http(
//       defaultBaseUrl: defaultBaseUrl,
//       tokenProvider: tokenStorage.readToken,
//     );

//     /// Authentication and User
//     final authenticationClient = AuthenticationClient(
//       httpClient: httpClient,
//       tokenStorage: tokenStorage,
//     );
//     //TODO: Create profileClient repo
//     final userRepository = UserRepository(
//       authenticationClient: authenticationClient,
//       storage: userStorage,
//     );
//     return App(
//       userRepository: userRepository,
//       exceptionStream: exceptionStream,
//     );
//   });

//   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScreenUtilInit(
          designSize: const Size(360, 800),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: '.shop',
            theme: ThemeData(
              scaffoldBackgroundColor: UIColors.quaterniary,
              colorScheme: ColorScheme.fromSeed(
                seedColor: UIColors.secondary,
              ),
              fontFamily: 'Poppins',
            ),
            home: const MainPage(),
          ),
        );
      },
    );
  }
}
