import 'package:dartz/dartz.dart';
import 'package:hr360/features/1login/data/user_model.dart';

import '../../../../utils/error/failure.dart';
import '../../../../utils/http/dio_client.dart';
import '../../../../utils/network.dart';
import '../../domain/repositires/repo.dart';

class HomeRepoImpl implements HomeRepo {

  @override
  Future<Either<Failure, dynamic>> getAllUserDetails() async {
    var response = await TDioHelper.get('users/all-personal-info');

    return response.fold((serverFailure) {
      print((serverFailure as ServerFailure).message);
      return Left(serverFailure);
    }, (data) {
      print(data);
      return Right(data);
    });
  }
}
