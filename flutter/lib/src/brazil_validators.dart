import 'package:plate_core/plate_core.dart';

/// Judges a `BrazilPlates` value, `LLL N L NN`. Reports, never bars a
/// keystroke; series allocation is not checked (see `BrazilSeries.stateOf`).
class BrazilPlateValidator extends RuledPlateValidator {
  const BrazilPlateValidator();

  static const String reasonSeries = 'The series is three letters.';
  static const String reasonNumber =
      'The number is a digit, a letter and two digits.';

  static final RegExp _legacy = RegExp(r'^[A-Z]{3}[0-9]{4}$');

  @override
  List<PlateCheck> get checks => const <PlateCheck>[
    PlateCheck('series', r'[A-Z]{3}', reasonSeries),
    PlateCheck('number', r'[0-9][A-Z][0-9]{2}', reasonNumber),
  ];

  /// The Mercosul form of a 1990–2018 plate, `ABC1234` → `ABC1C34`: the
  /// second digit becomes a letter, 0 → A through 9 → J. Null if [legacy] is
  /// not three letters and four digits.
  static String? fromLegacy(String legacy) {
    if (!_legacy.hasMatch(legacy)) return null;
    final String letter = String.fromCharCode(
      'A'.codeUnitAt(0) + legacy.codeUnitAt(4) - '0'.codeUnitAt(0),
    );
    return '${legacy.substring(0, 4)}$letter${legacy.substring(5)}';
  }
}
