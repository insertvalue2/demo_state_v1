import 'package:flutter/material.dart';

class ChildA extends StatelessWidget {
  const ChildA({required this.callback, super.key});

  //final VoidCallback callback;
  // 부모에게서 내려 받을 함수에 모양을 동일하게 설계 한다.
  final Function(String msg) callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        // onCatchPressed <-- 함수
        // onTap: () {
        //   print("child A에 이벤트 발생");
        // },
        onTap: () {
          callback('A 에게 이벤트가 발생 했어');
        },
        child: Container(
          width: double.infinity,
          color: Colors.orange,
          child: const Center(
            child: Text("CHILD A"),
          ),
        ),
      ),
    );
  }
}
