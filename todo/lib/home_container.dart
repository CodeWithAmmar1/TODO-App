import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final Icon icon;
  const HomeContainer(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10),
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xffA6A6A6),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 100),
              child: icon,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                child: Text(
              text1,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 10,
            ),
            Container(
                child: Text(
              text2,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 10,
            ),
            Container(
                child: Text(
              text3,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.5)),
            )),
          ],
        ),
      ),
    );
  }
}
