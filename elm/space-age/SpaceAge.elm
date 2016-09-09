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
            ageSec / (orbitEarthFraction.mercury * earthOrbitSec)

        Venus ->
            ageSec / (orbitEarthFraction.venus * earthOrbitSec)

        Earth ->
            ageSec / (orbitEarthFraction.earth * earthOrbitSec)

        Mars ->
            ageSec / (orbitEarthFraction.mars * earthOrbitSec)

        Jupiter ->
            ageSec / (orbitEarthFraction.jupiter * earthOrbitSec)

        Saturn ->
            ageSec / (orbitEarthFraction.saturn * earthOrbitSec)

        Uranus ->
            ageSec / (orbitEarthFraction.uranus * earthOrbitSec)

        Neptune ->
            ageSec / (orbitEarthFraction.neptune * earthOrbitSec)


earthOrbitSec : Float
earthOrbitSec =
    3.15576e7


orbitEarthFraction :
    { earth : Float
    , jupiter : Float
    , mars : Float
    , mercury : Float
    , neptune : Float
    , saturn : Float
    , uranus : Float
    , venus : Float
    }
orbitEarthFraction =
    { earth = 1.0
    , mercury = 0.2408467
    , venus = 0.61519726
    , mars = 1.8808158
    , jupiter = 11.862615
    , saturn = 29.447498
    , uranus = 84.016846
    , neptune = 164.79132
    }
