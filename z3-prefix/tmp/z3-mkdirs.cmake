# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/kabir-nagpal/Desktop/soltgp/soltgfrontend/z3-prefix/src/z3"
  "/home/kabir-nagpal/Desktop/soltgp/soltgfrontend/z3-prefix/src/z3-build"
  "/home/kabir-nagpal/Desktop/soltgp/soltgfrontend/run"
  "/home/kabir-nagpal/Desktop/soltgp/soltgfrontend/z3-prefix/tmp"
  "/home/kabir-nagpal/Desktop/soltgp/soltgfrontend/z3-prefix/src/z3-stamp"
  "/home/kabir-nagpal/Desktop/soltgp/soltgfrontend/z3-prefix/src"
  "/home/kabir-nagpal/Desktop/soltgp/soltgfrontend/z3-prefix/src/z3-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/kabir-nagpal/Desktop/soltgp/soltgfrontend/z3-prefix/src/z3-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/kabir-nagpal/Desktop/soltgp/soltgfrontend/z3-prefix/src/z3-stamp${cfgdir}") # cfgdir has leading slash
endif()
