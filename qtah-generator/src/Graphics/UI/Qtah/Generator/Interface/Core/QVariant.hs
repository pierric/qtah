module Graphics.UI.Qtah.Generator.Interface.Core.QVariant (
  aModule,
  c_QVariant,
  ) where

import Foreign.Hoppy.Generator.Spec.ClassFeature
import Foreign.Hoppy.Generator.Types
import Foreign.Hoppy.Generator.Spec
import Graphics.UI.Qtah.Generator.Interface.Imports
import Graphics.UI.Qtah.Generator.Types

aModule =
  AQtModule $
  makeQtModule ["Core", "QVariant"]
  [ QtExport $ ExportClass c_QVariant ]

c_QVariant =
  addReqIncludes [includeStd "QVariant"] $
  classAddFeatures [Assignable, Copyable, Equatable, Comparable] $
  classSetConversionToGc $
  makeClass (ident "QVariant") Nothing []
  [ mkCtor "newFromInt"  [intT]
  , mkCtor "newFromBool" [boolT]
  , mkCtor "new" []
  ] $
  [ ] 