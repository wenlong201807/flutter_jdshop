import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jdshop/services/ScreenAdapter.dart';
import 'package:flutter_jdshop/widget/JdButton.dart';

import '../../model/ProductContentModel.dart';

import '../../config/Config.dart';

class ProductContentFirst extends StatefulWidget {
  final List _productContentList;
  ProductContentFirst(this._productContentList, {Key? key}) : super(key: key);

  _ProductContentFirstState createState() => _ProductContentFirstState();
}

class _ProductContentFirstState extends State<ProductContentFirst> {
  late ProductContentItem _productContent;

  List _attr = [];

  @override
  void initState() {
    super.initState();
    this._productContent = widget._productContentList[0];

    this._attr = this._productContent.attr;

    print(this._attr);
    //[{"cate":"鞋面材料","list":["牛皮 "]},{"cate":"闭合方式","list":["系带"]},{"cate":"颜色","list":["红色","白色","黄色"]}]
  }

  List<Widget> _getAttrItemWidget(attrItem) {
    List<Widget> attrItemList = [];
    attrItem.list.forEach((item) {
      attrItemList.add(Container(
        margin: EdgeInsets.all(10),
        child: Chip(
          label: Text("${item}"),
          padding: EdgeInsets.all(10),
        ),
      ));
    });
    return attrItemList;
  }

  //封装一个组件 渲染attr
  List<Widget> _getAttrWidget() {
    List<Widget> attrList = [];
    this._attr.forEach((attrItem) {
      attrList.add(Wrap(
        children: <Widget>[
          Container(
            width: ScreenAdapter.width(120),
            child: Padding(
              padding: EdgeInsets.only(top: ScreenAdapter.height(28)),
              child: Text("${attrItem.cate}: ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            width: ScreenAdapter.width(580),
            child: Wrap(
              children: _getAttrItemWidget(attrItem),
            ),
          )
        ],
      ));
    });

    return attrList;
  }

  //底部弹出框
  _attrBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (contex) {
          return Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(ScreenAdapter.width(20)),
                child: ListView(
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _getAttrWidget())
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                width: ScreenAdapter.width(750),
                height: ScreenAdapter.height(76),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: JdButton(
                          color: Color.fromRGBO(253, 1, 0, 0.9),
                          text: "加入购物车",
                          cb: () {
                            print('加入购物车');
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: JdButton(
                            color: Color.fromRGBO(255, 165, 0, 0.9),
                            text: "立即购买",
                            cb: () {
                              print('立即购买');
                            },
                          )),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    //处理图片
    String pic = Config.domain + this._productContent.pic;
    pic = pic.replaceAll('\\', '/');

    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 12,
            child: Image.network("${pic}", fit: BoxFit.cover),
          ),
          //标题
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text("${this._productContent.title}",
                style: TextStyle(
                    color: Colors.black87, fontSize: ScreenAdapter.size(36))),
          ),
          Container(
              padding: EdgeInsets.only(top: 10),
              child: Text("${this._productContent.subTitle}",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenAdapter.size(28)))),
          //价格
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Text("特价: "),
                      Text("¥${this._productContent.price}",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: ScreenAdapter.size(46))),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("原价: "),
                      Text("¥${this._productContent.oldPrice}",
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: ScreenAdapter.size(28),
                              decoration: TextDecoration.lineThrough)),
                    ],
                  ),
                )
              ],
            ),
          ),
          //筛选
          Container(
            margin: EdgeInsets.only(top: 10),
            height: ScreenAdapter.height(80),
            child: InkWell(
              onTap: () {
                _attrBottomSheet();
              },
              child: Row(
                children: <Widget>[
                  Text("已选: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("115，黑色，XL，1件")
                ],
              ),
            ),
          ),
          Divider(),
          Container(
            height: ScreenAdapter.height(80),
            child: Row(
              children: <Widget>[
                Text("运费: ", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("免运费")
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
