import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../services/ScreenAdapter.dart';
import 'package:provider/provider.dart';
import '../../provider/Cart.dart';

import '../Cart/CartItem.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _isEdit = false;
  @override
  void initState() {
    super.initState();
    print("cart");
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.launch),
            onPressed: () {
              setState(() {
                this._isEdit = !this._isEdit;
              });
            },
          )
        ],
      ),
      body: cartProvider.cartList.length > 0
          ? Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Column(
                        children: cartProvider.cartList.map((value) {
                      return CartItem(value);
                    }).toList()),
                    SizedBox(height: ScreenAdapter.height(100))
                  ],
                ),
                Positioned(
                  bottom: 0,
                  width: ScreenAdapter.width(750),
                  height: ScreenAdapter.height(78),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.black12)),
                      color: Colors.white,
                    ),
                    width: ScreenAdapter.width(750),
                    height: ScreenAdapter.height(78),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: ScreenAdapter.width(60),
                                child: Checkbox(
                                  value: cartProvider.isCheckedAll,
                                  activeColor: Colors.pink,
                                  onChanged: (val) {
                                    //实现全选或者反选
                                    cartProvider.checkAll(val);
                                  },
                                ),
                              ),
                              Text("全选"),
                              SizedBox(width: 20),
                              this._isEdit == false ? Text("合计:") : Text(""),
                              this._isEdit == false
                                  ? Text("${cartProvider.allPrice}",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.red))
                                  : Text(""),
                            ],
                          ),
                        ),
                        this._isEdit == false
                            ? Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  child: Text("结算",
                                      style: TextStyle(color: Colors.white)),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  onPressed: () {},
                                ),
                              )
                            : Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  child: Text("删除",
                                      style: TextStyle(color: Colors.white)),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  onPressed: () {
                                    cartProvider.removeItem();
                                  },
                                ),
                              )
                      ],
                    ),
                  ),
                )
              ],
            )
          : Center(
              child: Text("购物车空空的..."),
            ),
    );
  }
}
