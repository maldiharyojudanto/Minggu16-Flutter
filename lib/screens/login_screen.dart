import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tugasflutter/widgets/reusable_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  DateTime timeBackPressed = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitPesan = difference >= Duration(seconds: 2);

        timeBackPressed = DateTime.now();

        if(isExitPesan) {
          final message = 'Press back again to exit';
          Fluttertoast.showToast(msg: message, fontSize: 16);

          return false;
        } else {
          Fluttertoast.cancel();

          return true;
        }
      },
      child: Scaffold(
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
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 240,
                    height: 240,
                    fit: BoxFit.contain,
                    color: Colors.white,
                  ),
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
                  logInRegisterButton(context, true, () {
                    if((_emailTextController.text == "") || (_passwordTextController.text == "")){
                      toastMessage("Nggak boleh kosong cuy", Colors.red);
                    } else {
                      logInFunction();
                    }
                  }),
                  registerOption(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row registerOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Belum mempunyai akun? ",
            style: TextStyle(color: Colors.white)),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/register');
            FocusScope.of(context).unfocus();
            _emailTextController.clear();
            _passwordTextController.clear();
          },
          child: const Text(
            "Daftar",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void logInFunction() {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value) {
      print("Berhasil login cuy");
      toastMessage('Berhasil login cuy', Colors.green);
      Navigator.of(context).pushNamed('/dashboard');
      FocusScope.of(context).unfocus();
      _emailTextController.clear();
      _passwordTextController.clear();
    }).onError((error, stackTrace) {
      print("Gagal login cuy, (${error.toString()})");
      toastMessage('Gagal login cuy, (${error.toString()})', Colors.red);
    });
  }
}
