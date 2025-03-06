import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/http/dio_client.dart';
import '../../../../core/utils/network.dart';
import '../../domain/repositires/auth_repo.dart';
import '../user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final Network network = Network();

  @override
  Future<Either<Failure, UserLoginModel>> loginWithEmailANdPassword(
      {required String password, required String email}) async {
    var response = await TDioHelper.post(
      'auth/login',
     data:  {
        'username': email,
        'password': password,
      },
    );

    return response.fold((serverFailure) => Left(serverFailure),
        (data) => Right(UserLoginModel.fromJson(data)));
  }

  @override
  Future<Either<Failure, UserLoginModel>> signInWithEmailAndPassword(
      {required String password, required String email}) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );

    return response.fold((serverFailure) => Left(serverFailure),
        (data) => Right(UserLoginModel.fromJson(data)));
  }
}
