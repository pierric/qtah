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

{-# LANGUAGE ScopedTypeVariables #-}

module Graphics.UI.Qtah.EventTest (tests) where

import Control.Concurrent.MVar (modifyMVar_, newMVar, readMVar)
import Control.Monad (unless, when)
import Foreign (alloca, peek, poke)
import Foreign.Hoppy.Runtime (delete, withScopedPtr)
import qualified Graphics.UI.Qtah.Core.QCoreApplication as QCoreApplication
import qualified Graphics.UI.Qtah.Core.QEvent as QEvent
import qualified Graphics.UI.Qtah.Core.QObject as QObject
import Graphics.UI.Qtah.Event
import Graphics.UI.Qtah.Core.QCoreApplication (QCoreApplication)
import Test.HUnit (Test (TestList), (~:), (@?=), assertFailure)

tests :: QCoreApplication -> Test
tests _ =
  TestList
  [ "listener gets deleted when receiver is deleted" ~: alloca $ \deletedPtr -> do
    poke deletedPtr 0
    receiver <- QObject.new
    _ <- internalOnEvent receiver deletedPtr $ \_ _ -> return False
    delete receiver
    deleted <- peek deletedPtr
    unless (deleted == 1) $ assertFailure "Listener was not deleted."

  , "unregister works" ~: withScopedPtr QObject.new $ \receiver -> do
    countVar <- newMVar 0
    let eventType = QEvent.QEventType_Drop
    reg <- onAnyEvent receiver $ \_ event -> do
      receivedType <- QEvent.eventType event
      when (receivedType == eventType) $ modifyMVar_ countVar $ return . (+ 1)
      return True
    withScopedPtr (QEvent.new eventType) $ \event -> do
      _ <- QCoreApplication.sendEvent receiver event
      readMVar countVar >>= (@?= 1)
      unregister reg
      _ <- QCoreApplication.sendEvent receiver event
      readMVar countVar >>= (@?= 1)

  , "unregister is idempotent" ~: withScopedPtr QObject.new $ \receiver -> do
    reg <- onAnyEvent receiver $ \_ _ -> return False
    unregister reg
    unregister reg  -- Should not explode.
    unregister reg  -- Nor should this.
  ]
