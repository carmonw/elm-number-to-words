module NumberToWords exposing (intToWords)

{-| This package converts numbers to its written form.


# Int to String

@docs intToWords

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
intToWords n =
    Util.spellInteger n
