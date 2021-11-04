import 'package:admin_flutter/src/helper/globalHelper.dart';
import 'package:admin_flutter/src/helper/textHelper.dart';
import 'package:flutter/material.dart';

class DashItem extends StatelessWidget {
  const DashItem({
    required this.size,
    required this.count,
    required this.title,
    required this.icon,
  });

  final Size size;
  final String count, title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.18,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(helper.sized / 2),
        boxShadow: [
          BoxShadow(
            color: clr.shadow,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                count,
                size: 50,
                color: clr.dasar,
                weight: FontWeight.bold,
              ),
              CustomText(
                title,
                size: 22,
                color: Colors.black45,
                weight: FontWeight.bold,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(helper.sized / 2),
              boxShadow: [
                BoxShadow(
                  color: clr.shadow,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 60,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
