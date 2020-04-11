module PascalVoc exposing
    ( PascalVoc, PascalVocSource, Size, Object
    , pascalVoc
    , size, setSize, objects, setObjects, filename, setFilename, folder, setFolder, path, setPath, segmented, setSegmented, source, setSource
    )

{-| This module provides types related to PascalVoc XML format and getters and setters.


# Types

@docs PascalVoc, PascalVocSource, Size, Object


# Constructor

@docs pascalVoc


# Getters & Setters

@docs size, setSize, objects, setObjects, filename, setFilename, folder, setFolder, path, setPath, segmented, setSegmented, source, setSource

-}

import PascalVoc.Internal.PascalVoc as P


{-| Represents Pascal VOC format data.
-}
type alias PascalVoc =
    P.PascalVoc


{-| Represents image source. Corresponding to `<annotation><source>`.

`PascalVoc.Settings` is providing several setters and getters for it.

-}
type alias PascalVocSource =
    P.PascalVocSource


{-| Represents image size. Corresponding to `<annotation><size>`.
-}
type alias Size =
    { width : Int, height : Int, depth : Int }


{-| Represents an annotation object. Corresponding to `<annotation><object>`.
-}
type alias Object =
    { name : String
    , bndbox :
        { xmin : Float, ymin : Float, xmax : Float, ymax : Float }
    , pose : Maybe String
    , truncated : Maybe Int
    , difficult : Maybe Int
    }


{-| Constructor.
-}
pascalVoc : { filename : String, size : P.Size, objects : List P.Object } -> PascalVoc
pascalVoc r =
    P.PascalVoc
        { size = r.size
        , objects = []
        , source = Nothing
        , filename = r.filename
        , folder = Nothing
        , segmented = Nothing
        , path = Nothing
        }


{-| Getter for image size.
-}
size : PascalVoc -> Size
size (P.PascalVoc r) =
    r.size


{-| Setter for image size.
-}
setSize : Size -> PascalVoc -> PascalVoc
setSize s (P.PascalVoc r) =
    P.PascalVoc { r | size = s }


{-| Getter for annotation objects.
-}
objects : PascalVoc -> List Object
objects (P.PascalVoc r) =
    r.objects


{-| Setter for annotation objects.
-}
setObjects : List Object -> PascalVoc -> PascalVoc
setObjects o (P.PascalVoc r) =
    P.PascalVoc { r | objects = o }


{-| Getter for filename. Corresponding to `<annotation><filename>`.
-}
filename : PascalVoc -> String
filename (P.PascalVoc r) =
    r.filename


{-| Setter for filename. Corresponding to `<annotation><filename>`.
-}
setFilename : String -> PascalVoc -> PascalVoc
setFilename m (P.PascalVoc r) =
    P.PascalVoc { r | filename = m }


{-| Getter for folder. This field is optional. Corresponding to `<annotation><folder>`.
-}
folder : PascalVoc -> Maybe String
folder (P.PascalVoc r) =
    r.folder


{-| Setter for folder. This field is optional. Corresponding to `<annotation><folder>`.
-}
setFolder : Maybe String -> PascalVoc -> PascalVoc
setFolder m (P.PascalVoc r) =
    P.PascalVoc { r | folder = m }


{-| Getter for file path. This field is optional. Corresponding to `<annotation><path>`.
-}
path : PascalVoc -> Maybe String
path (P.PascalVoc r) =
    r.path


{-| Setter for file path. This field is optional. Corresponding to `<annotation><path>`.
-}
setPath : Maybe String -> PascalVoc -> PascalVoc
setPath m (P.PascalVoc r) =
    P.PascalVoc { r | path = m }


{-| Getter for `segmented`. This field is optional.
Corresponding to `<annotation><segmented>`.
In most cases, this value would be 0.
When this XML value cannot be interpreted as Int such as `Unspecified`, this function returns `Nothing`.
-}
segmented : PascalVoc -> Maybe Int
segmented (P.PascalVoc r) =
    r.segmented


{-| Setter for `segmented`. This field is optional.
Corresponding to `<annotation><segmented>`.
-}
setSegmented : Maybe Int -> PascalVoc -> PascalVoc
setSegmented m (P.PascalVoc r) =
    P.PascalVoc { r | segmented = m }


{-| Getter for `source`. This field is optional.
Corresponding to `<annotation><source>`.

See `PascalVoc.Settings` to access its child fields.

-}
source : PascalVoc -> Maybe PascalVocSource
source (P.PascalVoc r) =
    Maybe.map P.PascalVocSource r.source


{-| Setter for `source`. This field is optional.
Corresponding to `<annotation><source>`.
-}
setSource : Maybe PascalVocSource -> PascalVoc -> PascalVoc
setSource m (P.PascalVoc r) =
    P.PascalVoc { r | source = Maybe.map (\(P.PascalVocSource s) -> s) m }
