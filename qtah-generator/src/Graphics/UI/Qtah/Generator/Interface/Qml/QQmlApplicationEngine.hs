module Graphics.UI.Qtah.Generator.Interface.Qml.QQmlApplicationEngine(
  aModule,
  c_QQmlApplicationEngine,
  ) where

import Foreign.Hoppy.Generator.Types
import Foreign.Hoppy.Generator.Spec
import Graphics.UI.Qtah.Generator.Types
import Graphics.UI.Qtah.Generator.Interface.Core.QString (c_QString)
import Graphics.UI.Qtah.Generator.Interface.Core.QUrl    (c_QUrl)
import Graphics.UI.Qtah.Generator.Interface.Qml.QQmlEngine(c_QQmlEngine)
import Graphics.UI.Qtah.Generator.Interface.Core.QList   (c_QListQObject)

aModule = 
    AQtModule $
    makeQtModule ["Qml", "QQmlApplicationEngine"] $
    [ QtExport $ ExportClass c_QQmlApplicationEngine ]

c_QQmlApplicationEngine =
  addReqIncludes [includeStd "QQmlApplicationEngine"] $
  makeClass (ident "QQmlApplicationEngine") Nothing [c_QQmlEngine]
  [ mkCtor "new" [] ] $
  [ mkMethod "rootObjects" [] $ objT c_QListQObject
  , mkMethod "load" [constT $ refT $ objT c_QString] voidT
  , mkMethod' "load" "loadWithQUrl" [constT $ refT $ objT c_QUrl] voidT
  ]