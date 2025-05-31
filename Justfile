root := justfile_directory()

run year day part:
    #!/bin/sh
    set -euo pipefail
    SOLUTION_DIR="{{root}}/solutions/{{year}}/day{{day}}"
    cd $SOLUTION_DIR
    ghc -e 'Run.run Solution.part{{part}}' \
        {{root}}/common/run.hs \
        {{root}}/common/utils.hs \
        $SOLUTION_DIR/solution.hs

