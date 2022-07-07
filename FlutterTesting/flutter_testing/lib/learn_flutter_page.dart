import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({Key? key}) : super(key: key);

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPage();
}

class _LearnFlutterPage extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Learn Flutter'),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
              onPressed: () {
                debugPrint('End Button');
              },
              icon: Icon(
                Icons.info_outline,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('images/1.jpg'),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.black,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                color: Colors.blueGrey,
                child: const Center(
                  child: Text(
                    'This is a text widget',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: isSwitch ? Colors.red : Colors.blue,
                ),
                onPressed: () {
                  debugPrint('Elevated Button');
                },
                child: const Text('Elevated Button'),
              ),
              OutlinedButton(
                onPressed: () {
                  debugPrint('OutlinedButton');
                },
                child: const Text('OutlinedButton'),
              ),
              TextButton(
                onPressed: () {
                  debugPrint('TextButton');
                },
                child: const Text('TextButton'),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  debugPrint('This is a rows.');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.blue,
                    ),
                    Text('Row widget'),
                    Icon(
                      Icons.local_fire_department,
                    ),
                  ],
                ),
              ),
              Switch(
                  value: isSwitch,
                  onChanged: (bool newBool) {
                    setState(() {
                      isSwitch = newBool;
                    });
                  }),
              Checkbox(
                  value: isCheck,
                  onChanged: (bool? newBool) {
                    setState(() {
                      isCheck = newBool;
                    });
                  }),
              Image.network(
                  'https://www.techoffside.com/wp-content/uploads/2021/06/LINE-FRIENDS-BROWN-FRIENDS-3.jpg'),
            ],
          ),
        ));
  }
}
