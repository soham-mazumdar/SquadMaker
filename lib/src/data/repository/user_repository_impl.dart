import 'package:squad_maker/src/core/core.dart';
import 'package:squad_maker/src/data/data.dart';
import 'package:squad_maker/src/domain/domain.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(HttpClient client) : _client = client;

  final HttpClient _client;

  @override
  Future<(AppException?, List<UserModel>?)> getUsers(
    String count,
    String gender,
  ) async {
    try {
      final res = await _client.makeRequest(
        RequestMethod.get,
        path: 'users?size=$count',
      );

      final ret = res
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return (null, ret);
    } catch (e) {
      return (e.toAppException(), null);
    }
  }
}
