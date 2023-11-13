import 'package:flutter/material.dart';
import 'package:travel/view/home/homeTop.dart';
import 'package:travel/view/map.dart';
import 'view/login/loginUI.dart';
import 'view/home/testsenAPI.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginUI(),
    theme: ThemeData(
        primaryColor: Colors.purple, secondaryHeaderColor: Colors.blue),
    title: "Traveling...",
  ));
}

double? width;
double? height;

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        ElevatedButton(onPressed: () {}, child: const Text("data")),
        Center(
          child: Image.asset('assets/images/google.png'),
        )
      ],
    );
  }
}
