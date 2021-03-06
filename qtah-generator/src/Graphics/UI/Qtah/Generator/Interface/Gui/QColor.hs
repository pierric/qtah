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

{-# LANGUAGE CPP #-}

module Graphics.UI.Qtah.Generator.Interface.Gui.QColor (
  aModule,
  c_QColor,
  ) where

import Control.Monad (forM_)
#if !MIN_VERSION_base(4,8,0)
import Data.Monoid (mconcat)
#endif
import Foreign.Hoppy.Generator.Language.Haskell (
  addImports,
  indent,
  sayLn,
  saysLn,
  )
import Foreign.Hoppy.Generator.Spec (
  ClassHaskellConversion (
    ClassHaskellConversion,
    classHaskellConversionFromCppFn,
    classHaskellConversionToCppFn,
    classHaskellConversionType
  ),
  Export (ExportEnum, ExportClass),
  addReqIncludes,
  classSetHaskellConversion,
  hsImports,
  hsQualifiedImport,
  ident,
  ident1,
  includeStd,
  makeClass,
  mkConstMethod,
  mkConstMethod',
  mkCtor,
  mkMethod,
  mkMethod',
  mkProp,
  mkProps,
  mkStaticMethod,
  )
import Foreign.Hoppy.Generator.Spec.ClassFeature (
  ClassFeature (Assignable, Copyable, Equatable),
  classAddFeatures,
  )
import Foreign.Hoppy.Generator.Types (boolT, enumT, intT, objT, voidT)
import Foreign.Hoppy.Generator.Version (collect, just, test)
import Graphics.UI.Qtah.Generator.Flags (qtVersion)
import Graphics.UI.Qtah.Generator.Interface.Core.QString (c_QString)
import Graphics.UI.Qtah.Generator.Interface.Core.QStringList (c_QStringList)
import Graphics.UI.Qtah.Generator.Interface.Core.Types (e_GlobalColor, qreal)
import Graphics.UI.Qtah.Generator.Interface.Imports
import Graphics.UI.Qtah.Generator.Types
import Language.Haskell.Syntax (
  HsName (HsIdent),
  HsQName (UnQual),
  HsType (HsTyCon),
  )

{-# ANN module "HLint: ignore Use camelCase" #-}

aModule =
  AQtModule $
  makeQtModule ["Gui", "QColor"] $
  collect
  [ just $ QtExport $ ExportClass c_QColor
  , test (qtVersion >= [5, 2]) $ QtExport $ ExportEnum e_NameFormat
  , just $ QtExport $ ExportEnum e_Spec
  ]

-- TODO Everything using QRgb.
c_QColor =
  addReqIncludes [includeStd "QColor"] $
  classSetHaskellConversion conversion $
  classAddFeatures [Assignable, Copyable, Equatable] $
  makeClass (ident "QColor") Nothing []
  [ mkCtor "new" []
  , mkCtor "newRgb" [intT, intT, intT]
  , mkCtor "newRgba" [intT, intT, intT, intT]
  , mkCtor "newNamedColor" [objT c_QString]
  , mkCtor "newGlobalColor" [enumT e_GlobalColor]
  ] $
  collect
  [ just $ mkConstMethod "black" [] intT
  , just $ mkConstMethod "blackF" [] qreal
  , just $ mkStaticMethod "colorNames" [] $ objT c_QStringList
  , just $ mkConstMethod "convertTo" [enumT e_Spec] $ objT c_QColor
  , just $ mkConstMethod "cyan" [] intT
  , just $ mkConstMethod "cyanF" [] qreal
  , test (qtVersion >= [4, 3]) $ mkConstMethod' "darker" "darker" [] $ objT c_QColor
  , test (qtVersion >= [4, 3]) $ mkConstMethod' "darker" "darkerBy" [intT] $ objT c_QColor
  , test (qtVersion >= [4, 6]) $ mkConstMethod "hslHue" [] intT
  , test (qtVersion >= [4, 6]) $ mkConstMethod "hslHueF" [] qreal
  , test (qtVersion >= [4, 6]) $ mkConstMethod "hslSaturation" [] intT
  , test (qtVersion >= [4, 6]) $ mkConstMethod "hslSaturationF" [] qreal
  , just $ mkConstMethod "hsvHue" [] intT
  , just $ mkConstMethod "hsvHueF" [] qreal
  , just $ mkConstMethod "hsvSaturation" [] intT
  , just $ mkConstMethod "hsvSaturationF" [] qreal
  , just $ mkConstMethod "hue" [] intT
  , just $ mkConstMethod "hueF" [] qreal
  , just $ mkConstMethod "isValid" [] boolT
  , test (qtVersion >= [4, 7]) $ mkStaticMethod "isValidColor" [objT c_QString] boolT
  , test (qtVersion >= [4, 3]) $ mkConstMethod' "lighter" "lighter" [] $ objT c_QColor
  , test (qtVersion >= [4, 3]) $ mkConstMethod' "lighter" "lighterBy" [intT] $ objT c_QColor
  , test (qtVersion >= [4, 6]) $ mkConstMethod "lightness" [] intT
  , test (qtVersion >= [4, 6]) $ mkConstMethod "lightnessF" [] qreal
  , just $ mkConstMethod "magenta" [] intT
  , just $ mkConstMethod "magentaF" [] qreal
  , just $ mkConstMethod' "name" "name" [] $ objT c_QString
  , test (qtVersion >= [5, 2]) $
    mkConstMethod' "name" "nameWithFormat" [enumT e_NameFormat] $ objT c_QString
  , just $ mkConstMethod "saturation" [] intT
  , just $ mkConstMethod "saturationF" [] qreal
  , just $ mkMethod' "setCmyk" "setCmyk" [intT, intT, intT, intT] voidT
  , just $ mkMethod' "setCmyk" "setCmyka" [intT, intT, intT, intT, intT] voidT
  , just $ mkMethod' "setCmykF" "setCmykF" [qreal, qreal, qreal, qreal] voidT
  , just $ mkMethod' "setCmykF" "setCmykaF" [qreal, qreal, qreal, qreal, qreal] voidT
  , test (qtVersion >= [4, 6]) $ mkMethod' "setHsl" "setHsl" [intT, intT, intT] voidT
  , test (qtVersion >= [4, 6]) $ mkMethod' "setHsl" "setHsla" [intT, intT, intT, intT] voidT
  , test (qtVersion >= [4, 6]) $ mkMethod' "setHslF" "setHslF" [qreal, qreal, qreal] voidT
  , test (qtVersion >= [4, 6]) $ mkMethod' "setHslF" "setHslaF" [qreal, qreal, qreal, qreal] voidT
  , just $ mkMethod' "setHsv" "setHsv" [intT, intT, intT] voidT
  , just $ mkMethod' "setHsv" "setHsva" [intT, intT, intT, intT] voidT
  , just $ mkMethod' "setHsvF" "setHsvF" [qreal, qreal, qreal] voidT
  , just $ mkMethod' "setHsvF" "setHsvaF" [qreal, qreal, qreal, qreal] voidT
  , just $ mkMethod "setNamedColor" [objT c_QString] voidT
  , just $ mkMethod' "setRgb" "setRgb" [intT, intT, intT] voidT
  , just $ mkMethod' "setRgb" "setRgba" [intT, intT, intT, intT] voidT
  , just $ mkMethod' "setRgbF" "setRgbF" [qreal, qreal, qreal] voidT
  , just $ mkMethod' "setRgbF" "setRgbaF" [qreal, qreal, qreal, qreal] voidT
  , just $ mkConstMethod "spec" [] $ enumT e_Spec
  , just $ mkConstMethod "toCmyk" [] $ objT c_QColor
  , just $ mkConstMethod "toHsl" [] $ objT c_QColor
  , just $ mkConstMethod "toHsv" [] $ objT c_QColor
  , just $ mkConstMethod "toRgb" [] $ objT c_QColor
  , just $ mkConstMethod "value" [] intT
  , just $ mkConstMethod "valueF" [] qreal
  , just $ mkConstMethod "yellow" [] intT
  , just $ mkConstMethod "yellowF" [] qreal
  ] ++
  mkProps
  [ mkProp "alpha" intT
  , mkProp "alphaF" qreal
  , mkProp "blue" intT
  , mkProp "blueF" qreal
  , mkProp "green" intT
  , mkProp "greenF" qreal
  , mkProp "red" intT
  , mkProp "redF" qreal
  ]

  where
    components =
      [ ("Invalid", "", [])
      , ("Rgb", "rgba", ["red", "green", "blue", "alpha"])
      , ("Cmyk", "cmyka", ["cyan", "magenta", "yellow", "black", "alpha"])
      , ("Hsl", "hsla", ["hslHue", "hslSaturation", "lightness", "alpha"])
      , ("Hsv", "hsva", ["hsvHue", "hsvSaturation", "value", "alpha"])
      ]

    hColorImport = hsQualifiedImport "Graphics.UI.Qtah.Gui.HColor" "HColor"

    conversion =
      ClassHaskellConversion
      { classHaskellConversionType = do
        addImports hColorImport
        return $ HsTyCon $ UnQual $ HsIdent "HColor.HColor"

      , classHaskellConversionToCppFn = do
        addImports $ mconcat [importForPrelude,
                              importForRuntime,
                              hColorImport]
        sayLn "\\color' -> do"
        indent $ do
          sayLn "this' <- qColor_new"
          sayLn "case color' of"
          indent $ forM_ components $ \(spec, letters, _) ->
            saysLn $ concat
            [ ["HColor.", spec]
            , map (\var -> [' ', var, '\'']) letters
            , if null letters
              then [" -> QtahP.return ()"]
              else [" -> qColor_set", spec, "a this'"]
            , concatMap (\var -> [" (QtahFHR.coerceIntegral ", [var], "')"]) letters
            ]
          sayLn "QtahP.return this'"

      , classHaskellConversionFromCppFn = do
        addImports $ mconcat [hsImports "Prelude" ["($)", "(>>=)"],
                              importForPrelude,
                              importForRuntime,
                              hColorImport]
        sayLn "\\this' -> qColor_spec this' >>= \\spec' -> case spec' of"
        indent $ forM_ components $ \(spec, letters, getters) -> do
          saysLn ["QColorSpec_", spec, " -> do"]
          indent $ do
            forM_ (zip letters getters) $ \(var, get) ->
              saysLn [[var], "' <- QtahP.fmap QtahFHR.coerceIntegral $ qColor_", get, " this'"]
            saysLn $ ["QtahP.return $ HColor.", spec] ++ map (\var -> [' ', var, '\'']) letters
      }

-- Introduced in Qt 5.2.
e_NameFormat =
  makeQtEnum (ident1 "QColor" "NameFormat") [includeStd "QColor"]
  [ (0, ["hex", "rgb"])
  , (1, ["hex", "argb"])
  ]

e_Spec =
  makeQtEnum (ident1 "QColor" "Spec") [includeStd "QColor"]
  [ (0, ["invalid"])
  , (1, ["rgb"])
  , (2, ["hsv"])
  , (3, ["cmyk"])
  , (4, ["hsl"])
  ]
