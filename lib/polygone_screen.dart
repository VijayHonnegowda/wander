import 'package:wander/constants/app_exports.dart';

class PolyGoneScreen extends StatefulWidget {
  const PolyGoneScreen({super.key});

  @override
  State<PolyGoneScreen> createState() => _PolyGoneScreenState();
}

class _PolyGoneScreenState extends State<PolyGoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Polygone screen"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
