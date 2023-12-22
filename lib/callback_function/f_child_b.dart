import 'package:flutter/material.dart';

class ChildB extends StatelessWidget {
  const ChildB({required this.callback, super.key});
  //final VoidCallback callback;
  // 부모에게서 내려 받을 함수에 모양을 동일하게 설계 한다.
  final Function(String passToParentsMsg) callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        // 주의 - 함수의 모양
        onTap: () {
          callback('B에게 이벤트 발생!!!');
        },
        child: Container(
          width: double.infinity,
          color: Colors.redAccent,
          child: const Center(
            child: Text("CHILD B"),
          ),
        ),
      ),
    );
  }
}
