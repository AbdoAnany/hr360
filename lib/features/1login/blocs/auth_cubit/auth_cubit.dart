import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hr360/app.dart';
import 'package:hr360/features/home/presentation/pages/Home.dart';

import '../../../../di.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/constants/keys.dart';
import '../../../../utils/error/failure.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../data/settings_model.dart';
import '../../data/user_model.dart';
import '../../domain/repositires/auth_repo.dart';
import '../../login.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  Future completeInformation(
      {required String area,
      required String city,
      required String name,
      required GlobalKey<FormState> formKey,
      required String phoneNumber,
      required String token}) async {
    // try {
    //   emit(AuthLoading());
    //   var userEntity = await _authRepo.completeInformation(
    //       area: area,
    //       city: city,
    //       name: name,
    //       phoneNumber: phoneNumber,
    //       token: token);
    //   await GetStorage().write(kLoggedWithSocial, true);
    //   await GetStorage().write(kIsLoggedIn, true);
    //
    //   emit(AuthSuccess(user: userEntity));
    //   formKey.currentState?.reset();
    // } on DioError catch (e) {
    //   log('Exception in AuthCubit : ${e.requestOptions.headers.toString()}');
    //
    //   emit(AuthFailure(errMessage: e.response?.data['message']));
    // } on Exception {
    //   emit(AuthFailure(errMessage: kExceptionMessage));
    // }
  }

  Future signIn(
      {required String name,
      required String password,
      required String phoneNumber,
      required String city,
      required GlobalKey<FormState> formKey,
      required String email,
      required String area}) async {
    emit(AuthLoading());
    // try {
    //   await _authRepo
    //       .createEmailWithEmailAndPassword(
    //           name: name,
    //           password: password,
    //           phoneNumber: phoneNumber,
    //           email: email,
    //           city: city,
    //           area: area)
    //       .then((value) => login(
    //           password: password,
    //           email: email,
    //           formKey: formKey,
    //      ));
    //
    //   //emit(AuthSuccess(user: user));
    //   formKey.currentState?.reset();
    // } on DioException catch (e) {
    //   log('Exception in AuthCubit : ${e.toString()}');
    //
    //
    //   emit(AuthFailure(errMessage: e.message!));
    // } catch (e) {
    //   emit(AuthFailure(errMessage: kExceptionMessage));
    // }
  }

  Future<void> login({
    bool? rememberMe,
    required String password,
    required String email,
    required GlobalKey<FormState> formKey,
  }) async {
    emit(AuthLoading());
    try {
      var user = await _authRepo.loginWithEmailANdPassword(
        email: email,
        password: password,
      );
      user.fold((e) {
        String? errMessage = (e as ServerFailure).message;

        emit(AuthFailure(errMessage: errMessage));
        //   return e;
      }, (data) async {
        // await     sl<TLocalStorage>().removeData(AppKeys.userDataLogin);
        await sl<TLocalStorage>().saveData<Map<String,dynamic>>(AppKeys.userDataLogin, data.toJson()).then((e) {
          print('data :  ${data.toJson()}');
          THelperFunctions.navigateAndReplaceScreen(const Home());
          emit(AuthSuccess(user: data));
        });

        // return Right(data);
      });
    } on DioException catch (e) {
      emit(AuthFailure(errMessage: e.response?.data[kMessage]));
    } catch (e) {
      emit(AuthFailure(errMessage: kExceptionMessage));
    }
  }

  Future getSettings() async {
    // SettingsModel settings = await _authRepo.getPrivacyPoilcy();
    // aboutPage = int.parse(settings.aboutUs);
    // print('4444444=$aboutPage');
    // termsPage = int.parse(settings.terms);
    // emit(SettingsSuccess(settingsModel: settings));
  }

  Future checkForLogin() async {
    // GetStorage.init().then((value) async {
    //   print(GetStorage().read(kIsLoggedIn));
    //   bool isLogged = await GetStorage().read(kIsLoggedIn) ?? false;
    //   if (isLogged) {
    //     UserModel userdata = HelperFunctions.getUser();
    //     emit(AuthSuccess(user: userdata));
    //   } else {
    //     emit(AuthInitial());
    //   }
    //   print(isLogged);
    // });
  }

  logOut() {
    // GetStorage.init().then((value) async {
    // //  GetStorage().remove(kIsLoggedIn);
    // //  GetStorage().remove(AppKeys.rememberMe);
    //
    // });

    sl<TLocalStorage>().clearAll();
    THelperFunctions.navigateAndReplaceScreen(const LoginScreen());

    emit(AuthInitial());
  }
}
