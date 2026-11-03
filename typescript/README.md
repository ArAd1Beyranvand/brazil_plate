FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the joyful people of Brazil to view examples:

https://platexample.ir/#/discover/brazil:typescript

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

### Install (TypeScript)

Copy `typescript/src/countries/brazil/` into `plate_core/typescript/src/countries/`.

Then run the tests from `plate_core/typescript/`: `npm test`.

### Use

```ts
import country from './countries/brazil';

const spec = country.specs.get('br.mercosul');
console.log(country.package);
```

## Specs

The specs are the same in every language (they come from shared data).

- `br.mercosul`
- `br.mercosul.national`

## Themes

- `BrazilThemes.private`
- `BrazilThemes.commercial`
- `BrazilThemes.official`
- `BrazilThemes.diplomatic`
- `BrazilThemes.dealer`
- `BrazilThemes.collector`
- `BrazilThemes.collectorNational`

## Change it

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`BrazilPlateValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/brazil_plate/blob/main/LICENSE).
