import 'package:geolocator/geolocator.dart';
import 'package:wander/constants/app_exports.dart';

class LocationServices extends StatefulWidget {
  const LocationServices({super.key});

  @override
  State<LocationServices> createState() => _LocationServicesState();
}

class _LocationServicesState extends State<LocationServices> {


  void getCurrentLocation()async{
    Position position = await Geolocator.getCurrentPosition();
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
            onPressed: () {
              getCurrentLocation();
            },
            child: const Text("Get current location"),
          ),
        ],
      ),
    );
  }
}
