import 'package:flutter/material.dart';

class SurveyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              spreadRadius: 0,
              blurRadius: 2,
              color: Colors.black,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '09 nov 2022',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Whats your favorite web framework?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
