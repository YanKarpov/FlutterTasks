import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../../../../core/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers();
}
