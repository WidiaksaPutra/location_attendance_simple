// // ignore_for_file: unused_element, prefer_final_fields, avoid_init_to_null, unused_field

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// final fetchMapsLocationPostRiverpod = StateNotifierProvider.autoDispose<MapsLocationPostRiverpod, bool>((ref) {
//   final fetchMapsLocationPostRiverpodNotifier = MapsLocationPostRiverpod();
//   return fetchMapsLocationPostRiverpodNotifier;
// });

// class MapsLocationPostRiverpod extends StateNotifier<bool>{
//   late double _latitude = -8.656457725007472;
//   late double _longitude = 115.21773856133223;
//   late LatLng? _tappedLocation = null;
//   late double _currentZoomLevel = 13.0;
//   late Set<Marker> _kGoogleMarker = {};
//   MapsLocationPostRiverpod() : super(false);
  
//   GoogleMapController onMapCreated(GoogleMapController controller) {
//     return controller;
//   }
  
//   void onTap(LatLng latLng) {
//     _tappedLocation = latLng;
//     _latitude = latLng.latitude;
//     _longitude = latLng.longitude;
//     _kGoogleMarker.clear(); // Hapus marker lama jika ada
//     _kGoogleMarker.add(
//       Marker(
//         markerId: const MarkerId('tapped_location'),
//         position: latLng,
//         infoWindow: InfoWindow(
//           title: 'Tapped Location',
//           snippet: 'Lat: ${latLng.latitude}, Lng: ${latLng.longitude}',
//         ),
//       ),
//     );
//   }

//   double get latitude => _latitude;
//   double get longitude => _longitude;
//   LatLng? get tappedLocation => _tappedLocation;
//   double get currentZoomLevel => _currentZoomLevel;
//   Set<Marker> get kGoogleMarker => _kGoogleMarker;
// }