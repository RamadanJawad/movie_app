import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/resources/manager_assets.dart';
import 'package:movie_app/core/resources/manager_colors.dart';
import 'package:movie_app/core/resources/manager_fonts.dart';
import 'package:movie_app/core/resources/manager_size_util.dart';
import 'package:movie_app/core/resources/manager_styles.dart';
import 'package:movie_app/features/search/presentation/view/widget/search_delegate.dart';
import 'package:movie_app/routes/routes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(ManagerAssets.drawer)),
        Image.asset(
          ManagerAssets.logo,
          width: ManagerWidth.w100,
        ),
        IconButton(
            onPressed: () {
              Get.toNamed(Routes.searchVideo);
            },
            icon: const Icon(
              CupertinoIcons.search,
              color: ManagerColors.white,
            )),
      ],
    );
  }
}
