import 'package:persian_numeric_convertor/persian_numeric_convertor.dart';

void main() {

  final value = PersianNumericConvertor.convertRialToTomanCurrency(9849844894);
  print('value: $value');


  final stringValue = PersianNumericConvertor.convertStringRialToTomanCurrency("9849844894");
  print('value: $stringValue');
}
