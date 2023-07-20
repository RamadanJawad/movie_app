import 'package:flutter/material.dart';
import 'package:movie_app/core/resources/manager_colors.dart';
import 'package:movie_app/core/resources/manager_size_util.dart';
import 'package:shimmer/shimmer.dart';

Shimmer getShimmerLoading() {
  return Shimmer.fromColors(
    baseColor: ManagerColors.white.withOpacity(0.1),
    highlightColor: ManagerColors.white.withOpacity(0.2),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: ManagerWidth.w100,
                height: ManagerHeight.h20,
                margin: EdgeInsets.symmetric(
                    horizontal: ManagerHeight.h10, vertical: ManagerHeight.h10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ManagerRadius.r10),
                    color: ManagerColors.white),
              ),
              Container(
                width: ManagerWidth.w100,
                height: ManagerHeight.h20,
                margin: EdgeInsets.symmetric(
                    horizontal: ManagerHeight.h10, vertical: ManagerHeight.h10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ManagerRadius.r10),
                    color: ManagerColors.white),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: ManagerWidth.w100,
                height: ManagerHeight.h130,
                margin: EdgeInsets.symmetric(
                    horizontal: ManagerHeight.h10, vertical: ManagerHeight.h10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ManagerRadius.r10),
                    color: ManagerColors.white),
              ),
              Container(
                width: ManagerWidth.w100,
                height: ManagerHeight.h130,
                margin: EdgeInsets.symmetric(
                    horizontal: ManagerHeight.h10, vertical: ManagerHeight.h10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ManagerRadius.r10),
                    color: ManagerColors.white),
              ),
              Container(
                width: ManagerWidth.w100,
                height: ManagerHeight.h130,
                margin: EdgeInsets.symmetric(
                    horizontal: ManagerHeight.h10, vertical: ManagerHeight.h10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ManagerRadius.r10),
                    color: ManagerColors.white),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
