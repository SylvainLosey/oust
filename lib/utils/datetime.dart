String dateToStringFrench(DateTime date) {
  final List<String> months = <String> ['janvier', 'février', 'mars', 'avril', 'mai', 'juin', 'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre'];
  final List<String> days = <String> ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'];
  final String str = '${days[date.weekday-1]} ${date.day} ${months[date.month-1]}';
  return str;
}

String dateToString(DateTime date) {
  String str = date.toString();
  str = str.substring(0,10);
  return str;
}