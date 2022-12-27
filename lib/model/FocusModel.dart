// FocusModel.fromJson(json);

/*
 {"result":[{"_id":"59f6ef443ce1fb0fb02c7a43","title":"笔记本电脑","status":"1","pic":"public\\upload\\UObZahqPYzFvx_C9CQjU8KiX.png","url":"12"},{"_id":"5a012efb93ec4d199c18d1b4","title":"第二个轮播图","status":"1","pic":"public\\upload\\f3OtH11ZaPX5AA4Ov95Q7DEM.png"},{"_id":"5a012f2433574208841e0820","title":"第三个轮播图","status":"1","pic":"public\\upload\\s5ujmYBQVRcLuvBHvWFMJHzS.jpg"},{"_id":"5a688a0ca6dcba0ff4861a3d","title":"教程","status":"1","pic":"public\\upload\\Zh8EP9HOasV28ynDSp8TaGwd.png"}]}

* */

// api: https://jdmall.itying.com/api/focus
// [json to dart](https://javiercbk.github.io/json_to_dart/)


class FocusModel {
  List<Result>? result;

  FocusModel({this.result});

  FocusModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? sId;
  String? title;
  String? status;
  String? pic;
  String? url;

  Result({this.sId, this.title, this.status, this.pic, this.url});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['url'] = url;
    return data;
  }
}