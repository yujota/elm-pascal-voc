module PascalVoc.Internal.PascalVoc exposing (BoundingBox, Object, PascalVoc(..), PascalVocRecord, Size, Source)


type PascalVoc
    = PascalVoc PascalVocRecord


type alias PascalVocRecord =
    { size : Size
    , objects : List Object
    , source : Maybe Source
    , filename : Maybe String
    , folder : Maybe String
    , segmented : Maybe Int
    }


type alias Source =
    { database : Maybe String
    , annotation : Maybe String
    , image : Maybe String
    , flickrid : Maybe String
    }


type alias Size =
    { width : Int, height : Int, depth : Int }


type alias Object =
    { name : String
    , bndbox : BoundingBox
    , pose : Maybe String
    , truncated : Maybe Int
    , difficult : Maybe Int
    }


type alias BoundingBox =
    { xmin : Float, ymin : Float, xmax : Float, ymax : Float }
