# Copyright 2021-2023 NXP
#
# SPDX-License-Identifier: BSD-3-Clause


# Alsa scenario state files to restore sound state at system boot and save it at system shut down


alsa_state:
	@[ $(SOCFAMILY) != IMX -o $(DISTROVARIANT) != desktop ] && exit || \
	 $(call fbprint_b,"alsa_state") && \
	 install -d $(DESTDIR)/var/lib/alsa && \
	 if [ "$(MACHINE)" = "sp2imx8mp" ]; then \
	     install -m 0644 $(FBDIR)/patch/alsa_state/sp2imx8mp_asound.state $(DESTDIR)/var/lib/alsa/asound.state; \
	 else \
	     install -m 0644 $(FBDIR)/patch/alsa_state/asound.state $(DESTDIR)/var/lib/alsa; \
	 fi && \
	 install -m 0644 $(FBDIR)/patch/alsa_state/asound.conf $(DESTDIR)/etc && \
	 $(call fbprint_d,"alsa_state")
