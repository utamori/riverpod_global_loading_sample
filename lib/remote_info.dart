import 'package:faker/faker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_global_loading_sample/loading.dart';

part 'remote_info.g.dart';

@riverpod
class RemoteAddress extends _$RemoteAddress {
  @override
  FutureOr<String> build() {
    ref.listenSelf((pre, next) {
      if (pre == null) return;
      switch (next.isLoading) {
        case true:
          ref.read(globalLoadingServiceProvider.notifier).start();
        case false:
          ref.read(globalLoadingServiceProvider.notifier).finish();
      }
    });

    final address = Faker().address;
    return Future.delayed(
      const Duration(seconds: 3),
      () => address.country(),
    );
  }
}

@riverpod
FutureOr<String> remoteString(RemoteStringRef ref) {
  ref.listenSelf((pre, next) {
    if (pre == null) return;
    switch (next.isLoading) {
      case true:
        ref.read(globalLoadingServiceProvider.notifier).start();
      case false:
        ref.read(globalLoadingServiceProvider.notifier).finish();
    }
  });

  final animal = Faker().animal;
  return Future.delayed(
    const Duration(seconds: 3),
    () => animal.name(),
  );
}
