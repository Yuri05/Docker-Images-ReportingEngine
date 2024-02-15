#!/bin/sh

# Get software 
wget -nv --no-check-certificate https://ci.appveyor.com/api/projects/open-systems-pharmacology-ci/ospsuite-r/artifacts/ospsuite_ubuntu18.tar.gz -P /tmp_setup/

# Install packages
R CMD INSTALL /tmp_setup/ospsuite_ubuntu18.tar.gz --install-tests
R --no-save -e "remotes::install_github('Open-Systems-Pharmacology/OSPSuite.ReportingEngine', ref ='develop')"