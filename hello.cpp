#include <iostream>
#ifdef MPI
    #include <mpi.h>
#endif 

int main(int argc,char ** argv)
{

#ifndef MPI
    std::cout << "Hello World!"<<std::endl;
#endif

#ifdef MPI

    int rank,nRanks;

    MPI_Init(&argc,&argv);

    MPI_Comm_rank (MPI_COMM_WORLD, &rank);
    MPI_Comm_size (MPI_COMM_WORLD, &nRanks);

    for(int i=0;i<nRanks;i++)
    {
        if (rank == i) std::cout << "Hello World! from rank " << rank << std::endl;

        MPI_Barrier(MPI_COMM_WORLD);
    }

    MPI_Finalize();
#endif


};

