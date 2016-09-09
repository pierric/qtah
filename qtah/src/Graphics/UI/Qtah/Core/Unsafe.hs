module Graphics.UI.Qtah.Core.Unsafe where

import Foreign.Ptr
import Graphics.UI.Qtah.Generated.Core.QObject

qObjectFromRawPtr = QObject
qObjectFromRawPtrGc = QObjectGc 