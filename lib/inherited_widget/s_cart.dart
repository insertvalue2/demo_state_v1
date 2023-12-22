import 'package:demo_state_01/inherited_widget/state/inherited_cart.dart';
import 'package:flutter/material.dart';
import '../common/f_product_title.dart';
import '../common/product.dart';

class CartScreen extends StatelessWidget {
  // InheritedWidget 을 활용한 InheritedCart 위젯을 사용 하여
  // 생성자 의존 주입을 하지 하지 않아도 된다.
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // InheritedCart 인스턴스를 현재 컨텍스트에서 찾아옵니다.
    // 이 인스턴스를 통해 장바구니에 담긴 상품 목록과 상품 클릭 시 호출될 함수에 접근할 수 있습니다.
    InheritedCart inheritedCart = InheritedCart.of(context);
    return Scaffold(
      body: inheritedCart.cartProductList.isEmpty
          ? const Center(
              child: Text(
                "Empty",
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: inheritedCart.cartProductList.length,
              itemBuilder: (context, index) {
                Product product = inheritedCart.cartProductList[index];
                return ProductTile(
                  product: product,
                  isInCart: true,
                  onPressed: inheritedCart.onProductPressed,
                );
              },
            ),
    );
  }
}
