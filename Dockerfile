# Use the prebuilt ShareLaTeX image as base
FROM ghcr.io/cuhk-haosun/sharelatex-base:main

# Switch to root to install packages
USER root

# Update tlmgr and install required TeX Live packages
RUN tlmgr update --self --all
    # tlmgr install \
    #   titlesec enumitem multirow textpos adjustbox \
    #   siunitx caption subcaption float booktabs 

# (Optional) Clean up tlmgr caches to reduce image size
##  # disables future backups, removes all existing backups
RUN tlmgr option -- autobackup 0 && tlmgr backup --clean --all


# Expose default ShareLaTeX port (optional, inherited from base image)
EXPOSE 80

USER sharelatex
# (Optional) set entrypoint/cmd if you need to override base behavior
# CMD ["run"]

