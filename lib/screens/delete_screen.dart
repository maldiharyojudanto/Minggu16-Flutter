import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tugasflutter/screens/login_screen.dart';

import '../widgets/reusable_widget.dart';

class DeleteScreen extends StatefulWidget {
  static const routeName = '/delete';

  const DeleteScreen({Key? key}) : super(key: key);

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Delete Account",
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
                emailTextField("Konfirmasi email", Icons.person_outline, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                passwordTextField("Konfirmasi password", Icons.person_outline, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                deletePage(context, () {
                  if((_emailTextController.text == "") || (_passwordTextController.text == "")){
                    toastMessage("Nggak boleh kosong cuy", Colors.red);
                  } else {
                    deleteButton(context);
                  }
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
        const Text("Silakan isi form berikut untuk delete akun",
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ],
    );
  }

  Future<bool> deleteButton(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm'),
            content: const Text('Apakah yakin delete akun?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                    print('Batal Delete');
                  },
                  child: const Text('No')
              ),
              TextButton(
                  onPressed: () {
                    deleteFunction(_emailTextController.text, _passwordTextController.text);
                  },
                  child: const Text('Yes')
              )
            ],
          );
        }
    );
    return exitApp ?? false;
  }

  Future<void> deleteFunction(String email, String password) async {
    AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password
    );
    User user = await FirebaseAuth.instance.currentUser!;
    user.reauthenticateWithCredential(credential).then((value) async {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .delete();
      await user.delete();
      print('Berhasil delete akun');
      toastMessage('Berhasil delete akun', Colors.green);
      Navigator.of(context).popUntil(ModalRoute.withName('/'));
    }).onError((error, stackTrace) {
      print('Gagal delete akun, (${error.toString()})');
      toastMessage('Gagal delete akun, (${error.toString()})', Colors.red);
      Navigator.of(context).popUntil(ModalRoute.withName('/'));
      toastMessage('Session habis harap login kembali', Colors.red);
    });
  }
}
