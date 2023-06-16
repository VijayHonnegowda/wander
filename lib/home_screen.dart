import 'package:wander/constants/app_exports.dart';
import 'package:wander/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerOption(),
      appBar: AppBar(
        title: const Text("Wander"),
        centerTitle: true,
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}
