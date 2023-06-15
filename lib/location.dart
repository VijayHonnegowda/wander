import 'package:wander/constants/app_exports.dart';

class LocationServices extends StatelessWidget {
  const LocationServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AppCurrentLocation()));
            },
            child: const Text("Get current location"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MapLocation()));
            },
            child: const Text("Google Map"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GooglePlacesApiScreen()));
            },
            child: const Text("Google Places API"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomMarkerInfo()));
            },
            child: const Text("Custom marker list"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PolyGoneScreen()));
            },
            child: const Text("Polygone screen"),
          ),
        ],
      ),
    );
  }
}
