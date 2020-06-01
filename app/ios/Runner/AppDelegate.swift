import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyC0Uqb8ievAbRvyrBa5Xr58TsnzB0dmibU")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
