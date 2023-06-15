import 'package:custom_info_window/custom_info_window.dart';
import 'package:wander/constants/app_exports.dart';

class CustomMarkerInfo extends StatefulWidget {
  const CustomMarkerInfo({super.key});

  @override
  State<CustomMarkerInfo> createState() => _CustomMarkerInfoState();
}

class _CustomMarkerInfoState extends State<CustomMarkerInfo> {
  CustomInfoWindowController windowController = CustomInfoWindowController();

  final List<Marker> _marker = <Marker>[];
  final List<LatLng> _latLang = [
    const LatLng(12.9797, 77.5912),
    const LatLng(12.9, 77.5),
    const LatLng(12.904, 77.558),
    const LatLng(12.90, 77.55),
    const LatLng(12.9, 77.8),
  ];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() {
    for (int i = 0; i < _latLang.length; i++) {
      if(i%2 == 0){
        _marker.add(
          Marker(
            markerId: MarkerId(i.toString()),
            icon: BitmapDescriptor.defaultMarker,
            position: _latLang[i],
            onTap: () {
              windowController.addInfoWindow!(
                Container(
                  height: 300,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: CircleAvatar(radius: 30, backgroundColor: Colors.blue,),
                  )
                ),
                _latLang[i],
              );
            },
          ),
        );
      }else{
        _marker.add(
          Marker(
            markerId: MarkerId(i.toString()),
            icon: BitmapDescriptor.defaultMarker,
            position: _latLang[i],
            onTap: () {
              windowController.addInfoWindow!(
                Container(
                  height: 300,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 300,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://assets-news.housing.com/news/wp-content/uploads/2022/06/29184410/10-best-tourist-places-to-visit-in-Bangalore-and-must-visit-places-near-it.jpg"),
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fitWidth),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 4, bottom: 4),
                        child: Row(
                          children: const [
                            Text(
                              "Vidhana Soudha",
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            ),
                            Spacer(),
                            Text("2 km"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 4, bottom: 4),
                        child: Row(
                          children: const [
                            Text(
                              "This is a famous place in Bangalore.",
                              maxLines: 5,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                _latLang[i],
              );
            },
          ),
        );
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Marker List"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(12.9797, 77.5912),
              zoom: 15,
            ),
            markers: Set<Marker>.of(_marker),
            onTap: (position) {
              windowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              windowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) {
              windowController.googleMapController = controller;
            },
          ),
          CustomInfoWindow(
            controller: windowController,
            height: 200,
            width: 300,
            offset: 35,
          ),
        ],
      ),
    );
  }
}
