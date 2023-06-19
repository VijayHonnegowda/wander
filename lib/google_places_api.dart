import 'package:google_places_flutter/model/prediction.dart';
import 'package:wander/constants/app_exports.dart';

class GooglePlacesApiScreen extends StatefulWidget {
  const GooglePlacesApiScreen({super.key});

  @override
  State<GooglePlacesApiScreen> createState() => _GooglePlacesApiScreenState();
}

class _GooglePlacesApiScreenState extends State<GooglePlacesApiScreen> {

  void showGoogleAutoComplete() async {
   const kGoogleApiKey = "AIzaSyBcgsqJ9BMHSLZheEeB4-A9V9du4fEaKgo";

   var Mode;
   var PlacesAutocomplete;
   Prediction p = await PlacesAutocomplete.show(
     context:context,
     apiKey:kGoogleApiKey,
     mode: Mode.overlay,
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Places API"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Search"
              ),
              onTap: (){
                showGoogleAutoComplete();
              },
            ),
          ),
        ],
      ),
    );
  }
}
