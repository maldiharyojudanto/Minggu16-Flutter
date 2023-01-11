import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:tugasflutter/widgets/reusable_widget.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail';

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String location = "Step 1: Click Get Location to Access Quiz";
  String qrtext = "";
  String qresult = "Step 2: Validation by QR to Access Quiz";
  late String lat;
  late String long;
  bool munculinbuttonQRBool = false;
  bool munculinbuttonSoalBool = false;


  void getDataLocation() async {
    User user = await FirebaseAuth.instance.currentUser!;
    var dataLoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    setState(() {
      location = dataLoc.data()!['location'];
    });
  }

  void getDataQrText() async {
    var dataQRText = await FirebaseFirestore.instance
        .collection('generate')
        .doc('qrcode')
        .get();

    setState(() {
      qrtext = dataQRText.data()!['result'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detail =  ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    final detailId = detail['id'];

    final detailTitle = detail['title'];
    final detailImageUrl = detail['imageUrl'] as String;
    final detailIngredients = detail['ingredients'] as List<String>;
    final detailSteps = detail['steps'] as List<String>;
    final detailComplexity = detail['complexity'] as Object;
    final detailDuration = detail['duration'] as int;
    final detailVisible = detail['isVisible'] as bool;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  icon: Image.asset(
                    'assets/images/previous.png',
                    width: 24,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "$detailTitle",
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      )
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            height: 0,
            thickness: 3,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 103,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16/9,
                    child: Image.network(
                      detailImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Visibility(
                      visible: detailVisible,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Duration : ${detailDuration.toString()} | Complexity : ${detailComplexity.toString()}",
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Table(
                              border: TableBorder.all(color: Colors.black),
                              columnWidths: const {
                                0: FlexColumnWidth(15),
                                1: FlexColumnWidth(85)
                              },
                              children: [
                                for (int i=1; i<=detailIngredients.length; i++)
                                TableRow(children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Text('$i.'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(detailIngredients[i-1]),
                                  ),
                                ])
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'How?',
                              style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Table(
                              border: TableBorder.all(color: Colors.black),
                              columnWidths: const {
                                0: FlexColumnWidth(15),
                                1: FlexColumnWidth(85)
                              },
                              children: [
                                for (int i=1; i<=detailSteps.length; i++)
                                TableRow(children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Text('$i.'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(detailSteps[i-1]),
                                  ),
                                ])
                              ],
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Visibility(
                      visible: !detailVisible,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                location,
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton.icon(
                                label: const Text("Get Location"),
                                icon: const Icon(Icons.location_on_outlined),
                                onPressed: () {
                                  locationFunction();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pink.shade400,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Visibility(
                                visible: munculinbuttonQRBool,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Step 2: Validation by QR to Access Quiz",
                                      style: GoogleFonts.openSans(
                                        textStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton.icon(
                                      label: Text("Scan QR Code"),
                                      icon: const Icon(Icons.qr_code),
                                      onPressed: () {
                                        scanQRCode();
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Visibility(
                                      visible: munculinbuttonSoalBool,
                                      child: Column(
                                        children: <Widget>[
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          ElevatedButton.icon(
                                            label: Text("Monggo Dimulai Quiznya"),
                                            icon: const Icon(Icons.book_outlined),
                                            onPressed: () {
                                              if((detailId == "c19") && (qrtext == qresult)) {
                                                Navigator.of(context).pushNamed('/quiz-music');
                                              } else if((detailId == "c20") && (qrtext == qresult)) {
                                                Navigator.of(context).pushNamed('/quiz-piano');
                                              } else if((detailId == "c21") && (qrtext == qresult)) {
                                                Navigator.of(context).pushNamed('/quiz-guitar');
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50)
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //Get lokasi terkini
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if(permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request');
    }
    return await Geolocator.getCurrentPosition();
  }

  //Get realtime location
  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings).listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        location = 'Latitude: $lat, Longitude: $long';
        munculinbuttonQRBool = true;
      });

      User? data = FirebaseAuth.instance.currentUser;
      FirebaseFirestore.instance.collection('users').doc(data!.uid).update({
        'location': location,
      });
    });
  }

  //Set location realtime
  void locationFunction() {
    _getCurrentLocation().then((value) {
      lat = '${value.latitude}';
      long = '${value.longitude}';

      setState(() {
        location = 'Latitude: $lat, Longitude: $long';
        munculinbuttonQRBool = true;
      });

      _liveLocation();
      getDataQrText();

      User? data = FirebaseAuth.instance.currentUser;
      FirebaseFirestore.instance.collection('users').doc(data!.uid).update({
        'location': location,
      });
    });
  }

  void scanQRCode() async {
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Batal', true, ScanMode.QR);

      if(!mounted) return;

      setState(() {
        qresult = qrCode;
        if(qresult == qrtext) {
          setState(() {
            munculinbuttonSoalBool = true;
            toastMessage("Selamat, QR dikenali", Colors.black87);
          });
        } else if (qresult == "-1"){
          setState(() {
            qresult = "Step 2: Validation by QR to Access Quiz";
            munculinbuttonSoalBool = false;
          });
        } else {
          setState(() {
            qresult = "Step 2: Validation by QR to Access Quiz";
            munculinbuttonSoalBool = false;
          });
          toastMessage("QR Tidak dikenali", Colors.red);
        }
      });
    } on PlatformException {
      qresult = 'Gagal mengscan QR Code';
    }
  }
}
