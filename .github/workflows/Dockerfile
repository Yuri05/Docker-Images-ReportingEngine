ARG r_version
ARG os_version
ARG ospsuite_r_version

FROM ghcr.io/open-systems-pharmacology/ospsuite-r${r_version}-${os_version}:${ospsuite_r_version}

# Args are resetted by FROM! s. https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG re_version

ENTRYPOINT ["sh"]

# Copy installation scripts
RUN mkdir -p /tmp_setup 
COPY .github/workflows/*.R /tmp_setup/
COPY .github/workflows/*.sh /tmp_setup/
RUN chmod ugo+x /tmp_setup/*.sh

# Install OSP R packages
RUN /tmp_setup/install_packages.sh ${re_version}

# Cleanup
RUN rm -rf /tmp_setup

# run package tests
RUN R --no-save -e "setwd(system.file('tests', package = 'ospsuite.reportingengine')); source('testthat.R')"
