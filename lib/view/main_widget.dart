import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siec/view/animals_page.dart';
import 'package:siec/view/home.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int __currentIndex = 0;
  final List<Widget> __optionWidget = const [
    Home(), AnimalPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: __optionWidget.elementAt(__currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: __currentIndex,
        onTap: (value) {
          setState(() {
            __currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.doc_plaintext), label: "Todo"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.doc_richtext), label: "Animal"),
        ],
      ),
    );
  }
}
