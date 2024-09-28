import 'package:flutter/material.dart';

import 'package:todo/homepage.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 112, 129, 216),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Manage your \nDaily TO DO ",
                style: TextStyle(fontSize: 40),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 369,
              height: 497.66,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("Illustration.png"), fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 56,
                      height: 18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffFFC727))),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      width: 56,
                      height: 18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffFCD873))),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      width: 56,
                      height: 18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffFCD873)))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Without much worry just manage \nthings as easy as piece of cake",
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(30),
              width: 232,
              height: 38,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Homepage(
                                  tasks: [],
                                )));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFFC00E),
                  ),
                  child: Text(
                    "Create a Note ",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
