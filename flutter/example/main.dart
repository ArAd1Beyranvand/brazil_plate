import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:brazil_plate/brazil_plate.dart';

void main() => runApp(
  PlateExampleApp(spec: BrazilPlates.mercosul, theme: BrazilThemes.private),
);
