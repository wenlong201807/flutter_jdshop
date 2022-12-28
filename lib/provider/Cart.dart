import 'package:flutter/material.dart';
import 'dart:convert';
import '../services/Storage.dart';

class Cart with ChangeNotifier {
  List _cartList = []; //状态
  bool _isCheckedAll = false; //状态
  List get cartList => this._cartList;
  bool get isCheckedAll => this._isCheckedAll;

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
    //获取全选的状态
    this._isCheckedAll = this.isCheckAll();
    notifyListeners();
  }

  //更新购物车列表
  updateCartList() {
    this.init();
  }

  //数量改变触发的方法
  itemCountChange() {
    Storage.setString("cartList", json.encode(this._cartList));
    notifyListeners();
  }

  //全选 反选
  checkAll(value) {
    for (var i = 0; i < this._cartList.length; i++) {
      this._cartList[i]["checked"] = value;
    }
    this._isCheckedAll = value;
    Storage.setString("cartList", json.encode(this._cartList));
    notifyListeners();
  }

  //判断是否全选
  bool isCheckAll() {
    if (this._cartList.length > 0) {
      for (var i = 0; i < this._cartList.length; i++) {
        if (this._cartList[i]["checked"] == false) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  //监听每一项的选中事件
  itemChage() {
    if (this.isCheckAll() == true) {
      this._isCheckedAll = true;
    } else {
      this._isCheckedAll = false;
    }

    Storage.setString("cartList", json.encode(this._cartList));
    notifyListeners();
  }
}
