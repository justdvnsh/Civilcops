abstract class OtpService {

  Future<bool> getOtp({String mobileNumber});
  Future<bool> verifyOtp({String mobileNumber, String otpCode});
}