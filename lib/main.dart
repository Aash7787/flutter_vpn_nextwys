import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vpn/src/router/routes.dart';
import 'package:flutter_vpn/src/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
// <<<<<<< bkr
//     return ScreenUtilInit(
//       minTextAdapt: true,
//       splitScreenMode: true,
//       designSize: const Size(375, 812),
//       builder: (context, child) {
//         return SafeArea(
//           child: MaterialApp(
//             debugShowCheckedModeBanner: false,
//             home: MaterialApp.router(
//               debugShowCheckedModeBanner: false,
//               theme: AppTheme.instance.lightTheme,
//               routerDelegate: MyAppRouter.router.routerDelegate,
//               routeInformationParser: MyAppRouter.router.routeInformationParser,
//               routeInformationProvider:
//                   MyAppRouter.router.routeInformationProvider,
//             ),
//           ),
//         );
//       },
// =======
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: AppTheme.instance.lightTheme, // Light Theme
      darkTheme: AppTheme.instance.darkTheme, // Dark Theme
      onGenerateRoute: onGenRoute,
      initialRoute: HomePage.route,
// >>>>>>> master
    );
  }
}
