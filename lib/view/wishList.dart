import 'package:flutter/material.dart';
import 'package:travel/model/Ticket.dart';
import 'package:travel/view/home/homeTop.dart';
import 'item/item169.dart';

class WishList extends StatelessWidget {
  List<Ticket> list;
  WishList({required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Item169(
          isWishLish: true,
          listItems: tickets,
          isTicket: false,
        )
      ],
    ));
  }
}
