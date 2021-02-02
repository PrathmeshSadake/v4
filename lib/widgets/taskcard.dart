import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 32.0,
      ),
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get Started',
                style: TextStyle(
                  color: Color(0xFF211551),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Hello User! Welcome to Todoist, this is a default task you can simply edit or delete this one to start using the app.',
                style: TextStyle(
                  color: Color(0xFF868290),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF7349FE),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Image.asset('assets/images/add_icon.png'),
              )),
        ],
      ),
    );
  }
}
