import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/config/constants.dart';
import 'package:movie_app/core/resources/manager_colors.dart';
import 'package:movie_app/core/resources/manager_size_util.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ManagerHeight.h240,
      child: Shimmer.fromColors(
        baseColor: ManagerColors.white.withOpacity(0.1),
        highlightColor: ManagerColors.white.withOpacity(0.2),
        child: Card(
          elevation: Constants.shimmerElevation,
          margin: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w10, vertical: ManagerHeight.h10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ManagerRadius.r10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: ManagerWidth.w120,
                height: double.infinity,
                color: Colors.white,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w8,
                    vertical: ManagerHeight.h8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: ManagerHeight.h16,
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: ManagerHeight.h8),
                      ),
                      Container(
                        width: double.infinity,
                        height: ManagerHeight.h16,
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: ManagerHeight.h8),
                      ),
                      Container(
                        width: double.infinity,
                        height: ManagerHeight.h16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
