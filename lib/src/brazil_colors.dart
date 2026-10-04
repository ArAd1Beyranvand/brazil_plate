import 'package:flutter/widgets.dart';

/// The colours of Brazil's Mercosul plates.
///
/// Every value is sampled from the article's category artwork,
/// `Placas_Mercosul_2022.jpg` — seven plates, one per colour scheme, drawn
/// flat. Inks are the modal colour of the serial's ink pixels (the
/// holographic `MERCOSUL BRASIL` watermark lightens a median); frames are the
/// median of the left rim, which is printed in a lighter, textured version of
/// the ink. The photograph `Brazilian_vehicle_license_plate_(2018-).jpg`
/// agrees on the layout but is lit: its band samples `0C3CC0` and its field a
/// grey `BCC0BC`, so it is not used for colour.
abstract final class BrazilColors {
  /// The band across the top, `0736A2`, the same on every category.
  static const Color band = Color(0xFF0736A2);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF040404);

  /// `BRASIL`, the logo and the flag's outline on the band.
  static const Color bandInk = Color(0xFFFCFCFC);

  /// Paid transport and driving schools. A dark red, not the article's
  /// bright "red".
  static const Color red = Color(0xFF8C0404);
  static const Color redFrame = Color(0xFF793E40);

  /// Official use.
  static const Color blue = Color(0xFF04348C);
  static const Color blueFrame = Color(0xFF3E4B70);

  /// Diplomatic use. The article says "gold"; the pixels are a yellow.
  static const Color gold = Color(0xFFF4CC14);
  static const Color goldFrame = Color(0xFFD5B959);

  /// Manufacturers and dealers.
  static const Color green = Color(0xFF045C04);
  static const Color greenFrame = Color(0xFF3E6741);

  /// Collector vehicles with unrestricted circulation.
  static const Color grey = Color(0xFF646464);
  static const Color greyFrame = Color(0xFF898689);

  /// Private vehicles' frame; their ink is [black].
  static const Color blackFrame = Color(0xFF363738);

  /// Collector vehicles restricted to Brazil: white ink on a black field.
  static const Color nationalInk = Color(0xFFFCFCFC);
  static const Color nationalFrame = Color(0xFFCFCFCD);

  static const Color inactiveOnLight = Color(0xFFB0B0B0);
  static const Color inactiveOnDark = Color(0x80FFFFFF);
}
