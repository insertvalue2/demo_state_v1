import 'package:demo_state_01/inherited_widget/s_cart.dart';
import 'package:demo_state_01/inherited_widget/s_store.dart';
import 'package:demo_state_01/inherited_widget/state/inherited_cart.dart';
import 'package:flutter/material.dart';

import '../common/f_bottom_bar.dart';
import '../common/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  /// 현재 선택된 index
  int currentIndex = 0;

  /// 카트에 담긴 상품 목록
  List<Product> cartProductList = [];

  /// 상품 클릭
  void onProductPressed(Product product) {
    setState(() {
      if (cartProductList.contains(product)) {
        // cartProductList.remove(product);
        cartProductList = cartProductList.where((element) {
          return element != product;
        }).toList();
      } else {
        // cartProductList.add(product);
        cartProductList = [...cartProductList, product];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedCart(
      cartProductList: cartProductList,
      onProductPressed: onProductPressed,
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: const [
            StoreScreen(),
            CartScreen(),
          ],
        ),
        bottomNavigationBar: Builder(
          builder: (context) {
            final inheritedCart = InheritedCart.of(context);
            return BottomBar(
              currentIndex: currentIndex,
              cartTotal: "${inheritedCart.cartProductList.length}",
              onTap: (index) => setState(() {
                currentIndex = index;
              }),
            );
          },
        ),
      ),
    );
  }
}
