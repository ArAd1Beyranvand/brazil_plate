import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:brazil_plate/brazil_plate.dart';
import 'package:plate_core/plate_core.dart';

/// One golden per design, rendered with a real bold face so the ink can be
/// measured against the article's photographs.
void main() {
  setUpAll(() async {
    final loader = FontLoader('Roboto');
    final file = File('/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf');
    if (file.existsSync()) {
      loader.addFont(file.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
  });

  List<String?> v(String s) => s.split('').toList();

  final cases = <(String, PlateSpec, PlateTheme, String)>[
    ('private', BrazilPlates.mercosul, BrazilThemes.private, 'BRA2E19'),
    ('commercial', BrazilPlates.mercosul, BrazilThemes.commercial, 'RIO2A18'),
    ('official', BrazilPlates.mercosul, BrazilThemes.official, 'OFC1B23'),
    ('diplomatic', BrazilPlates.mercosul, BrazilThemes.diplomatic, 'CDA0E12'),
    ('dealer', BrazilPlates.mercosul, BrazilThemes.dealer, 'EXP4F56'),
    ('collector', BrazilPlates.mercosul, BrazilThemes.collector, 'COL1A23'),
    (
      'collector_national',
      BrazilPlates.mercosulNational,
      BrazilThemes.collectorNational,
      'COL2B34',
    ),
  ];

  test('every spec has a golden', () {
    expect(cases.map((c) => c.$2).toSet(), BrazilPlates.all.toSet());
  });

  for (final (name, spec, theme, values) in cases) {
    testWidgets(name, (tester) async {
      final controller = PlateController.fromValues(spec, v(values));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 520,
                height: 520 * spec.canvasHeight / spec.canvasWidth,
                child: PlateView(
                  controller: controller,
                  theme: theme,
                  country: BrazilCountry.brazil,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(find.byType(PlateView), matchesGoldenFile('goldens/$name.png'));
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
