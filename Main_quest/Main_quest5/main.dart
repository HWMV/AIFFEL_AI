import 'package:flutter/material.dart';
import 'screen_one.dart'; // 1번 화면에 해당하는 파일

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Friend CB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('My Friend CB'),
          backgroundColor: const Color.fromARGB(255, 24, 150, 196),
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.blue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/main_image.png'), // 이미지
              const SizedBox(height: 40), // 이미지와 버튼 사이 간격 증가
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenOne()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      const Color.fromARGB(117, 255, 255, 255), // 버튼 색상
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 15), // 버튼 패딩
                ),
                child: const Text(
                  'Talk?,Talk!',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                ),
              ),
              const SizedBox(height: 10), // 버튼 아래 추가 간격
            ],
          ),
        ),
      ),
    );
  }
}
