class BoringCryptography {
  static String encrypt(String input) {
    return input.split('').map((char) {
      int code = char.codeUnitAt(0);

      if (code >= 97 && code <= 122) {
        return String.fromCharCode(((code - 84) % 26) + 97);
      }

      return char;
    }).join();
  }
}