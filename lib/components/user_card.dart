import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:squad_maker/helpers/calc.dart';
import 'package:squad_maker/src/data/data.dart';
import 'package:squad_maker/theme/theme.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final (age, _, _) = ageNow(DateTime.parse(user.dateOfBirth!));
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: boxShadow1,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
              imageUrl: user.image!,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Container(
                  color: AppColors.bg,
                  constraints:
                      const BoxConstraints(maxHeight: 160, maxWidth: 160),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: 160,
              color: AppColors.bg,
              colorBlendMode: BlendMode.dstOver,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            user.name!,
            style: AppTextStyle.lgSB,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            '${user.gender} | $age',
            style: AppTextStyle.mRegular.copyWith(color: AppColors.subText),
          ),
          const SizedBox(height: 10),
          Text('${user.country}'),
        ],
      ),
    );
  }
}
