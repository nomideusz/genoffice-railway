FROM ghcr.io/linuxserver/baseimage-selkies:debiantrixie-3900c0f0-ls140

# upgrade: github genspark-ai/genoffice
ARG GENOFFICE_VERSION=0.11.829

ENV TITLE=GenOffice \
    NO_GAMEPAD=true \
    NO_DECOR=true \
    PIXELFLUX_WAYLAND=true

# Upstream starts Xvfb with a 15360x8640 screen, which pins ~600 MB for the
# framebuffer alone and OOM-kills the desktop on Railway's small plans.
# 4K is plenty; Selkies still resizes the desktop to the browser window.
ENV MAX_RES=3840x2160

RUN apt-get update && \
  curl -fsSL -o /tmp/genoffice.deb \
    "https://github.com/genspark-ai/genoffice/releases/download/v${GENOFFICE_VERSION}/genoffice_${GENOFFICE_VERSION}_amd64.deb" && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends /tmp/genoffice.deb && \
  cp /usr/share/icons/hicolor/512x512/apps/genoffice.png /usr/share/selkies/www/icon.png && \
  apt-get autoclean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ponytail: same as our other Selkies wrappers - an unauthenticated
# /healthcheck for Railway, a page-cache trimmer, plus the app launcher.
COPY root/ /
RUN chmod +x /custom-cont-init.d/20-healthcheck /custom-services.d/drop-file-cache /usr/local/bin/drop-file-cache /usr/bin/genoffice
