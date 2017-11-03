PRGS =  mcmctree 
CC = cc # cc, gcc, cl

CFLAGS = -O3

LIBS = -lm # -lM

all : $(PRGS)

mcmctree : mcmctree.c  tools.c treesub.c treespace.c paml.h 
	$(CC) $(CFLAGS) -o $@ mcmctree.c tools.c $(LIBS)
	$(CC) $(CFLAGS) -o infinitesites -D INFINITESITES mcmctree.c tools.c $(LIBS)
