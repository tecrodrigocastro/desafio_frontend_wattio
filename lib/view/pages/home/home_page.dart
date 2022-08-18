import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeigth = MediaQuery.of(context).size.height;

    bool isDesktop(BuildContext context) => sizeWidth >= 600;
    bool isMobile(BuildContext context) => sizeWidth < 600;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SizedBox(
            height: sizeHeigth,
            width: sizeWidth,
            child: Card(
              color: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Calcule a sua economia',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'O valor da minha conta de luz mensal é:',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.white,
                      height: 50,
                      width: isMobile(context) ? sizeWidth : sizeWidth / 2,
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        initialValue: '1000',
                        decoration: const InputDecoration(
                          prefixText: 'R\$',
                          prefixStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        shadowColor: Colors.red,
                        primary: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Calcular economia',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
