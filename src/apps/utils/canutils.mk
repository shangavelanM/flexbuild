

canutils:
	@[ $(DESTARCH) != arm64 -o $(DISTROVARIANT) != desktop ] && exit || \
	 $(call fbprint_b,"canutils") && \
	 $(call repo-mngr,fetch,canutils,apps/utils) && \
	 cp -r $(FBDIR)/patch/apps/canutils $(UTILSDIR)/ && \
	 cd $(UTILSDIR)/canutils && \
	 mkdir -p build_$(DISTROTYPE)_$(ARCH) && \
	 cd build_$(DISTROTYPE)_$(ARCH) && \
	 export CC=$(CROSS_COMPILE)gcc && \
	 cmake -S .. && \
	 $(MAKE) -j$(JOBS) && $(MAKE) install && \
	 $(call fbprint_d,"canutils build and installation completed")

