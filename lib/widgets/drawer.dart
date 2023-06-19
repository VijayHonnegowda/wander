import 'package:wander/constants/app_exports.dart';

class DrawerOption extends StatelessWidget {
  const DrawerOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            currentAccountPicture: CircleAvatar(
              child: Image(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_1280.png"),
                height: 52,
                width: 80,
              ),
            ),
            currentAccountPictureSize: Size.square(80),
            accountName: Text("Vijay H"),
            accountEmail: Text("Vijay@123.com"),
          ),
          const ListTile(
            title: Text("Home"),
          ),
          const Divider(),
          ListTile(
            title: const Text("Current location"),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AppCurrentLocation()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Location"),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LocationServices()));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Network Place Selection"),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NetworkImageMarkerScreen()));
            },
          ),
          const Divider(),
          const SizedBox(height: 120),
          const ListTile(
            title: Text("logout"),
          ),
        ],
      ),
    );
  }
}
