import 'package:Todoist/helpers/db_helper.dart';
import 'package:flutter/material.dart';
import '../widgets/taskcard.dart';
import '../widgets/scrollBehavior.dart';
import './taskpage.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
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
                      top: 28.0,
                      bottom: 28.0,
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 50,
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: _dbHelper.getTasks(),
                      builder: (context, snapshot) {
                        return ScrollConfiguration(
                          behavior: NoGlowBehaviour(),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (ctx) => Taskpage(
                                        task: snapshot.data[index],
                                      ),
                                    ),
                                  ).then((value) {
                                    setState(() {});
                                  });
                                },
                                child: TaskCard(
                                  title: snapshot.data[index].title,
                                  description: snapshot.data[index].description,
                                ),
                              );
                            },
                            itemCount: snapshot.data == null
                                ? 0
                                : snapshot.data.length,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 34.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => Taskpage(
                          task: null,
                        ),
                      ),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF7349FE), Color(0xFF643FD8)],
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
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
