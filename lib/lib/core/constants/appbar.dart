import 'package:flutter/material.dart';

PreferredSizeWidget appBar(context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      onPressed: (() {
        Navigator.pop(context);
      }),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    ),
    actions: [
      IconButton(
          onPressed: (() {
          }),
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          )),
    ],
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
            text: const TextSpan(
                text: 'DevCamp',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
                children: [
              TextSpan(
                text: 'News',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ])),
      ],
    ),
  );
}

AppBar appBarHome(context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    actions: [
      IconButton(
          onPressed: (() {}),
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          )),
    ],
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
            text: const TextSpan(
                text: 'DevCamp',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
                children: [
              TextSpan(
                text: 'News',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ])),
      ],
    ),
  );
}
