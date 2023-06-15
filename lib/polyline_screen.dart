import 'dart:async';

import 'package:wander/constants/app_exports.dart';

class PolylineScreen extends StatefulWidget {
  const PolylineScreen({super.key});

  @override
  State<PolylineScreen> createState() => _PolylineScreenState();
}

class _PolylineScreenState extends State<PolylineScreen> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex =
      const CameraPosition(target: LatLng(12.984121, 77.515016), zoom: 14);

  final Set<Marker> _marker = {};
  final Set<Polyline> _polyline = {};

  List<LatLng> latlng = [
    const LatLng(12.984121, 77.515016),
    const LatLng(13.014652, 77.670264),
    const LatLng(12.941089, 77.667985),
  ];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < latlng.length; i++) {
      _marker.add(
        Marker(
            markerId: MarkerId(i.toString()),
            position: latlng[i],
            infoWindow: const InfoWindow(
                title: "Really cool place", snippet: '5 star rating'),
            icon: BitmapDescriptor.defaultMarker),
      );
      setState(() {});
      _polyline.add(
        Polyline(
            polylineId: const PolylineId("1"),
            color: Colors.purple,
            width: 2 ,
            points: latlng),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Polyline screen"),
      ),
      body: GoogleMap(
        markers: _marker,
        initialCameraPosition: _kGooglePlex,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        polylines: _polyline,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
