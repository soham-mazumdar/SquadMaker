import 'package:flutter/material.dart';
import 'package:squad_maker/app/di/di.dart';
import 'package:squad_maker/components/user_card.dart';
import 'package:squad_maker/features/bloc/user_bloc.dart';
import 'package:squad_maker/src/data/data.dart';

class SelectedUserWidget extends StatelessWidget {
  const SelectedUserWidget({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          width: 350,
          child: UserCard(user: user),
        ),
        const SizedBox(height: 10),
        IconButton(
          onPressed: () {
            getItInstance<UserBloc>().add(UnselectUser());
          },
          icon: const Icon(Icons.restore),
        )
      ],
    );
  }
}
