module Tests.Decode exposing (decodeString)

import Expect exposing (equal)
import PascalVoc.Decode as PD
import PascalVoc.Internal.PascalVoc as P
import Test exposing (Test, describe, test)


decodeString : Test
decodeString =
    let
        checkFileName () =
            let
                actual =
                    PD.decodeString simpleAnnotationXmlString
                        |> Result.map (\(P.PascalVoc p) -> p.filename)

                desired =
                    Ok (Just "000001.png")
            in
            equal actual desired

        checkFolder () =
            let
                actual =
                    PD.decodeString simpleAnnotationXmlString
                        |> Result.map (\(P.PascalVoc p) -> p.folder)

                desired =
                    Ok (Just "GeneratedData_Train")
            in
            equal actual desired

        checkSize () =
            let
                actual =
                    PD.decodeString simpleAnnotationXmlString
                        |> Result.map (\(P.PascalVoc p) -> p.size)

                desired =
                    Ok { width = 224, height = 224, depth = 3 }
            in
            equal actual desired

        checkObjects () =
            let
                actual =
                    PD.decodeString simpleAnnotationXmlString
                        |> Result.map (\(P.PascalVoc p) -> p.objects)

                desired =
                    { name = "21"
                    , pose = Just "Frontal"
                    , truncated = Just 0
                    , difficult = Just 0
                    , bndbox = { xmin = 82, xmax = 172, ymin = 88, ymax = 146 }
                    }
                        |> List.singleton
                        |> Ok
            in
            equal actual desired
    in
    describe "test PascalVoc.Decode.decodeString"
        [ test "test file name" checkFileName
        , test "test folder" checkFolder
        , test "test size" checkSize
        , test "test objects" checkObjects
        ]


simpleAnnotationXmlString : String
simpleAnnotationXmlString =
    """
<annotation>
\t<folder>GeneratedData_Train</folder>
\t<filename>000001.png</filename>
\t<path>/my/path/GeneratedData_Train/000001.png</path>
\t<source>
\t\t<database>Unknown</database>
\t</source>
\t<size>
\t\t<width>224</width>
\t\t<height>224</height>
\t\t<depth>3</depth>
\t</size>
\t<segmented>0</segmented>
\t<object>
\t\t<name>21</name>
\t\t<pose>Frontal</pose>
\t\t<truncated>0</truncated>
\t\t<difficult>0</difficult>
\t\t<occluded>0</occluded>
\t\t<bndbox>
\t\t\t<xmin>82</xmin>
\t\t\t<xmax>172</xmax>
\t\t\t<ymin>88</ymin>
\t\t\t<ymax>146</ymax>
\t\t</bndbox>
\t</object>
</annotation>
"""
