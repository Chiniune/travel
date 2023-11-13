import 'package:flutter/material.dart';
import '../main.dart' as prefix0;
import '../main.dart';
import '../config/color.dart';
import '../config/clipper.dart';

String? fromlocation;
String? tolocation;

class SearchPage extends StatelessWidget {
  final String? fromloc;
  final String? toloc;
  SearchPage({this.fromloc, this.toloc});

  @override
  Widget build(BuildContext context) {
    fromlocation = fromloc;
    tolocation = toloc;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: primaryColor,
          title: Text(
            'Search Result',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[StackTop(), StackDown()],
          ),
        ));
  }
}

class StackDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Best Result',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                FlightCard(
                  date: "01 Far 1399",
                  percentOff: "0",
                  price: "500",
                  rating: 3.5,
                  flightTo: "Ha Noi",
                  oldprice: "999",
                ),
                FlightCard(
                  date: "02 Esf 1398",
                  percentOff: "0",
                  price: "600",
                  rating: 5,
                  flightTo: "Da Nang",
                  oldprice: "1000",
                ),
                FlightCard(
                  date: "01 Far 1399",
                  percentOff: "0",
                  price: "300",
                  rating: 3.5,
                  flightTo: "Can Tho",
                  oldprice: "999",
                ),
                FlightCard(
                  date: "02 Esf 1398",
                  percentOff: "0",
                  price: "700",
                  rating: 5,
                  flightTo: "TP Ho Chi Minh",
                  oldprice: "1000",
                ),
              ],
            )
          ],
        ));
  }
}

class FlightCard extends StatelessWidget {
  final String? price;
  final String? flightTo;
  final String? percentOff;
  final String? date;
  final double? rating;
  final String? oldprice;

  FlightCard(
      {this.date,
      this.flightTo,
      this.percentOff,
      this.price,
      this.rating,
      this.oldprice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Stack(
          children: <Widget>[
            Container(
              //height: prefix0.height/6,
              width: prefix0.width! * .8,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.lerp(
                    Radius.elliptical(10, 20), Radius.circular(20), 2)!),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        price! + '\$',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: prefix0.width! * .02,
                      ),
                      Text(
                        "$flightTo",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: prefix0.height! * .03,
                  ),
                  Wrap(
                    spacing: 5.0,
                    runSpacing: -5.0,
                    children: <Widget>[
                      Tag(
                        label: date!,
                        avatar: Icon(
                          Icons.calendar_today,
                          size: 18,
                        ),
                      ),
                      Tag(
                        label: rating.toString(),
                        avatar: Icon(Icons.star, size: 18),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: prefix0.height! * .025,
              right: 15,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                width: prefix0.width! * .09,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: primaryColor.withOpacity(.2)),
                child: Center(
                  child: Text(
                    percentOff! + '%',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: primaryColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  String? label;
  Widget? avatar;

  Tag({this.avatar, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: RawChip(
        label: Text(
          label!,
        ),
        labelStyle: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 8, color: Colors.black),
        avatar: avatar,
        backgroundColor: chipBackground,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}

class StackTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Key from;
    // Key to;
    return Material(
      elevation: 0,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: Clipper08(),
            child: Container(
              height: height! * .272, //400
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryColor, primaryColor.withAlpha(240)],
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: prefix0.height! * .04,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin:
                    EdgeInsets.symmetric(horizontal: prefix0.height! * .035),
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.all(prefix0.height! * .035),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Something...',
                              style: TextStyle(fontSize: 16.0),
                              // key: from,
                            ),
                            Divider(
                              color: Colors.black12,
                              height: prefix0.height! * .04,
                            ),
                            Text(
                              /*prefix0.locs[1]*/ tolocation! /*+ ' Imam reza Holy Shrine'*/,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                              // key: to,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                              icon: Icon(
                                Icons.import_export,
                                color: Colors.black,
                                size: prefix0.height! * .07,
                              ),
                              onPressed: () {
                                // TODO Swap To And From texts
                              }))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
