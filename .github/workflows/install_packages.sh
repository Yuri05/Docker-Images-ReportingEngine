#!/bin/sh

# Get software 
wget -nv https://github.com/Open-Systems-Pharmacology/OSPSuite.ReportingEngine/releases/download/v$1/ospsuite.reportingengine_$1.tar.gz -P /tmp_setup/

#TODO update tlf installation in the ospsuite-R docker image
wget -nv https://github.com/Open-Systems-Pharmacology/TLF-Library/releases/download/v1.4.89/tlf_1.4.89.tar.gz -P /tmp_setup/
R CMD INSTALL /tmp_setup/tlf_1.4.89.tar.gz --install-tests

# Install packages
R CMD INSTALL /tmp_setup/ospsuite.reportingengine_$1.tar.gz --install-tests
