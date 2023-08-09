// ignore: file_names
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:opticalproject/data/user/model/notifactionmodel.dart';

abstract class NotifactionController extends GetxController {
  getAllNafication();
}

class NotifactionControllerImp extends NotifactionController {
  bool threIsData = true;
  int notifactionCounter = 3;
  List<NotifactionModel> data = [
    NotifactionModel(title: "title1", body: "body2", date: "2023/2/1"),
    NotifactionModel(title: "title1", body: "body2", date: "2023/2/1"),
    NotifactionModel(title: "title1", body: "body2", date: "2023/2/1")
  ];



  @override
  getAllNafication() {
    update();
  }
}
