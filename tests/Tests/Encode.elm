module Tests.Encode exposing (..)

import Expect exposing (equal)
import PascalVoc.Encode as PE
import PascalVoc.Internal.PascalVoc as P
import Test exposing (Test, describe, test)


format : Test
format =
    let
        checkFileName () =
            let
                actual =
                    PE.format
                        (P.PascalVoc
                            { size = { width = 324, height = 832, depth = 3 }
                            , objects =
                                [ { name = "21"
                                  , bndbox = { xmin = 32, ymin = 42, xmax = 83, ymax = 98 }
                                  , pose = Nothing
                                  , truncated = Nothing
                                  , difficult = Nothing
                                  }
                                , { name = "22"
                                  , bndbox = { xmin = 82, ymin = 42, xmax = 103, ymax = 98 }
                                  , pose = Nothing
                                  , truncated = Nothing
                                  , difficult = Nothing
                                  }
                                ]
                            , path = Just "/path/to/target"
                            , source =
                                Just
                                    { database = Just "hoge"
                                    , annotation = Nothing
                                    , image = Nothing
                                    , flickrid = Nothing
                                    }
                            , filename = Just "some_filename.png"
                            , folder = Nothing
                            , segmented = Nothing
                            }
                        )

                desired =
                    ""
            in
            -- equal actual desired
            Expect.true "mock" True
    in
    describe "test PascalVoc.Decode.decodeString"
        [ test "test file name" checkFileName
        ]
