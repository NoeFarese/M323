from dataclasses import dataclass
from typing import Union

# Ein Flusskommt entweder aus:
# - einer Quelle (Creek)
# - einem Hauptfluss und einem Nebenfluss (Confluence)

# Ein Bach hat folgende Eigenschaften:
# - Ursprungsort
@dataclass(frozen=True)
class Creek:
    origin: str

# Ein Zusammentreffen von zwei Flüssen hat folgende Eigenschaften:
# - Ort des Zusammentreffens
# - Hauptfluss <-- Selbstbezug
# - Nebenfluss <-- Selbstbezug
@dataclass(frozen=True)
class Confluence:
    origin: str
    main_stem: 'River'
    tributary: 'River'

# Ein Fluss ist eins der Folgenden:
# - ein Bach aus einer Quelle
# - ein Zusammentreffen aus einem Hauptfluss und einem Nebenfluss
River = Union[Creek, Confluence]

# Beispiele
eschach = Creek("Heimliswald")
prim = Creek("Dreifaltigkeitsberg")
neckar_1 = Confluence("Rottweil", eschach, prim)
schlichem = Creek("tieringen")
neckar_2 = Confluence("Epfendorf", neckar_1, schlichem)

# Fliesst der Fluss durch einern bestimmten Ort?
def flows_through(river: River, town: str) -> bool:
    match river:
        case Creek(origin=origin):
            return origin == town
        case Confluence(origin=origin, main_stem=main_stem, tributary=tributary):
            return (origin == town or
                    flows_through(main_stem, town) or
                    flows_through(tributary, town))

# Testfälle
assert flows_through(eschach, "Heimliswald") == True
assert flows_through(eschach, "Zürich") == False
assert flows_through(neckar_2, "Heimliswald") == True
assert flows_through(neckar_2, "Rottweil") == True
assert flows_through(neckar_2, "Luzern") == False

