import 'dart:convert';

String corrigirBytes(List<int> bytes) {
  return utf8.decode(latin1.decode(bytes).codeUnits);
}
