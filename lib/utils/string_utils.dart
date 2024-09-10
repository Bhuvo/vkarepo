String printDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}
String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
String pluralize(String s) {
  if (s.endsWith('es'))
    return s;
  if (s.endsWith('s'))
    return s + 'es';
  if (s.endsWith('ey'))
    return s + 's';
  if (s.endsWith('y'))
    return s.substring(0, s.length - 1) + 'ies';
  return s + 's';
}