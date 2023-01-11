import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugasflutter/widgets/reusable_widget.dart';

import '../dummy_data.dart';
import '../widgets/dashboard_item.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Pagi';
    }
    if (hour < 17) {
      return 'Siang';
    }
    return 'Malam';
  }
  String name = "";

  void getDataName() async {
    User user = await FirebaseAuth.instance.currentUser!;
    var dataName = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    setState(() {
      name = dataName.data()!['name'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataName();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => logoutButton(context),
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: Column(
            children: <Widget>[
              const SizedBox(
                height: 70,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${greeting()}, $name",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Dashboard",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Color(0xffa29aac),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                              )
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      icon: Image.asset(
                        'assets/images/account.png',
                        width: 24,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/profile');
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: GridView.count(
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(10),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: DUMMY_DASHBOARD
                      .map(
                        (catData) => DashboardItem(
                        catData.id,
                        catData.title,
                        catData.description,
                        catData.imageUrl
                    ),
                  ).toList(),
                ),
              )
            ],
          )
      ),
    );
  }
}
