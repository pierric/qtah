module Graphics.UI.Qtah.Generator.Interface.Widgets.QAbstractItemModel (
  aModule,
  c_QAbstractItemModel,
  ) where

import Foreign.Hoppy.Generator.Types
import Foreign.Hoppy.Generator.Spec
import Graphics.UI.Qtah.Generator.Types
import Graphics.UI.Qtah.Generator.Interface.Core.Types (bs_ItemFlags)
import Graphics.UI.Qtah.Generator.Interface.Core.QObject (c_QObject)
import Graphics.UI.Qtah.Generator.Interface.Core.QVariant (c_QVariant)
import Graphics.UI.Qtah.Generator.Interface.Core.QModelIndex (c_QModelIndex)

aModule =
  AQtModule $
  makeQtModule ["Widgets", "QAbstractItemModel"]
  [ QtExport $ ExportClass c_QAbstractItemModel ]

c_QAbstractItemModel = 
  addReqIncludes [includeStd "QAbstractItemModel"] $
  makeClass (ident "QAbstractItemModel") Nothing [c_QObject]
  []
  [ mkConstMethod "buddy" [refT $ constT $ objT c_QModelIndex] (objT c_QModelIndex)
  , mkConstMethod "flags" [refT $ constT $ objT c_QModelIndex] (bitspaceT bs_ItemFlags)
  , mkConstMethod "columnCount" [] intT
  , mkConstMethod "data" [refT $ constT $ objT c_QModelIndex] (objT c_QVariant)
  , mkConstMethod'"data" "dataWithRole" [refT $ constT $ objT c_QModelIndex, intT] (objT c_QVariant)
  , mkConstMethod "hasChildren" [] boolT
  , mkConstMethod "hasIndex" [intT, intT] boolT
  , mkConstMethod "index" [intT, intT] (objT c_QModelIndex)
  , mkConstMethod "parent" [refT $ constT $ objT c_QModelIndex] (objT c_QModelIndex)
  , mkConstMethod "rowCount" [] intT
  , mkMethod "setData" [refT $ constT $ objT c_QModelIndex, refT $ constT $ objT c_QVariant] boolT
  , mkMethod'"setData" "setDataWithRole" [refT $ constT $ objT c_QModelIndex, refT $ constT $ objT c_QVariant, intT] boolT 
  , mkConstMethod "sibling" [intT, intT, refT $ constT $ objT c_QModelIndex] (objT c_QModelIndex)
  ]