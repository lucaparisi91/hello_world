MF=	Makefile-archer2

# You will need to load some modules:
# 
# module use /work/z19/shared/sfarr/modulefiles
# module load adios/2.8.3
#
# module load cray-hdf5-parallel
# module load cray-netcdf-hdf5parallel
#


CC:=	CC
CPPFLAGS:=
LFLAGS:=

EXE=	hello

SRC= \
	hello.cpp


#
# No need to edit below this line
#

OBJ=	$(SRC:.cpp=.o)

all:	$(EXE)

%.o : %.cpp
		$(CC) -c $(CPPFLAGS) $< -o $@

$(EXE):	$(OBJ)
	$(CC) -o $@ $(OBJ) $(LFLAGS)


clean:
	rm -f $(OBJ) $(EXE)