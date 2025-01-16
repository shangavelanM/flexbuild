spidevtest:
	@[ $(SOCFAMILY) != IMX ] && exit || \
	 $(call fbprint_b,"SPIDEVTEST") && \
	 $(call repo-mngr,fetch,spidevtest,apps/utils) && \
	 cp -r $(FBDIR)/patch/apps/spidevtest $(UTILSDIR)/ && \
	 cd $(UTILSDIR)/spidevtest/src && \
	 sudo $(CROSS_COMPILE)gcc spidev_test.c -o $(RFSDIR)/usr/local/bin/spidevtest && \
	 $(call fbprint_d,"SPIDEVTEST")
