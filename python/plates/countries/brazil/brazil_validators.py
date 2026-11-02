"""Port of brazil_plate/lib/src/brazil_validators.dart."""
from __future__ import annotations

import re
from dataclasses import dataclass

from plates.core.validators.plate_validator import GatedPlateValidator, PlateEntry, PlateValidation


@dataclass(frozen=True)
class BrazilPlateValidator(GatedPlateValidator):
    gate_group = "number"

    reason_series = "The series is three letters."
    reason_number = "The number is a digit, a letter and two digits."

    _series = re.compile(r"^[A-Z]{3}$")
    _number = re.compile(r"^[0-9][A-Z][0-9]{2}$")
    _legacy = re.compile(r"^[A-Z]{3}[0-9]{4}$")

    def judge(self, entry: PlateEntry) -> PlateValidation:
        if not self._series.fullmatch(entry.group("series")):
            return PlateValidation.invalid(self.reason_series)
        if not self._number.fullmatch(entry.group("number")):
            return PlateValidation.invalid(self.reason_number)
        return PlateValidation.valid()

    @staticmethod
    def from_legacy(legacy: str) -> str | None:
        if not BrazilPlateValidator._legacy.fullmatch(legacy):
            return None
        letter = chr(ord("A") + ord(legacy[4]) - ord("0"))
        return f"{legacy[:4]}{letter}{legacy[5:]}"
