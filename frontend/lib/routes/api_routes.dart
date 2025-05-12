class ApiRoutes {
  ApiRoutes();

  static String apiEndpoint = "api/v1/user/";
  static String paymentEndPoint = "api/v1/payment/";

  static String serverUrl = "http://172.16.225.154:4000/";
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
  String buyProperty = "property/buy";
  String getInvestments = "investment/get";
}
