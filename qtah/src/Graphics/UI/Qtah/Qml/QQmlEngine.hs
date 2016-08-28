{-# LANGUAGE NoMonomorphismRestriction #-}

---------- GENERATED FILE, EDITS WILL BE LOST ----------

module Graphics.UI.Qtah.Qml.QQmlEngine (
  QQmlEngineValue (..),
  QQmlEngineConstPtr (..),
  QQmlEnginePtr (..),
  QQmlEngineConst,
  QQmlEngine,
  castConst,
  cast,
  downCastConst,
  downCast,
  new,
  addImportPath,
  addPluginPath,
  baseUrl,
  rootContext,
  setBaseUrl,
  ) where

import Graphics.UI.Qtah.Generated.Qml.QQmlEngine
import Prelude ()


castConst = toQQmlEngineConst
cast = toQQmlEngine
downCastConst = downToQQmlEngineConst
downCast = downToQQmlEngine
new = qQmlEngine_new
addImportPath = qQmlEngine_addImportPath
addPluginPath = qQmlEngine_addPluginPath
rootContext = qQmlEngine_rootContext
baseUrl = qQmlEngine_baseUrl
setBaseUrl = qQmlEngine_setBaseUrl