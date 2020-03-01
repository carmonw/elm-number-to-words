module NumberToWords exposing
    ( intToWords
    , roundToWords, floorToWords, ceilingToWords
    )

{-| This package converts numbers to its written form.


# Int to String

@docs intToWords


# Float to String

@docs roundToWords, floorToWords, ceilingToWords

-}

import Util


{-| Convert an `Int` to its written form.

    import NumberToWords

    NumberToWords.intToWords 1255
    --> "one thousand, two hundred fifty-five"

    NumberToWords.intToWords 1232551
    --> "one million, two hundred thirty-two thousand, five hundred fifty-one"

-}
intToWords : Int -> String
intToWords =
    Util.spellInteger


{-| Convert a `Float` to its written form after rounding it to the nearest integer.

    import NumberToWords

    NumberToWords.roundToWords 1255.20
    --> "one thousand, two hundred fifty-five"

    NumberToWords.roundToWords 1232551.50
    --> "one million, two hundred thirty-two thousand, five hundred fifty-two"

-}
roundToWords : Float -> String
roundToWords =
    Util.spellInteger << round


{-| Convert a `Float` to its written form after rounding it down.

    import NumberToWords

    NumberToWords.floorToWords 1255.20
    --> "one thousand, two hundred fifty-five"

    NumberToWords.floorToWords 1232551.20
    --> "one million, two hundred thirty-two thousand, five hundred fifty-one"

-}
floorToWords : Float -> String
floorToWords =
    Util.spellInteger << floor


{-| Convert a `Float` to its written form after rounding it up.

    import NumberToWords

    NumberToWords.ceilingToWords 1255.20
    --> "one thousand, two hundred fifty-six"

    NumberToWords.ceilingToWords 1232551.20
    --> "one million, two hundred thirty-two thousand, five hundred fifty-two"

-}
ceilingToWords : Float -> String
ceilingToWords =
    Util.spellInteger << ceiling
