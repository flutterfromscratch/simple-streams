import 'dart:async';

// how to use yield* to merge a stream into an existing stream

Future<void> main(List<String> arguments) async {
  await for (final result in simpleEmitter([1, 3, 4, 5])) {
    print(result);
  }
}

Stream<String> simpleEmitter(List<int> numbersToPrint) async* {
  for (final number in numbersToPrint) {
    await Future.delayed(Duration(seconds: 1));
    if (number == 2) throw Exception("I don't like the number 2");
    yield "This is result ${number}";
    await for (final string in simpleStringEmitter(['one', 'two'])) {
      yield "$number: $string"; // Yields into the original stream
    }
  }
  print('The stream completed :)');
}

Stream<String> simpleStringEmitter(List<String> stringsToPrint) async* {
  for (final string in stringsToPrint) {
    await Future.delayed(Duration(seconds: 1));
    yield string;
  }
}
