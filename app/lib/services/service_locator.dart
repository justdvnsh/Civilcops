import 'package:civilcops/business_logic/viewmodels/home/confirm_location_viewmodel.dart';
import 'package:civilcops/business_logic/viewmodels/home/main_screen_viewmodel.dart';
import 'package:civilcops/business_logic/viewmodels/home/register_complaint_viewmodel.dart';
import 'package:civilcops/business_logic/viewmodels/home/report_screen_viewmodel.dart';
import 'package:civilcops/business_logic/viewmodels/login_viewmodel.dart';
import 'package:civilcops/business_logic/viewmodels/otpViewModel.dart';
import 'package:civilcops/business_logic/viewmodels/signup_viewmodel.dart';
import 'package:civilcops/services/auth_service/auth_service_impl.dart';
import 'package:civilcops/services/auth_service/otp_service.dart';
import 'package:civilcops/services/auth_service/otp_service_impl.dart';
import 'package:get_it/get_it.dart';

import 'auth_service/auth_service.dart';

var serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // services
  serviceLocator.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  serviceLocator.registerLazySingleton<OtpService>(() => OtpServiceImpl());

  // viewModels
  serviceLocator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  serviceLocator.registerLazySingleton<SignupViewModel>(() => SignupViewModel());
  serviceLocator.registerLazySingleton<OtpViewModel>(() => OtpViewModel());
  serviceLocator.registerLazySingleton<ConfirmLocationViewModel>(() => ConfirmLocationViewModel());
  serviceLocator.registerLazySingleton<MainScreenViewModel>(() => MainScreenViewModel());
  serviceLocator.registerLazySingleton<ReportScreenViewModel>(() => ReportScreenViewModel());
  serviceLocator.registerLazySingleton<RegisterComplaintViewModel>(() => RegisterComplaintViewModel());
}