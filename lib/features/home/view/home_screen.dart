import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:squad_maker/app/di/di.dart';
import 'package:squad_maker/features/bloc/user_bloc.dart';
import 'package:squad_maker/features/home/widgets/limit_notice_widget.dart';
import 'package:squad_maker/features/home/widgets/my_team_listing.dart';
import 'package:squad_maker/features/home/widgets/selected_user_widget.dart';
import 'package:squad_maker/features/home/widgets/user_listing_widget.dart';
import 'package:squad_maker/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      bloc: getItInstance<UserBloc>()..add(const GetUsers()),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.bg,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            centerTitle: true,
            title: Text(
              'Squad Maker',
              style: AppTextStyle.lgSB.copyWith(color: AppColors.white),
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                if (state.apiStatus == ApiStatus.loading)
                  const SizedBox(
                    width: 140,
                    height: 10,
                    child: LinearProgressIndicator(color: AppColors.primary),
                  )
                else if (state.users.isEmpty)
                  const Text('No User Found!')
                else if (state.selectedUser?.name != null)
                  SelectedUserWidget(user: state.selectedUser!)
                else
                  UserListingWidget(myTeam: state.myTeam, users: state.users),
                const Spacer(),
                if (state.myTeam.length == 3) const LimitNoticeWidget(),
                MyTeamListing(myTeam: state.myTeam)
              ],
            ),
          ),
        );
      },
    );
  }
}
