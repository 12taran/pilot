class ApiRoutes {
  ApiRoutes();

  static String apiEndpoint = "api/v1/user/";
  static String paymentEndPoint = "api/v1/payment/";

  static String serverUrl = "http://192.168.114.16:4000/";
  static String imageRoutes = "${serverUrl}uploads/";

  // static String serverUrl = "http://localhost:8000/";
  String baseUrl = "$serverUrl$apiEndpoint";
  String paymentRoute = "$serverUrl$paymentEndPoint";

  String userRegisterVerify = "register/phone";
  String userRegister = "";
  String userLogin = "login";
  String userEdit = "edit";
  String getUser = "getById";
  String getBoardMembers = "member/get";
}
