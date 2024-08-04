import 'package:dartz/dartz.dart';

import '../../../../core/utils/error/failure.dart';
import '../../data/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> loginWithEmailANdPassword(
      {required String password, required String email});

// Future<UserModel> createEmailWithEmailAndPassword(
//     {required  String name,
//     required  String password,
//     required  String phoneNumber,
//     required  String city,
//     required  String email,
//     required  String area});
//
//
//
//
// Future<UserModel> completeInformation(
//     {String token,
//     String name,
//     String city,
//     String area,
//     String phoneNumber});

// Future<SettingsModel> getPrivacyPoilcy();
}
