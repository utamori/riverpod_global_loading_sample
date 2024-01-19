import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading.g.dart';

/// アプリ全体でのローディング状態を管理します
/// これがtrueの間、グローバルローディングインジケーターが表示されます
@riverpod
class GlobalLoadingService extends _$GlobalLoadingService {
  /// 実行中の処理の数です
  int _count = 0;

  @override
  bool build() {
    return false;
  }

  void start() {
    state = true;
  }

  void finish() {
    state = false;
  }

  /// Wrap the a future completed value and show / hide the loader before and after processing.
  /// このメソッドでFuture処理をラップすると、処理中にグローバルなローディングインジケーターが表示されます
  Future<T> wrap<T>(FutureOr<T> future) async {
    _present();
    try {
      return await future;
    } finally {
      _dismiss();
    }
  }

  void _present() {
    _count = _count + 1;
    // Set the state to true.
    state = true;
  }

  void _dismiss() {
    _count = _count - 1;
    // [_count]が0になったら、ローディングインジケーターを非表示にします
    if (_count == 0) {
      state = false;
    }
  }
}
