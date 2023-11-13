import 'package:flutter/material.dart';
import 'package:travel/API/generalAPI.dart';
import 'package:travel/API/hotelAPI.dart';
import 'package:travel/API/restaurantAPI.dart';
import 'package:travel/API/ticketAPI.dart';
import 'package:travel/API/regionAPI.dart';
import 'package:travel/config/clipper.dart';
import 'package:travel/model/Restaurant.dart';
import 'package:travel/model/Ticket.dart';
import 'package:travel/model/Region.dart';
import 'package:travel/view/item/choiceItem.dart';
import 'package:travel/view/searchPage.dart';
import '../../main.dart' as Main;
import 'package:url_launcher/url_launcher.dart';
import '../../config/color.dart';
import '../../model/Hotel.dart';
import '../item/item34.dart';
import '../item/item169.dart';
import '../item/regionItem.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);
  @override
  State<HomeUI> createState() => HomeDownState();
}

var selectedloc = 0;
List<String> locs = ['ENGLISH', 'VIETNAMESE'];
bool isHomeSelected = true;
bool isHotelSelected = false;
bool isResSelected = false;
List<Hotel> hotels = [];
List<Restaurant> restaurants = [];
List<Ticket> tickets = [];
List<Region> regions = [];
List nearest = [];

class HomeDownState extends State<HomeUI> {
  Future<void> loadNearest(List list) async {
    await GeneralAPI.getNeartList(list).then((result) {
      setState(() {
        nearest = result;
      });
    });
  }

  Future<void> initWithSyn() async {
    await GeneralAPI.setCurrentLocation();
    print("----------------------------------------------------------------");
    ticketAPI.fetchTicket('all').then((dataFromServer) {
      setState(() {
        tickets = dataFromServer;
        if (isHomeSelected) {
          loadNearest(tickets);
        }
      });
    });
    RestaurantAPI.fetchRestaurant('hot').then((dataFromServer) {
      setState(() {
        restaurants = dataFromServer;
      });
    });
    HotelAPI.fetchHotel('hot').then((dataFromServer) {
      setState(() {
        hotels = dataFromServer;
      });
    });
    regionAPI.fetchRegion().then((dataFromServer) {
      setState(() {
        regions = dataFromServer;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initWithSyn();
  }

  @override
  Widget build(BuildContext context) {
    // Navigation.selindex=0;

    Main.width = MediaQuery.of(context).size.shortestSide;
    Main.height = MediaQuery.of(context).size.longestSide;
    double h = 50;
    double w = 50;
    TextEditingController c = TextEditingController();

    return Scaffold(
      // bottomNavigationBar: /*NavigationTest()*/Navigation(),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        hoverElevation: 0,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("More Info :"),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            onPrimary: Colors.white,
                          ),
                          child: Image.asset('assets/images/gmail.png'),
                          onPressed: () async {
                            const url = 'mailto:vttrinh.20it1@vku.udn.vn';
                            // const url = 'https://mail.google.com/mail/u/0/?view=cm&fs=1&tf=1&to=hasanmahani08@gmail.com&su=I+am+using+MIN+pa08+so&ui=2&tf=1';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: h,
                        width: w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            onPrimary: Colors.white,
                          ),
                          child: Image.asset('assets/images/instagram.png'),
                          onPressed: () async {
                            const url = 'https://instagram.com/jin_abcd15';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: h,
                        width: w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            onPrimary: Colors.white,
                          ),
                          child: Image.asset('assets/images/facebook.png'),
                          onPressed: () async {
                            const url =
                                'https://www.facebook.com/dulichdanang43a/';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: h,
                        width: w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            onPrimary: Colors.white,
                          ),
                          child: Image.asset('assets/images/whatsapp.png'),
                          onPressed: () async {
                            const url = 'https://wa.me/+0332226695';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.info_outline),
        backgroundColor: primaryColor.withOpacity(.5),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: Clipper08(),
                  child: Container(
                    height: Main.height! * .50 < 450
                        ? Main.height! * .45
                        : 400, //400
                    //color: Colors.tealAccent,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [primaryColor, secondaryHeaderColor])),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: Main.height! / 18,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: Main.width! * 0.05,
                              ),
                              PopupMenuButton(
                                onSelected: (index) {
                                  setState(() {
                                    selectedloc = int.parse(index.toString());
                                  });
                                },
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      locs[selectedloc],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                itemBuilder: (BuildContext context) {
                                  return <PopupMenuItem<int>>[
                                    PopupMenuItem(
                                      child: Text(
                                        locs[0],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      value: 0,
                                    ),
                                    PopupMenuItem(
                                      child: Text(
                                        locs[1],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      value: 1,
                                    )
                                  ];
                                },
                              ),
                              Spacer(),
                              Icon(
                                Icons.settings,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'TRAVEL IN VIETNAM',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: Main.height! * 0.0375),
                        Container(
                          width: 300,
                          padding: EdgeInsets.symmetric(horizontal: 32.0),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              controller: c,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                              cursorColor: primaryColor,
                              decoration: InputDecoration(
                                  hintText: "Search something",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 25, right: 5, bottom: 8),
                                  suffixIcon: Material(
                                    child: InkWell(
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.black,
                                      ),
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SearchPage(
                                              fromloc: locs[selectedloc],
                                              toloc: c.text);
                                        }));
                                      },
                                    ),
                                    elevation: 2.0,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Main.height! * 0.025,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            InkWell(
                              child: Choice08(
                                  icon: Icons.home_outlined,
                                  text: "Home",
                                  selected: isHomeSelected),
                              onTap: () {
                                setState(() {
                                  isHomeSelected = true;
                                  isHotelSelected = false;
                                  isResSelected = false;
                                  loadNearest(tickets);
                                });
                              },
                            ),
                            SizedBox(
                              width: Main.width! * 0.055,
                            ),
                            InkWell(
                              child: Choice08(
                                  icon: Icons.hotel,
                                  text: "Hotels",
                                  selected: isHotelSelected),
                              onTap: () {
                                setState(() {
                                  isHotelSelected = true;
                                  isHomeSelected = false;
                                  isResSelected = false;
                                  loadNearest(hotels);
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              child: Choice08(
                                  icon: Icons.restaurant_outlined,
                                  text: "Restaurant",
                                  selected: isResSelected),
                              onTap: () {
                                setState(() {
                                  isResSelected = true;
                                  isHomeSelected = false;
                                  isHotelSelected = false;
                                  loadNearest(restaurants);
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            nearestTitle,
            Items34(lists: nearest, isTicket: isHomeSelected),
            SizedBox(
              height: 20,
            ),
            hotTitle(isHomeSelected, isHotelSelected, isResSelected),
            tickets.isEmpty
                ? Center(
                    child: Text("Loading..."),
                  )
                : getItems169(isHomeSelected, isHotelSelected, isResSelected),
            isHomeSelected == true
                ? Column(
                    children: [
                      popularTitle(),
                      regions.isEmpty
                          ? Center(
                              child: Text("Loading..."),
                            )
                          : regionItem(
                              lists: regions,
                            )
                    ],
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  hotTitle(isHome, isHotel, isRestaurant) {
    var name = "";
    if (isHome) {
      name = "Ticket";
    } else if (isHotel) {
      name = "hotels";
    } else {
      name = "restaurant";
    }
    return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (isHotel) {
                    HotelAPI.fetchHotel('hot').then((dataFromServer) {
                      setState(() {
                        hotels = dataFromServer;
                      });
                    });
                  }
                  if (isRestaurant) {
                    RestaurantAPI.fetchRestaurant('hot').then((dataFromServer) {
                      setState(() {
                        restaurants = dataFromServer;
                      });
                    });
                  }
                });
              },
              child: Text(
                "Hot $name",
                style: viewallstyle,
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            ),
            Spacer(),
            isHome == false
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (isHotel) {
                          HotelAPI.fetchHotel('all').then((dataFromServer) {
                            setState(() {
                              hotels = dataFromServer;
                            });
                          });
                        }
                        if (isRestaurant) {
                          RestaurantAPI.fetchRestaurant('all')
                              .then((dataFromServer) {
                            setState(() {
                              restaurants = dataFromServer;
                            });
                          });
                        }
                      });
                    },
                    child: Text("View all $name", style: viewallstyle),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  )
                : Container(),
          ],
        ));
  }

  var nearestTitle = Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Nearest to you",
          style: title,
        ),
      ],
    ),
  );

  popularTitle() {
    var component = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Regions",
            style: title,
          )
        ],
      ),
    );

    return component;
  }
}

getItems169(isHome, isHotel, isRestaurant) {
  List lists = [];
  bool isTicket = false;
  if (isHome) {
    lists = tickets;
    isTicket = true;
  } else if (isHotel) {
    lists = hotels;
  } else {
    lists = restaurants;
  }
  return Item169(
    isWishLish: false,
    listItems: lists,
    isTicket: isTicket,
  );
}

var title =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
var viewallstyle = TextStyle(fontSize: 14, color: primaryColor //Colors.teal
    );
checkList(isHome, isHotel, isRestaurant) {
  if (isHome) {
    return tickets;
  } else if (isHotel) {
    return hotels;
  } else {
    return restaurants;
  }
}
