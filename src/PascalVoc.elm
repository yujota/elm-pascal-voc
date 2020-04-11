module PascalVoc exposing
    ( Object
    , PascalVoc
    , PascalVocSource
    , Size
    , filename
    , folder
    , objects
    , pascalVoc
    , path
    , segmented
    , setFilename
    , setFolder
    , setObjects
    , setPath
    , setSegmented
    , setSize
    , setSource
    , size
    , source
    )

import PascalVoc.Internal.PascalVoc as P


type alias PascalVoc =
    P.PascalVoc


type alias PascalVocSource =
    P.PascalVocSource


type alias Size =
    { width : Int, height : Int, depth : Int }


type alias Object =
    { name : String
    , bndbox :
        { xmin : Float, ymin : Float, xmax : Float, ymax : Float }
    , pose : Maybe String
    , truncated : Maybe Int
    , difficult : Maybe Int
    }


pascalVoc : { size : P.Size, objects : List P.Object } -> PascalVoc
pascalVoc r =
    P.PascalVoc
        { size = r.size
        , objects = []
        , source = Nothing
        , filename = Nothing
        , folder = Nothing
        , segmented = Nothing
        , path = Nothing
        }


size : PascalVoc -> Size
size (P.PascalVoc r) =
    r.size


setSize : Size -> PascalVoc -> PascalVoc
setSize s (P.PascalVoc r) =
    P.PascalVoc { r | size = s }


objects : PascalVoc -> List Object
objects (P.PascalVoc r) =
    r.objects


setObjects : List Object -> PascalVoc -> PascalVoc
setObjects o (P.PascalVoc r) =
    P.PascalVoc { r | objects = o }


filename : PascalVoc -> Maybe String
filename (P.PascalVoc r) =
    r.filename


setFilename : Maybe String -> PascalVoc -> PascalVoc
setFilename m (P.PascalVoc r) =
    P.PascalVoc { r | filename = m }


folder : PascalVoc -> Maybe String
folder (P.PascalVoc r) =
    r.folder


setFolder : Maybe String -> PascalVoc -> PascalVoc
setFolder m (P.PascalVoc r) =
    P.PascalVoc { r | folder = m }


path : PascalVoc -> Maybe String
path (P.PascalVoc r) =
    r.path


setPath : Maybe String -> PascalVoc -> PascalVoc
setPath m (P.PascalVoc r) =
    P.PascalVoc { r | path = m }


segmented : PascalVoc -> Maybe Int
segmented (P.PascalVoc r) =
    r.segmented


setSegmented : Maybe Int -> PascalVoc -> PascalVoc
setSegmented m (P.PascalVoc r) =
    P.PascalVoc { r | segmented = m }


source : PascalVoc -> Maybe PascalVocSource
source (P.PascalVoc r) =
    Maybe.map P.PascalVocSource r.source


setSource : Maybe PascalVocSource -> PascalVoc -> PascalVoc
setSource m (P.PascalVoc r) =
    P.PascalVoc { r | source = Maybe.map (\(P.PascalVocSource s) -> s) m }
