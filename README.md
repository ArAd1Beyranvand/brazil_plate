FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the joyful people of Brazil to view examples:

https://platexample.ir/#/discover/brazil

# brazil_plate

Brazil's licence plates for the `plate_core` library. The Mercosul plate, `ABC1D23` under the blue BRASIL band, in its seven category colours. The 1901–2018 series are not implemented.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  brazil_plate: ^0.1.0
```

## Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:brazil_plate/brazil_plate.dart';

PlateCanvas(
  spec: BrazilPlates.mercosul,
  theme: BrazilThemes.private,
  validator: const BrazilPlateValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Contains

- `BrazilCountry` — country panel: `brazil`.
- `BrazilPlates` — 2 plate specs: `mercosul`, `mercosulNational`.
- `BrazilThemes` — 7 themes: `private`, `commercial`, `official`, `diplomatic`, `dealer`, `collector`, `collectorNational`.
- `BrazilPlateValidator` — advisory validator; flags the frame, never blocks a keystroke.
- 1 bundled asset (`Flag_of_Brazil.svg`).

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

