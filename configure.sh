#!/bin/sh

# this is an example file...please DO NOT MODIFY if you don't want to do it for everyone
#to use it, copy it to another file and run it

# additional compiler flags could be added customizing the corresponding var, for example
# -DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -msse3 ". Note that the "defaults are already correctly coded"
#so we should ass here only machine specific stuff

#an effort is made to autodetect all of the libraries needed HOWEVER:
#METIS_APPLICATION needs the var PARMETIS_ROOT_DIR to be specified by the user (not needed if the app is set to OFF)
#TRILINOS_APPLICATION needs the var PARMETIS_ROOT_DIR to be specified by the user (not needed if the app is set to OFF)
#MKL_SOLVERS_APPLICATION needs the var MKLSOLVER_INCLUDE_DIR and MKLSOLVER_LIB_DIR to be specified by the user (not needed if the app is set to OFF)
#note that the MKLSOLVER_LIB_DIR should include /lib/em64t. This is needed as intel is changing location of mkl at every update of the compiler!!

#the user should also note that the symbol "\" marks that the command continues on the next line. IT SHOULD ONLY BE FOLLOWED
#BY the "ENTER" and NOT by any space!!

clear

#you may want to decomment this the first time you compile
rm -f CMakeCache.txt
rm -f *.cmake
rm -rf CMakeFiles\

cmake ..  									                     \
-DCMAKE_CXX_COMPILER=mpiicpc						             \
-DCMAKE_C_COMPILER=mpiicc			    			             \
-DTrilinos_DIR="$HOME/myprograms/Trilinos/install"               \
-DLifeV_ENABLE_ALL_PACKAGES=ON						             \
-DLifeV_ENABLE_TESTS=ON                                          \
-DLifeV_ENABLE_EXAMPLES=ON \

#decomment this to have it verbose
# make VERBOSE=1 -j4
#make -j4
#make install
