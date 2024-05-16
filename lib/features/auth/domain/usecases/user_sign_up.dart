import 'package:blogger/core/error/failures.dart';
import 'package:blogger/core/params/user_sign_up_params.dart';
import 'package:blogger/core/usecase/usecase.dart';
import 'package:blogger/core/common/entities/user_entities.dart';
import 'package:blogger/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;
  UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}
