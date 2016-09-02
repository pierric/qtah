module Graphics.UI.Qtah.Generator.Interface.Core.QUrl (
  aModule,
  c_QUrl,
  ) where

import Foreign.Hoppy.Generator.Spec.ClassFeature
import Foreign.Hoppy.Generator.Types
import Foreign.Hoppy.Generator.Spec
import Graphics.UI.Qtah.Generator.Interface.Imports
import Graphics.UI.Qtah.Generator.Types
import Graphics.UI.Qtah.Generator.Interface.Core.QString (c_QString)

aModule =
  AQtModule $
  makeQtModule ["Core", "QUrl"]
  [ QtExport $ ExportClass c_QUrl ]

c_QUrl =
  addReqIncludes [includeStd "QUrl"] $
  classAddFeatures [Assignable, Copyable, Equatable] $
  classSetConversionToGc $
  makeClass (ident "QUrl") Nothing []
  [ mkCtor "new" []
  , mkCtor "newFromString" [refT $ constT $ objT c_QString]
  ] $
  [ mkMethod "clear" [] voidT
  , mkConstMethod "errorString" [] (objT c_QString)
  , mkConstMethod "fileName"    [] (objT c_QString)
  , mkConstMethod "fragment"    [] (objT c_QString)
  , mkConstMethod "hasFragment" [] boolT
  , mkConstMethod "hasQuery"    [] boolT
  , mkConstMethod "host"        [] (objT c_QString)
  , mkConstMethod "isEmpty"     [] boolT
  , mkConstMethod "isLocalFile" [] boolT
  , mkConstMethod "isParentOf"  [refT $ constT $ objT c_QUrl] boolT
  , mkConstMethod "isRelative"  [] boolT
  , mkConstMethod "isValid"     [] boolT
  , mkConstMethod "password"    [] (objT c_QString)
  , mkConstMethod "path"        [] (objT c_QString)
  , mkConstMethod "port"        [] intT
  , mkConstMethod "query"       [] (objT c_QString)
  , mkConstMethod "resolved"    [refT $ constT $ objT c_QUrl] (objT c_QUrl)
  , mkConstMethod "scheme"      [] (objT c_QString) 
  , mkMethod "swap" [refT $ objT c_QUrl] voidT
  , mkConstMethod "toLocalFile" [] (objT c_QString)
  , mkConstMethod "toString"    [] (objT c_QString)
  , mkConstMethod "userInfo"    [] (objT c_QString)
  , mkConstMethod "userName"    [] (objT c_QString)
  ] 