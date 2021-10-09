import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: GirisSayfasi(),
    );
  }
}

class GirisSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/40.png"),
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Mr.Robot",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 7,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        child: const Center(
                          child: Text(
                            "Mail ile Giriş",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        width: 260,
                        height: 52,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: const Center(
                                child: Text(
                                  "Facebook Giriş",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              height: 52,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              child: const Center(
                                child: Text(
                                  "Gmail Giriş",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              height: 52,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 183, 57, 100),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - 50,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
