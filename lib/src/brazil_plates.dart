import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'brazil_alphabets.dart';
import 'brazil_colors.dart';
import 'brazil_country.dart';

/// Where the ink sits on a Mercosul plate, in millimetres.
///
/// Measured off `Placas_Mercosul_2022.jpg` by normalising each plate
/// rectangle to 400×130. The artwork is drawn at 3.16 against the documented
/// 3.08, so x positions carry ~2%.
///
/// * Band: y 0..35.3, `0736A2`, edge to edge — a background row, not a box.
/// * `BRASIL`: white ink x 169.7..236.8, y 17.4..30.8 (centre 203.3, 24.1),
///   letter-spaced: B 169.7, R 182.8, A 195.4, S 210.1, I 221.6, L 229.7.
/// * Flag: green x 362.9..388.5, y 12.9..31.4 inside a ~1.1 mm white outline
///   — the panel, white, padded by the outline.
/// * Mercosul logo: `MERCOSUL` ink x 19.6..49.7, y 28.6..33.1; four stars
///   ~1.5 mm at (32.7, 12.3), (36.6, 14.0), (29.7, 15.4), (34.1, 21.7).
/// * Serial: seven cells, centres 59.5..344.4, pitch 47.5; ink y 47.6..113.2
///   (65.6 tall, centre 80.4), each glyph ~33 mm wide.
/// * `BR`: ink x 8.7..30.0, y 102.0..119.9 (centre 19.4, 111.0).
///
/// Rendered with DejaVu Bold and measured the same way: `BRASIL` x
/// 169.2..238.5, y 17.6..30.6 — DejaVu's natural width matches the printed
/// letter-spacing, so it is set unspaced. `MERCOSUL` x 17.7..51.5; stars
/// x 29.2..36.9, y 11.5..21.4; flag x 362.3..389.2, y 12.2..32.1.
///
/// **Under-height serial and `BR`, accepted.** The plate face is a condensed
/// 33 mm wide, 66 mm tall glyph. A slot scales its glyph down to fit its
/// cell, and DejaVu Bold is wider, so the serial is width-limited: ink
/// y 58.5..103.9, 69% of the reference height, centred within 1 mm. `BR` is
/// boxed to its measured width and comes out ~78% tall.
///
/// **Not drawn.** The QR code (x 10..41, y 37..66, unique per plate), the
/// logo's arc under the stars, and the holographic watermark.
abstract final class _Layout {
  static const double width = 400;
  static const double height = 130;
  static const double band = 35.3;

  static const PlateBox brasil = PlateBox(163.3, 13.1, 80, 22);
  static const double brasilGlyph = 24.4;

  /// 25.6×18.5 of flag (10:7) in 1.1 mm of white.
  static const PlateBox flag = PlateBox(361.8, 11.8, 27.8, 20.7);
  static const double flagOutline = 1.1;

  static const PlateBox mercosul = PlateBox(14.7, 27.9, 40, 6);
  static const double mercosulGlyph = 7.4;
  static const List<(double, double)> stars = <(double, double)>[
    (32.7, 12.3),
    (36.6, 14.0),
    (29.7, 15.4),
    (34.1, 21.7),
  ];
  static const double star = 4;
  static const double starGlyph = 4;

  static const double pitch = 47.5;
  static const double serialLeft = 59.5 - pitch / 2;
  static const double serialTop = 39.9;
  static const double serialHeight = 83.4;

  static const PlateBox code = PlateBox(6.5, 99.3, 21.3, 22);
  static const double codeGlyph = 27.3;
}

abstract final class BrazilPlates {
  /// The Mercosul plate, `ABC1D23`, for every category but the national
  /// collector one; the category is the theme. `BR` stays black whatever the
  /// ink. Slots: the three series letters, then digit, letter, digit, digit.
  static final PlateSpec mercosul = _mercosul(
    id: 'br.mercosul',
    logo: true,
    codeInk: BrazilColors.black,
  );

  /// The collector plate restricted to Brazil: white on black, and no
  /// Mercosul logo since it may not cross the border. Pair with
  /// `BrazilThemes.collectorNational`.
  static final PlateSpec mercosulNational = _mercosul(id: 'br.mercosul.national', logo: false);

  static final List<PlateSpec> all = <PlateSpec>[mercosul, mercosulNational];

  static PlateSpec _mercosul({required String id, required bool logo, Color? codeInk}) => PlateSpec(
    id: id,
    country: BrazilCountry.brazil,
    canvasWidth: _Layout.width,
    canvasHeight: _Layout.height,
    panel: const PlatePanel(box: _Layout.flag, padding: EdgeInsets.all(_Layout.flagOutline)),
    background: const PlateSection.rows(<PlatePart>[
      PlatePart(PlateSection.fill(PlateFill.color(BrazilColors.band)), end: _Layout.band),
      PlatePart(PlateSection.plain),
    ]),
    labels: <PlateLabel>[
      const PlateLabel(
        text: 'BRASIL',
        box: _Layout.brasil,
        glyphHeight: _Layout.brasilGlyph,
        color: BrazilColors.bandInk,
      ),
      if (logo) ...<PlateLabel>[
        const PlateLabel(
          text: 'MERCOSUL',
          box: _Layout.mercosul,
          glyphHeight: _Layout.mercosulGlyph,
          color: BrazilColors.bandInk,
        ),
        for (final (double x, double y) in _Layout.stars)
          PlateLabel(
            text: '✦',
            box: PlateBox(x - _Layout.star / 2, y - _Layout.star / 2, _Layout.star, _Layout.star),
            glyphHeight: _Layout.starGlyph,
            color: BrazilColors.bandInk,
          ),
      ],
      PlateLabel(text: 'BR', box: _Layout.code, glyphHeight: _Layout.codeGlyph, color: codeInk),
    ],
    slots: <PlateSlot>[
      for (final (int i, PlateAlphabet a) in const <PlateAlphabet>[
        BrazilAlphabets.letters,
        BrazilAlphabets.letters,
        BrazilAlphabets.letters,
        BrazilAlphabets.digits,
        BrazilAlphabets.letters,
        BrazilAlphabets.digits,
        BrazilAlphabets.digits,
      ].indexed)
        PlateSlot(
          alphabet: a,
          box: PlateBox(
            _Layout.serialLeft + i * _Layout.pitch,
            _Layout.serialTop,
            _Layout.pitch,
            _Layout.serialHeight,
          ),
        ),
    ],
    textGroups: const <PlateTextGroup>[
      PlateTextGroup(<int>[0, 1, 2], key: 'series'),
      PlateTextGroup(<int>[3, 4, 5, 6], key: 'number'),
    ],
  );
}
