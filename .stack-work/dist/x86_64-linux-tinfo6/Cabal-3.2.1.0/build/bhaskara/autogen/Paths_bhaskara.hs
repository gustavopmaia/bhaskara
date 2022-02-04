{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_bhaskara (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/gustavo/projects/haskell/bhaskara/.stack-work/install/x86_64-linux-tinfo6/6ac71540c239db6fe1ccdeddfd628b52d89fb408d63f8f07b01707631eb85ccb/8.10.7/bin"
libdir     = "/home/gustavo/projects/haskell/bhaskara/.stack-work/install/x86_64-linux-tinfo6/6ac71540c239db6fe1ccdeddfd628b52d89fb408d63f8f07b01707631eb85ccb/8.10.7/lib/x86_64-linux-ghc-8.10.7/bhaskara-0.1.0.0-I7cl2VI9J0UJ5leg5qutW3-bhaskara"
dynlibdir  = "/home/gustavo/projects/haskell/bhaskara/.stack-work/install/x86_64-linux-tinfo6/6ac71540c239db6fe1ccdeddfd628b52d89fb408d63f8f07b01707631eb85ccb/8.10.7/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/home/gustavo/projects/haskell/bhaskara/.stack-work/install/x86_64-linux-tinfo6/6ac71540c239db6fe1ccdeddfd628b52d89fb408d63f8f07b01707631eb85ccb/8.10.7/share/x86_64-linux-ghc-8.10.7/bhaskara-0.1.0.0"
libexecdir = "/home/gustavo/projects/haskell/bhaskara/.stack-work/install/x86_64-linux-tinfo6/6ac71540c239db6fe1ccdeddfd628b52d89fb408d63f8f07b01707631eb85ccb/8.10.7/libexec/x86_64-linux-ghc-8.10.7/bhaskara-0.1.0.0"
sysconfdir = "/home/gustavo/projects/haskell/bhaskara/.stack-work/install/x86_64-linux-tinfo6/6ac71540c239db6fe1ccdeddfd628b52d89fb408d63f8f07b01707631eb85ccb/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "bhaskara_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "bhaskara_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "bhaskara_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "bhaskara_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "bhaskara_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "bhaskara_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
