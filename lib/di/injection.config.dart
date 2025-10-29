// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:zytronic_whatsapp_task/di/firebase_module.dart' as _i1017;
import 'package:zytronic_whatsapp_task/features/auth/data/data_sources/auth_local_datasource.dart'
    as _i715;
import 'package:zytronic_whatsapp_task/features/auth/data/data_sources/auth_remote_datasource.dart'
    as _i362;
import 'package:zytronic_whatsapp_task/features/auth/data/repository/auth_repository_impl.dart'
    as _i568;
import 'package:zytronic_whatsapp_task/features/auth/domain/repository/auth_repository%20.dart'
    as _i879;
import 'package:zytronic_whatsapp_task/features/auth/domain/usecases/get_cached_user_use_case.dart'
    as _i108;
import 'package:zytronic_whatsapp_task/features/auth/domain/usecases/signout_use_case.dart'
    as _i1033;
import 'package:zytronic_whatsapp_task/features/auth/domain/usecases/signup_phone_use_case.dart'
    as _i867;
import 'package:zytronic_whatsapp_task/features/auth/presentation/bloc/auth_bloc.dart'
    as _i752;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => firebaseModule.firebaseStore,
    );
    gh.lazySingleton<_i715.AuthLocalDataSource>(
      () => _i715.AuthLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i362.AuthRemoteDataSource>(
      () => _i362.AuthRemoteDataSourceImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i879.AuthRepository>(
      () => _i568.AuthRepositoryImpl(
        remoteDataSource: gh<_i362.AuthRemoteDataSource>(),
        localDataSource: gh<_i715.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i108.GetCachedUserUseCase>(
      () => _i108.GetCachedUserUseCase(gh<_i879.AuthRepository>()),
    );
    gh.lazySingleton<_i1033.SignOutUseCase>(
      () => _i1033.SignOutUseCase(gh<_i879.AuthRepository>()),
    );
    gh.lazySingleton<_i867.SignupPhoneUseCase>(
      () => _i867.SignupPhoneUseCase(gh<_i879.AuthRepository>()),
    );
    gh.factory<_i752.AuthBloc>(
      () => _i752.AuthBloc(
        signupPhoneUseCase: gh<_i867.SignupPhoneUseCase>(),
        getCachedUserUseCase: gh<_i108.GetCachedUserUseCase>(),
        signOutUseCase: gh<_i1033.SignOutUseCase>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i1017.FirebaseModule {}
