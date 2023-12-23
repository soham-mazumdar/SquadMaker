import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:squad_maker/app/di/di.dart';
import 'package:squad_maker/components/app_snackbar.dart';
import 'package:squad_maker/components/user_card.dart';
import 'package:squad_maker/features/cubit/user_cubit.dart';
import 'package:squad_maker/src/data/data.dart';

class UserListingWidget extends StatelessWidget {
  const UserListingWidget({
    super.key,
    required this.users,
    required this.myTeam,
  });

  final List<UserModel> users;
  final List<UserModel> myTeam;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 350,
      width: 350,
      child: AppinioSwiper(
        cardCount: users.length,
        backgroundCardCount: 2,
        backgroundCardScale: 0.83,
        // isDisabled: myTeam.length >= 3,
        onEnd: () {
          getItInstance<UserCubit>().getUsers(count: 10);
        },
        onSwipeEnd: (
          int previousIndex,
          int targetIndex,
          SwiperActivity activity,
        ) {
          if (activity.direction == AxisDirection.right) {
            if (myTeam.length < 3) {
              getItInstance<UserCubit>()
                  .addToTeam(userModel: users[targetIndex - 1]);
              // AppSnackbar(context).show('Added to team', context);
            } else {
              AppSnackbar(context).show(
                'Not Added!! Can On only pick 3 members',
                context,
              );
            }
          }
        },
        cardBuilder: (BuildContext context, int index) {
          final user = users[index];
          return UserCard(user: user);
        },
      ),
    );
  }
}
