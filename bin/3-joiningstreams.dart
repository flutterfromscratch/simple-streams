import 'dart:async';

Future<void> main(List<String> arguments) async {
  try {
    await for (final event in simpleEmitter([1, 2, 3, 4, 5])) {
      print('Main: $event');
    }
  } on Exception catch (ex) {
    print('exception caught!');
    await for (final event in simpleEmitter([1, 3, 4, 5])) {
      print('RETRY: $event');
    }
  }
}

Stream<String> simpleEmitter(List<int> numbersToPrint) async* {
  for (final number in numbersToPrint) {
    await Future.delayed(Duration(seconds: 1));
    if (number == 2) throw Exception("I don't like the number 4");
    yield* simpleStringEmitter(['one', 'two']);
    // await for (final string in simpleStringEmitter(['one', 'two'])) {
    //   yield "simpleEmitter: $string";
    // }
  }
  print('The stream completed :)');
}

Stream<String> simpleStringEmitter(List<String> stringsToPrint) async* {
  for (final string in stringsToPrint) {
    await Future.delayed(Duration(seconds: 1));
    yield "simpleStringEmitter: $string";
  }
}
