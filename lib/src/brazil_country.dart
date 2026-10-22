import 'package:plate_core/plate_core.dart';

import 'brazil_colors.dart';

/// The panel is the flag in a thin white outline at the band's right end;
/// `BRASIL` is a label on the spec, so there is no caption.
///
/// The flag is an SVG asset because a `PlateSection` cannot draw its rhombus
/// and starred globe.
abstract final class BrazilCountry {
  static const PlateCountry brazil = PlateCountry(
    code: 'br',
    captionLines: <String>[],
    panelColor: BrazilColors.bandInk,
    panelTextColor: BrazilColors.band,
    flagAspectRatio: 10 / 7,
    flag: SvgPlateAsset('assets/flags/Flag_of_Brazil.svg', package: 'brazil_plate'),
  );
}
