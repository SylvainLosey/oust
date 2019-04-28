
String emailValidator(String value) {
  // This is just a regular expression for email addresses
  final String p = '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+';
  final RegExp regExp = RegExp(p);

  if (regExp.hasMatch(value)) {
    // So, the email is valid
    return null;
  }

  // The pattern of the email didn't match the regex above.
  return 'Cette adresse email n\'est pas valide';
}

String phoneValidator(String value) {
  //Trim everythin but numbers, and letters
  final String trimmed = value.replaceAll(RegExp(r'[^0-9a-zA-Z]'), '');

  if (isNumeric(trimmed) && trimmed.length >= 9 && trimmed.length <=14) {
    return null;
  }

  return 'Ce numéro de téléphone n\'est pas valide';
}


bool isNumeric(String string) => num.tryParse(string) != null;
