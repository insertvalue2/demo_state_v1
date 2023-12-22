import 'package:demo_state_01/callback_function/f_child_a.dart';
import 'package:demo_state_01/callback_function/f_child_b.dart';
import 'package:flutter/material.dart';

class ParentsView extends StatefulWidget {
  const ParentsView({super.key});

  @override
  State<ParentsView> createState() => _ParentsViewState();
}

class _ParentsViewState extends State<ParentsView> {
  String childMessageContent = "여기는 부모 위젯 영역 이야";

  // 코드 수정
  // 호출시 자식 입장에서 input 값을 받을 수 있도록 설계
  void onCallbackPressed(String msg) {
    setState(() {
      childMessageContent = msg;
    });
  }

  // 자식들에게 생성자를 통해서 최첨단 양자 함수를 내려주자.
  // onCallbackPressed --> 함수를 자식에게 전달

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 1, child: Center(child: Text(childMessageContent))),
            Expanded(flex: 1, child: ChildA(callback: onCallbackPressed)),
            Expanded(flex: 1, child: ChildB(callback: onCallbackPressed)),
          ],
        ),
      ),
    );
  }
}
