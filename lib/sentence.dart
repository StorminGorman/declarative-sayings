import 'package:declarative_sayings/saying.dart';

class Sentence implements Saying {
  final List<Saying> sayings;
  final Saying punctuation;

  Sentence(this.sayings, {this.punctuation = const Blank()});

  @override
  Future<String> say() async {
    final parts = sayings.map((saying) => saying.say());
    final results = await Future.wait(parts);
    final punctuationValue = await punctuation.say();
    return '${results.join(' ')}$punctuationValue';
  }
}

class Period implements Saying {
  const Period();
  @override
  Future<String> say() async {
    return '.';
  }
}
