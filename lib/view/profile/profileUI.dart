import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/view/profile/bookingMana.dart';
import 'package:travel/config/color.dart';
import 'editProfile.dart';
import '../item/menuProfileItem.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel/API/google_signin_API.dart';
import '../login/loginUI.dart';

class ProfileUI extends StatelessWidget {
  final GoogleSignInAccount user;
  const ProfileUI({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () => Get.back(),
      //       icon: const Icon(LineAwesomeIcons.angle_left)),
      //   title: Text(tProfile, style: Theme.of(context).textTheme.headline4),
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(image: NetworkImage(user.photoUrl!))),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(user.displayName!,
                  style: Theme.of(context).textTheme.headlineMedium),
              Text(user.email, style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UpdateProfileScreen(user: user)));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor.shade300,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text("Edit Information",
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(
                  title: "Settings",
                  icon: Icons.settings_outlined,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Billing Details",
                  icon: Icons.wallet_outlined,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Booking Management",
                  icon: Icons.history_edu_rounded,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (bookingManaUI())));
                  }),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Your Information",
                  icon: Icons.person_outline,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.logout,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () => confirmLogout(context)
                  // {
                  //   Get.defaultDialog(
                  //     title: "LOGOUT",
                  //     titleStyle: const TextStyle(fontSize: 20),
                  //     content: const Padding(
                  //       padding: EdgeInsets.symmetric(vertical: 15.0),
                  //       child: Text("Are you sure, you want to Logout?"),
                  //     ),
                  //     confirm: Expanded(
                  //       child: ElevatedButton(
                  //         onPressed: () => {
                  //           GoogleSignInAPI.logout(),
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => LoginUI()))
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //             backgroundColor: Colors.redAccent,
                  //             side: BorderSide.none),
                  //         child: const Text("Yes"),
                  //       ),
                  //     ),
                  //     cancel: OutlinedButton(
                  //         onPressed: () => Get.back(), child: const Text("No")),
                  //   );
                  // }
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> confirmLogout(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('LOGOUT CONFIRM'),
          content: const Text('Are you sure, you want to Logout?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('NO'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('YES'),
              onPressed: () {
                GoogleSignInAPI.logout();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginUI()));
              },
            ),
          ],
        );
      },
    );
  }
}
