# Copied from either $ROSE_ROOT/include/rose-installed-make.cfg (when ROSE is compiled with Tup) or
# from $ROSE_ROOT/lib/rose-config.cfg (when ROSE is built with GNU Autotool).
include rose.cfg

PREFIX       = $(ROSE_PREFIX)
CC           = $(ROSE_CC)
CXX          = $(ROSE_CXX)
CPPFLAGS     = $(ROSE_CPPFLAGS)
CFLAGS       = $(ROSE_CFLAGS)
CXXFLAGS     = $(ROSE_CXXFLAGS)
LDFLAGS      = $(ROSE_LINK_RPATHS) $(ROSE_LDFLAGS) $(ROSE_LDFLAGS_SHARED)
ROSE_LIBTOOL = $(ROSE_PREFIX)/bin/libtool

# Work around broken ROSE include directories
CXXFLAGS += -I. -I$(ROSE_PREFIX)/include -I$(ROSE_PREFIX)/include/rose

example: example.o
	$(CXX) $(CPPFLAGS) -o $@ $< $(LDFLAGS)

# Make requires all dependencies to be listed explicitly. We don't do that
# for this little example, but rather just list the primary .C dependency.
example.o: example.C
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c $<
