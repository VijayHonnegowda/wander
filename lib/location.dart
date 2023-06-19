import 'package:wander/constants/app_exports.dart';

class LocationServices extends StatelessWidget {
  const LocationServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location services"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MapLocation()));
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomMarkerInfo()));
              },
              child: const Text("Custom marker list"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PolyGonScreen()));
              },
              child: const Text("Polygon screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PolylineScreen()));
              },
              child: const Text("Polyline screen"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const NetworkImageMarkerScreen()));
              },
              child: const Text("Network images screen"),
            ),
          ],
        ),
      ),
    );
  }
}
