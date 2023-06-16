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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            stops: [
              0.1,
              1.5,
            ],
            colors: [Colors.purple, Colors.greenAccent],
          ),
        ),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
