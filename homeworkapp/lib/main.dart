import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 홈페이지 보여주기
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 음식 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "category": "탑건: 매버릭",
        "imgUrl": "https://i.ibb.co/sR32PN3/topgun.jpg",
      },
      {
        "category": "마녀2",
        "imgUrl": "https://i.ibb.co/CKMrv91/The-Witch.jpg",
      },
      {
        "category": "범죄도시2",
        "imgUrl": "https://i.ibb.co/2czdVdm/The-Outlaws.jpg",
      },
      {
        "category": "헤어질 결심",
        "imgUrl": "https://i.ibb.co/gM394CV/Decision-to-Leave.jpg",
      },
      {
        "category": "브로커",
        "imgUrl": "https://i.ibb.co/MSy1XNB/broker.jpg",
      },
      {
        "category": "문폴",
        "imgUrl": "https://i.ibb.co/4JYHHtc/Moonfall.jpg",
      },
    ];

    // 화면에 보이는 영역
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: Text(
            'Movie Reviews',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                print("프로필 클릭");
              },
              icon: Icon(Icons.person_outline),
              iconSize: 30.0,
            )
          ]),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "검색어를 입력해주세요",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 200, // 모든 이미지의 높이를 200픽셀로 고정
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image.network(
                          dataList[index]['imgUrl'],
                          fit: BoxFit.cover, // 이미지가 컨테이너 영역을 꽉 채우도록 설정
                          color: Colors.black
                              .withOpacity(0.6), // 이미지를 어둡게 처리하기 위한 색상 오버레이 적용
                          colorBlendMode:
                              BlendMode.darken, // 오버레이 색상과 이미지를 어둡게 혼합하는 모드 적용
                        ),
                      ),
                      Center(
                        child: Text(
                          dataList[index]['category'],
                          style: TextStyle(
                            color: Colors.white, // 텍스트 색상을 흰색으로 설정
                            fontSize: 24, // 텍스트 크기 설정
                            fontWeight: FontWeight.bold, // 텍스트 굵기를 bold로 설정
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
