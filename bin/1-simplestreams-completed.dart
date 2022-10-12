import 'dart:async';

// cover async* (asterix) (yield generator)
// cover that streams dont begin until you start listening to them
// cover that you can use .listen, but should use await for

Future<void> main(List<String> arguments) async {
  await for (final event in simpleEmitter()) {
    print(event);
  }
}

Stream<String> simpleEmitter() async* {
  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield "This is result ${i}";
  }
}
