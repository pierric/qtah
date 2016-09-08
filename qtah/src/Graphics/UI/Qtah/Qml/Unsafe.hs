module Graphics.UI.Qtah.Qml.Unsafe where

import Foreign.Ptr
import Graphics.UI.Qtah.Generated.Qml.QJSValue

jsValuefromRawPtr :: Ptr QJSValue -> QJSValue
jsValuefromRawPtr = QJSValue