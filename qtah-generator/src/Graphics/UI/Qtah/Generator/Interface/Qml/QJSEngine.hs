module Graphics.UI.Qtah.Generator.Interface.Qml.QJSEngine(
  aModule,
  c_QJSEngine,
  ) where

import Foreign.Hoppy.Generator.Types
import Foreign.Hoppy.Generator.Spec
import Graphics.UI.Qtah.Generator.Types
import Graphics.UI.Qtah.Generator.Interface.Core.QObject (c_QObject)
import Graphics.UI.Qtah.Generator.Interface.Core.QString (c_QString)
import Graphics.UI.Qtah.Generator.Interface.Qml.QJSValue (c_QJSValue)

aModule = 
    AQtModule $
    makeQtModule ["Qml", "QJSEngine"] $
    [ QtExport $ ExportClass c_QJSEngine ]

c_QJSEngine =
  addReqIncludes [includeStd "QJSEngine"] $
  makeClass (ident "QJSEngine") Nothing [c_QObject]
  [ mkCtor "new" [] ] $
  [ mkMethod "newArray" [intT] $ objT c_QJSValue
  , mkMethod "newObject" [] $ objT c_QJSValue
  , mkMethod "newQObject" [ptrT $ objT c_QObject] $ objT c_QJSValue
  ]