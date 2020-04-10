module PascalVoc exposing (PascalVoc)

import PascalVoc.Internal.PascalVoc as P


type alias PascalVoc =
    P.PascalVoc


pascalVoc : { size : P.Size, objects : List P.Object } -> PascalVoc
pascalVoc r =
    P.PascalVoc
        { size = r.size
        , objects = []
        , source = Nothing
        , filename = Nothing
        , folder = Nothing
        , segmented = Nothing
        }
