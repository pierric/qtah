module Graphics.UI.Qtah.Generator.Interface.Qml.QQmlContext(
  aModule,
  c_QQmlContext,
  ) where

import Foreign.Hoppy.Generator.Types
import Foreign.Hoppy.Generator.Spec
import Graphics.UI.Qtah.Generator.Types
import Graphics.UI.Qtah.Generator.Interface.Core.QObject (c_QObject)
import Graphics.UI.Qtah.Generator.Interface.Core.QString (c_QString)
import Graphics.UI.Qtah.Generator.Interface.Core.QUrl    (c_QUrl)
import Graphics.UI.Qtah.Generator.Interface.Core.QVariant(c_QVariant)
import {-# SOURCE #-} Graphics.UI.Qtah.Generator.Interface.Qml.QQmlEngine (c_QQmlEngine)

aModule = 
    AQtModule $
    makeQtModule ["Qml", "QQmlContext"] $
    [ QtExport $ ExportClass c_QQmlContext ]

c_QQmlContext =
  addReqIncludes [includeStd "QQmlContext"] $
  makeClass (ident "QQmlContext") Nothing [c_QObject]
  [ mkCtor "new" [ptrT $ objT c_QQmlEngine]
  , mkCtor "newWithParentContext" [ptrT $ objT c_QQmlContext]
  ] $
  [ mkConstMethod "baseUrl" [] $ objT c_QUrl
  , mkConstMethod "contextObject" [] $ ptrT (objT c_QObject)
  , mkConstMethod "contextProperty" [refT $ constT $ objT c_QString] $ objT c_QVariant
  , mkConstMethod "engine" [] $ ptrT (objT c_QQmlEngine)
  , mkConstMethod "isValid" [] $ boolT
  , mkConstMethod "nameForObject" [ptrT $ objT c_QObject] $ objT c_QString
  , mkConstMethod "parentContext" [] $ ptrT (objT c_QQmlContext)
  , mkMethod "resolvedUrl" [refT $ constT $ objT c_QUrl] $ objT c_QUrl
  , mkMethod "setBaseUrl"  [refT $ constT $ objT c_QUrl] voidT
  , mkMethod "setContextObject" [ptrT $ objT c_QObject] voidT
  , mkMethod "setContextProperty" [refT $ constT $ objT c_QString, ptrT $ objT c_QObject] voidT
  , mkMethod' "setContextProperty" "setContextPropertyWithQVariant" [refT $ constT $ objT c_QString, refT $ constT $ objT c_QVariant] voidT
  ]