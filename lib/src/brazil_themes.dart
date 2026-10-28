import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'brazil_colors.dart';

/// The seven Mercosul categories: one ink on one field, framed in a lighter
/// print of the ink. Categories share one layout and differ only here (and in
/// `BrazilPlates.mercosulNational`).
///
/// The border is the solid edge (~4 mm, 0.03 of the height), not the ~6 mm rim
/// with its pale margin, which would bury `BR`.
abstract final class BrazilThemes {
  static const double _border = 0.03;
  static const double _radius = 0.06;

  static PlateTheme _livery({
    required Color ink,
    required Color frame,
    Color field = BrazilColors.white,
    Color inactive = BrazilColors.inactiveOnLight,
  }) => PlateTheme(
    plateBackground: field,
    plateBorder: frame,
    ink: ink,
    dividerColor: ink,
    borderWidthRatio: _border,
    plateRadiusRatio: _radius,
    activeColor: ink,
    inactiveColor: inactive,
  );

  /// Black on white: privately owned vehicles (*particular*).
  static final PlateTheme private = _livery(
    ink: BrazilColors.black,
    frame: BrazilColors.blackFrame,
  );

  /// Red on white: paid transport and driving schools (*aluguel*,
  /// *aprendizagem*).
  static final PlateTheme commercial = _livery(
    ink: BrazilColors.red,
    frame: BrazilColors.redFrame,
  );

  /// Blue on white: government vehicles (*oficial*).
  static final PlateTheme official = _livery(
    ink: BrazilColors.blue,
    frame: BrazilColors.blueFrame,
  );

  /// Gold on white: diplomatic vehicles (*diplomático*).
  static final PlateTheme diplomatic = _livery(
    ink: BrazilColors.gold,
    frame: BrazilColors.goldFrame,
  );

  /// Green on white: manufacturers' and dealers' test vehicles
  /// (*experiência*, *fabricante*).
  static final PlateTheme dealer = _livery(
    ink: BrazilColors.green,
    frame: BrazilColors.greenFrame,
  );

  /// Grey on white: collector vehicles free to cross borders (*coleção*).
  static final PlateTheme collector = _livery(
    ink: BrazilColors.grey,
    frame: BrazilColors.greyFrame,
  );

  /// White on black: collector vehicles restricted to Brazil. Pair it with
  /// `BrazilPlates.mercosulNational`, which drops the Mercosul logo.
  static final PlateTheme collectorNational = _livery(
    field: BrazilColors.black,
    ink: BrazilColors.nationalInk,
    frame: BrazilColors.nationalFrame,
    inactive: BrazilColors.inactiveOnDark,
  );
}
