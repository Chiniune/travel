import 'package:flutter/material.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "WELCOME TO DANATOUR",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16 * 2),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset('assets/images/background1.png'),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 16 * 2),
      ],
    );
  }
}
