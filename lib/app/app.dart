import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squad_maker/app/di/di.dart';
import 'package:squad_maker/app/router/app_router.dart';
import 'package:squad_maker/features/bloc/user_bloc.dart';
import 'package:squad_maker/features/home/view/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) => getItInstance<UserBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Started Kit',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRouter().onGenerateRoute,
        home: const HomeScreen(),
      ),
    );
  }
}
