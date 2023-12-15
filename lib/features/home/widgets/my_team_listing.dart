import 'package:flutter/material.dart';
import 'package:squad_maker/app/di/di.dart';
import 'package:squad_maker/app/router/app_routes.dart';
import 'package:squad_maker/components/my_team_chip.dart';
import 'package:squad_maker/components/row_builder.dart';
import 'package:squad_maker/features/bloc/user_bloc.dart';
import 'package:squad_maker/src/data/data.dart';

class MyTeamListing extends StatelessWidget {
  const MyTeamListing({
    super.key,
    required this.myTeam,
  });
  final List<UserModel> myTeam;

  @override
  Widget build(BuildContext context) {
    return RowBuilder(
      mainAxisAlignment: MainAxisAlignment.center,
      itemCount: myTeam.length == 3 ? 4 : myTeam.length,
      itemBuilder: (context, index) {
        if (index > 2) {
          return MyTeamChip(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.myTeam);
            },
            onClose: () {},
          );
        }
        final user = myTeam[index];
        return MyTeamChip(
          user: user,
          onTap: () {
            getItInstance<UserBloc>().add(SelecteUser(userModel: user));
          },
          onClose: () {
            getItInstance<UserBloc>().add(RemoveFromTeam(userModel: user));
          },
        );
      },
    );
  }
}
