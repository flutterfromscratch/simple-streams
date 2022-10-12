import 'dart:async';

Future<void> main(List<String> arguments) async {
  await for (final result in simpleEmitter()) {
    print(result);
  }
}

Stream<String> simpleEmitter() async* {
  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield "This is result ${i}";
  }
}
