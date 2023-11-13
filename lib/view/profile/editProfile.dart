import 'package:flutter/material.dart';
import 'package:travel/config/color.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel/view/item/alert_dialog.dart';

class UpdateProfileScreen extends StatelessWidget {
  final GoogleSignInAccount user;
  const UpdateProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tFormHeight = 50;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text("Edit Profile",
            style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
        backgroundColor: secondaryHeaderColor.shade300,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(width / 12),
          child: Column(
            children: [
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
              const Divider(),
              const SizedBox(height: 10),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Email"),
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Phone Number"),
                          prefixIcon: Icon(Icons.phone)),
                    ),
                    const SizedBox(height: tFormHeight - 20),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Future.delayed(const Duration(milliseconds: 300), () {
                            showDialog(
                                context: context,
                                builder: (context) => CardAlertDialog(
                                      typeAlert: "Update",
                                    ));
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor.shade300,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(
                          "Edit Profile",
                          // style: TextStyle(color: tDarkColor)
                        ),
                      ),
                    ),
                    const SizedBox(height: tFormHeight - 0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
