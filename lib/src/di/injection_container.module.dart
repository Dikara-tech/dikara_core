//@GeneratedMicroModule;DikaraCorePackageModule;package:dikara_core/src/di/injection_container.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:device_info_plus/device_info_plus.dart' as _i3;
import 'package:dio/dio.dart' as _i6;
import 'package:injectable/injectable.dart' as _i1;
import 'package:logger/logger.dart' as _i7;
import 'package:package_info_plus/package_info_plus.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../dikara_core.dart' as _i4;
import '../utilities/platforms/src/device_platform.dart' as _i10;
import 'modules/internal_module.dart' as _i12;
import 'modules/third_party_module.dart' as _i11;
import 'utilities/bloc/default_bloc_observer.dart' as _i5;

const String _android = 'android';
const String _ios = 'ios';
const String _fuchsia = 'fuchsia';
const String _linux = 'linux';
const String _macos = 'macos';
const String _windows = 'windows';

class DikaraCorePackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) async {
    final thirdPartyModule = _$ThirdPartyModule();
    final internalModule = _$InternalModule();
    await gh.lazySingletonAsync<_i3.AndroidDeviceInfo>(
      () => thirdPartyModule.androidDeviceInfo,
      registerFor: {_android},
      preResolve: true,
    );
    gh.lazySingleton<_i4.AppRouter>(() => internalModule.appRouter);
    gh.lazySingleton<_i5.DefaultBlocObserver>(() => _i5.DefaultBlocObserver());
    gh.factory<_i6.Dio>(() => thirdPartyModule.dio);
    await gh.lazySingletonAsync<_i3.IosDeviceInfo>(
      () => thirdPartyModule.iosDeviceInfo,
      registerFor: {_ios},
      preResolve: true,
    );
    gh.factory<_i7.Logger>(() => thirdPartyModule.logger);
    await gh.lazySingletonAsync<_i8.PackageInfo>(
      () => thirdPartyModule.packageInfo,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i9.SharedPreferences>(
      () => thirdPartyModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i10.DevicePlatformInfo>(
      () => _i10.DevicePlatformInfoAndroid(
        gh<_i8.PackageInfo>(),
        gh<_i3.AndroidDeviceInfo>(),
      ),
      registerFor: {_android},
    );
    gh.lazySingleton<_i10.DevicePlatformInfo>(
      () => _i10.DevicePlatformInfoIos(
        gh<bool>(instanceName: 'IsJailBroken'),
        gh<_i8.PackageInfo>(),
        gh<_i3.IosDeviceInfo>(),
      ),
      registerFor: {_ios},
    );
    gh.lazySingleton<_i10.DevicePlatformInfo>(
      () => _i10.DevicePlatformInfoOther(gh<_i8.PackageInfo>()),
      registerFor: {
        _fuchsia,
        _linux,
        _macos,
        _windows,
      },
    );
  }
}

class _$ThirdPartyModule extends _i11.ThirdPartyModule {}

class _$InternalModule extends _i12.InternalModule {}
