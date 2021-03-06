# This file is part of Qtah.
#
# Copyright 2016 Bryan Gardiner <bog@khumba.net>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

{ mkDerivation, base, Cabal, qt, qtah-generator, stdenv, lib
, enableSplitObjs ? null
, forceParallelBuilding ? false
}:
mkDerivation ({
  pname = "qtah-cpp";
  version = "0.1.2";
  src = ./.;
  libraryHaskellDepends = [ base Cabal qtah-generator ];
  librarySystemDepends = [ qt ];
  homepage = "http://khumba.net/projects/qtah";
  description = "Qt bindings for Haskell - C++ library";
  license = stdenv.lib.licenses.lgpl3Plus;

  preConfigure =
    if forceParallelBuilding then ''
      configureFlags+=" --ghc-option=-j$NIX_BUILD_CORES"
      export QTAH_BUILD_JOBS="$NIX_BUILD_CORES"
    '' else null;
} // lib.filterAttrs (k: v: v != null) { inherit enableSplitObjs; })
