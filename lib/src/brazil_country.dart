import 'package:plate_core/plate_core.dart';

import 'brazil_colors.dart';

/// Brazil as a `PlateCountry`. The panel is the flag in its thin white
/// outline at the band's right end; there is no caption — `BRASIL` is a label
/// on the spec, centred on the band.
///
/// The flag is the SVG asset rather than painted sections: its rhombus and
/// starred globe are not something a `PlateSection` can draw.
abstract final class BrazilCountry {
  static const PlateCountry brazil = PlateCountry(
    code: 'br',
    captionLines: <String>[],
    panelColor: BrazilColors.bandInk,
    panelTextColor: BrazilColors.band,
    flagAspectRatio: 10 / 7,
    flag: SvgPlateAsset(
      'assets/flags/Flag_of_Brazil.svg',
      package: 'brazil_plate',
    ),
  );
}
