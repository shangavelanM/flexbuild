msgpacker:
	@[ $(SOCFAMILY) != IMX ] && exit || \
	 $(call fbprint_b,"msgpacker") && \
	 $(call repo-mngr,fetch,msgpacker,apps/utils) && \
	 cp -r $(FBDIR)/patch/apps/msgpacker $(UTILSDIR)/ && \
	 cd $(UTILSDIR)/msgpacker && \
	 sudo cp msgpacker.py $(RFSDIR)/usr/local/bin/msgpacker && \
	 $(call fbprint_d,"msgpacker")


