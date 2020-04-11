module PascalVoc.Encode exposing (format)

{-| Decoder for Pascal VOC XML format


# Encoder

@docs format

-}

import PascalVoc.Internal.PascalVoc as P exposing (PascalVoc)
import XmlParser as XP


{-| Encode `PascalVoc` to XML.

    data = PascalVoc.pascalVoc { filename = "01.png", size = { width = 10, height = 15, depth = 3 }, objects = [] }
    format data == "<annotation ><filename >01.png</filename><size ><width >10</width><height >15</height><depth >3</depth></size></annotation>

-}
format : PascalVoc -> String
format (P.PascalVoc r) =
    { processingInstructions = []
    , docType = Nothing
    , root =
        XP.Element "annotation"
            []
            (encodeMaybeValue "folder" identity r.folder
                ++ [ XP.Element "width" [] [ XP.Text r.filename ] ]
                ++ encodeMaybeValue "path" identity r.path
                ++ Maybe.withDefault [] (Maybe.map (encodeSource >> List.singleton) r.source)
                ++ [ encodeSize r.size ]
                ++ encodeMaybeValue "segmented" String.fromInt r.segmented
                ++ List.map encodeObject r.objects
            )
    }
        |> XP.format


encodeSize : P.Size -> XP.Node
encodeSize { width, height, depth } =
    XP.Element "size"
        []
        [ XP.Element "width" [] [ XP.Text <| String.fromInt width ]
        , XP.Element "height" [] [ XP.Text <| String.fromInt height ]
        , XP.Element "depth" [] [ XP.Text <| String.fromInt depth ]
        ]


encodeSource : P.Source -> XP.Node
encodeSource s =
    XP.Element "source"
        []
        (encodeMaybeValue "database" identity s.database
            ++ encodeMaybeValue "annotation" identity s.annotation
            ++ encodeMaybeValue "image" identity s.image
            ++ encodeMaybeValue "flickrid" identity s.flickrid
        )


encodeObject : P.Object -> XP.Node
encodeObject o =
    XP.Element "object"
        []
        ([ XP.Element "name" [] [ XP.Text o.name ]
         , encodeBoundingBox o.bndbox
         ]
            ++ encodeMaybeValue "pose" identity o.pose
            ++ encodeMaybeValue "truncated" String.fromInt o.truncated
            ++ encodeMaybeValue "difficult" String.fromInt o.difficult
        )


encodeBoundingBox : P.BoundingBox -> XP.Node
encodeBoundingBox b =
    XP.Element "bndbox"
        []
        [ XP.Element "xmin" [] [ XP.Text <| String.fromFloat b.xmin ]
        , XP.Element "xmax" [] [ XP.Text <| String.fromFloat b.xmax ]
        , XP.Element "ymin" [] [ XP.Text <| String.fromFloat b.ymin ]
        , XP.Element "ymax" [] [ XP.Text <| String.fromFloat b.ymax ]
        ]


encodeMaybeValue tag toString val =
    Maybe.map (\p -> XP.Element tag [] [ XP.Text (toString p) ] |> List.singleton) val |> Maybe.withDefault []
