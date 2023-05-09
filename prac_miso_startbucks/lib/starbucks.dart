import 'package:flutter/material.dart';

/// Starbucks 메인 색상
Color starbucksPrimaryColor = Color.fromARGB(255, 83, 184, 138);

/// Starbucs 포인트 색상
Color starbucksAccentColor = Color.fromARGB(255, 199, 176, 121);

class Starbucks extends StatefulWidget {
  const Starbucks({Key? key}) : super(key: key);

  @override
  State<Starbucks> createState() => _StarbucksState();
}

class _StarbucksState extends State<Starbucks> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text("Starbucks 첫 번째 페이지"),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text("Starbucks 두 번째 페이지"),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text("Starbucks 세 번째 페이지"),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text("Starbucks 네 번째 페이지"),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text("Starbucks 다섯 번째 페이지"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: starbucksPrimaryColor,
        // 선택된 아이콘 색상
        unselectedItemColor: Colors.grey,
        // 선택되지 않은 아이콘 색상
        showSelectedLabels: false,
        // 선택된 항목 label 숨기기
        showUnselectedLabels: false,
        // 선택되지 않은 항목 label 숨기기
        type: BottomNavigationBarType.fixed,
        // 선택시 아이콘 움직이지 않기
        backgroundColor: Colors.white.withOpacity(0.8),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.free_breakfast), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.redeem), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ""),
        ],
      ),
    );
  }
}
