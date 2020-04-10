module PascalVoc.Decode exposing (decodeString)

import PascalVoc.Internal.PascalVoc as P exposing (PascalVoc)
import Xml.Decode as XD


decodeString : String -> Result String PascalVoc
decodeString =
    XD.decodeString pascalVocDecoder


pascalVocDecoder : XD.Decoder PascalVoc
pascalVocDecoder =
    XD.succeed P.PascalVocRecord
        |> XD.requiredPath [ "size" ] (XD.single sizeDecoder)
        |> XD.requiredPath [ "object" ] (XD.list objectDecoder)
        |> XD.possiblePath [ "source" ] (XD.single sourceDecoder)
        |> XD.possiblePath [ "filename" ] (XD.single XD.string)
        |> XD.possiblePath [ "folder" ] (XD.single XD.string)
        |> XD.possiblePath [ "segmented" ] (XD.single XD.int)
        |> XD.map P.PascalVoc


objectDecoder : XD.Decoder P.Object
objectDecoder =
    XD.succeed P.Object
        |> XD.requiredPath [ "name" ] (XD.single XD.string)
        |> XD.requiredPath [ "bndbox" ] (XD.single boundingBoxDecoder)
        |> XD.possiblePath [ "pose" ] (XD.single XD.string)
        |> XD.possiblePath [ "truncated" ] (XD.single XD.int)
        |> XD.possiblePath [ "difficult" ] (XD.single XD.int)


sourceDecoder : XD.Decoder P.Source
sourceDecoder =
    XD.succeed P.Source
        |> XD.possiblePath [ "database" ] (XD.single XD.string)
        |> XD.possiblePath [ "annotation" ] (XD.single XD.string)
        |> XD.possiblePath [ "image" ] (XD.single XD.string)
        |> XD.possiblePath [ "flickrid" ] (XD.single XD.string)


sizeDecoder : XD.Decoder { width : Int, height : Int, depth : Int }
sizeDecoder =
    XD.succeed (\x y z -> { width = x, height = y, depth = z })
        |> XD.requiredPath [ "width" ] (XD.single XD.int)
        |> XD.requiredPath [ "height" ] (XD.single XD.int)
        |> XD.requiredPath [ "depth" ] (XD.single XD.int)


boundingBoxDecoder : XD.Decoder P.BoundingBox
boundingBoxDecoder =
    XD.succeed P.BoundingBox
        |> XD.requiredPath [ "xmin" ] (XD.single XD.float)
        |> XD.requiredPath [ "ymin" ] (XD.single XD.float)
        |> XD.requiredPath [ "xmax" ] (XD.single XD.float)
        |> XD.requiredPath [ "ymax" ] (XD.single XD.float)
