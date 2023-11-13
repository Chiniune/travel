import 'package:flutter/material.dart';
import 'package:travel/API/generalAPI.dart';
import 'package:travel/API/ticketAPI.dart';
import 'package:travel/config/color.dart';
import 'package:travel/view/item/item169.dart';

class viewAllUI extends StatefulWidget {
  String id;
  viewAllUI({required this.id});
  @override
  State<viewAllUI> createState() => _viewAllUIState(id: id);
}

class _viewAllUIState extends State<viewAllUI> {
  String id;
  List list = [];
  _viewAllUIState({required this.id});
  @override
  void initState() {
    super.initState();
    ticketAPI.getRegionItem(id).then((dataFromServer) {
      setState(() {
        list = dataFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          title: Text("Some Information In Place",
              style: Theme.of(context).textTheme.headlineSmall),
          centerTitle: true,
          backgroundColor: primaryColor.shade300,
        ),
        body: list.isEmpty
            ? Center(
                child: Text("No Something here.."),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Item169(isWishLish: false, listItems: list, isTicket: true),
                ],
              ));
  }
}
