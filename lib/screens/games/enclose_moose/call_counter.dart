import "package:flutter/foundation.dart";

class CallCounter<T, E> extends ChangeNotifier {
  final Map<T, int> _counter = {};
  final Map<T, E> _values = {};
  final Map<T, List<Future<void>>> _futures = {};

  @override
  void dispose() {
    removeAll();

    super.dispose();
  }

  int? getCount(T key) {
    return _counter[key];
  }

  E? getValue(T key) {
    return _values[key];
  }

  void increment(T key, E value, {Duration duration = const Duration(seconds: 4)}) {
    _counter[key] = (_counter[key] ?? 0) + 1;
    _values[key] = value;
    notifyListeners();

    final future = Future.delayed(duration, () {
      if (_counter[key] == 1) {
        _counter[key] = 0;
        notifyListeners();
      } else {
        _counter[key] = _counter[key]! - 1;
      }

      if (_futures[key]!.length != 0) {
        _futures[key]!.removeAt(0);
      }
    });
    if (!_futures.containsKey(key)) {
      _futures[key] = [];
    }
    _futures[key]!.add(future);
  }

  bool isNotEmpty(T key) {
    return exists(key) && _counter[key] != 0;
  }

  bool exists(T key) {
    return _counter[key] != null;
  }

  void remove(T key) {
    _counter.remove(key);
    _values.remove(key);
    notifyListeners();

    for (final Future future in _futures[key] ?? []) {
      future.ignore();
    }
    _futures[key]?.clear();
  }

  void removeAll() {
    for (final key in _futures.keys) {
      remove(key);
    }
  }
}

class RestrictedCallCounter<T, E> extends ChangeNotifier {
  RestrictedCallCounter({
    required this.callCounter,
    required this.key
  }) {
    callCounter.addListener(notifyListeners);
  }

  final CallCounter<T, E> callCounter;
  final T key;

  @override
  void dispose() {
    callCounter.removeListener(notifyListeners);

    super.dispose();
  }

  E? getValue() {
    return callCounter.getValue(key);
  }

  void increment(E value, {Duration duration = const Duration(seconds: 4)}) {
    callCounter.increment(key, value, duration: duration);
  }

  bool isNotEmpty() {
    return callCounter.isNotEmpty(key);
  }

  bool exists() {
    return callCounter.exists(key);
  }

  void remove() {
    callCounter.remove(key);
  }
}
