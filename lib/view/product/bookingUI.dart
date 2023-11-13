import 'package:flutter/material.dart';
import '../../config/color.dart';
import '../../config/card_input_formatter.dart';
import 'package:flutter/services.dart';
import '../item/alert_dialog.dart';

class bookingUI extends StatefulWidget {
  const bookingUI({Key? key}) : super(key: key);

  @override
  State<bookingUI> createState() => bookingState();
}

class bookingState extends State<bookingUI> {
  final TextEditingController putAdult = TextEditingController();
  final TextEditingController putChild = TextEditingController();
  // final TextEditingController cardHolderNameController =
  //     TextEditingController();

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final hour = today.hour.toString().padLeft(2, '0');
    final minutes = today.minute.toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title:
            Text("Booking", style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
        backgroundColor: primaryColor.shade300,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Row(),
              Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.12,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          pickDateTime();
                        },
                        child: Icon(
                          Icons.calendar_month_outlined,
                          size: 25,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                side: BorderSide(color: primaryColor))),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "${today.year}/${today.month}/${today.day}  ${today.hour}:${today.minute}",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: putAdult,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    hintText: 'Enter adult',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  inputFormatters: [
                    // FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                    CardInputFormatter(),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: putChild,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    hintText: 'Enter child',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(
                      Icons.child_care,
                      color: Colors.grey,
                    ),
                  ),
                  inputFormatters: [
                    // FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                    CardInputFormatter(),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    hintText: 'Some note',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(
                      Icons.note_add_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20 * 3),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: primaryColor.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width / 1.12, 55),
                ),
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 300), () {
                    showDialog(
                        context: context,
                        builder: (context) => CardAlertDialog(
                              typeAlert: "Booking",
                            ));
                    putAdult.clear();
                    putChild.clear();
                  });
                },
                child: Text(
                  'Booking Now',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future pickDate() => showDatePicker(
        context: context,
        initialDate: today,
        firstDate: today,
        lastDate: today.add(Duration(days: 90)),
      );

  Future pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(today),
      );

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    TimeOfDay? time = await pickTime();
    if (time == null) return;

    final timeUsed =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() => this.today = timeUsed);
  }
}
