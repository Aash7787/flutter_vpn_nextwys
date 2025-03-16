import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/common/model/country.dart';
import 'package:flutter_vpn/src/features/home/page/country_pick_page.dart';
import 'package:flutter_vpn/src/features/home/widgets/drawer_c.dart';

enum ConnectionStateStatus { disconnected, connecting, connected }

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = 'home/page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCountry = "France";
  ConnectionStateStatus connectionState = ConnectionStateStatus.disconnected;
  Country? country = countryList.first;
  String connectingText = "CONNECTING";

  @override
  void initState() {
    super.initState();
    if (connectionState == ConnectionStateStatus.connecting) {
      _startConnectingAnimation();
    }
  }

  void _startConnectingAnimation() {
    int dotCount = 0;
    Future.doWhile(() async {
      if (connectionState != ConnectionStateStatus.connecting) return false;
      setState(() {
        connectingText = "CONNECTING${"." * (dotCount % 8)}";
        dotCount++;
      });
      await Future.delayed(const Duration(milliseconds: 500));
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "SuperVPN",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
        actions: [
          Image.asset("assets/images/other/crown.png", height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: InkWell(
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  CountryPickPage.route,
                );
                if (result != null && result is Country) {
                  setState(() {
                    country = result;
                  });
                }
                log('Selected Country: ${country!.imageName}');
              },
              child: CircleAvatar(
                backgroundImage: AssetImage(country!.imagePath),
                backgroundColor: Colors.white,
                radius: 15,
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerC(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.orange,
                padding: const EdgeInsets.all(5),
                child: const Center(
                  child: Text(
                    "We provide free VPN service to Apple devices now.\nPlease visit www.supervpn.best to download",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 17,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      final result = await Navigator.pushNamed(
                                        context,
                                        CountryPickPage.route,
                                      );
                                      if (result != null && result is Country) {
                                        setState(() {
                                          country = result;
                                        });
                                      }
                                      log(
                                        'Selected Country: ${country!.imageName}',
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircleAvatar(
                                          radius: 12,
                                          backgroundImage: AssetImage(
                                            country!.imagePath,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          country!.imageName,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              connectionState == ConnectionStateStatus.connected
                                  ? "Connected"
                                  : "Ready",
                              style: TextStyle(
                                color:
                                    connectionState ==
                                            ConnectionStateStatus.connected
                                        ? Colors.green
                                        : Colors.deepOrange,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  if (connectionState ==
                                      ConnectionStateStatus.disconnected) {
                                    connectionState =
                                        ConnectionStateStatus.connecting;
                                    _startConnectingAnimation();
                                  } else if (connectionState ==
                                      ConnectionStateStatus.connected) {
                                    connectionState =
                                        ConnectionStateStatus.disconnected;
                                  }
                                });

                                if (connectionState ==
                                    ConnectionStateStatus.connecting) {
                                  await Future.delayed(
                                    const Duration(seconds: 2),
                                  );
                                  setState(
                                    () =>
                                        connectionState =
                                            ConnectionStateStatus.connected,
                                  );
                                }
                              },
                              child: Container(
                                height: 170,
                                width: 170,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        connectionState ==
                                                ConnectionStateStatus.connected
                                            ? Colors.red
                                            : connectionState ==
                                                ConnectionStateStatus.connecting
                                            ? Colors.orange
                                            : Colors.green,
                                    width: 15,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    connectionState ==
                                            ConnectionStateStatus.connected
                                        ? "DISCONNECT"
                                        : connectionState ==
                                            ConnectionStateStatus.connecting
                                        ? connectingText
                                        : "CONNECT",
                                    style: TextStyle(
                                      color:
                                          connectionState ==
                                                  ConnectionStateStatus
                                                      .connected
                                              ? Colors.red
                                              : Colors.blue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Free",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
