import 'package:flutter/material.dart';
import 'package:todo/container.dart';
import 'package:todo/homepage.dart';

class AddScreen extends StatefulWidget {
  final List<Map<String, String>> tasks;
  final Map<String, String>? taskToEdit;
  final int? taskIndex;
  AddScreen({
    super.key,
    required this.tasks,
    this.taskToEdit,
    this.taskIndex,
  });

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  late TextEditingController from;
  late TextEditingController to;
  late TextEditingController title;
  late TextEditingController description;

  @override
  void initState() {
    super.initState();

    from = TextEditingController(text: widget.taskToEdit?["from"] ?? "");
    to = TextEditingController(text: widget.taskToEdit?["to"] ?? "");
    title = TextEditingController(text: widget.taskToEdit?["title"] ?? "");
    description =
        TextEditingController(text: widget.taskToEdit?["description"] ?? "");
  }

  @override
  void dispose() {
    from.dispose();
    to.dispose();
    title.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 112, 129, 216),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    widget.taskToEdit != null ? "Edit Task" : "Create new Task",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                CircleAvatar(
                  backgroundImage: AssetImage("profile.jpg"),
                  radius: 30,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 115, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "From",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text("To",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextField(
                  controller: from,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(255, 255, 255, 1),
                    hintText: '10:00 A.M',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
              ),
              Expanded(
                child: TextField(
                  controller: to,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "04:30 P.M",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 40),
            child: Text(
              "Title",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: title,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 40),
            child: Text(
              "Description",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: description,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 80),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              "Choose Priority",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ContainerPriority(color: Color(0xffDD1515), text: "High"),
              ContainerPriority(color: Color(0xffA6A6A6), text: "Medium"),
              ContainerPriority(color: Color(0xff79AF92), text: "Low"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
              margin: EdgeInsets.all(30),
              width: 374,
              height: 53,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (widget.taskToEdit != null &&
                          widget.taskIndex != null) {
                        widget.tasks[widget.taskIndex!] = {
                          "title": title.text,
                          "description": description.text,
                          "from": from.text,
                          "to": to.text,
                        };
                      } else {
                        widget.tasks.add({
                          "title": title.text,
                          "description": description.text,
                          "from": from.text,
                          "to": to.text,
                        });
                        title.clear();
                        to.clear();
                        from.clear();
                        description.clear();
                      }
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homepage(tasks: widget.tasks),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff79AF92),
                  ),
                  child: Text(
                    widget.taskToEdit != null ? "Save" : "Add",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
