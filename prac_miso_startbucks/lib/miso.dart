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

class MisoSecondPage extends StatelessWidget {
  const MisoSecondPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Text(
                  "예약내역",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 64),
                Row(
                  children: [
                    Icon(Icons.error, color: misoPrimaryColor),
                    SizedBox(width: 8),
                    Expanded(
                        child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text("예약된 서비스가 아직 없습니다. 지금 예약해보세요!!!!!!!",
                          style: TextStyle(
                            fontSize: 100,
                          )),
                    ))
                  ],
                ),
                Divider(
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Positioned(
              bottom: 18,
              left: 24,
              right: 24,
              child: GestureDetector(
                  onTap: () {
                    print("예약하기 클릭!");
                  },
                  child: Container(
                    width: double.infinity,
                    height: 58,
                    color: misoPrimaryColor,
                    alignment: Alignment.center,
                    child: Text(
                      "예약하기",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )))
        ]),
      )),
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
      backgroundColor: misoPrimaryColor,
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                bottom: 0,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 200),
                  child: Image.network(backgroundImgUrl),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 64),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: 28,
                          height: 1.5,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(text: "친구 추천할 때마다 \n"),
                          TextSpan(
                              text: "10,000원 ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(text: "할인 쿠폰 적립! "),
                        ])),
                SizedBox(height: 64),
                GestureDetector(
                    onTap: () {
                      print("자세히 보기 클릭!");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "자세히 보기",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        )
                      ],
                    ))
              ],
            ),
            Positioned(
                bottom: 42,
                child: GestureDetector(
                    onTap: () {
                      print("친구 추천 클릭");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(64),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.redeem,
                            color: misoPrimaryColor,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "친구 추천하기",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: misoPrimaryColor,
                            ),
                          )
                        ],
                      ),
                    )))
          ],
        ),
      )),
    );
  }
}

/// 네 번째 페이지
class MisoFourthPage extends StatelessWidget {
  const MisoFourthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 62),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "나의정보",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "010-0000-0000",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              ListTile(
                onTap: ()=> print("주소관리 클릭"),
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.home_outlined, color: Colors.black,),
                title: Text(
                  "주소 관리",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ),
              ListTile(
                onTap: ()=> print("주소관리 클릭"),
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.home_outlined, color: Colors.black,),
                title: Text(
                  "주소 관리",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ),
              ListTile(
                onTap: ()=> print("주소관리 클릭"),
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.home_outlined, color: Colors.black,),
                title: Text(
                  "주소 관리",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ),


            ],
          ),
        ),
      ),
    );
  }
}
