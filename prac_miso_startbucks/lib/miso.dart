import 'package:flutter/material.dart';

Color misoPrimaryColor = Color.fromARGB(255, 38, 103, 240);

class Miso extends StatefulWidget {
  const Miso({Key? key}) : super(key: key);

  @override
  State<Miso> createState() => _MisoState();
}

class _MisoState extends State<Miso> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(index: currentIndex, children: [
          MisoFirstPage(),
          MisoSecondPage(),
          MisoThirdPage(),
          MisoFourthPage(),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          selectedItemColor: misoPrimaryColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          // 선택된 항목 label 숨기기
          showUnselectedLabels: false,
          // 선택되지 않은 항목 label 숨기기
          type: BottomNavigationBarType.fixed,
          // 선택시 아이콘 움직이지 않기
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.redeem), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        ));
  }
}

class MisoSecondPage extends StatelessWidget {
  const MisoSecondPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Miso 두 번째 페이지")),
    );
  }
}

class MisoFirstPage extends StatelessWidget {
  const MisoFirstPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: misoPrimaryColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(alignment: Alignment.center, children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Text(
                  "대한민국 1등 홈서비스\n미소를 만나보세요!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 38),
                GestureDetector(
                    onTap: () {
                      print("눌렀다!");
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 24,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(64),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add, color: misoPrimaryColor),
                            SizedBox(width: 6),
                            Text(
                              "예약하기",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: misoPrimaryColor,
                              ),
                            )
                          ],
                        )))
              ],
            ),
            Positioned(
              bottom: 32,
              child: GestureDetector(
                  onTap: () {
                    print("service clicked!");
                  },
                  child: Container(
                      color: Colors.white.withOpacity(0.3),
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "서비스 이용하기",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
            )
          ]),
        ),
      ),
    );
  }
}

/// 세 번째 페이지
class MisoThirdPage extends StatelessWidget {
  const MisoThirdPage({Key? key}) : super(key: key);

  /// 세 번째 화면 배경 이미지 URL
  final String backgroundImgUrl =
      "https://i.ibb.co/rxzkRTD/146201680-e1b73b36-aa1e-4c2e-8a3a-974c2e06fa9d.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Miso 세 번째 페이지"),
      ),
    );
  }
}

/// 네 번째 페이지
class MisoFourthPage extends StatelessWidget {
  const MisoFourthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Miso 네 번째 페이지"),
      ),
    );
  }
}
