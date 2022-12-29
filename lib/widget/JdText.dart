import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_jdshop/services/ScreenAdapter.dart';

class JdText extends StatelessWidget {

  final String text;
  final bool password;
  var onChanged;
  final int maxLines;
  final double height;

  JdText({Key? key,this.text="输入内容",this.password=false,this.onChanged=null,this.maxLines=1,this.height=68}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        maxLines:this.maxLines ,
        obscureText: this.password,
        decoration: InputDecoration(
            hintText: this.text,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none)),
        onChanged: this.onChanged,
      ),
      height: ScreenAdapter.height(this.height),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1,
                  color: Colors.black12
              )
          )
      ),
    );
  }
}
