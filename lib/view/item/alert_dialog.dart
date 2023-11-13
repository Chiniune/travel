import 'package:flutter/material.dart';

class CardAlertDialog extends StatelessWidget {
  String typeAlert;
  CardAlertDialog({Key? key, required this.typeAlert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: -40.0,
          top: -40.0,
          child: InkResponse(
            onTap: () {
              Navigator.of(context).pop(2);
            },
            child: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.close, color: Colors.white),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '$typeAlert Successfully',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            typeAlert == "Booking"
                ? Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Wish you have a good experience ><',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  )
                : Container()
          ],
        ),
      ],
    ));
  }
}
