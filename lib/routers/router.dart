import 'package:flutter/material.dart';
import '../pages/tabs/Tabs.dart';

import '../pages/Search.dart';
import '../pages/ProductList.dart';
import '../pages/ProductContent.dart';

//配置路由
final Map<String,Function> routes = {
  '/': (context) => Tabs(),
  '/search': (context) => SearchPage(),
  // 有路由传值
  '/productList': (context,{arguments}) => ProductListPage(arguments:arguments), // 商品列表子页面
  '/productContent': (context,{arguments}) => ProductContentPage(arguments:arguments),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      // 初始化的路由
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
