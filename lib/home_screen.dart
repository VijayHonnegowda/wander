import 'package:wander/constants/app_exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wander"),
      ),
      body:Column(
        children: const  [
          LocationServices(),
        ],
      ),
    );
  }
}
