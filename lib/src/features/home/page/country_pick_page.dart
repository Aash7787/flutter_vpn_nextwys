import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/common/widgets/custom_app_bar.dart';

class CountryPickPage extends StatelessWidget {
  const CountryPickPage({super.key});

  static const route = 'country/pick/page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Pick Country'),
      // body: ListView.separated(itemBuilder: (context, index) => ListTile(), separatorBuilder: (context, index) => Divider(), itemCount: ),
    );
  }
}