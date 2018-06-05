MATLABHOME = /lusr/share/software/matlab-r2007b
MEX        = $(MATLABHOME)/bin/mex
MEXEXT     = .$(shell $(MATLABHOME)/bin/mexext)
INCLUDELIB = -lm
INCLUDEDIR = -I$(MATLABHOME)/extern/include
CFLAGS      = -fPIC -D_GNU_SOURCE -pthread -fexceptions
COPTIMFLAGS = -O3 -msse2

MEXFILES = simonfunkMFGL_knn_U.mex 

all: $(MEXFILES:.mex=$(MEXEXT))

.PHONY: clean
clean:
	-rm -f $(MEXFILES:.mex=$(MEXEXT))

.SUFFIXES: .mexglx .mexa64 .mexmaci

.c.mexglx:
	$(MEX) CFLAGS='$(CFLAGS)' COPTIMFLAGS='$(COPTIMFLAGS)' $< \
        $(INCLUDEDIR) $(INCLUDELIB)

.c.mexa64:
	$(MEX) CFLAGS='$(CFLAGS)' COPTIMFLAGS='$(COPTIMFLAGS)'  -largeArrayDims $< \
        $(INCLUDEDIR) $(INCLUDELIB)

.c.mexmaci:
	$(MEX) CFLAGS='$(CFLAGS)' COPTIMFLAGS='$(COPTIMFLAGS)' $< \
        $(INCLUDEDIR) $(INCLUDELIB)
