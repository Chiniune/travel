// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel/API/generalAPI.dart';
import 'package:travel/view/map.dart';
// import '../../controller/tourController.dart';
import '../../model/Ticket.dart';
import '../../config/color.dart';
// import 'package:get/get.dart';
import 'bookingUI.dart';

class LocationDetailsUI extends StatefulWidget {
  var object;
  bool isTicket;
  LocationDetailsUI({Key? key, required this.object, required this.isTicket})
      : super(key: key);

  @override
  State<LocationDetailsUI> createState() =>
      LocationDetailsState(object: object, isTicket: isTicket);
}

class LocationDetailsState extends State<LocationDetailsUI> {
  LocationDetailsState({required this.object, required this.isTicket});
  bool wish = false;
  var object;
  bool isTicket;
  List images = [];
  double space = 0;

  // Future<void> loadImage() async {
  //   images = await GeneralAPI.getAllImage(object.image);
  // }

  Future<void> loadImage() async {
    await GeneralAPI.getAllImage(object.image).then((result) {
      setState(() {
        images = result;
      });
    });
  }

  Future<void> loadSpace() async {
    await GeneralAPI.getSpaceOnMaps(object.latitude, object.longitude)
        .then((result) {
      setState(() {
        space = result;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadImage();
    loadSpace();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor.shade300,
        elevation: 0,
        title: Text(
          "Details",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.shopping_bag_outlined,
        //       color: Colors.black,
        //     ),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .35,
            // padding: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            child: Image.asset(
              'assets/images/${object.image}.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30, right: 14, left: 14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.only(
                    //   topLeft: Radius.circular(30),
                    //   topRight: Radius.circular(30),
                    // ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          object.address,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          space == 0.0
                              ? 'loading...'
                              : '$space' + 'km away from you',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          object.name,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        isTicket == true
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Adult: \$',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '${object.price_child}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Child: \$',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '${object.price_adult}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Container(),
                        const SizedBox(height: 20),
                        Text(
                          'Some picture',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 110,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: images.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    showDialogImage(
                                        context, "${images[index]}");
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 6),
                                    width: 110,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Image(
                                        height: 70,
                                        image: AssetImage("${images[index]}"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          object.description,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: primaryColor),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (wish) {
                      wish = false;
                    } else {
                      wish = true;
                    }
                  });
                },
                child: Icon(
                  wish == false ? Icons.favorite_border : Icons.favorite,
                  size: 30,
                  color: primaryColor,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: primaryColor),
                ),
                child: InkWell(
                  onTap: () {
                    showMaps(object.latitude, object.longitude);
                  },
                  child: Icon(
                    Icons.directions,
                    size: 30,
                    color: primaryColor,
                  ),
                )),
            SizedBox(width: 10),
            Expanded(
              child: InkWell(
                onTap: () {
                  // productController.addToCart();
                },
                // child: Container(
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //     color: Colors.black,
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => bookingUI()));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  child:
                      // productController.isAddLoading.value
                      //     ? SizedBox(
                      //         width: 20,
                      //         height: 20,
                      //         child: CircularProgressIndicator(
                      //           color: Colors.white,
                      //           strokeWidth: 3,
                      //         ),
                      //       )
                      Text(
                    'Booking',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogImage(Context, img) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.92,
            child: Column(
              children: [
                Expanded(child: Image.asset(img)),
              ],
            ),
          ),
        );
      },
    );
  }

  showMaps(lat, long) {
    print(long);
    print(lat);
    print("object");
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.92,
            child: MapsUI(latitude: lat, longitude: long),
          );
        });
  }
}
