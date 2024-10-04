// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field, must_be_immutable, prefer_const_constructors, unused_element, await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance/controller/mixin/mixin_shared_pref.dart';
import 'package:mobile_attendance/routes/route_name.dart';

final _latitude = StateProvider.autoDispose<double?>((ref) => 0.0);
final _longitude = StateProvider.autoDispose<double?>((ref) => 0.0);
final _currentZoomLevel = StateProvider.autoDispose<double?>((ref) => 13.0);

final _latitudeClien = StateProvider.autoDispose<double?>((ref) => 0.0);
final _longitudeClien = StateProvider.autoDispose<double?>((ref) => 0.0);

class MapsLocationGet extends ConsumerWidget with SharedPref{
  MapsLocationGet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(Duration.zero, () async{
      await sharedPref();  
      ref.read(_latitude.notifier).state = prefs.getDouble('latitude')!;
      ref.read(_longitude.notifier).state = prefs.getDouble('longitude')!;
      ref.read(_currentZoomLevel.notifier).state = prefs.getDouble('currentZoomLevel')!;
    
      ref.read(_latitudeClien.notifier).state = prefs.getDouble('latitude_clien')!;
      ref.read(_longitudeClien.notifier).state = prefs.getDouble('longitude_clien')!;
    });
    late double _lat = ref.watch(_latitude)!;
    late double _lang = ref.watch(_longitude)!;

    late double _latClien = ref.watch(_latitudeClien)!;
    late double _langClien = ref.watch(_longitudeClien)!;

    List<Marker> _kGoogleMarker = [
      Marker(
        markerId: const MarkerId('_kGooglePlex'),
        infoWindow: const InfoWindow(title: 'Your Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(_lat, _lang),
      ),
      Marker(
        markerId: const MarkerId('_kGooglePlex'),
        infoWindow: const InfoWindow(title: 'Your Location'),
        position: LatLng(_latClien, _langClien),
      ),
    ];

    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(_lat, _lang),
      zoom: ref.watch(_currentZoomLevel)!,
    );

    Circle circle = Circle(
      circleId: const CircleId('circle_id'),
      center: LatLng(_lat, _lang),
      radius: 2000.0,
      strokeColor: Colors.blue.withOpacity(0.5),
      strokeWidth: 2,
      fillColor: Colors.blue.withOpacity(0.3),
    );
    
    void _showNotification() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Notification'),
            content: Text('clian sudah berada dilingkup radius...'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    void _checkMarkerWithinRadius() async {
      double distance = await Geolocator.distanceBetween(
        _lat,
        _lang,
        _latClien,
        _langClien,
      );
      if (distance <= 2000.0 && distance != 0.0) {
        _showNotification();
      }
    }
    _checkMarkerWithinRadius();

    return Scaffold(
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.go(RouteName.home),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
          const Text('Google Maps'),
          const SizedBox(),
        ],
      ),),
      body: Column(
        children: [
          (_lat == 0.0)
          ? Text("loading...")
          : Expanded(
              child: GoogleMap(
                circles: {circle},
                mapType: MapType.normal,
                markers: Set<Marker>.of(_kGoogleMarker),
                initialCameraPosition: _kGooglePlex,
              ),
            ),
        ],
      ),
    );
  }
}