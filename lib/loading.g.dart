// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$globalLoadingServiceHash() =>
    r'cc3effc96f17634b2a36cf277ad445ee62570a17';

/// アプリ全体でのローディング状態を管理します
/// これがtrueの間、グローバルローディングインジケーターが表示されます
///
/// Copied from [GlobalLoadingService].
@ProviderFor(GlobalLoadingService)
final globalLoadingServiceProvider =
    AutoDisposeNotifierProvider<GlobalLoadingService, bool>.internal(
  GlobalLoadingService.new,
  name: r'globalLoadingServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$globalLoadingServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GlobalLoadingService = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
