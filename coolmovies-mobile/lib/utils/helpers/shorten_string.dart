String shortenString(String text, int maxLength) {
  String short = text;

  if (text.length > maxLength) {
    String str = text.substring(0, maxLength);
    short = str + "...";
  }

  return short;
}
