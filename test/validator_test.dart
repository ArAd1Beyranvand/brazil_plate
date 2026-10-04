import 'package:brazil_plate/brazil_plate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plate_core/plate_core.dart';

void main() {
  PlateValidation judge(String value) => const BrazilPlateValidator().validate(
    PlateEntry(spec: BrazilPlates.mercosul, values: value.split('')),
  );

  test('accepts LLL N L NN', () {
    expect(judge('BRA2E19').isValid, isTrue);
  });

  test('rejects a legacy-shaped number', () {
    expect(judge('ABC1234').isValid, isFalse);
  });

  test('converts a legacy plate', () {
    expect(BrazilPlateValidator.fromLegacy('ABC1234'), 'ABC1C34');
    expect(BrazilPlateValidator.fromLegacy('ABC1034'), 'ABC1A34');
    expect(BrazilPlateValidator.fromLegacy('ABC1D23'), isNull);
  });

  test('looks up the issuing state', () {
    expect(BrazilSeries.stateOf('AAA0A00'), BrazilState.pr);
    expect(BrazilSeries.stateOf('BEZ9Z99'), BrazilState.pr);
    expect(BrazilSeries.stateOf('BFA0A00'), BrazilState.sp);
    expect(BrazilSeries.stateOf('SAV0A01'), BrazilState.sp);
    expect(BrazilSeries.stateOf('SAV1A01'), BrazilState.ce);
    expect(BrazilSeries.stateOf('short'), isNull);
  });

  test('every spec is valid', () {
    for (final spec in BrazilPlates.all) {
      expect(debugValidateSpec(spec), isTrue);
    }
  });
}
