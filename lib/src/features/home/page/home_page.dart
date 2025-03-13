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
  bool isConnected = false;

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/france.png"),
            ),
          ),
          Image.asset("assets/images/crown.png", height: 35),
        ],
      ),
      drawer: const DrawerC(),
      body: Column(
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
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Country selector as a dropdown with a rounded blue container
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: DropdownButton<String>(
                            value: selectedCountry,
                            underline: const SizedBox(), // remove default underline
                            dropdownColor: Colors.blue,
                            iconEnabledColor: Colors.white,
                            items: ["France", "USA", "Germany"].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  children: [
                                    // Replace with actual flag asset for each country if available.
                                    const Icon(Icons.flag, color: Colors.white),
                                    const SizedBox(width: 8),
                                    Text(
                                      value,
                                      style: const TextStyle(color: Colors.white),
                                    ),
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
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Status text
                    const Text(
                      "Ready",
                      style: TextStyle(color: Colors.deepOrange, fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    // Connect/Disconnect button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isConnected = !isConnected;
                        });
                      },
                      child: Container(
                        height: 170,
                        width: 170,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isConnected ? Colors.red : Colors.green,
                            width: 15,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            isConnected ? "DISCONNECT" : "CONNECT",
                            style: TextStyle(
                              color: isConnected ? Colors.red : Colors.blue,
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
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
