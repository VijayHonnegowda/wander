// import 'package:wander/constants/app_exports.dart';
//
// class Routes {
//   static const String login = "/login";
//   static const String homeScreen = "/homeScreen";
// }
//
// class NavigationServices {
//   static final GlobalKey<NavigatorState> navigatorKey =
//       GlobalKey<NavigatorState>();
//
//   static BuildContext get context => navigatorKey.currentContext!;
//
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.login:
//         return MaterialPageRoute(builder: (_) => const Login());
//       case Routes.homeScreen:
//         return MaterialPageRoute(builder: (_) => const HomeScreen());
//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(child: Text('No route defined for ${settings.name}')),
//           ),
//         );
//     }
//   }
// }
