String? emailCheck(String? email) {
  if (email == null || email.isEmpty) {
    return "Email can't be empty";
  }
  final RegExp emailRegExp =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  if (!emailRegExp.hasMatch(email)) {
    return 'You email doesn\'t meet the requirements';
  } else if (email.length > 20) {
    return "The length of the email exceeds 30 characters";
  }

  return null;
}

String? passwordCheck(String? password) {
  if (password == null || password.isEmpty) {
    return "Password can't be empty";
  }
  final RegExp passwordRegExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  if (!passwordRegExp.hasMatch(password)) {
    return 'Пароль не подходить';
  }
  return null;
}

extension Truncate on String {
  String truncate({required int max, String suffix = ''}) {
    return length < max
        ? this
        : '${substring(0, substring(0, max - suffix.length).lastIndexOf(" "))}$suffix';
  }
}

String getFirstWordsFast(String sentence, String wordSeparator, int findCount) {
  if (findCount < 1) {
    return '';
  }

  Runes spaceRunes = Runes(wordSeparator);
  Runes sentenceRunes = Runes(sentence);
  String finalString = "";

  for (int letter in sentenceRunes) {
    if (letter == spaceRunes.single) {
      findCount -= 1;
      if (findCount < 1) {
        return finalString;
      }
    }
    finalString += String.fromCharCode(letter);
  }
  return finalString;
}
