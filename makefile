# Jim Tao

# Macros
 GHC = ghc
 GHCFLAGS = -O3

# Dependency rules for non-file targets
all:
	$(GHC) $(GHCFLAGS) 01matrix.hs
	$(GHC) $(GHCFLAGS) gameoflife.hs
clean:
	rm 01matrix gameoflife
	rm -f *.o *.hi
clobber: clean
	rm -f *~ \#*\# core

