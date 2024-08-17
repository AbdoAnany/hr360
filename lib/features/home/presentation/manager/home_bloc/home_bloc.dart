import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr360/features/home/date/repositries/repo_impl.dart';
import 'package:hr360/features/home/presentation/pages/pages/Employee/employees.dart';

import '../../../../../core/utils/error/failure.dart';
import '../../widgets/Mainbar.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitialState());
 static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  static HomeCubit get(context) => BlocProvider.of(context);
  final HomeRepoImpl _homeRepo = HomeRepoImpl();
  PageType currentPage = PageType.dashboard;
  void update() {

    emit( ChangeState());
  }
  void changePage(PageType newPage,{arguments}) {

    MainBarControl.currentPage = newPage;
    currentPage = newPage;

    _navigateToPage(newPage,arguments: arguments);

    emit(const ChangePageState());
    emit(const StartGetData());
  }


  void _navigateToPage(PageType pageType,{arguments}) {
    String routeName;
    switch (pageType) {
      case PageType.dashboard:
        routeName = '/dashboard';
        break;
      case PageType.employees:
        routeName = '/employees';
        break;
        case PageType.chat:
        routeName = '/chat';
        break;
        case PageType.category:
        routeName = '/category';
        break;
        case PageType.report:
        routeName = '/report';
        break;
      case PageType.profile:
        routeName = '/profile';
        break;
      case PageType.setting:
        routeName = '/setting';
        break;
      default:
        routeName = '/default';
        break;
    }
    print(routeName);
    print(arguments);
    navigatorKey.currentState?.pushNamed(routeName,arguments:arguments);
  }
  Future getDataFromServer() async {
    var dateList;
    var val = await _homeRepo.getAllUserDetails();
    val.fold((e) {
      dateList = damyList;
    }, (data) {
      dateList = data;
    });
    return dateList;
  }

  Future<Either<Failure, dynamic>> getDataFromServerTEST() async {
    var val = await _homeRepo.getAllUserDetails().then((val) {
      return val.fold((e) {
        emit(const FailGetData());

        Left(e);
      }, (data) {
        print(data);
        Right(data);
        emit(SuccessfulGetData(data: data));
      });
    });
    return val;
  }
}
// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   static HomeBloc get(context) => BlocProvider.of(context);
//   final HomeRepo _HomeRepo=HomeRepoImpl();
//
//   HomeBloc()
//       : super(const HomeState()) {
//     on<HomeEvent>((event, emit) async {
//       if (event is InitialHomeEvent) {
//         await getDataFromServer();
//
//       }
//
//       if (event is ChangePageEvent) {
//         print('eeeeeeeeeeeeee  ${event.newPage}');
//
//         emit(ChangePageState(newPage: event.newPage));
//       }
//     });
//   }
//
//   void changePage(PageType newPage) {
//     MainBarControl.currentPage = newPage;
//     add(ChangePageEvent(newPage));
//   }
//
//   Future<void> getDataFromServer() async {
//     _HomeRepo.getAllUserDetails().then((val){
//
//       val.fold((e){
//         emit(const FailGetData());
//
//         Left(e);
//       },(data){
//         print(data);
//         Right(data);
//         add( SuccessfulGetDataEvent(data:data));
//
//       });
//     });
//   }
// }
