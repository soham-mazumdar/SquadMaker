import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:squad_maker/helpers/calc.dart';
import 'package:squad_maker/src/data/data.dart';
import 'package:squad_maker/theme/theme.dart';

class MyTeamChip extends StatelessWidget {
  const MyTeamChip({
    super.key,
    this.user,
    this.onTap,
    required this.onClose,
  });

  final UserModel? user;
  final void Function()? onTap;
  final void Function()? onClose;

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      final (age, _, _) = ageNow(DateTime.parse(user!.dateOfBirth!));
      return Flexible(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: user!.image!,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Container(
                      color: AppColors.bg,
                      width: 32,
                      height: 32,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    width: 32,
                    color: AppColors.bg,
                    colorBlendMode: BlendMode.dstOver,
                  ),
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getInitials(user!.name!),
                      style: AppTextStyle.xsSB,
                    ),
                    Text(
                      '$age',
                      style: AppTextStyle.xsSB,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: onClose,
                  icon: const Icon(Icons.close, size: 16),
                  color: AppColors.error,
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 68,
          color: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: const Icon(
            Icons.visibility,
            size: 15,
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
