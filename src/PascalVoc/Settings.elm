module PascalVoc.Settings exposing (emptySource, database, setDatabase, annotation, setAnnotation, image, setImage, flickrid, setFlickrid)

{-| This module provides constructor of `PascalVocSource` and accessor to its fields.


# PascalVocSource

@docs emptySource, database, setDatabase, annotation, setAnnotation, image, setImage, flickrid, setFlickrid

-}

import PascalVoc.Internal.PascalVoc as P exposing (PascalVocSource)


{-| Constructor for `<annotation><source>`.
-}
emptySource : PascalVocSource
emptySource =
    P.PascalVocSource { database = Nothing, annotation = Nothing, image = Nothing, flickrid = Nothing }


{-| Getter for database. Corresponding to `<annotation><source><database>`.
This field is optional.
-}
database : PascalVocSource -> Maybe String
database (P.PascalVocSource r) =
    r.database


{-| Setter for database. Corresponding to `<annotation><source><database>`.
This field is optional.
-}
setDatabase : Maybe String -> PascalVocSource -> PascalVocSource
setDatabase m (P.PascalVocSource r) =
    P.PascalVocSource { r | database = m }


{-| Getter for `String` value of who or what organization did the annotation.
Corresponding to `<annotation><source><annotation>`.
This field is optional.

To access to each annotation, use `PascalVoc.objects`.

-}
annotation : PascalVocSource -> Maybe String
annotation (P.PascalVocSource r) =
    r.annotation


{-| Setter for `String` value of who or what organization did the annotation.
Corresponding to `<annotation><source><annotation>`.
This field is optional.
-}
setAnnotation : Maybe String -> PascalVocSource -> PascalVocSource
setAnnotation m (P.PascalVocSource r) =
    P.PascalVocSource { r | annotation = m }


{-| Getter for image info.
Corresponding to `<annotation><source><annotation>`.
This field is optional.

To access to filename, use `PascalVoc.filename`.

-}
image : PascalVocSource -> Maybe String
image (P.PascalVocSource r) =
    r.image


{-| Setter for image info.
Corresponding to `<annotation><source><annotation>`.
This field is optional.
-}
setImage : Maybe String -> PascalVocSource -> PascalVocSource
setImage m (P.PascalVocSource r) =
    P.PascalVocSource { r | image = m }


{-| Getter for flickrid.
Corresponding to `<annotation><source><flickrid>`.
This field is optional.
-}
flickrid : PascalVocSource -> Maybe String
flickrid (P.PascalVocSource r) =
    r.flickrid


{-| Setter for flickrid.
Corresponding to `<annotation><source><flickrid>`.
This field is optional.
-}
setFlickrid : Maybe String -> PascalVocSource -> PascalVocSource
setFlickrid m (P.PascalVocSource r) =
    P.PascalVocSource { r | flickrid = m }
