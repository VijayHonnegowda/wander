import 'dart:async';
import 'dart:collection';
import 'package:wander/constants/app_exports.dart';

class PolyGonScreen extends StatefulWidget {
  const PolyGonScreen({super.key});

  @override
  State<PolyGonScreen> createState() => _PolyGonScreenState();
}

class _PolyGonScreenState extends State<PolyGonScreen> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(12.909858, 77.480121), zoom: 14);

  final Set<Marker> _marker = {};
  final Set<Polygon> _polygon = HashSet<Polygon>();

  @override
  void initState() {
    super.initState();

    _polygon.add(
      Polygon(
          polygonId: const PolygonId("1"),
          points: points,
          fillColor: Colors.redAccent,
          geodesic: true,
          strokeWidth: 4),
    );
  }

  List<LatLng> points = [
    LatLng(12.909858, 77.480121),
    LatLng(12.935887, 77.583382),
    LatLng(12.984121, 77.515016),
    LatLng(13.014652, 77.670264),
    LatLng(12.941089, 77.667985),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Polygon screen"),
        ),
        body: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          myLocationEnabled: false,
          polygons: _polygon,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ));
  }
}
