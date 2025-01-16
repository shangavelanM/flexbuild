beep:
	@[ $(SOCFAMILY) != IMX ] && exit || \
	 $(call fbprint_b,"beep") && \
	 $(call repo-mngr,fetch,beep,apps/utils) && \
	 cp -r $(FBDIR)/patch/apps/beep $(UTILSDIR)/ && \
	 cd $(UTILSDIR)/beep/src && \
	 sudo $(CROSS_COMPILE)gcc beep.c -o $(RFSDIR)/usr/local/bin/beep && \
	 $(call fbprint_d,"beep done")
