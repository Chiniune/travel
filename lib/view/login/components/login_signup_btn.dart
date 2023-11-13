import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel/API/customerAPI.dart';
import 'package:travel/API/google_signin_API.dart';
import 'package:travel/model/Customer.dart';
import 'package:travel/view/home/homeUI.dart';
import 'package:travel/config/color.dart';

class LoginAndSignupBtn extends StatefulWidget {
  const LoginAndSignupBtn({super.key});

  @override
  State<LoginAndSignupBtn> createState() => _LoginAndSignupBtnState();
}

class _LoginAndSignupBtnState extends State<LoginAndSignupBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Hero(
            tag: "login_btn",
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, right: 40, left: 40),
                  backgroundColor: primaryColor.shade300),
              onPressed: () {
                setState(() {
                  signInOnClick(context);
                });
              },
              icon: Image.asset('assets/images/google.png'),
              label: const Text("Continue with Google"),
            ),
          ),
        ],
      ),
    );
  }

  Future signInOnClick(context) async {
    final user = await GoogleSignInAPI.login();

    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Sign in failed!")));
    } else {
      var name = user.displayName.toString();
      var email = user.email;
      var img = user.photoUrl.toString();
      customerAPI.checkUserLogin(name, email, img);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNav(user: user)));
    }
  }
}
