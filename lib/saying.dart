abstract class Saying {
  Future<String> say();
}

class Blank implements Saying {
  const Blank();

  @override
  Future<String> say() async {
    return "";
  }
}

class Word implements Saying {
  final String word;

  Word(this.word);

  @override
  Future<String> say() async {
    return word;
  }
}
