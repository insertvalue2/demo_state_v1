import 'package:demo_state_01/inherited_widget/state/inherited_cart.dart';
import 'package:flutter/material.dart';

import '../common/product.dart';
import '../common/f_product_title.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // InheritedCart 인스턴스를 현재 컨텍스트에서 찾아옵니다.
    // 이 인스턴스를 통해 장바구니에 담긴 상품 목록과 상품 클릭 시 호출될 함수에 접근할 수 있습니다.
    InheritedCart inheritedCart = InheritedCart.of(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: storeProductList.length,
        itemBuilder: (context, index) {
          Product product = storeProductList[index];
          return ProductTile(
            product: product,
            isInCart: inheritedCart.cartProductList.contains(product),
            onPressed: inheritedCart.onProductPressed,
          );
        },
      ),
    );
  }
}
