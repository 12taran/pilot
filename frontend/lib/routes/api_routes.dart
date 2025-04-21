class ApiRoutes {
  ApiRoutes();

  static String apiEndpoint = "api/v1/user/";

  static String serverUrl = "http://192.168.1.124:4000/";

  // static String serverUrl = "http://localhost:8000/";
  String baseUrl = "$serverUrl$apiEndpoint";

  String userRegisterVerify = "register/phone";
  String userRegister = "";
}
