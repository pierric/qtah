-- This file is part of Qtah.
--
-- Copyright 2015-2016 Bryan Gardiner <bog@khumba.net>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

module Graphics.UI.Qtah.Generator.Interface.Widgets.QScrollArea (
  aModule,
  ) where

import Foreign.Hoppy.Generator.Spec (
  Export (ExportClass),
  addReqIncludes,
  ident,
  includeStd,
  makeClass,
  mkCtor,
  mkMethod,
  mkMethod',
  mkProp,
  mkProps,
  )
import Foreign.Hoppy.Generator.Types (bitspaceT, boolT, intT, objT, ptrT, voidT)
import Foreign.Hoppy.Generator.Version (collect, just, test)
import Graphics.UI.Qtah.Generator.Flags (qtVersion)
import Graphics.UI.Qtah.Generator.Interface.Core.Types (bs_Alignment)
import Graphics.UI.Qtah.Generator.Interface.Widgets.QAbstractScrollArea (c_QAbstractScrollArea)
import Graphics.UI.Qtah.Generator.Interface.Widgets.QWidget (c_QWidget)
import Graphics.UI.Qtah.Generator.Types

{-# ANN module "HLint: ignore Use camelCase" #-}

aModule =
  AQtModule $
  makeQtModule ["Widgets", "QScrollArea"]
  [ QtExport $ ExportClass c_QScrollArea ]

c_QScrollArea =
  addReqIncludes [includeStd "QScrollArea"] $
  makeClass (ident "QScrollArea") Nothing [c_QAbstractScrollArea]
  [ mkCtor "new" []
  , mkCtor "newWithParent" [ptrT $ objT c_QWidget]
  ] $
  collect
  [ just $ mkMethod' "ensureVisible" "ensureVisible" [intT, intT] voidT
  , just $ mkMethod' "ensureVisible" "ensureVisibleWithMargins" [intT, intT, intT, intT] voidT
  , test (qtVersion >= [4, 2]) $ mkMethod' "ensureWidgetVisible" "ensureWidgetVisible"
    [ptrT $ objT c_QWidget] voidT
  , test (qtVersion >= [4, 2]) $ mkMethod' "ensureWidgetVisible" "ensureWidgetVisibleWithMargins"
    [ptrT $ objT c_QWidget, intT, intT] voidT
  , just $ mkMethod "takeWidget" [] $ ptrT $ objT c_QWidget
  ] ++
  (mkProps . collect)
  [ test (qtVersion >= [4, 2]) $ mkProp "alignment" $ bitspaceT bs_Alignment
  , just $ mkProp "widget" $ ptrT $ objT c_QWidget
  , just $ mkProp "widgetResizable" boolT
  ]
