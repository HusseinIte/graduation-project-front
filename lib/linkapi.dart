class AppLink {
  // static const String baseUrl = "http://10.0.2.2:8000/";
  static const String baseUrl = "http://localhost:8000/";

  // static const String baseUrl = "http://127.0.0.1:8000/";
  // static const String baseUrl = "http://192.168.137.20/";
//  adb reverse tcp:8000 tcp:8000
// hussein.ite@gmail.com

//// Auth Api ///////
  static const String loginnew = "api/login";
  static const String singup = "api/customer/register";
  static const String verificationCode = "api/customer/email_verification";

  //! customer
  static const String getmenproduct = "api/product/getMenProduct";
  static const String getkidsproduct = "api/product/getKidsProduct";
  static const String getwomenproduct = "api/product/getWomenProduct";
  static const String getallproduct = "api/product/allProducts";
  static const String search = "api/product/searchProduct";

  //getMyMainOrder

  static const String sendorder = "api/customer/Purchase/sendOrder";
  static const String sendsendmaintenanceorderorder =
      "api/customer/Maintenance/sendOrder";
  static const String getmyorder = "api/customer/getMyPayOrder";
  static const String getmymainOrder = "api/customer/getMyMainOrder";
  static const String lensOrder = "api/customer/addLensesToCart";
  static const String recieveOrder = "api/customer/receiveOrderByCustomer/";
  static const String mainmessage = "api/customer/getMainOrder/";

  //! warehouse
  static const String getDeviceProduvt = "api/product/getDevicesProducts";
  static const String getFrameProduvt = "api/product/getFrameProducts";
  static const String getLensesProduvt = "api/product/getLensesProducts";
  //?store
  static const String stroreFrame = "api/product/storeFrame";
  static const String stroreLenses = "api/product/storeLenses";
  static const String stroreDevice = "api/product/storeDevice";

  static const String excuteorder = "api/warehouse/executeOrder/";
  static const String rejectorder = "api/order/reject/";
  static const String getNewOrder = "api/warehouse/NewOrder";
  static const String getAllOrder = "api/warehouse/allOrder";
  static const String deleteProduct = "api/product/deletePrudoct/";

  //! delivery
  static const String getneworderdelivery = "api/delivery/NewOrder";
  static const String receiveOrderFromWarehouse = "api/delivery/receiveOrder/";
  static const String deliveryorder = "api/delivery/deliverOrder/";
  static const String getexcutedorderdelivery = "api/delivery/executedOrder/";
  static const String getallorderdelivery = "api/delivery/allOrder";

//! maintinance
  static const String newmaintinanceOrder = "api/maintenance/allOrder";

  static const String mainbymessage =
      "api/maintenance/executeMaintenanceByMessage";
  static const String mainbygotostore = "api/maintenance/maintenanceByGoStore";
  static const String mainbysendgroub = "api/maintenance/maintenanceByDel";
  static const String mainexecute = "api/maintenance/executeMaintenance";

  //! notification

  static const String getnotification = "api/customer/noty";
  static const String markAllRead = "api/delivery/allOrder";
  static const String markread = "api/customer/ReadNotification/";

  static const String imagelink = "api/images/";
}
