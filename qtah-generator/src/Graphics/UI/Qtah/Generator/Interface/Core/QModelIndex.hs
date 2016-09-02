module Graphics.UI.Qtah.Generator.Interface.Core.QModelIndex (
  aModule,
  c_QModelIndex,
  ) where

import Foreign.Hoppy.Generator.Types
import Foreign.Hoppy.Generator.Spec
import Foreign.Hoppy.Generator.Spec.ClassFeature
import Graphics.UI.Qtah.Generator.Types
import Graphics.UI.Qtah.Generator.Interface.Core.Types(bs_ItemFlags)
import {-# SOURCE #-} Graphics.UI.Qtah.Generator.Interface.Widgets.QAbstractItemModel(c_QAbstractItemModel)
import Graphics.UI.Qtah.Generator.Interface.Core.QVariant(c_QVariant)

aModule =
  AQtModule $
  makeQtModule ["Core", "QModelIndex"]
  [ QtExport $ ExportClass c_QModelIndex ]

c_QModelIndex = 
  addReqIncludes [includeStd "QModelIndex"] $
  classAddFeatures [Equatable] $
  classSetConversionToGc $
  makeClass (ident "QModelIndex") Nothing []
  [ mkCtor "new" [] ]
  [ mkConstMethod "child"  [intT, intT] (objT c_QModelIndex)
  , mkConstMethod "column" [] intT
  , mkConstMethod "data" [] (objT c_QVariant)
  , mkConstMethod'"data" "dataWithRole" [intT] (objT c_QVariant)
  , mkConstMethod "flags" [] (bitspaceT bs_ItemFlags)
  , mkConstMethod "internalId" [] sizeT
  , mkConstMethod "internalPointer" [] (ptrT voidT)
  , mkConstMethod "isValid" [] boolT
  , mkConstMethod "model" [] (ptrT $ constT $ objT c_QAbstractItemModel)
  , mkConstMethod "parent" [] (objT c_QModelIndex)
  , mkConstMethod "row" [] intT
  , mkConstMethod "sibling" [intT, intT] (objT c_QModelIndex)
  ]
  