import 'package:wander/constants/app_exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
      theme: ThemeData(
        primaryColor: Colors.lightGreen.shade200,
        appBarTheme: AppBarTheme(
          color: Colors.lightGreen.shade200,
          centerTitle: true,
        ),
      ),
    );
  }
}
