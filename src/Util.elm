module Util exposing (spellInteger)

import Array
import List.Extra


{-| Utility function for converting an integer to its written form.
<https://github.com/metaleap/rosetta-haskell-dump/blob/master/number-names.hs>
-}
spellInteger : Int -> String
spellInteger n =
    if n < 0 then
        "negative " ++ spellInteger (negate n)

    else if n < 20 then
        small n

    else if n < 100 then
        ( n // 10, modBy 10 n )
            |> (\( a, b ) -> tens a ++ nonzero '-' b)

    else if n < 1000 then
        ( n // 100, modBy 100 n )
            |> (\( a, b ) -> small a ++ " hundred" ++ nonzero ' ' b)

    else
        List.Extra.unfoldr uff n
            |> (\x -> List.Extra.zip (List.range 0 (List.length x - 1)) x)
            |> List.filter (Tuple.second >> (/=) 0)
            |> List.reverse
            |> List.map big
            |> intercalate ", "


nonzero : Char -> Int -> String
nonzero char n =
    case n of
        0 ->
            ""

        _ ->
            String.cons char (spellInteger n)


uff : Int -> Maybe ( Int, Int )
uff n =
    case n of
        0 ->
            Nothing

        _ ->
            Just ( modBy 1000 n, n // 1000 )


smallArray : Array.Array String
smallArray =
    [ "zero"
    , "one"
    , "two"
    , "three"
    , "four"
    , "five"
    , "six"
    , "seven"
    , "eight"
    , "nine"
    , "ten"
    , "eleven"
    , "twelve"
    , "thirteen"
    , "fourteen"
    , "fifteen"
    , "sixteen"
    , "seventeen"
    , "eighteen"
    , "nineteen"
    ]
        |> Array.fromList


small : Int -> String
small n =
    Array.get n smallArray
        |> Maybe.withDefault ""


tensArray : Array.Array String
tensArray =
    [ ""
    , ""
    , "twenty"
    , "thirty"
    , "forty"
    , "fifty"
    , "sixty"
    , "seventy"
    , "eighty"
    , "ninety"
    ]
        |> Array.fromList


tens : Int -> String
tens n =
    Array.get n tensArray
        |> Maybe.withDefault ""


bigArray : Array.Array String
bigArray =
    [ ""
    , ""
    , "million"
    , "billion"
    , "trillion"
    , "quadrillion"
    , "quintillion"
    , "sextillion"
    , "septillion"
    , "octillion"
    , "nonillion"
    , "decillion"
    ]
        |> Array.fromList


big : ( Int, Int ) -> String
big tuple =
    case tuple of
        ( 0, n ) ->
            spellInteger n

        ( 1, n ) ->
            spellInteger n ++ " thousand"

        ( e, n ) ->
            spellInteger n ++ " " ++ Maybe.withDefault "" (Array.get e bigArray)


intercalate : String -> List String -> String
intercalate seperator list =
    List.intersperse seperator list
        |> String.join ""
