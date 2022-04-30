import 'package:package_info_plus/package_info_plus.dart';

class AppPackageInfo {
  static Future<PackageInfo> appPackageInfo() async {
    return await PackageInfo.fromPlatform();
  }
}
