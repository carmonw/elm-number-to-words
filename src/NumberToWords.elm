module NumberToWords exposing
    ( intToWords
    , floorToWords
    )

{-| This package converts numbers to its written form.


# Int to String

@docs intToWords


# Float to String

@docs floatToWords

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
