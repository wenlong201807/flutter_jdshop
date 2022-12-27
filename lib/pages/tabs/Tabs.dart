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
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController=PageController(initialPage:_currentIndex );
  }

  // final List _pageList = [HomePage(), CategoryPage(), CartPage(), UserPage()];
  final List <Widget> _pageList=[
    HomePage(),
    CategoryPage(),
    CartPage(),
    UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("shop"),
      ),
      // body: _pageList[_currentIndex], // 依据底部选中tab，对应切换页面
      body: PageView(
        controller: _pageController,
        children: _pageList,
        // onPageChanged: (){
        // },
      ),
      // body: IndexedStack( // 第一次加载所有页面，后续只显示其中一个页面
      //   index: _currentIndex,
      //   children: _pageList,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() { // 更新当前索引值
            _currentIndex = index;

            //跳转页面
            _pageController.jumpToPage(index);
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
