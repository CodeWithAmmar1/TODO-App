import 'package:flutter/material.dart';
import 'package:todo/addscreen.dart';
import 'package:todo/home_container.dart';

class Homepage extends StatefulWidget {
  final List<Map<String, String>> tasks;

  Homepage({required this.tasks});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late List<Map<String, String>> tasks;

  @override
  void initState() {
    super.initState();
    tasks = widget.tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 112, 129, 216),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Welcome to Notes",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                CircleAvatar(
                  backgroundImage: AssetImage("profile.jpg"),
                  radius: 30,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Have a great Day",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 30),
            child: Text(
              "My Priority Task ",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Row(
            children: [
              HomeContainer(
                  text1: "2 hours Ago",
                  text2: "Mobile App\nUI Design",
                  text3: 'using Figma \nand other tools',
                  icon: Icon(
                    Icons.mobile_screen_share,
                    color: Colors.white.withOpacity(0.5),
                  )),
              HomeContainer(
                  text1: "2 hours Ago",
                  text2: "Capture sun\nRise Shot",
                  text3: 'complete GShot\nChallenge',
                  icon: Icon(
                    Icons.mobile_screen_share,
                    color: Colors.white.withOpacity(0.5),
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Task ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  child: Icon(
                    Icons.add_circle,
                    color: const Color.fromARGB(255, 14, 255, 22),
                    size: 34,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddScreen(
                          tasks: tasks,
                        ),
                      ),
                    ).then((_) {
                      setState(() {});
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today’s Task",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "Weekly  Task",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Monthly Task",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task["title"] ?? '',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                SizedBox(width: 5),
                                Text(
                                  "${task["to"]} - ${task["from"]}",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              task["description"] ?? '',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.delete,
                              size: 30,
                            ),
                            onTap: () {
                              setState(() {
                                tasks.removeAt(index);
                              });
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            child: Icon(
                              Icons.edit,
                              size: 30,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddScreen(
                                    tasks: tasks,
                                    taskToEdit: tasks[index],
                                    taskIndex: index,
                                  ),
                                ),
                              ).then((_) {
                                setState(() {});
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
