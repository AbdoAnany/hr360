import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/http/dio_client.dart';
import '../../../../core/utils/network.dart';
import '../../domain/repositires/auth_repo.dart';
import '../user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final Network network = Network();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore  _firestore = FirebaseFirestore.instance;

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
  Future<Either<Failure, String>?> signInWithEmailAndPassword(
      {required String password, required String email}) async {

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      String uid = userCredential.user!.uid;
      return Right(uid);
    } catch (e) {
      return Left(ServerFailure(e.toString()));}


  }


}
