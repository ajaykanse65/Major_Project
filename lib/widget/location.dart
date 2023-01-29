// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//
// class Loaction extends StatefulWidget {
//   const Loaction({Key? key}) : super(key: key);
//
//   @override
//   State<Loaction> createState() => _LoactionState();
// }
//
// class _LoactionState extends State<Loaction> {
//
//   static const _initialCameraPosition = CameraPosition(
//     target: LatLng(19.189176138216553, 72.81959344047421),
//     zoom: 20.5,
//   );
//
//   late GoogleMapController _googleMapController;
//
//   @override
//   void dispose() {
//     _googleMapController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       initialCameraPosition: _initialCameraPosition,
//       zoomControlsEnabled: false,
//       myLocationButtonEnabled: false,
//       onMapCreated: (controller) => _googleMapController = controller,
//     );
//   }
// }
