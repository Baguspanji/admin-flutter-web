import 'package:admin_flutter/src/helper/textHelper.dart';
import 'package:flutter/material.dart';

class PesanPage extends StatelessWidget {
  const PesanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CustomText(
          'Pesan',
          size: 60,
        ),
      ),
    );
  }
}
