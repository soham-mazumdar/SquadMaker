import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:squad_maker/features/cubit/user_cubit.dart';
import 'package:squad_maker/src/core/core.dart';
import 'package:squad_maker/src/data/data.dart';
import 'package:squad_maker/src/domain/domain.dart';

final getItInstance = GetIt.I;

init() async {
  // SERVICES
  getItInstance.registerLazySingleton<Client>(Client.new);
  getItInstance.registerLazySingleton<HttpClient>(() => HttpClient(
        baseUrl: 'https://random-data-api.com/api/v2/',
        client: getItInstance(),
      ));

  getItInstance.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(getItInstance()));

  // GLOBAL BLOCS
  getItInstance
      .registerLazySingleton<UserCubit>(() => UserCubit(getItInstance()));
}
