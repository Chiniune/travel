import 'package:flutter/material.dart';
import 'package:travel/API/test.dart';

class testsenUI extends StatefulWidget {
  const testsenUI({super.key});

  @override
  State<testsenUI> createState() => _testsenUIState();
}

class _testsenUIState extends State<testsenUI> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("data"),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  testAPI.addData('he23784sh', 'cudfgs2', '72agy');
                });
              },
              child: const Icon(Icons.add))
        ],
      ),
    );
  }
}
