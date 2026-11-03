FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the joyful people of Brazil to view examples:

https://platexample.ir/#/discover/brazil:flutter

# brazil_plate

Brazil's licence plates for the plate_core library — the Mercosul plate in its seven category colours.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/brazil_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/brazil:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/brazil_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/brazil:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/brazil_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/brazil:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/brazil_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/brazil:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  brazil_plate: ^0.1.0
```

### Use

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

## Specs

Each spec is one plate layout.

- `BrazilPlates.mercosul` — id `br.mercosul`
- `BrazilPlates.mercosulNational` — id `br.mercosul.national`

## Themes

- `BrazilThemes.private`
- `BrazilThemes.commercial`
- `BrazilThemes.official`
- `BrazilThemes.diplomatic`
- `BrazilThemes.dealer`
- `BrazilThemes.collector`
- `BrazilThemes.collectorNational`

## Change it

`PlateCanvas` takes `spec:` (an entry of `BrazilPlates`) and `theme:` (an entry of `BrazilThemes`). Set `validator:` to `BrazilPlateValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `BrazilCountry` — the country panel.
- `BrazilPlateValidator` — the plate validator.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/brazil_plate/blob/main/LICENSE).
