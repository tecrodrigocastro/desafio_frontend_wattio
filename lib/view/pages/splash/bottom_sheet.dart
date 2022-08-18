import 'package:flutter/material.dart';

Widget buildPage({
  required Color color,
  required String urlImage,
  required String title,
  required String subtitle,
  bool? screen,
  bool? initialPage,
  required BuildContext context,
}) =>
    Container(
      height: MediaQuery.of(context).size.width / 2,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              urlImage,
              fit: BoxFit.cover,
              //width: screen!
              //  ? MediaQuery.of(context).size.width / 3
              //  : double.infinity,
            ),
          ),
          const SizedBox(height: 64),
          Text(
            title,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: EdgeInsets.symmetric(horizontal: screen! ? 100 : 20),
            child: Text(
              subtitle,
              style: TextStyle(
                color: Colors.black45,
                fontSize: screen ? 20 : 15,
              ),
            ),
          ),
        ],
      ),
    );
