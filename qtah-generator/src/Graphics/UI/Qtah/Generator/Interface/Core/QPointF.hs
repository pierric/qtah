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

{-# LANGUAGE CPP #-}

module Graphics.UI.Qtah.Generator.Interface.Core.QPointF (
  aModule,
  c_QPointF,
  ) where

#if !MIN_VERSION_base(4,8,0)
import Data.Monoid (mconcat)
#endif
import Foreign.Hoppy.Generator.Language.Haskell (
  addImports,
  indent,
  sayLn,
  )
import Foreign.Hoppy.Generator.Spec (
  ClassHaskellConversion (
    ClassHaskellConversion,
    classHaskellConversionFromCppFn,
    classHaskellConversionToCppFn,
    classHaskellConversionType
  ),
  Export (ExportClass),
  Operator (OpAddAssign, OpDivideAssign, OpMultiplyAssign, OpSubtractAssign),
  addReqIncludes,
  classSetHaskellConversion,
  hsImports,
  hsQualifiedImport,
  ident,
  includeStd,
  makeClass,
  mkConstMethod,
  mkCtor,
  mkMethod,
  mkProp,
  mkProps,
  mkStaticMethod,
  )
import Foreign.Hoppy.Generator.Spec.ClassFeature (
  ClassFeature (Assignable, Copyable, Equatable),
  classAddFeatures,
  )
import Foreign.Hoppy.Generator.Types (boolT, objT, refT)
import Foreign.Hoppy.Generator.Version (collect, just, test)
import Graphics.UI.Qtah.Generator.Flags (qtVersion)
import Graphics.UI.Qtah.Generator.Interface.Core.QPoint (c_QPoint)
import Graphics.UI.Qtah.Generator.Interface.Core.Types (qreal)
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
  makeQtModule ["Core", "QPointF"]
  [ QtExport $ ExportClass c_QPointF ]

c_QPointF =
  addReqIncludes [includeStd "QPointF"] $
  classSetHaskellConversion
    ClassHaskellConversion
    { classHaskellConversionType = do
      addImports $ hsQualifiedImport "Graphics.UI.Qtah.Core.HPointF" "HPointF"
      return $ HsTyCon $ UnQual $ HsIdent "HPointF.HPointF"
    , classHaskellConversionToCppFn = do
      addImports $ mconcat [hsImports "Control.Applicative" ["(<$>)", "(<*>)"],
                            hsQualifiedImport "Graphics.UI.Qtah.Core.HPointF" "HPointF"]
      sayLn "qPointF_new <$> HPointF.x <*> HPointF.y"
    , classHaskellConversionFromCppFn = do
      addImports $ mconcat [hsQualifiedImport "Graphics.UI.Qtah.Core.HPointF" "HPointF",
                            importForPrelude]
      sayLn "\\q -> do"
      indent $ do
        sayLn "y <- qPointF_x q"
        sayLn "x <- qPointF_y q"
        sayLn "QtahP.return (HPointF.HPointF x y)"
    } $
  classAddFeatures [Assignable, Copyable, Equatable] $
  makeClass (ident "QPointF") Nothing []
  [ mkCtor "newNull" []
  , mkCtor "new" [qreal, qreal]
  , mkCtor "newFromPoint" [objT c_QPoint]
  ] $
  collect
  [ test (qtVersion >= [5, 1]) $ mkStaticMethod "dotProduct" [objT c_QPointF, objT c_QPointF] qreal
  , just $ mkConstMethod "isNull" [] boolT
  , test (qtVersion >= [4, 6]) $ mkConstMethod "manhattanLength" [] qreal
  , just $ mkConstMethod "toPoint" [] $ objT c_QPoint
  , just $ mkMethod OpAddAssign [objT c_QPointF] $ refT $ objT c_QPointF
  , just $ mkMethod OpSubtractAssign [objT c_QPointF] $ refT $ objT c_QPointF
  , just $ mkMethod OpMultiplyAssign [qreal] $ refT $ objT c_QPointF
  , just $ mkMethod OpDivideAssign [qreal] $ refT $ objT c_QPointF
  ] ++
  mkProps
  [ mkProp "x" qreal
  , mkProp "y" qreal
  ]
