module Graphics.UI.Qtah.Generator.Interface.Qml.QQmlContext(
  aModule,
  c_QQmlContext,
  ) where

import Foreign.Hoppy.Generator.Types
import Foreign.Hoppy.Generator.Spec
import Graphics.UI.Qtah.Generator.Types
import Graphics.UI.Qtah.Generator.Interface.Core.QObject (c_QObject)
import Graphics.UI.Qtah.Generator.Interface.Core.QString (c_QString)
import {-# SOURCE #-} Graphics.UI.Qtah.Generator.Interface.Qml.QQmlEngine (c_QQmlEngine)

aModule = 
    AQtModule $
    makeQtModule ["Qml", "QQmlContext"] $
    [ QtExport $ ExportClass c_QQmlContext ]

c_QQmlContext =
  addReqIncludes [includeStd "QQmlContext"] $
  makeClass (ident "QQmlContext") Nothing [c_QObject]
  [ mkCtor "new" [ptrT $ objT c_QQmlEngine]
  ] $
  [ 
  ]