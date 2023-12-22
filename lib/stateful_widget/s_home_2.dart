import 'package:demo_state_01/common/f_bottom_bar.dart';
import 'package:demo_state_01/stateful_widget/s_cart_2.dart';
import 'package:demo_state_01/stateful_widget/s_store_2.dart';
import 'package:flutter/material.dart';

import '../common/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 현재 선택된 index
  int currentIndex = 0;

  /// 카트에 담긴 상품 목록
  List<Product> cartProductList = [];

  /// 상품 클릭
  void onProductPressed(Product product) {
    setState(() {
      if (cartProductList.contains(product)) {
        cartProductList.remove(product);
      } else {
        cartProductList.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: [
            StoreScreen(
              cartProductList: cartProductList,
              onPressed: onProductPressed,
            ),
            Cart(cartProductList: cartProductList, onPressed: onProductPressed),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        cartTotal: "${cartProductList.length}",
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
      ),
    );
  }
}
