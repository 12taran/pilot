class ApiRoutes {
  ApiRoutes();

  static String apiEndpoint = "api/v1/user/";
  static String paymentEndPoint = "api/v1/payment/";

  static String serverUrl = "http://192.168.1.81:4000/";
  static String imageRoutes = "${serverUrl}uploads/";

  // static String serverUrl = "http://localhost:8000/";
  String baseUrl = "$serverUrl$apiEndpoint";
  String paymentRoute = "$serverUrl$paymentEndPoint";

  String userRegisterVerify = "register/phone";

  String userLogin = "login";
  String userRegister = "";
  String userEdit = "edit";
  String getUser = "getById";
  String getBoardMembers = "member/get";
  String getProperties = "property/getAll";
  String addProperties = "property/create";
  String getAdiminProperties = "property/get";
}
