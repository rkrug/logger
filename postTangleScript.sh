#!/bin/bash
# [[file:~/Documents/Projects/AlienManagementDrakensberg/sim/packages/logger/logger.org::*Post%20tangle%20script][Post\ tangle\ script:1]]
MAJORVERSION=$(cat <<'BABEL_TABLE'
0
BABEL_TABLE
)
MINORVERSION=$(cat <<'BABEL_TABLE'
0
BABEL_TABLE
)
PATCHVERSION=$(cat <<'BABEL_TABLE'
1
BABEL_TABLE
)
GITHASH=$(cat <<'BABEL_TABLE'
testhash
BABEL_TABLE
)
GITCOMMITDATE=$(cat <<'BABEL_TABLE'
testdate
BABEL_TABLE
)
VER=$(cat <<'BABEL_TABLE'
master
BABEL_TABLE
)
STATE=$(cat <<'BABEL_TABLE'
edited
BABEL_TABLE
)
  sed -i '' s/MAJORVERSION/$MAJORVERSION/ ./DESCRIPTION
  sed -i '' s/MINORVERSION/$MINORVERSION/ ./DESCRIPTION
  sed -i '' s/PATCHVERSION/$PATCHVERSION/ ./DESCRIPTION
  sed -i '' s/TODAYSDATE/`date +%Y-%m-%d_%H-%M`/ ./DESCRIPTION

  sed -i '' s/MAJORVERSION/$MAJORVERSION/ ./logger-package.R
  sed -i '' s/MINORVERSION/$MINORVERSION/ ./logger-package.R
  sed -i '' s/PATCHVERSION/$PATCHVERSION/ ./logger-package.R
  sed -i '' s/TODAYSDATE/`date +%Y-%m-%d_%H-%M`/ ./logger-package.R

  Rscript -e "library(roxygen2);roxygenize('pkg', roxygen.dir='pkg', copy.package=FALSE, unlink.target=FALSE)"
  rm -f ./postTangleScript.sh
# Post\ tangle\ script:1 ends here
