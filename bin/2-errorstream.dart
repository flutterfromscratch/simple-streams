import 'dart:async';

Future<void> main(List<String> arguments) async {
  try {
    await for (final event in simpleEmitter([1, 2, 3, 4, 5])) {
      print(event);
    }
  } on Exception catch (ex) {
    print('Exception caught!');
    await for (final event in simpleEmitter([1, 3, 4, 5])) {
      print('RETRY: $event');
    }
  }
}

Stream<String> simpleEmitter(List<int> numbersToPrint) async* {
  for (final number in numbersToPrint) {
    await Future.delayed(Duration(seconds: 1));
    if (number == 2) throw Exception("I don't like the number 2");
    yield "This is result $number";
  }
}
