import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugasflutter/widgets/reusable_widget.dart';
import 'package:tugasflutter/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _nameTextController = TextEditingController();
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
          "Daftar",
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
                emailTextField("Masukkan nama lengkap", Icons.person_outline, _nameTextController),
                const SizedBox(
                  height: 20,
                ),
                emailTextField("Masukkan email", Icons.email_outlined, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                passwordTextField("Masukkan password", Icons.lock_outline, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                logInRegisterButton(context, false, () {
                  if((_nameTextController.text == "") || (_emailTextController.text == "") || (_passwordTextController.text == "")){
                    toastMessage("Nggak boleh kosong cuy", Colors.red);
                  } else {
                    registerFunction();
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
        const Text("Silakan isi form berikut untuk daftar",
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ],
    );
  }

  Future<void> userSetup() async {
    User? data = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('users').doc(data!.uid).set({
      'name': _nameTextController.text,
      'email': _emailTextController.text,
      'uid': data.uid,
    });
    return;
  }

  void registerFunction() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value) {
      userSetup();
      print("Selamat cuy berhasil mendaftar");
      toastMessage('Selamat cuy berhasil mendaftar', Colors.green);
      FirebaseAuth.instance.signOut();
      FocusScope.of(context).unfocus();
      Navigator.of(context).popUntil(ModalRoute.withName('/'));
    }).onError((error, stackTrace) {
      print("Gagal mendaftar cuy, (${error.toString()})");
      toastMessage('Gagal mendaftar cuy, (${error.toString()})', Colors.red);
    });
  }
}
