import 'package:flutter/material.dart';
import '../widgets/taskcard.dart';
import '../widgets/scrollBehavior.dart';
import './taskpage.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          color: Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 32.0,
                      bottom: 32.0,
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: NoGlowBehaviour(),
                      child: ListView(
                        children: [
                          TaskCard(
                            title: 'Get Started',
                            description:
                                'Hello User! Welcome to Todoist, this is a default task you can simply edit or delete this one to start using the app.',
                          ),
                          TaskCard(),
                          TaskCard(),
                          TaskCard(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => Taskpage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      // color: Color(0xFF7349FE),
                      gradient: LinearGradient(
                        colors: [Color(0xFF7349FE), Color(0xFF643FD8)],
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Image.asset('assets/images/add_icon.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
