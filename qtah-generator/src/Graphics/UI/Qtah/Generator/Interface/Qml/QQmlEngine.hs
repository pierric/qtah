module Graphics.UI.Qtah.Generator.Interface.Qml.QQmlEngine(
  aModule,
  c_QQmlEngine,
  ) where

import Foreign.Hoppy.Generator.Types
import Foreign.Hoppy.Generator.Spec
import Graphics.UI.Qtah.Generator.Types
import Graphics.UI.Qtah.Generator.Interface.Core.QString (c_QString)
import Graphics.UI.Qtah.Generator.Interface.Core.QUrl    (c_QUrl)
import Graphics.UI.Qtah.Generator.Interface.Qml.QJSEngine(c_QJSEngine)
import Graphics.UI.Qtah.Generator.Interface.Qml.QQmlContext(c_QQmlContext)

aModule = 
    AQtModule $
    makeQtModule ["Qml", "QQmlEngine"] $
    [ QtExport $ ExportClass c_QQmlEngine ]

c_QQmlEngine =
  addReqIncludes [includeStd "QQmlEngine"] $
  makeClass (ident "QQmlEngine") Nothing [c_QJSEngine]
  [ mkCtor "new" [] ] $
  [ mkMethod "addImportPath" [refT $ constT $ objT c_QString] voidT
  , mkMethod "addPluginPath" [refT $ constT $ objT c_QString] voidT
  , mkConstMethod "rootContext" [] $ ptrT (objT c_QQmlContext)
  , mkConstMethod "baseUrl" [] $ objT c_QUrl
  , mkMethod "setBaseUrl" [constT (objT c_QUrl)] voidT
  ]