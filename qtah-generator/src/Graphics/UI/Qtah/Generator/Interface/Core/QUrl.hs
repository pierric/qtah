module Graphics.UI.Qtah.Generator.Interface.Core.QUrl (
  aModule,
  c_QUrl,
  ) where

import Foreign.Hoppy.Generator.Spec.ClassFeature
import Foreign.Hoppy.Generator.Types
import Foreign.Hoppy.Generator.Spec
import Graphics.UI.Qtah.Generator.Interface.Imports
import Graphics.UI.Qtah.Generator.Types
import Graphics.UI.Qtah.Generator.Interface.Core.QString (c_QString)

aModule =
  AQtModule $
  makeQtModule ["Core", "QUrl"]
  [ QtExport $ ExportClass c_QUrl ]

c_QUrl =
  addReqIncludes [includeStd "QUrl"] $
  classAddFeatures [Assignable, Copyable, Equatable] $
  classSetConversionToGc $
  makeClass (ident "QUrl") Nothing []
  [ mkCtor "new" []
  , mkCtor "newFromString" [constT $ refT $ objT c_QString]
  ] $
  [ ] 