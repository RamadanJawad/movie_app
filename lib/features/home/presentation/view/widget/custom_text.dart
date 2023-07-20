import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/config/constants.dart';
import 'package:movie_app/core/resources/manager_colors.dart';
import 'package:movie_app/core/resources/manager_fonts.dart';
import 'package:movie_app/core/resources/manager_size_util.dart';
import 'package:movie_app/core/resources/manager_styles.dart';
import 'package:movie_app/features/home/presentation/controller/home_controller.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: getBoldTextStyle(
                    fontSize: ManagerFontSize.s20,
                    color: ManagerColors.white),
              ),
              InkWell(
                child: Text(
                  "View all",
                  style: getBoldTextStyle(
                      fontSize: ManagerFontSize.s14,
                      color: ManagerColors.primaryColor),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
