import 'package:architecture/app/data/datasource/remote/posts/i_posts_service.dart';
import 'package:architecture/app/data/datasource/remote/posts/posts_service.dart';
import 'package:architecture/app/data/datasource/remote/sign_in/i_sign_in_service.dart';
import 'package:architecture/app/data/datasource/remote/sign_in/sign_in_service.dart';
import 'package:architecture/app/data/datasource/remote/users/i_users_service.dart';
import 'package:architecture/app/data/datasource/remote/users/users_service.dart';
import 'package:architecture/app/data/repository/posts/posts_repository.dart';
import 'package:architecture/app/data/repository/sign_in/sign_in_repository.dart';
import 'package:architecture/app/data/repository/users/users_repository.dart';
import 'package:architecture/app/domain/posts/repository/i_posts_repository.dart';
import 'package:architecture/app/domain/posts/usecase/fetch_posts_usecase.dart';
import 'package:architecture/app/domain/sign_in/repository/i_sign_in_repositort.dart';
import 'package:architecture/app/domain/sign_in/usecase/sign_in_with_params_use_case.dart';
import 'package:architecture/app/domain/sign_in/usecase/sing_in_use_case.dart';
import 'package:architecture/app/domain/users/repository/i_users_repository.dart';
import 'package:architecture/app/domain/users/usecase/fetch_users.dart';
import 'package:architecture/app/presentation/sign_in/viewmodel/sign_in_viewmodel.dart';
import 'package:architecture/app/presentation/splash/viewmodel/splash_viewmodel.dart';
import 'package:architecture/app/presentation/users/viewmodel/users_viewmodel.dart';
import 'package:architecture/app/utilities/connectivity/connectivity_controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIT() {
  setupViewModel();
  setupRepository();
  setupServices();
  setupUseCases();
}

void setupViewModel() {
  getIt
    ..registerLazySingleton<UsersViewModel>(
        () => UsersViewModel(fetchUsers: getIt(), fetchPostsUseCase: getIt()))
    ..registerLazySingleton<SignInViewModel>(() => SignInViewModel(
        signInUseCase: getIt(), signInWithParamsUseCase: getIt()))
    ..registerLazySingleton<SplashViewModel>(SplashViewModel.new)
    ..registerLazySingleton<ConnectivityController>(ConnectivityController.new);
}

void setupRepository() {
  getIt
    ..registerLazySingleton<IUsersRepository>(
        () => UsersRepository(iUsersService: getIt()))
    ..registerLazySingleton<ISignInRepository>(
        () => SignInRepository(iSignInService: getIt()))
    ..registerLazySingleton<IPostsRepository>(
        () => PostsRepository(postsService: getIt()));
}

void setupServices() {
  getIt
    ..registerLazySingleton<IUsersService>(UsersService.new)
    ..registerLazySingleton<ISignInService>(SignInService.new)
    ..registerLazySingleton<IPostsService>(PostsService.new);
}

void setupUseCases() {
  getIt
    ..registerLazySingleton<FetchUsers>(
        () => FetchUsers(iDomainUsersRepository: getIt()))
    ..registerLazySingleton<SignInWithParamsUseCase>(
        () => SignInWithParamsUseCase(iDomainSignInRepository: getIt()))
    ..registerLazySingleton<SignInUseCase>(
        () => SignInUseCase(iDomainSignInRepository: getIt()))
    ..registerLazySingleton<FetchPostsUseCase>(
        () => FetchPostsUseCase(iPostsRepository: getIt()));
}
