import 'package:dartz/dartz.dart';

import '../../../../utils/error/failure.dart';
import '../../../../utils/http/dio_client.dart';
import '../../../../utils/network.dart';
import '../../domain/repositires/auth_repo.dart';
import '../user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final Network network = Network();

  @override
  Future<Either<Failure, UserModel>> loginWithEmailANdPassword(
      {required String password, required String email}) async {
    var response = await TDioHelper.post(
      'auth/login',
      {
        'username': email,
        'password': password,
      },
    );

    return response.fold((serverFailure) => Left(serverFailure),
        (data) => Right(UserModel.fromJson(data)));
  }
}
