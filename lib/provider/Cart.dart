import 'package:flutter/material.dart';
import 'dart:convert';
import '../services/Storage.dart';

class Cart with ChangeNotifier {
  List _cartList = []; //状态

  List get cartList => this._cartList;

  Cart() {
    this.init();
  }
  //初始化的时候获取购物车数据
  init() async {
    //注意：新版shared_preferences增加了可空类型，如果为空不会报错了，所以这里直接可以判断。
    String? cartList = await Storage.getString('cartList');
    if (cartList != null) {
      List cartListData = json.decode(cartList);
      this._cartList = cartListData;
    } else {
      this._cartList = [];
    }
    notifyListeners();
  }

  updateCartList() {
    this.init();
  }
}
