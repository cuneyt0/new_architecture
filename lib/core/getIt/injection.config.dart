// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../app/data/datasource/local/application/application_local_datasource.dart'
    as _i3;
import '../../app/data/datasource/local/application/application_local_datasource_impl.dart'
    as _i4;
import '../../app/data/datasource/remote/posts/i_posts_service.dart' as _i6;
import '../../app/data/datasource/remote/posts/posts_service.dart' as _i7;
import '../../app/data/datasource/remote/sign_in/i_sign_in_service.dart' as _i8;
import '../../app/data/datasource/remote/sign_in/sign_in_service.dart' as _i9;
import '../../app/data/datasource/remote/users/i_users_service.dart' as _i10;
import '../../app/data/datasource/remote/users/users_service.dart' as _i11;
import '../../app/data/repository/posts/posts_repository.dart' as _i19;
import '../../app/data/repository/sign_in/sign_in_repository.dart' as _i21;
import '../../app/data/repository/users/users_repository.dart' as _i23;
import '../../app/domain/posts/repository/i_posts_repository.dart' as _i18;
import '../../app/domain/posts/usecase/fetch_posts_usecase.dart' as _i27;
import '../../app/domain/sign_in/repository/i_sign_in_repositort.dart' as _i20;
import '../../app/domain/sign_in/usecase/sign_in_with_params_use_case.dart'
    as _i26;
import '../../app/domain/sign_in/usecase/sing_in_use_case.dart' as _i24;
import '../../app/domain/users/repository/i_users_repository.dart' as _i22;
import '../../app/domain/users/usecase/fetch_users.dart' as _i28;
import '../../app/presentation/notification/viewmodel/notification_viewmodel.dart'
    as _i14;
import '../../app/presentation/sign_in/viewmodel/sign_in_viewmodel.dart'
    as _i25;
import '../../app/presentation/splash/viewmodel/splash_viewmodel.dart' as _i15;
import '../../app/presentation/users/viewmodel/user_sub_viewmodel.dart' as _i16;
import '../../app/presentation/users/viewmodel/users_viewmodel.dart' as _i29;
import '../../app/utilities/connectivity/connectivity_controller.dart' as _i5;
import '../network/builder/network_manager.dart' as _i12;
import '../network/builder/network_manager_impl.dart' as _i13;
import '../network/builder/third_party_managers.dart' as _i17;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ApplicationLocalDataSource>(
        () => _i4.UserLocalDataSourceImpl());
    gh.singleton<_i5.ConnectivityController>(
        () => _i5.ConnectivityController());
    gh.lazySingleton<_i6.IPostsService>(() => _i7.PostsService());
    gh.lazySingleton<_i8.ISignInService>(() => _i9.SignInService());
    gh.lazySingleton<_i10.IUsersService>(() => _i11.UsersService());
    gh.lazySingleton<_i12.NetworkManager>(() => _i13.NetworkManagerImpl());
    gh.lazySingleton<_i14.NotificationViewModel>(
        () => _i14.NotificationViewModel());
    gh.lazySingleton<_i15.SplashViewModel>(() => _i15.SplashViewModel());
    gh.lazySingleton<_i16.SubUserViewModel>(() => _i16.SubUserViewModel());
    gh.singleton<_i17.ThirdPartyManagers>(() => _i17.ThirdPartyManagers());
    gh.lazySingleton<_i18.IPostsRepository>(
        () => _i19.PostsRepository(postsService: gh<_i6.IPostsService>()));
    gh.lazySingleton<_i20.ISignInRepository>(
        () => _i21.SignInRepository(iSignInService: gh<_i8.ISignInService>()));
    gh.lazySingleton<_i22.IUsersRepository>(
        () => _i23.UsersRepository(iUsersService: gh<_i10.IUsersService>()));
    gh.lazySingleton<_i24.SignInUseCase>(() => _i24.SignInUseCase(
        iDomainSignInRepository: gh<_i20.ISignInRepository>()));
    gh.lazySingleton<_i25.SignInViewModel>(
        () => _i25.SignInViewModel(signInUseCase: gh<_i24.SignInUseCase>()));
    gh.lazySingleton<_i26.SignInWithParamsUseCase>(() =>
        _i26.SignInWithParamsUseCase(
            iDomainSignInRepository: gh<_i20.ISignInRepository>()));
    gh.singleton<_i27.FetchPostsUseCase>(() =>
        _i27.FetchPostsUseCase(iPostsRepository: gh<_i18.IPostsRepository>()));
    gh.singleton<_i28.FetchUsers>(() =>
        _i28.FetchUsers(iDomainUsersRepository: gh<_i22.IUsersRepository>()));
    gh.lazySingleton<_i29.UsersViewModel>(() => _i29.UsersViewModel(
          fetchUsers: gh<_i28.FetchUsers>(),
          fetchPostsUseCase: gh<_i27.FetchPostsUseCase>(),
        ));
    return this;
  }
}
