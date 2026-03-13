FROM registry.access.redhat.com/ubi8/ubi-minimal

LABEL name="motorolasolution/vddk-init" \
      vendor="motorolasolution" \
      org.opencontainers.image.title="Motorola Solutions VDDK Init Image" \
      org.opencontainers.image.description="VDDK init image for VMware disk access during virtualization migration workflows." \
      org.opencontainers.image.vendor="motorolasolution" \
      org.opencontainers.image.authors="motorolasolution" \
      org.opencontainers.image.licenses="Proprietary" \
      org.opencontainers.image.source="Internal build" \
      org.opencontainers.image.documentation="README.md" \
      org.opencontainers.image.base.name="registry.access.redhat.com/ubi8/ubi-minimal"

