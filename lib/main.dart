import 'package:flutter/material.dart';
import 'package:ott_platforms/screen/globals.dart';
import 'package:ott_platforms/screen/web_Page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: '/',
      routes: {
        'web': (context) => const Web_Page(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Web App"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(3.0, 3.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          image: DecorationImage(
                              image: AssetImage('assets/image/Netflix.webp'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 10),
                      OutlinedButton(
                        child: const Text(
                          "Netflix",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Global.currentWeb = Global.urls[0];
                          });
                          Navigator.of(context).pushNamed("web");
                        },
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(3.0, 3.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/image/Amazon-prime.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 10),
                      OutlinedButton(
                        child: const Text(
                          "Amazon prime",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Global.currentWeb = Global.urls[1];
                          });
                          Navigator.of(context).pushNamed("web");
                        },
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(3.0, 3.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/image/Disney+Hotstar.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 10),
                      OutlinedButton(
                        child: const Text(
                          "Disney+Hotstar",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Global.currentWeb = Global.urls[2];
                          });
                          Navigator.of(context).pushNamed("web");
                        },
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(3.0, 3.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          image: DecorationImage(
                              image: AssetImage('assets/image/Sonyliv.webp'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 10),
                      OutlinedButton(
                        child: const Text(
                          "Sonyliv Web",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              Global.currentWeb = Global.urls[3];
                            },
                          );
                          Navigator.of(context).pushNamed("web");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
