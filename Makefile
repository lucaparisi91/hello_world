MF=	Makefile-archer2

# You will need to load some modules:
# 
# module use /work/z19/shared/sfarr/modulefiles
# module load adios/2.8.3
#
# module load cray-hdf5-parallel
# module load cray-netcdf-hdf5parallel
#

CXX?=CXX
PREFIX?=${PWD}

EXE:=	hello


SRC:= \
	hello.cpp


#
# No need to edit below this line
#


OBJ:=	$(SRC:.cpp=.o)


$(EXE):	$(OBJ)
	$(CXX) -o $@ $(OBJ) $(LFLAGS)


%.o : %.cpp
		$(CXX) -c $(CPPFLAGS) $< -o $@


clean:
	rm -f $(OBJ) $(EXE)

install: $(EXE)
	@echo "Installing..."
	mkdir -p $(PREFIX)
	mkdir -p $(PREFIX)/bin
	cp $(EXE) $(PREFIX)/bin
