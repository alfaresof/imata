import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:imata/comp/colors.dart';
import 'package:imata/comp/text.dart';
import 'package:imata/comp/textfield.dart';



import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class NewReport extends StatelessWidget {
  static const String routename = '/new_report';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routename),
        builder: (context) => NewReport()
    );
  }
   NewReport({Key? key}) : super(key: key);

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }


  @override
  Widget build(BuildContext context) {

     double a = 0;
     double b  = 0;
    var loc = _determinePosition().then((value) {
      print(value.longitude);
    a = value.latitude;
    b = value.longitude;
    });
    loc;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.only(left: 8.0, bottom: 6.0,top: 50),
              child: text('Location', 25, FontWeight.bold, Colors.black,
                  TextAlign.left),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 8.0, bottom: 6.0,top: 50),
              child: text('$a', 25, FontWeight.bold, Colors.black,
                  TextAlign.left),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 8.0, bottom: 6.0,top: 50),
              child: text('Description', 25, FontWeight.bold, Colors.black,
                  TextAlign.left),
            ),
            BigCustomTextFormField('hint', (value) => null, false)
          ],
        ),
      ),
    );
  }
}
