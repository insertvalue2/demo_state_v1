import 'package:flutter/material.dart';

import '../../common/product.dart';

// App State : 카트에 담긴 상품 목록
// 상품 클릭
/// Flutter에서 InheritedWidget을 활용하여
/// 데이터를 하위 위젯에게 전달하는 방법
class InheritedCart extends InheritedWidget {
  // 생성자를 통해 필수 데이터와 자식 위젯을 받습니다.
  const InheritedCart(
      {required this.cartProductList,
      required this.onProductPressed,
      required super.child});

  // 카트에 담긴 상품 목록
  final List<Product> cartProductList;

  // 상품 클릭 콜백 - product 를 인자로 받는다.
  final void Function(Product product) onProductPressed;

  // 외부에서 손쉽게 접근할 수 있는 static 함수 설계
  // 컨텍스트를 통해 InheritedCard에 접근할 수 있는 정적 메서드입니다.
  // 이 함수를 사용하여 위젯 트리에서 InheritedCard를 찾을 수 있습니다
  static InheritedCart of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedCart>()!;
  }

  // 위젯이 업데이트 되어야 할 때 호출됩니다.
  // 여기서는 cartProductList가 변경되었는지를 검사하여, 변경된 경우 true를 반환합니다.
  // 이는 하위 위젯에게 위젯 트리를 다시 빌드할 필요가 있는지 알려줍니다.
  @override
  bool updateShouldNotify(covariant InheritedCart oldWidget) {
    print("${cartProductList.length} / ${oldWidget.cartProductList.length}");
    return cartProductList != oldWidget.cartProductList;
  }
}
