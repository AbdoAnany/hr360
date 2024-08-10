import 'package:dartz/dartz.dart';

import '../../../../core/utils/error/failure.dart';
import '../../../../core/utils/http/dio_client.dart';

class HomeRepoImpl   {

  @override
  Future<Either<Failure, dynamic>> getAllUserDetails() async {
    var response = await TDioHelper.get('users/all-personal-info');

    return response.fold((serverFailure) {
      print((serverFailure as ServerFailure).message);
      return Left(serverFailure);
    }, (data) {

      return Right(data);
    });
  }
}
