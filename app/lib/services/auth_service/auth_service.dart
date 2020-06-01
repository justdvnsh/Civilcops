
import 'package:civilcops/business_logic/models/user.dart';

abstract class AuthService {

  Future<bool> signup({User user});
  Future<bool> login({String mobileNumber});
}