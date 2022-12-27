import 'package:flutter/material.dart';

import 'Home.dart';
import 'Category.dart';
import 'Cart.dart';
import 'User.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  final List _pageList = [HomePage(), CategoryPage(), CartPage(), UserPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("shop"),
      ),
      body: _pageList[_currentIndex], // 依据底部选中tab，对应切换页面
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() { // 更新当前索引值
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // 2个以上的菜单，必须配置此属性
        fixedColor: Colors.red, // 选中的颜色
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "购物车"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "我的")
        ],
      ),
    );
  }
}
