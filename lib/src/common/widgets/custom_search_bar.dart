import 'package:flutter/material.dart';

import '../const/global_variable.dart' show colorScheme, txtTheme;

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  const CustomSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: SearchBar(
        controller: controller,
        elevation: const WidgetStatePropertyAll(0),
        hintText: "Search here",
        hintStyle: WidgetStatePropertyAll(
          txtTheme(context).bodyMedium!.copyWith(
                color: colorScheme(context).outline,
              ),
        ),
        trailing: const [
          Padding(padding: EdgeInsets.all(5.0), child: Icon(Icons.search)
              // SvgPicture.asset(AppImages.searchIcon),
              )
        ],
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        side: WidgetStatePropertyAll(
          BorderSide(
            width: 1,
            color: colorScheme(context).onSurface.withOpacity(0.25),
          ),
        ),
      ),
    );
  }
}
