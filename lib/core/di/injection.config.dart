// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:flutter_clevit_task/core/di/injection.dart' as _i564;
import 'package:flutter_clevit_task/core/services/network_service.dart'
    as _i185;
import 'package:flutter_clevit_task/features/collection/data/datasources/bottle_local_datasource.dart'
    as _i527;
import 'package:flutter_clevit_task/features/domain/repositories/bottle_repository.dart'
    as _i297;
import 'package:flutter_clevit_task/features/domain/repositories/bottle_repository_impl.dart'
    as _i300;
import 'package:flutter_clevit_task/features/presentation/bloc/collection_bloc.dart'
    as _i228;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i185.NetworkService>(() => registerModule.networkService);
    gh.lazySingleton<_i527.BottleLocalDataSource>(
      () => _i527.BottleLocalDataSource(),
    );
    gh.lazySingleton<_i297.BottleRepository>(
      () => _i300.BottleRepositoryImpl(gh<_i527.BottleLocalDataSource>()),
    );
    gh.factory<_i228.CollectionBloc>(
      () => _i228.CollectionBloc(gh<_i297.BottleRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i564.RegisterModule {}
