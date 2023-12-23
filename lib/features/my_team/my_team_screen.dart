import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squad_maker/app/di/di.dart';
import 'package:squad_maker/components/user_card.dart';
import 'package:squad_maker/features/cubit/user_cubit.dart';
import 'package:squad_maker/theme/theme.dart';

class MyTeamScreen extends StatelessWidget {
  const MyTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      bloc: getItInstance<UserCubit>(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: AppColors.primary,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.chevron_left_rounded,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: Text(
              'My Team',
              style: AppTextStyle.lgSB.copyWith(color: AppColors.white),
            ),
          ),
          body: state.myTeam.isEmpty
              ? const Center(
                  child: Text(
                    'No one added to team',
                    textAlign: TextAlign.center,
                  ),
                )
              : Column(
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Expanded(child: UserCard(user: state.myTeam[0])),
                        const SizedBox(width: 20),
                        Expanded(child: UserCard(user: state.myTeam[1])),
                        const SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UserCard(user: state.myTeam[2]),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
        );
      },
    );
  }
}
