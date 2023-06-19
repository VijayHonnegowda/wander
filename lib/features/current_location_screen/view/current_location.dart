import 'package:wander/constants/app_exports.dart';

class AppCurrentLocation extends StatefulWidget {
  const AppCurrentLocation({super.key});

  @override
  State<AppCurrentLocation> createState() => _AppCurrentLocationState();
}

class _AppCurrentLocationState extends State<AppCurrentLocation> {
  String location = 'null ,Press Button';
  String Address = 'search';

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> GetAddressLotLong(Position position) async {
    List<Placemark> placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placeMark);
    Placemark place = placeMark[0];

    Address = '${place.name},'
        ' ${place.subLocality},'
        '${place.locality},'
        '${place.administrativeArea}, '
        '${place.country}'
        ' - '
        '${place.postalCode}, ';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Current location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Text(location),
            const SizedBox(height: 10),
            const Text("Address"),
            const SizedBox(height: 10),
            Text('${Address}'),
            const SizedBox(height: 32),
            const Icon(
              Icons.location_on,
              size: 46,
              color: Colors.black,
            ),
            const SizedBox(height: 12),
            const Text(
              "Get user location",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                Position position = await _determinePosition();
                print(position);

                location =
                    'Lat: ${position.latitude}, Long:${position.longitude}';
                GetAddressLotLong(position);
                setState(() {});
              },
              child: const Text("Get current location"),
            ),
          ],
        ),
      ),
    );
  }
}
