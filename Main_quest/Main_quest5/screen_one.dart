import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScreenOne extends StatefulWidget {
  ScreenOne({super.key});

  final TextEditingController _controller = TextEditingController(); // 텍스트 컨트롤러

  @override
  // ignore: library_private_types_in_public_api
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  String chatResponse = '챗봇의 답변이 여기에 표시됩니다.';
  final TextEditingController messageController = TextEditingController();

  Future<void> sendMessage() async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8021/chat/'), // FastAPI 서버 주소와 포트
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: json.encode({'text': widget._controller.text}),
    );

    if (response.statusCode == 200) {
      var data = json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        chatResponse = data['answer']; // 서버로부터 받은 응답을 UI에 업데이트
      });
      print(chatResponse);
    } else {
      // 에러 처리
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('My Friend CB'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
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
            child: Column(children: <Widget>[
              const SizedBox(height: 20),
              Center(
                child: Image.asset('assets/images/one_image.png'),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.lightBlueAccent,
                width: 300,
                height: 200,
                child: Text(
                  chatResponse,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // color: Colors.white,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: widget._controller, // 텍스트 컨트롤러 연결
                    decoration: InputDecoration(
                      hintText: '여기에 메시지를 입력하세요...',
                      border: const OutlineInputBorder(),
                      filled: true, // 배경색 채우기 활성화
                      fillColor: Colors.white, // 배경색 지정
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: sendMessage, // 메시지 전송 함수 연결
                      ),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
