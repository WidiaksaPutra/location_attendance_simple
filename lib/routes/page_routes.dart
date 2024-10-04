import 'package:go_router/go_router.dart';
import 'package:mobile_attendance/home.dart';
import 'package:mobile_attendance/maps_clien_location_post.dart';
import 'package:mobile_attendance/maps_location_get.dart';
import 'package:mobile_attendance/maps_base_location_post.dart';
import 'package:mobile_attendance/routes/route_name.dart';

abstract class AppRoutes{
  static GoRouter pages = GoRouter(
    routes: [
      GoRoute(path: RouteName.home, builder: (context, state) => Home()),
      GoRoute(path: RouteName.mapsGet, builder: (context, state) => MapsLocationGet()),
      GoRoute(path: RouteName.mapsPost, builder: (context, state) => MapsBaseLocationPost()),
      GoRoute(path: RouteName.mapsPostClien, builder: (context, state) => MapsClienLocationPost()),
    ],
  ); 
}