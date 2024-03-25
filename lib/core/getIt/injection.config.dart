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
import '../../app/data/repository/posts/posts_repository.dart' as _i18;
import '../../app/data/repository/sign_in/sign_in_repository.dart' as _i20;
import '../../app/data/repository/users/users_repository.dart' as _i22;
import '../../app/domain/posts/repository/i_posts_repository.dart' as _i17;
import '../../app/domain/posts/usecase/fetch_posts_usecase.dart' as _i26;
import '../../app/domain/sign_in/repository/i_sign_in_repositort.dart' as _i19;
import '../../app/domain/sign_in/usecase/sign_in_with_params_use_case.dart'
    as _i25;
import '../../app/domain/sign_in/usecase/sing_in_use_case.dart' as _i23;
import '../../app/domain/users/repository/i_users_repository.dart' as _i21;
import '../../app/domain/users/usecase/fetch_users.dart' as _i27;
import '../../app/presentation/sign_in/viewmodel/sign_in_viewmodel.dart'
    as _i24;
import '../../app/presentation/splash/viewmodel/splash_viewmodel.dart' as _i14;
import '../../app/presentation/users/viewmodel/user_sub_viewmodel.dart' as _i15;
import '../../app/presentation/users/viewmodel/users_viewmodel.dart' as _i28;
import '../../app/utilities/connectivity/connectivity_controller.dart' as _i5;
import '../network/builder/network_manager.dart' as _i12;
import '../network/builder/network_manager_impl.dart' as _i13;
import '../network/builder/third_party_managers.dart' as _i16;

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
    gh.lazySingleton<_i14.SplashViewModel>(() => _i14.SplashViewModel());
    gh.lazySingleton<_i15.SubUserViewModel>(() => _i15.SubUserViewModel());
    gh.singleton<_i16.ThirdPartyManagers>(() => _i16.ThirdPartyManagers());
    gh.lazySingleton<_i17.IPostsRepository>(
        () => _i18.PostsRepository(postsService: gh<_i6.IPostsService>()));
    gh.lazySingleton<_i19.ISignInRepository>(
        () => _i20.SignInRepository(iSignInService: gh<_i8.ISignInService>()));
    gh.lazySingleton<_i21.IUsersRepository>(
        () => _i22.UsersRepository(iUsersService: gh<_i10.IUsersService>()));
    gh.lazySingleton<_i23.SignInUseCase>(() => _i23.SignInUseCase(
        iDomainSignInRepository: gh<_i19.ISignInRepository>()));
    gh.lazySingleton<_i24.SignInViewModel>(
        () => _i24.SignInViewModel(signInUseCase: gh<_i23.SignInUseCase>()));
    gh.lazySingleton<_i25.SignInWithParamsUseCase>(() =>
        _i25.SignInWithParamsUseCase(
            iDomainSignInRepository: gh<_i19.ISignInRepository>()));
    gh.singleton<_i26.FetchPostsUseCase>(() =>
        _i26.FetchPostsUseCase(iPostsRepository: gh<_i17.IPostsRepository>()));
    gh.singleton<_i27.FetchUsers>(() =>
        _i27.FetchUsers(iDomainUsersRepository: gh<_i21.IUsersRepository>()));
    gh.lazySingleton<_i28.UsersViewModel>(() => _i28.UsersViewModel(
          fetchUsers: gh<_i27.FetchUsers>(),
          fetchPostsUseCase: gh<_i26.FetchPostsUseCase>(),
        ));
    return this;
  }
}
