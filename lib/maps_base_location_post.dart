// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance/controller/mixin/mixin_shared_pref.dart';
import 'package:mobile_attendance/routes/route_name.dart';

final _tappedLocation = StateProvider.autoDispose<LatLng?>((ref) => null);
final _currentZoomLevel = StateProvider.autoDispose<double>((ref) => 13.0);
final _kGoogleMarker = StateProvider.autoDispose<Set<Marker>>((ref) => {});
final _mapController = StateProvider.autoDispose<GoogleMapController?>((ref) => null);
final _latitude = StateProvider.autoDispose<double>((ref) => -8.656457725007472);
final _longitude = StateProvider.autoDispose<double>((ref) => 115.21773856133223);

class MapsBaseLocationPost extends ConsumerWidget with SharedPref{
  MapsBaseLocationPost({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(Duration.zero,() async{
      await sharedPref();
    });
    
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(ref.watch(_latitude), ref.watch(_longitude)),
      zoom: ref.watch(_currentZoomLevel),
    );

    void _onMapCreated(GoogleMapController controller) {
      ref.read(_mapController.notifier).state = controller;
    }

    void _onTap(LatLng latLng) {
      ref.read(_tappedLocation.notifier).state = latLng;
      ref.read(_latitude.notifier).state = latLng.latitude;
      ref.read(_longitude.notifier).state = latLng.longitude;
      ref.read(_kGoogleMarker.notifier).state.clear(); // Hapus marker lama jika ada
      ref.read(_kGoogleMarker.notifier).state.add(
        Marker(
          markerId: const MarkerId('tapped_location'),
          position: latLng,
          infoWindow: InfoWindow(
            title: 'Tapped Location',
            snippet: 'Lat: ${latLng.latitude}, Lng: ${latLng.longitude}',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    }
    
    Circle circle = Circle(
      circleId: const CircleId('circle_id'),
      center: LatLng(ref.watch(_latitude), ref.watch(_longitude)),
      radius: 2000.0,
      strokeColor: Colors.blue.withOpacity(0.5),
      strokeWidth: 2,
      fillColor: Colors.blue.withOpacity(0.3),
    );

    return Scaffold(
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.go(RouteName.home),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
          const Text('Google Maps'),
          (ref.watch(_tappedLocation) != null)
          ? IconButton(
              onPressed: (){
                prefs.setDouble('latitude', ref.watch(_latitude));
                prefs.setDouble('longitude', ref.watch(_longitude));
                prefs.setDouble('currentZoomLevel', ref.watch(_currentZoomLevel));
                context.go(RouteName.mapsGet);
              },
              icon: const Icon(Icons.check, color: Colors.purple),
            )
          : const SizedBox(),
        ],
      ),),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart, 
        children: [
          Expanded(
            child: GoogleMap(
              circles: {circle},
              onMapCreated: _onMapCreated,
              mapType: MapType.normal,
              markers: ref.watch(_kGoogleMarker),
              onTap: _onTap,
              initialCameraPosition: _kGooglePlex,
              onCameraMove: (CameraPosition position){
                ref.read(_currentZoomLevel.notifier).state = position.zoom;
              },
            ),
          ),
        ],
      ),
    );
  }
}


// child: Container(
//   margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
//   padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
//   decoration: BoxDecoration(
//     color: Colors.purple,
//     borderRadius:  BorderRadius.circular(5.r)
//   ),
//   child: const Icon(Icons.add, color: Colors.white,),
// ),