// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
class PersianNumericConvertor {
  static const List<String> _units = [
    '',
    'هزار',
    'میلیون',
    'میلیارد',
    'تریلیون'
  ];

  static String _convertToPersianCurrency(num number) {
    if (number < 0) {
      throw ArgumentError('Number must be non-negative');
    }

    final rialPart = number % 10;
    final tomanPart = number ~/ 10;
    final tomanString = tomanPart.toString();
    final groups = <String>[];

    for (int i = tomanString.length; i > 0; i -= 3) {
      final start = (i - 3) < 0 ? 0 : (i - 3);
      final group = tomanString.substring(start, i);
      groups.add(group);
    }

    final parts = <String>[];

    for (int i = 0; i < groups.length; i++) {
      final group = int.parse(groups[i]);
      if (group != 0) {
        parts.add('$group ${_units[i]}');
      }
    }

    final tomanResult = '${parts.reversed.join(' و ')} تومان';
    final rialResult = rialPart > 0 ? ' و $rialPart ریال' : '';

    return tomanResult + rialResult;
  }

  static String convertStringRialToTomanCurrency(String number) {
    final convertedNumber = num.parse(number);
    return _convertToPersianCurrency(convertedNumber);
  }

  static String convertRialToTomanCurrency(num number) {
    return _convertToPersianCurrency(number);
  }
}
