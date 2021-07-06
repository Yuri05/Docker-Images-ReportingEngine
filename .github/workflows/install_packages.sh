#!/bin/sh

# Get software 
wget -nv https://github.com/Open-Systems-Pharmacology/OSPSuite.ReportingEngine/releases/download/v$1/ospsuite.reportingengine_$1.tar.gz -P /tmp_setup/

# Install packages
R CMD INSTALL /tmp_setup/ospsuite.reportingengine_$1.tar.gz --install-tests
