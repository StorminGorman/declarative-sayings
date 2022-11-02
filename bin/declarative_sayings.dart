import 'package:declarative_sayings/foreign.dart';
import 'package:declarative_sayings/saying.dart';
import 'package:declarative_sayings/sentence.dart';

void main(List<String> arguments) async {
  await simple();
  await sentence();
  await advanced();
}

class Voice {
  final Saying saying;

  Voice(this.saying);

  Future<void> speak() async {
    print(await saying.say());
  }
}

Future<void> simple() async {
  final voice = Voice(
    Word('Howdy')
  );
  await voice.speak();
}

Future<void> sentence() async {
  final voice = Voice(
    Sentence([
      Word('This'),
      Word('is'),
      Word('cool'),
    ], punctuation: const Period())
  );
  await voice.speak();
}

Future<void> advanced() async {
  final voice = Voice(
    Spanish(Sentence([
      Word('This'),
      Word('is'),
      Word('cool'),
    ], punctuation: const Period()))
  );
  await voice.speak();
}
