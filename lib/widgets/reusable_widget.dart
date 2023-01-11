import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tugasflutter/screens/dashboard_screen.dart';
import 'package:tugasflutter/screens/profile_screen.dart';
import 'package:tugasflutter/screens/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

//DRAWER (Tidak dipakai)
// Drawer reusableDrawer(BuildContext context) {
//   return Drawer(
//     child: Container(
//       child: ListView(
//         children: [
//           DrawerHeader(
//             child: Center(
//               child: Text(
//                 'H E I',
//                 style: TextStyle(color: Colors.black54, fontSize: 48, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.home, color: Colors.black54,),
//             title: Text(
//               'Dashboard',
//               style: TextStyle(color: Colors.black54,fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.person, color: Colors.black54,),
//             title: Text(
//               'Profile',
//               style: TextStyle(color: Colors.black54,fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.logout, color: Colors.black54,),
//             title: Text(
//               'Keluar',
//               style: TextStyle(color: Colors.black54,fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             onTap: () {
//               FirebaseAuth.instance.signOut().then((value) {
//                 print("Berhasil Keluar");
//                 Navigator.of(context).pushNamed('/');
//               });
//             },
//           )
//         ],
//       ),
//     ),
//   );
// }

//TEXTFIELD
TextField reusableTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.8)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.2),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none)
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

TextField emailTextField(String text, IconData icon, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: false,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.8)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.2),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)
      ),
    ),
  );
}

TextField passwordTextField(String text, IconData icon, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: true,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.8)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.2),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)
      ),
    ),
  );
}

// BUTTON
Container logInRegisterButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width:  MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? 'LOGIN' : 'REGISTER',
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.lightBlue.shade400;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
          )
      ),
    ),
  );
}

Container updateProfile(BuildContext context, Function onTap) {
  return Container(
    width:  MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text('UPDATE',
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.lightBlue.shade400;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
          )
      ),
    ),
  );
}

Container logOutProfile(BuildContext context, Function onTap) {
  return Container(
    width:  MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text('LOGOUT',
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.red.shade400;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
          )
      ),
    ),
  );
}

Container deletePage(BuildContext context, Function onTap) {
  return Container(
    width:  MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text('DELETE',
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.red.shade400;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
          )
      ),
    ),
  );
}

Container getLocation(BuildContext context, Function onTap) {
  return Container(
    width:  MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text('GET LOCATION',
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.lightBlue.shade400;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
          )
      ),
    ),
  );
}

//DIALOG CONFIRM
Future<bool> logoutButton(BuildContext context) async {
  bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text('Apakah yakin untuk logout?'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  print('Batal Logout');
                },
                child: const Text('No')
            ),
            TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Berhasil logout");
                    toastMessage('Berhasil logut', Colors.green);
                    Navigator.of(context).popUntil(ModalRoute.withName('/'));
                  });
                },
                child: const Text('Yes')
            )
          ],
        );
      }
  );
  return exitApp ?? false;
}

void toastMessage(String pesan, Color color) {
  Fluttertoast.showToast(
    msg: pesan,
    fontSize: 16,
    backgroundColor: color,
  );
}