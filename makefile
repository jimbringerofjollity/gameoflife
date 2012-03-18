# Jim Tao

# Macros
 GHC = ghc
 GHCFLAGS = -O3
 CC = gcc
 CCFLAGS = -O3 -DNDEBUG

# Dependency rules for non-file targets
all:
	$(CC) $(CCFLAGS) 01matrix.c -o 01matrix
	$(GHC) $(GHCFLAGS) gameoflife.hs
clean:
	rm 01matrix gameoflife
	rm -f *.o *.hi *.tmp
clobber: clean
	rm -f *~ \#*\# core

