import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/common/model/country.dart';
import 'package:flutter_vpn/src/common/widgets/custom_app_bar.dart';

class CountryPickPage extends StatefulWidget {
  const CountryPickPage({super.key});

  static const route = 'country/pick/page';

  @override
  State<CountryPickPage> createState() => _CountryPickPageState();
}

class _CountryPickPageState extends State<CountryPickPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Pick Country'),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
        child: ListView.separated(
          itemBuilder:
              (context, index) => InkWell(
                onTap: () {
                  for (int i = 0; i < countryList.length; i++) {
                    countryList[i].isSelected = false;
                  }
                  countryList[index].isSelected = true;
                  Navigator.pop(context, countryList[index]);
                  setState(() {});
                },
                child: ListTile(
                  leading: Image.asset(countryList[index].imagePath),
                  title: Text(countryList[index].imageName),
                  trailing: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey),
                      color:
                          countryList[index].isSelected
                              ? Colors.blue
                              : Colors.white,
                    ),

                    child:
                        countryList[index].isSelected
                            ? SizedBox(
                              width: 25,
                              height: 25,
                              child: Center(
                                child: Icon(Icons.check, color: Colors.white),
                              ),
                            )
                            : SizedBox(width: 25, height: 25),
                  ),
                ),
              ),
          separatorBuilder:
              (context, index) => Divider(height: 50, color: Colors.black38),
          itemCount: countryList.length,
        ),
      ),
    );
  }
}
