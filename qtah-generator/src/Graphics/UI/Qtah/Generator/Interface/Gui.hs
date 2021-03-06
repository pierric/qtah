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

module Graphics.UI.Qtah.Generator.Interface.Gui (modules) where

import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QActionEvent as QActionEvent
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QClipboard as QClipboard
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QCloseEvent as QCloseEvent
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QColor as QColor
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QDoubleValidator as QDoubleValidator
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QEnterEvent as QEnterEvent
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QExposeEvent as QExposeEvent
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QFocusEvent as QFocusEvent
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QHideEvent as QHideEvent
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QHoverEvent as QHoverEvent
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QInputEvent as QInputEvent
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QIntValidator as QIntValidator
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QKeyEvent as QKeyEvent
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QMouseEvent as QMouseEvent
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QPolygon as QPolygon
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QPolygonF as QPolygonF
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QRegion as QRegion
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QShowEvent as QShowEvent
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QValidator as QValidator
import qualified Graphics.UI.Qtah.Generator.Interface.Gui.QWheelEvent as QWheelEvent
import Graphics.UI.Qtah.Generator.Types

{-# ANN module "HLint: ignore Use camelCase" #-}

modules :: [AModule]
modules =
  [ QActionEvent.aModule
  , QClipboard.aModule
  , QCloseEvent.aModule
  , QColor.aModule
  , QDoubleValidator.aModule
  , QEnterEvent.aModule
  , QFocusEvent.aModule
  , QExposeEvent.aModule
  , QHideEvent.aModule
  , QHoverEvent.aModule
  , QInputEvent.aModule
  , QIntValidator.aModule
  , QKeyEvent.aModule
  , QMouseEvent.aModule
  , QPolygon.aModule
  , QPolygonF.aModule
  , QRegion.aModule
  , QShowEvent.aModule
  , QValidator.aModule
  , QWheelEvent.aModule
  ]
