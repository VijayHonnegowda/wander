import 'dart:async';

import 'package:wander/constants/app_exports.dart';

class MapLocation extends StatefulWidget {
  const MapLocation({super.key});

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition kGooglePlex =
      CameraPosition(target: LatLng(12.9043423, 77.5581816), zoom: 14);

  List<Marker> marker = [];
  List<Marker> list = [
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(12.90434, 77.55818),
      infoWindow: InfoWindow(
        title: "My current location",
      ),
    ),
    Marker(
      markerId: MarkerId("2"),
      position: LatLng(12.904, 77.558),
      infoWindow: InfoWindow(
        title: "My home",
      ),
    ),
    Marker(
      markerId: MarkerId("3"),
      position: LatLng(12.90, 77.55),
      infoWindow: InfoWindow(
        title: "F1",
      ),
    ),
    Marker(
      markerId: MarkerId("4"),
      position: LatLng(12.9, 77.8),
      infoWindow: InfoWindow(
        title: "F2",
      ),
    ),
  ];

  loadData() async {
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(12.2958, 76.6394), zoom: 14),
      ),
    );
    getUserCurrentLocation().then((value) async {
      print('My current location');
      print(value.latitude.toString() + " " + value.longitude.toString());

      marker.add(
        Marker(
          markerId: MarkerId("2"),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(title: "My currnet location"),
        ),
      );
    });
    setState(() {});
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    marker.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          mapType: MapType.normal,
          compassEnabled: false,
          myLocationEnabled: true,
          markers: Set<Marker>.of(marker),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_disabled_outlined),
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(12.2958, 76.6394), zoom: 14),
            ),
          );
          getUserCurrentLocation().then((value) async {
            print('My current location');
            print(value.latitude.toString() + " " + value.longitude.toString());

            marker.add(
              Marker(
                markerId: MarkerId("2"),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: InfoWindow(title: "My currnet location"),
              ),
            );
          });
          setState(() {});
        },
      ),
    );
  }
}
