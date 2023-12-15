import 'package:squad_maker/src/core/core.dart';
import 'package:squad_maker/src/data/data.dart';

/// {@template chat_repository}
/// Repository which manages the user domain.
/// {@endtemplate}
abstract class UserRepository {
  /// Returns a random Users
  Future<(AppException?, List<UserModel>?)> getUsers(
      String count, String gender);
}
