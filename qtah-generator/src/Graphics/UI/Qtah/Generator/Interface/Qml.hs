module Graphics.UI.Qtah.Generator.Interface.Qml(modules) where

import Graphics.UI.Qtah.Generator.Types
import qualified Graphics.UI.Qtah.Generator.Interface.Qml.QJSValue   as QJSValue
import qualified Graphics.UI.Qtah.Generator.Interface.Qml.QJSEngine  as QJSEngine
import qualified Graphics.UI.Qtah.Generator.Interface.Qml.QQmlEngine as QQmlEngine
import qualified Graphics.UI.Qtah.Generator.Interface.Qml.QQmlContext as QQmlContext
import qualified Graphics.UI.Qtah.Generator.Interface.Qml.QQmlApplicationEngine as QQmlApplicationEngine

modules :: [AModule]
modules = 
    [ QJSValue.aModule
    , QJSEngine.aModule
    , QQmlEngine.aModule 
    , QQmlContext.aModule
    , QQmlApplicationEngine.aModule
    ]