module Graphics.UI.Qtah.Generator.Interface.Qml.QJSValue(
  aModule,
  c_QJSValue,
  ) where

import Foreign.Hoppy.Generator.Types
import Foreign.Hoppy.Generator.Spec
import Foreign.Hoppy.Generator.Spec.ClassFeature
import Graphics.UI.Qtah.Generator.Types
import Graphics.UI.Qtah.Generator.Interface.Core.QString (c_QString)
import Graphics.UI.Qtah.Generator.Interface.Core.QVariant(c_QVariant)

aModule = 
    AQtModule $
    makeQtModule ["Qml", "QJSValue"] $
    [ QtExport $ ExportClass c_QJSValue ]

c_QJSValue =
  addReqIncludes [includeStd "QJSValue"] $
  classAddFeatures [Assignable, Copyable] $
  classSetConversionToGc $
  makeClass (ident "QJSValue") Nothing []
  [ mkCtor "new" []
  , mkCtor "newFromBool" [boolT]
  , mkCtor "newFromInt"  [intT]
  , mkCtor "newFromUInt" [uintT]
  , mkCtor "newFromDouble" [doubleT]
  , mkCtor "newFromString" [constT $ refT $ objT c_QString] ] $
  [ mkConstMethod "isArray"      [] boolT
  , mkConstMethod "isBool"       [] boolT
  , mkConstMethod "isCallable"   [] boolT
  , mkConstMethod "isDate"       [] boolT
  , mkConstMethod "isError"      [] boolT
  , mkConstMethod "isNull"       [] boolT
  , mkConstMethod "isNumber"     [] boolT
  , mkConstMethod "isObject"     [] boolT
  , mkConstMethod "isQObject"    [] boolT
  , mkConstMethod "isRegExp"     [] boolT
  , mkConstMethod "isString"     [] boolT
  , mkConstMethod "isUndefined"  [] boolT
  , mkConstMethod "isVariant"    [] boolT
  , mkConstMethod "property" [constT $ refT $ objT c_QString]  (objT c_QJSValue)
  , mkConstMethod "toBool"       [] boolT
  , mkConstMethod "toInt"        [] intT
  , mkConstMethod "toUInt"       [] uintT
  , mkConstMethod "toVariant"    [] (objT c_QVariant)
  ]