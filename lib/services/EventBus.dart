import 'package:event_bus/event_bus.dart';

//Bus 初始化

EventBus eventBus = EventBus();

class ProductContentEvent {
  late String str;
  ProductContentEvent(String str) {
    this.str = str;
  }
}

//用户中心广播
class UserEvent {
  String str;
  UserEvent(this.str);
}
