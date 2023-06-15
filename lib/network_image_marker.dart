import 'dart:typed_data';
import 'package:wander/constants/app_exports.dart';
import 'dart:ui' as ui;

class NetworkImageMarkerScreen extends StatefulWidget {
  const NetworkImageMarkerScreen({super.key});

  @override
  State<NetworkImageMarkerScreen> createState() =>
      _NetworkImageMarkerScreenState();
}

class _NetworkImageMarkerScreenState extends State<NetworkImageMarkerScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(12.909858, 77.480121), zoom: 14);

  final List<Marker> _marker = <Marker>[];

  List<LatLng> _latlng = [
    const LatLng(12.909858, 77.480121),
    const LatLng(12.935887, 77.583382),
    const LatLng(12.984121, 77.515016),
    const LatLng(13.014652, 77.670264),
    const LatLng(12.941089, 77.667985),
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    for (int i = 0; i < _latlng.length; i++) {
      Uint8List? image = await loadNetworkImage(
          "https://holidayinfy.com/wp-content/uploads/2021/10/20-Famous-Bangalore-tourist-places.jpg");

      final ui.Codec markerImageCodec = await ui.instantiateImageCodec(
        image.buffer.asUint8List(),
        targetHeight: 100,
        targetWidth: 100,
      );
      final ui.FrameInfo frameInfo = await markerImageCodec.getNextFrame();
      final ByteData? byteData = await frameInfo.image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      final Uint8List resizedImagesMarker = byteData!.buffer.asUint8List();
      _marker.add(
        Marker(
          markerId: MarkerId(i.toString()),
          icon: BitmapDescriptor.fromBytes(resizedImagesMarker),
          position: _latlng[i],
          infoWindow: InfoWindow(title: "Title of marker " + i.toString()),
        ),
      );
      setState(() {});
    }
  }

  Future<Uint8List> loadNetworkImage(String path) async {
    final completer = Completer<ImageInfo>();
    var image = NetworkImage(path);

    image.resolve(const ImageConfiguration()).addListener(
          ImageStreamListener(
            (info, _) => completer.complete(info),
          ),
        );
    final imageInfo = await completer.future;

    final byteData =
        await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Network image Screen"),
      ),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
