module Graphics.UI.Qtah.Generator.Interface.Widgets.QFileSystemModel (
  aModule,
  c_QFileSystemModel,
  ) where

import Foreign.Hoppy.Generator.Types
import Foreign.Hoppy.Generator.Spec
import Graphics.UI.Qtah.Generator.Types
import Graphics.UI.Qtah.Generator.Interface.Widgets.QAbstractItemModel (c_QAbstractItemModel)
import Graphics.UI.Qtah.Generator.Interface.Core.Types (decorationRole, userRole)
import Graphics.UI.Qtah.Generator.Interface.Core.QObject (c_QObject)
import Graphics.UI.Qtah.Generator.Interface.Core.QString (c_QString)
import Graphics.UI.Qtah.Generator.Interface.Core.QVariant (c_QVariant)
import Graphics.UI.Qtah.Generator.Interface.Core.QModelIndex (c_QModelIndex)
import Graphics.UI.Qtah.Generator.Interface.Core.QList (c_QListQString)

aModule =
  AQtModule $
  makeQtModule ["Widgets", "QFileSystemModel"]
  [ QtExport $ ExportClass c_QFileSystemModel 
  , QtExport $ ExportEnum  e_Roles]

c_QFileSystemModel = 
  addReqIncludes [includeStd "QFileSystemModel"] $
  makeClass (ident "QFileSystemModel") Nothing [c_QAbstractItemModel]
  [ mkCtor "new" []
  , mkCtor "newWithParent" [ptrT $ objT c_QObject]]
  [ mkConstMethod "fileName" [refT $ constT $ objT c_QModelIndex] (objT c_QString)
  , mkConstMethod "filePath" [refT $ constT $ objT c_QModelIndex] (objT c_QString)
  , mkConstMethod "index" [refT $ constT $ objT c_QString] (objT c_QModelIndex)
  , mkConstMethod "isDir" [refT $ constT $ objT c_QModelIndex] boolT
  , mkConstMethod "isReadOnly" [] boolT
  , mkMethod "mkdir" [refT $ constT $ objT c_QModelIndex, refT $ constT $ objT c_QString] (objT c_QModelIndex)
  , mkConstMethod "myComputer" [] (objT c_QVariant)
  , mkConstMethod "nameFilterDisables" [] boolT
  , mkConstMethod "nameFilters" [] (objT c_QListQString)
  , mkMethod "remove" [refT $ constT $ objT c_QModelIndex] boolT
  , mkMethod "resolveSymlinks" [] boolT
  , mkMethod "rmdir" [refT $ constT $ objT c_QModelIndex] boolT
  , mkConstMethod "rootPath" [] (objT c_QString)
  , mkMethod "setNameFilterDisables" [boolT] voidT
  , mkMethod "setNameFilters" [refT $ constT $ objT c_QListQString] voidT
  , mkMethod "setReadOnly" [boolT] voidT
  , mkMethod "setResolveSymlinks" [boolT] voidT
  , mkMethod "setRootPath" [refT $ constT $ objT c_QString] (objT c_QModelIndex)
  , mkConstMethod "size" [refT $ constT $ objT c_QModelIndex] int64T
  , mkConstMethod'"type" "type_" [refT $ constT $ objT c_QModelIndex] (objT c_QString)
  ]

e_Roles =
  makeQtEnum (ident1 "QFileSystemModel" "Roles") [includeStd "QFileSystemModel"]
  [ (decorationRole, ["file", "icon", "role"])
  , (userRole+1, ["file", "path", "role"])
  , (userRole+2, ["file", "name", "role"])
  , (userRole+3, ["file", "permissions"])
  ]
