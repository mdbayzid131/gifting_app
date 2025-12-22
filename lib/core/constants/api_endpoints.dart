class ApiEndpoints {
  ///<========================base url=====================================>

  static String baseUrl="http://10.10.7.33:5002/api/v1";

  ///<========================auth end points=====================================>`
  static String login = "$baseUrl/auth/login";
  static String createParentAccount = "$baseUrl/user";
  static String forgotPassword = "$baseUrl/auth/forget-password";
  static String resendVerifyEmail = "$baseUrl/auth/resend-verify-email";
  static String verifyEmail = "$baseUrl/auth/verify-email";
  static String resetPassword = "$baseUrl/auth/reset-password?token=RESET_TOKEN_FROM_EMAIL";

  static String refreshToken = "$baseUrl/auth/refresh-token";
  static String logout = "$baseUrl/auth/logout";
  static String changePassword = "$baseUrl/auth/change-password";



  // static String otoVerify(String userName)=>"/auth/vefiry_for_forget/$userName/";
  // static String resetPassword="/auth/reset_password/";
  //
  // static String termsAndServicesEndPoints="/auth/terms/";
  // static String privacyPolicyEndPoints="/auth/privacy-policy/";
  // static String aboutUsEndPoints="/auth/about-us/";
  //
  // static String productDataEndPoint = "/shoping/products/";
  // static String brandDataEndPoint = "/shoping/brands/";
  // static String productReviewDataEndPoint( int productId) => "/shoping/products/reviews/$productId/";
  //
  //
  // static String userInfoEndPoint = "/auth/profile/";
  //
  //
  //
  // static String singleProduct="/shoping/products/8";
  // static String wisherListEndPoints(int productId)=>"/shoping/wisher/$productId/";

}