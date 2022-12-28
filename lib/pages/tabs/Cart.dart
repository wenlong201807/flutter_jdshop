import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/Counter.dart';
import '../../provider/Cart.dart';

import '../Cart/CartItem.dart';

import '../Cart/CartNum.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    print("cart");
  }

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<Counter>(context);

    var cartProvider = Provider.of<Cart>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.incCount();
          //给购物车列表增加数据
          cartProvider.addData('哈哈${counterProvider.count}');
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text("统计数量：${counterProvider.count}",
                style: TextStyle(fontSize: 20)),
          ),
          Divider(),

          //加载购物车列表的子组件
          CartItem(),
          Divider(height: 40),
          CartNum()
        ],
      ),
    );
  }
}
