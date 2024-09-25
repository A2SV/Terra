class AppStrings {
  static String baseUrl = 'https://terra-wb9c.onrender.com';

  static String registerUrl = '$baseUrl/api/auth/register';
  static String loginUrl = '$baseUrl/api/auth/login';
  static String otpEndPoint = '$baseUrl/api/auth/VerifyOTP';
  static String resendOtpEndPoint = '$baseUrl/api/auth/ResendOTP';
  static String getAllListingsEndPoint = '$baseUrl/api/listing/?pageSize=22';
  static String getAllListingEndPoint = '$baseUrl/api/listing/id?id=';

}
