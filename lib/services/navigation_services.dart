// import 'package:wander/constants/app_exports.dart';
//
// class Routes {
//   static const String appCurrentLocation = "/appCurrentLocation";
// }
//
// class NavigationServices {
//   static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//   static BuildContext get context => navigatorKey.currentContext!;
//
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.appCurrentLocation:
//         return MaterialPageRoute(builder: (_) => const AppCurrentLocation());
//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(child: Text('No route defined for ${settings.name}')),
//           ),
//         );
//     }
//   }
// }