import 'package:flutter/material.dart';
import 'package:travel/main.dart';
import 'package:travel/view/product/locationDetailUI.dart';

class Item169 extends StatelessWidget {
  List listItems = [];
  bool isWishLish = false;
  bool isTicket = false;
  Item169(
      {required this.isWishLish,
      required this.listItems,
      required this.isTicket});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: isWishLish == false ? size.height * .55 : size.height * .8,
      child: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LocationDetailsUI(
                    object: listItems[index],
                    isTicket: isTicket,
                  );
                }));
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Container(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/images/${listItems[index].image}.png",
                          fit: BoxFit.fill,
                          height: 60.0,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const SizedBox(
                            //   height: 8.0,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  listItems[index].name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    isWishLish == false
                                        ? isTicket == false
                                            ? Container(
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/star.png",
                                                      width: 30,
                                                    ),
                                                    Text(
                                                      listItems[index]
                                                          .rating
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 16.0,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : Container()
                                        : Container(),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Text(
                                    listItems[index].address,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xff686771),
                                    ),
                                  ),
                                ),
                                isWishLish == true
                                    ? Icon(
                                        Icons.delete_outline_rounded,
                                        color: Colors.red,
                                      )
                                    : SizedBox(),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
