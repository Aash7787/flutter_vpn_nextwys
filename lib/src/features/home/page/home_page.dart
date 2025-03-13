import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/features/home/widgets/drawer_c.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = 'home/page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCountry = "France";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("SuperVPN"),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/france.png",
              ), // Replace with actual flag asset
            ),
          ),
        ],
      ),
      drawer: DrawerC(),
      body: Column(
        children: [
          Container(
            color: Colors.orange,
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                "We provide free VPN service to Apple devices now.\nPlease visit www.supervpn.best to download",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: DropdownButton<String>(
                    value: selectedCountry,
                    items:
                        ["France", "USA", "Germany"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.flag,
                                ), // Replace with actual flag icons
                                SizedBox(width: 8),
                                Text(value),
                              ],
                            ),
                          );
                        }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCountry = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Ready",
                  style: TextStyle(color: Colors.orange, fontSize: 18),
                ),
                SizedBox(height: 10),
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 5),
                  ),
                  child: Center(
                    child: Text(
                      "CONNECT",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Free",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ],
            ),
          ),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   child: Column(
          //     children: [
          //       Image.network("https://via.placeholder.com/300x100"), // Replace with actual ad image
          //       SizedBox(height: 5),
          //       ElevatedButton(
          //         onPressed: () {},
          //         child: Text("Install"),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
