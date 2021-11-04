import 'package:admin_flutter/src/helper/textHelper.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CustomText(
          'User',
          size: 60,
        ),
      ),
    );
  }
}
