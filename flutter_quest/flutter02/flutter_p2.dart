import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.radio_button_on), // 원하는 아이콘 추가
          title: const Text('플러터 앱 만들기!'), // 중앙 텍스트 추가
          centerTitle: true,
          backgroundColor: Colors.black54,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https://upload3.inven.co.kr/upload/2023/02/10/bbs/i16217949963.jpg?MW=800', // 실제 이미지 URL로 교체 필요
                height: 350, // 이미지의 높이 설정
                width: 300, // 이미지의 너비 설정
              ),
              const SizedBox(height: 5), // 앱바와 여백 주기
              ElevatedButton(
                onPressed: () {
                  print('버튼이 눌렸습니다!'); // 버튼 클릭 시 콘솔에 메시지 출력
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black12, // 버튼 배경색
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                child: const Text('Text'),
              ),
              const SizedBox(height: 15), // 버튼과 컨테이너 사이 간격 조정
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(width: 300, height: 300, color: Colors.blue),
                      Container(width: 240, height: 240, color: Colors.green),
                      Container(width: 180, height: 180, color: Colors.yellow),
                      Container(width: 120, height: 120, color: Colors.orange),
                      Container(width: 60, height: 60, color: Colors.red),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
