import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';
import '../config/Config.dart';
import 'package:dio/dio.dart';

class ProductListPage extends StatefulWidget {
  Map? arguments; //Map? 表示arguments是可为空参数, 对应路由传值，获取使用
  ProductListPage({Key? key, this.arguments}) : super(key: key);


  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  @override
  void initState() {
    super.initState();
    print(widget.arguments);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("商品详情"),
        ),
        //widget.arguments  获取arguments传值
        // body:Text("${widget.arguments}")
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemBuilder: (context, index) {
              //每一个元素
              return Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: ScreenAdapter.width(180),
                        height: ScreenAdapter.height(180),
                        child: Image.network(
                            "https://www.itying.com/images/flutter/list2.jpg",
                            fit: BoxFit.cover),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: ScreenAdapter.height(180),
                          margin: EdgeInsets.only(left: 10),
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  "戴尔(DELL)灵越3670 英特尔酷睿i5 高性能 台式电脑整机(九代i5-9400 8G 256G)",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: ScreenAdapter.height(36),
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),

                                    //注意 如果Container里面加上decoration属性，这个时候color属性必须得放在BoxDecoration
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromRGBO(230, 230, 230, 0.9),
                                    ),

                                    child: Text("4g"),
                                  ),
                                  Container(
                                    height: ScreenAdapter.height(36),
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromRGBO(230, 230, 230, 0.9),
                                    ),
                                    child: Text("126"),
                                  ),
                                ],
                              ),
                              Text(
                                "¥990",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(height: 20)
                ],
              );
            },
            itemCount: 10,
          ),
        ));
  }
}
