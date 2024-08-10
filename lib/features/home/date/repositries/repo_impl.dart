import 'package:dartz/dartz.dart';
import 'package:hr360/features/1_login/data/user_model.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/http/dio_client.dart';
import '../../../../core/utils/network.dart';
import '../../domain/repositires/repo.dart';
import '../../presentation/pages/pages/Employee/employees.dart';

class HomeRepoImpl {
  @override
  Future<Either<Failure, dynamic>> getAllUserDetails() async {
    var response = await TDioHelper.get('users/all-personal-info');

    return response.fold((serverFailure) {
      print("(serverFailure as ServerFailure).message");
      print((serverFailure as ServerFailure).message);
      return Left(serverFailure);
    }, (data) {
      return Right(data);
    });
  }
}
