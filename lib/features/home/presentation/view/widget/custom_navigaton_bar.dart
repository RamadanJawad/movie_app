import 'package:flutter/material.dart';
import 'package:movie_app/core/resources/manager_assets.dart';
import 'package:movie_app/core/resources/manager_size_util.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ManagerWidth.w250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.9),
            blurRadius: 4,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(ManagerAssets.logo,width: ManagerWidth.w100,)
          ],
        ),
      ),
    );
  }
}
