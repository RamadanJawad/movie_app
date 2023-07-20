import 'package:flutter/material.dart';
import 'package:movie_app/core/resources/manager_colors.dart';
import 'package:movie_app/core/resources/manager_size_util.dart';
import 'package:shimmer/shimmer.dart';

Shimmer getShimmerDetailsLoading() {
  return Shimmer.fromColors(
    baseColor: ManagerColors.white.withOpacity(0.1),
    highlightColor: ManagerColors.white.withOpacity(0.2),
    child: Column(
      children: [
        Container(
          width: double.infinity,
          height: ManagerHeight.h460,
          margin: EdgeInsets.symmetric(
              horizontal: ManagerHeight.h10, vertical: ManagerHeight.h10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
              color: ManagerColors.white),
        ),
        ListTile(
          title: Container(
            width: ManagerWidth.w68,
            height: ManagerHeight.h20,
            margin: EdgeInsets.symmetric(
                horizontal: ManagerHeight.h10,
                vertical: ManagerHeight.h10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ManagerRadius.r10),
                color: ManagerColors.white),
          ),
          subtitle: Container(
            width: ManagerWidth.w68,
            height: ManagerHeight.h20,
            margin: EdgeInsets.symmetric(
                horizontal: ManagerHeight.h10,
                vertical: ManagerHeight.h10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ManagerRadius.r10),
                color: ManagerColors.white),
          ),
          trailing: Container(
            width: ManagerWidth.w40,
            height: ManagerHeight.h20,
            margin: EdgeInsets.symmetric(
                horizontal: ManagerHeight.h10,
                vertical: ManagerHeight.h10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ManagerRadius.r10),
                color: ManagerColors.white),
          ),
        ),
        Container(
          width: double.infinity,
          height: ManagerHeight.h100,
          margin: EdgeInsets.symmetric(
              horizontal: ManagerHeight.h10, vertical: ManagerHeight.h10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
              color: ManagerColors.white),
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
  );
}
