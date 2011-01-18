# Syntax is checked by running the wanted perl interpreter
# (run-perl, a prerequisite) with options -wc FILE
# run-perl is on the Git repository root
GITROOT=./$(git rev-parse --show-cdup)
redo-ifchange $1
#echo "Checking syntax for $1" >/dev/stderr
$GITROOT/run-perl -I$GITROOT/lib -wc $1 > $3

# vim: syntax=sh :
