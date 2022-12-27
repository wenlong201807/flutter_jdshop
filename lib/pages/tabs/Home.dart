import 'package:flutter/material.dart';
//最新版本的flutter中使用flutter_swiper_null_safety替代flutter_swiper，他们的用法都是一样的。
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import '../../services/ScreenAdapter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //轮播图
  Widget _swiperWidget() {
    List<Map> imgList = [
      {"url": "https://www.itying.com/images/flutter/slide01.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide02.jpg"},
      {"url": "https://www.itying.com/images/flutter/slide03.jpg"},
    ];

    return Container(
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                imgList[index]["url"],
                fit: BoxFit.fill,
              );
            },
            itemCount: imgList.length,
            pagination: const SwiperPagination(),
            autoplay: true),
      ),
    );
  }

  Widget _titleWidget(value) {
    return Container(
      height: ScreenAdapter.height(34),
      margin: EdgeInsets.only(left: ScreenAdapter.width(20)),
      padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
        color: Colors.red,
        width: ScreenAdapter.width(10),
      ))),
      child: Text(
        value,
        style:
            TextStyle(color: Colors.black54, fontSize: ScreenAdapter.size(26)),
      ),
    );
  }

  Widget _hotProductListWidget(){
    return  Container(
      height: ScreenAdapter.height(234), // 外层必须设置高度
      padding: EdgeInsets.all(ScreenAdapter.width(20)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // 水平方向滑动列表
        itemBuilder: (contxt,index){
          return Column(
            children: <Widget>[
              Container(
                height: ScreenAdapter.height(140),
                width: ScreenAdapter.width(140),
                margin: EdgeInsets.only(right: ScreenAdapter.width(21)),
                child: Image.network("https://www.itying.com/images/flutter/hot${index+1}.jpg",fit: BoxFit.cover),
              ),
              Container(
                padding: EdgeInsets.only(top:ScreenAdapter.height(10)),
                height: ScreenAdapter.height(44),
                child: Text("第${index + 1}条"),
              )
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _swiperWidget(),
         SizedBox(height: ScreenAdapter.height(12)),
        _titleWidget("猜你喜欢"),
        SizedBox(height: ScreenAdapter.height(34)),
        _hotProductListWidget(),
        SizedBox(height: ScreenAdapter.height(12)),
        _titleWidget("热门推荐"),
      ],
    );
  }
}

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           ElevatedButton(
//             child: const Text("跳转到搜索"),
//             onPressed: (){
//               Navigator.pushNamed(context, '/search');
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
