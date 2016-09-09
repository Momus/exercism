module SpaceAge exposing (..)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


ageOn : Planet -> Float -> Float
ageOn planet ageSec =
    case planet of
        Mercury ->
            ageSec / (orbitPropotionToEarth.mercury * earthOrbitSec)

        Venus ->
            ageSec / (orbitPropotionToEarth.venus * earthOrbitSec)

        Earth ->
            ageSec / (orbitPropotionToEarth.earth * earthOrbitSec)

        Mars ->
            ageSec / (orbitPropotionToEarth.mars * earthOrbitSec)

        Jupiter ->
            ageSec / (orbitPropotionToEarth.jupiter * earthOrbitSec)

        Saturn ->
            ageSec / (orbitPropotionToEarth.saturn * earthOrbitSec)

        Uranus ->
            ageSec / (orbitPropotionToEarth.uranus * earthOrbitSec)

        Neptune ->
            ageSec / (orbitPropotionToEarth.neptune * earthOrbitSec)


earthOrbitSec : Float
earthOrbitSec =
    3.15576e7


type alias PlanetsStat =
    { earth : Float
    , jupiter : Float
    , mars : Float
    , mercury : Float
    , neptune : Float
    , saturn : Float
    , uranus : Float
    , venus : Float
    }

orbitPropotionToEarth : PlanetsStat
orbitPropotionToEarth =
    { earth = 1.0
    , mercury = 0.2408467
    , venus = 0.61519726
    , mars = 1.8808158
    , jupiter = 11.862615
    , saturn = 29.447498
    , uranus = 84.016846
    , neptune = 164.79132
    }
