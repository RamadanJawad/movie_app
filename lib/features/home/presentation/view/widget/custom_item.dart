import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/config/constants.dart';
import 'package:movie_app/core/resources/manager_size_util.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.data, this.onTap});

  final List data;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w10, vertical: ManagerHeight.h14),
      height: ManagerHeight.h160,
      child: ListView.builder(
          itemCount: data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: onTap,
              child: Container(
                width: ManagerWidth.w100,
                height: ManagerHeight.h130,
                margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ManagerRadius.r10),
                    image: DecorationImage(
                        image: NetworkImage(
                            "${Constants.imageBasic}${data[index].posterPath!.toString()}"),
                        fit: BoxFit.cover)),
              ),
            );
          }),
    );
  }
}
