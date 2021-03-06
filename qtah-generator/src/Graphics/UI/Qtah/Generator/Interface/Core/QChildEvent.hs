-- This file is part of Qtah.
--
-- Copyright 2016 Bryan Gardiner <bog@khumba.net>
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

module Graphics.UI.Qtah.Generator.Interface.Core.QChildEvent (
  aModule,
  ) where

import Foreign.Hoppy.Generator.Spec (
  addReqIncludes,
  ident,
  includeStd,
  makeClass,
  mkConstMethod,
  mkCtor,
  )
import Foreign.Hoppy.Generator.Types (boolT, enumT, objT, ptrT)
import Graphics.UI.Qtah.Generator.Interface.Core.QEvent (c_QEvent, e_Type)
import Graphics.UI.Qtah.Generator.Interface.Core.QObject (c_QObject)
import Graphics.UI.Qtah.Generator.Types

{-# ANN module "HLint: ignore Use camelCase" #-}

aModule =
  AQtModule $
  makeQtModule ["Core", "QChildEvent"]
  [ QtExportEvent c_QChildEvent
  ]

c_QChildEvent =
  addReqIncludes [includeStd "QChildEvent"] $
  makeClass (ident "QChildEvent") Nothing [c_QEvent]
  [ mkCtor "new" [enumT e_Type, ptrT $ objT c_QObject]
  ]
  [ mkConstMethod "added" [] boolT
  , mkConstMethod "child" [] $ ptrT $ objT c_QObject
  , mkConstMethod "polished" [] boolT
  , mkConstMethod "removed" [] boolT
  ]
