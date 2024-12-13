import 'package:atw/feature/auth/login/presentation/login_cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../feature/auth/login/data/data_source/login_data_source_impl.dart';
import '../../feature/auth/login/data/repos/login_repo_impl.dart';
import '../../feature/auth/login/domain/repos/login_data_source.dart';
import '../../feature/auth/login/domain/repos/login_repo.dart';
import '../network/firebase/firebase_uitiles.dart';

class DependencyInjection{
  final getIt = GetIt.instance;

  void configure(){

    getIt.registerLazySingleton<LoginDataSource>(() =>
    (LoginDataSourceImpl(firebaseUtils: FirebaseUtils.getInstance())));

    getIt.registerLazySingleton<LoginRepo>(
          () => LoginRepoImpl(loginDataSource: getIt<LoginDataSource>()),
    );

    getIt.registerLazySingleton<LoginCubit>(
        () => LoginCubit()
    );
  }
}