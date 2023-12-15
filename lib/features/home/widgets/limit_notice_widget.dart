import 'package:flutter/material.dart';
import 'package:squad_maker/theme/theme.dart';

class LimitNoticeWidget extends StatelessWidget {
  const LimitNoticeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        color: AppColors.error,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Text(
        '3 people already added to squad',
        style: AppTextStyle.smSB,
      ),
    );
  }
}
