import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/common/widgets/custom_app_bar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  static const route = '/setting/page';

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isTCPModeEnable = false;
  bool isProxyGooglePlayServiceEnable = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Setting',),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enable TCP Mode',
                    style: TextTheme.of(context).titleLarge,
                  ),
                  Checkbox(
                    value: isTCPModeEnable,
                    onChanged: (value) {
                      setState(() {
                        isTCPModeEnable = value!;
                      });
                    },
                  ),
                ],
              ),
              Text(
                'If connection error, or no data after connected, please enable TCP mode and reconnect',
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Proxy Google Play Service',
                    style: TextTheme.of(context).titleLarge,
                  ),
                  Checkbox(
                    value: isProxyGooglePlayServiceEnable,
                    onChanged: (value) {
                      setState(() {
                        isProxyGooglePlayServiceEnable = value!;
                      });
                    },
                  ),
                ],
              ),
              Text(
                'If you can not visit Google on your region, please enable it.',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
