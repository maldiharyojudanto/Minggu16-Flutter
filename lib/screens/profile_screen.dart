import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tugasflutter/widgets/reusable_widget.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _nameTextController = TextEditingController();
  String name = "";
  String location = "Click Get Location!";
  late String lat;
  late String long;

  void getDataName() async {
    User user = await FirebaseAuth.instance.currentUser!;
    var data_var = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    setState(() {
      _nameTextController.text = data_var.data()!['name'];
      name = data_var.data()!['name'];
    });
  }

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataName();
    getDataLocation();
    locationFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.lightBlue, Colors.lightBlue.shade200]),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                perintahStatus(),
                const SizedBox(
                  height: 30,
                ),
                emailTextField(_nameTextController.text, Icons.person_outline, _nameTextController),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  location
                ),
                getLocation(context, (){
                  locationFunction();
                }),
                updateProfile(context, (){
                  if(_nameTextController.text == name) {
                    toastMessage('Nama tidak boleh sama cuy', Colors.red);
                  }else{
                    updateFunction();
                  }
                }),
                deletePage(context, () {
                  Navigator.of(context).pushNamed('/delete');
                }),
                logOutProfile(context, (){
                  logoutButton(context);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row perintahStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Silakan ubah form berikut untuk update data",
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ],
    );
  }

  Future<void> userUpdate() async {
    User? data = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('users').doc(data!.uid).update({
      'name': _nameTextController.text,
    });
    return;
  }

  void updateFunction() {
    userUpdate().then((value) {
      print("Berhasil update akun");
      toastMessage('Berhasil update akun', Colors.green);
      Navigator.of(context).pushNamed('/dashboard');
    }).onError((error, stackTrace) {
      print("Gagal update akun (${error.toString()})");
      toastMessage('Gagal update akun (${error.toString()})', Colors.red);
    });
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
      });

      _liveLocation();

      User? data = FirebaseAuth.instance.currentUser;
      FirebaseFirestore.instance.collection('users').doc(data!.uid).update({
        'location': location,
      });
    });
  }
}
