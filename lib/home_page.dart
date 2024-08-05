

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var myBox = Hive.box('testBox');

  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: 'Enter title',
                    ),
                    onSubmitted: (String value) {
                      myBox.add(value);
                      titleController.clear();
                      print("box value : ${myBox.values}");
                      setState(() {});
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    myBox.add(titleController.text);
                    titleController.clear();
                    print("box value : ${myBox.values}");
                    setState(() {});
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: myBox.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(myBox.getAt(index).toString()),
                    trailing: IconButton(
                      onPressed: () {
                        myBox.deleteAt(index);
                        print("box value : ${myBox.values}");
                        setState(() {});
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 30),
                    child: const Divider(
                      color: Colors.black,
                      height: 1,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
























