import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/features/auth/signup/controller/auth_controller.dart';


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
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             AuthController().logout(context);
//           },
//           child: Icon(Icons.logout),
//         ),
//       ),
//       body: Center(child: Text("Hellow World")),
//     );
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("SuperVPN",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),
        actions: [
          Image.asset("assets/images/crown.png",height: 35,),
        Padding(
  padding: EdgeInsets.all(8.0),
  child: CircleAvatar(backgroundImage: AssetImage("assets/images/france.png"),
    backgroundColor: Colors.white,
    radius: 15, 
 
  ),
)
        ],
      ),
        drawer: Drawer(
        child: Column(
          children: [
            // Drawer Header
            Container(
              width: double.infinity,
              color: Colors.blue,
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child:Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // Handle Google Sign-In
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                        "assets/images/google.jpg",
                            height: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Sign in",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                        ListTile(
              title: Text(
                "Unstable connection? Click here",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
                ],
              ),
            ),

           
      

            // Menu Items
            ListTile(
              leading: Icon(Icons.bolt, color: Colors.blue),
              title: Text("Smart proxy", style: TextStyle(fontSize: 16)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.share, color: Colors.blue),
              title: Text("Share", style: TextStyle(fontSize: 16)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.star, color: Colors.blue),
              title: Text("Rate us", style: TextStyle(fontSize: 16)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.blue),
              title: Text("FAQ", style: TextStyle(fontSize: 16)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              title: Text("Setting", style: TextStyle(fontSize: 16)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.blue),
              title: Text("About", style: TextStyle(fontSize: 16)),
              onTap: () {},
            ),
          ],
        ),
      ),
   
      body: Column(
        children: [
          Container(
            color: Colors.orange,
            padding: EdgeInsets.all(5),
            child: Center(
              child: Text(
                "We provide free VPN service to Apple devices now.\nPlease visit www.supervpn.best to download",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 18,),
          Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25), // Rounded border
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 12, // Small flag size
                                backgroundImage: AssetImage("assets/images/france.png"), // Ensure image is added in pubspec.yaml
                              ),
                              SizedBox(width: 8),
                              Text(
                                "France",
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_drop_down, color: Colors.white),
                            ],
                          ),
                        ),
                  )
                    
                      ],
                    ),
                SizedBox(height: 20),
                Text("Ready", style: TextStyle(color: Colors.deepOrange, fontSize: 18)),
                SizedBox(height: 10),
                 GestureDetector(
      onTap: () {
        setState(() {
          isConnected = !isConnected; // Toggle state
        });
      },
      child: Container(
        height: 170,
        width: 170,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isConnected ? Colors.red : Colors.green, // Change color
            width: 15,
          ),
        ),
        child: Center(
          child: Text(
            isConnected ? "DISCONNECT" : "CONNECT",
            style: TextStyle(
              color: isConnected ? Colors.red : Colors.blue, // Text color change
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
                 ),
                // Container(
                //   height: 170,
                //   width: 170,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     border: Border.all(color: Colors.grey, width: 15,),
                //   ),
                //   child: Center(
                //     child: Text(
                //       "CONNECT",
                //       style: TextStyle(color: Colors.blue, fontSize: 18,fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // ),
                SizedBox(height: 10),
                Text("Free", style: TextStyle(color: Colors.blue, fontSize: 16)),
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
         ) ],
      ),
    )]));
// >>>>>>> master
  }
}


