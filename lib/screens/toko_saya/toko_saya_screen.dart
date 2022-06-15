import 'package:flutter/material.dart';

class TokoSaya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/96241592?v=4",
                      ),
                      radius: 50.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "ACUL KOMPUTER",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 22.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: const <Widget>[
                                  Text(
                                    "Dibuka Sejak",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      // color: Colors.blueAccent,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "2017",
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: const <Widget>[
                                  Text(
                                    "Lokasi",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      // color: Colors.blueAccent,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Sebulu Ulu",
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 22.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: const <Widget>[
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'Acul Komputer adalah toko komputer yang berfokus dalam penjual hardware komputer dan laptop sejak tahun 1945.'
                                    '\n\nBerlokasi di Jalan Ulin RT.10 Kel. Sebulu Ulu, Kec. Sebulu, Kab. Kutai Kartanegara 75552',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      // color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .2,
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
