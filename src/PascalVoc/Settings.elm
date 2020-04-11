module PascalVoc.Settings exposing
    ( annotation
    , database
    , emptySource
    , flickrid
    , image
    , setAnnotation
    , setDatabase
    , setFlickrid
    , setImage
    )

import PascalVoc.Internal.PascalVoc as P


type alias PascalVocSource =
    P.PascalVocSource


emptySource : PascalVocSource
emptySource =
    P.PascalVocSource { database = Nothing, annotation = Nothing, image = Nothing, flickrid = Nothing }


database : PascalVocSource -> Maybe String
database (P.PascalVocSource r) =
    r.database


setDatabase : Maybe String -> PascalVocSource -> PascalVocSource
setDatabase m (P.PascalVocSource r) =
    P.PascalVocSource { r | database = m }


annotation : PascalVocSource -> Maybe String
annotation (P.PascalVocSource r) =
    r.annotation


setAnnotation : Maybe String -> PascalVocSource -> PascalVocSource
setAnnotation m (P.PascalVocSource r) =
    P.PascalVocSource { r | annotation = m }


image : PascalVocSource -> Maybe String
image (P.PascalVocSource r) =
    r.image


setImage : Maybe String -> PascalVocSource -> PascalVocSource
setImage m (P.PascalVocSource r) =
    P.PascalVocSource { r | image = m }


flickrid : PascalVocSource -> Maybe String
flickrid (P.PascalVocSource r) =
    r.flickrid


setFlickrid : Maybe String -> PascalVocSource -> PascalVocSource
setFlickrid m (P.PascalVocSource r) =
    P.PascalVocSource { r | flickrid = m }
