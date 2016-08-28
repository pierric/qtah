{-# LANGUAGE NoMonomorphismRestriction #-}

---------- GENERATED FILE, EDITS WILL BE LOST ----------

module Graphics.UI.Qtah.Qml.QJSValue (
  QJSValueValue (..),
  QJSValueConstPtr (..),
  QJSValuePtr (..),
  QJSValueConst,
  QJSValue,
  castConst,
  cast,
  downCastConst,
  downCast,
  new,
  newCopy,
  newFromBool,
  newFromDouble,
  newFromInt,
  newFromString,
  newFromUInt,
  aSSIGN,
  isArray,
  isBool,
  isCallable,
  isDate,
  isError,
  isNull,
  isNumber,
  isObject,
  isQObject,
  isRegExp,
  isString,
  isUndefined,
  isVariant,
  property,
  toBool,
  toInt,
  toUInt,
  toVariant,
  ) where

import Graphics.UI.Qtah.Generated.Qml.QJSValue
import Prelude ()


castConst = toQJSValueConst
cast = toQJSValue
downCastConst = downToQJSValueConst
downCast = downToQJSValue
new = qJSValue_new
newFromBool = qJSValue_newFromBool
newFromInt = qJSValue_newFromInt
newFromUInt = qJSValue_newFromUInt
newFromDouble = qJSValue_newFromDouble
newFromString = qJSValue_newFromString
newCopy = qJSValue_newCopy
isArray = qJSValue_isArray
isBool = qJSValue_isBool
isCallable = qJSValue_isCallable
isDate = qJSValue_isDate
isError = qJSValue_isError
isNull = qJSValue_isNull
isNumber = qJSValue_isNumber
isObject = qJSValue_isObject
isQObject = qJSValue_isQObject
isRegExp = qJSValue_isRegExp
isString = qJSValue_isString
isUndefined = qJSValue_isUndefined
isVariant = qJSValue_isVariant
property = qJSValue_property
toBool = qJSValue_toBool
toInt = qJSValue_toInt
toUInt = qJSValue_toUInt
toVariant = qJSValue_toVariant
aSSIGN = qJSValue_ASSIGN