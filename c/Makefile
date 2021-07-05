SUBDIRS := $(wildcard p*)

all: $(SUBDIRS)
$(SUBDIRS):
		mkdir -p bin
		$(MAKE) -C $@
		mv $@/$@ ./bin

clean:
	rm -r ./bin

.PHONY: all $(SUBDIRS) clean

