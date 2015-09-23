module Main (
    main
)   where

import ClassyPrelude
import Network.Wai (responseLBS, Application)
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types (status200)
import Network.HTTP.Types.Header (hContentType)

main = do
    (port :: Int, filepath :: FilePath) <- readArgs
    putStrLn $ "Listening on port " ++ tshow port
    filecontents <- readFile filepath
    run port $ app filecontents

app :: LByteString -> Application
app filecontents req f =
    f $ responseLBS status200 [(hContentType, "text/html")] filecontents
