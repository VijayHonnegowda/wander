import 'package:wander/constants/app_exports.dart';
import 'package:wander/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerOption(),
      appBar: AppBar(
        title: const Text("Wander"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
          ],
        ),
      ),
    );
  }
}
