class ProductContentModel {
  late ProductContentItem result;

  ProductContentModel({
    required this.result,
  });

  ProductContentModel.fromJson(Map<String, dynamic> json) {
    result = ProductContentItem.fromJson(json['result']);
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['result'] = result.toJson();
    return data;
  }
}

class ProductContentItem {
  //可为空的字段就设置成可为空空
  String? sId;
  String? title;
  String? cid;
  Object? price;
  Object? oldPrice;
  Object? isBest;
  Object? isHot;
  Object? isNew;
  late List<Attr> attr; //不可为空
  Object? status;
  late String pic; //不可为空
  String? content;
  String? cname;
  int? salecount;
  String? subTitle;

  ProductContentItem({
    this.sId,
    this.title,
    this.cid,
    this.price,
    this.oldPrice,
    this.isBest,
    this.isHot,
    this.isNew,
    required this.attr,
    this.status,
    required this.pic,
    this.content,
    this.cname,
    this.salecount,
    this.subTitle,
  });

  ProductContentItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    oldPrice = json['old_price'];
    isBest = json['is_best'];
    isHot = json['is_hot'];
    isNew = json['is_new'];
    attr =
        List<dynamic>.from(json['attr']).map((e) => Attr.fromJson(e)).toList();
    status = json['status'];
    pic = json['pic'];
    content = json['content'];
    cname = json['cname'];
    salecount = json['salecount'];
    subTitle = json['sub_title'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['cid'] = cid;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['is_best'] = isBest;
    data['is_hot'] = isHot;
    data['is_new'] = isNew;
    data['attr'] = attr.map((e) => e.toJson()).toList();
    data['status'] = status;
    data['pic'] = pic;
    data['content'] = content;
    data['cname'] = cname;
    data['salecount'] = salecount;
    data['sub_title'] = subTitle;
    return data;
  }
}

class Attr {
  late String cate;
  late List<String> list;
  List<Map> attrList=[];   //自定义的attrList
  Attr({
    required this.cate,
    required this.list,
  });

  Attr.fromJson(Map<String, dynamic> json) {
    cate = json['cate'];
    list = List<String>.from(json['list']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cate'] = cate;
    data['list'] = list;
    return data;
  }
}
