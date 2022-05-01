import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_info/shared/app_package_info.dart';
import 'package:flutter_app_info/widgets/info_item.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PackageInfo _packageInfo = PackageInfo(appName: '', packageName: '', version: '', buildNumber: '');

  @override
  void initState() {
    super.initState();
    getAppPackageInfo();
  }

  Future<void> getAppPackageInfo() async {
    _packageInfo = await AppPackageInfo.appPackageInfo();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xff3B3B3B),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(5, 10),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      'images/pubdev.png',
                      height: 28,
                      width: 28,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'package_info_plus 1.4.2',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Kanit',
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
            InfoItem(
              title: 'Nome do aplicativo',
              subtitle: _packageInfo.appName,
              iconLeading: const Icon(
                Icons.new_releases_rounded,
                size: 40,
                color: Color(0xff3949ab),
              ),
            ),
            InfoItem(
              title: 'Nome do package',
              subtitle: _packageInfo.packageName,
              iconLeading: const Icon(
                Icons.new_releases_rounded,
                size: 40,
                color: Color(0xff3949ab),
              ),
            ),
            InfoItem(
              title: 'Versão',
              subtitle: _packageInfo.version,
              iconLeading: const Icon(
                Icons.new_releases_rounded,
                size: 40,
                color: Color(0xff3949ab),
              ),
            ),
            Visibility(
              visible: !kIsWeb && !Platform.isWindows,
              child: InfoItem(
                title: 'Número Build',
                subtitle: _packageInfo.buildNumber,
                iconLeading: const Icon(
                  Icons.new_releases_rounded,
                  size: 40,
                  color: Color(0xff3949ab),
                ),
              ),
            ),
            const Spacer(),
            const Text(
              'PLATAFORMAS SUPORTADAS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Kanit',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/android.png',
                    width: 28,
                    height: 28,
                  ),
                  Image.asset(
                    'images/apple.png',
                    width: 28,
                    height: 28,
                  ),
                  Image.asset(
                    'images/internet.png',
                    width: 28,
                    height: 28,
                  ),
                  Image.asset(
                    'images/linux.png',
                    width: 28,
                    height: 28,
                  ),
                  Image.asset(
                    'images/microsoft.png',
                    width: 28,
                    height: 28,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
