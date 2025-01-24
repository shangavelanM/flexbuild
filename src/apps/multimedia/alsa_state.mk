# Copyright 2021-2023 NXP
#
# SPDX-License-Identifier: BSD-3-Clause


# Alsa scenario state files to restore sound state at system boot and save it at system shut down


alsa_state:
	@[ $(SOCFAMILY) != IMX -o $(DISTROVARIANT) != desktop ] && exit || \
	 $(call fbprint_b,"alsa_state") && \
	 install -d $(DESTDIR)/var/lib/alsa && \
	 install -m 0644 $(FBDIR)/patch/alsa_state/asound.state $(DESTDIR)/var/lib/alsa && \
	 if [ "$(MACHINE)" = "sp2imx8mp" ]; then \
	     $(call fbprint_d,"alsa_state_sp2") && \
	     install -m 0644 $(FBDIR)/patch/alsa_state/sp2_asound.state $(DESTDIR)/var/lib/alsa/asound.state; \
	 fi && \
	 install -m 0644 $(FBDIR)/patch/alsa_state/asound.conf $(DESTDIR)/etc && \
	 $(call fbprint_d,"alsa_state")
