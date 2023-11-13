import 'package:flutter/material.dart';
import 'package:travel/view/product/locationDetailUI.dart';

class Items34 extends StatelessWidget {
  Items34({required this.lists, required this.isTicket});
  bool isTicket;
  List lists;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return lists.isEmpty
        ? Center(
            child: Text("Not found below 15km..."),
          )
        : Container(
            margin: const EdgeInsets.only(top: 16, left: 10),
            height: size.height * .4,
            child: ListView.builder(
                itemCount: lists.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LocationDetailsUI(
                            object: lists[index],
                            isTicket: isTicket,
                          );
                        }));
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(24),
                              ),
                              child: Image.asset(
                                  'assets/images/${lists[index].image}.png')),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 0, .5),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                              child: Text(
                                lists[index].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
  }
}
