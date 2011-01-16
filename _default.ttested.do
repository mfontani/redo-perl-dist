# Whether a test needs run depends on whether the .pm file
# mentioned in the test file use_ok() lines has been changed
# or if the test file itself has changed.
# Since both .pm and .t files are tested for syntax, and redo
# does not support multiple dependencies for one file, this
# depends on the .pm file's .syntax file, which is created
# whenever the .pm file changes.
GITROOT=./$(git rev-parse --show-cdup)
redo-ifchange $1 $(grep use_ok $1 | perl -nle"next unless /use_ok\W+([a-z0-9:]+)'/i;\$m=\$1;\$m=~s,::,/,g;print qq,$GITROOT/lib/\$m.pm.syntax,")
echo "Running test $1" > /dev/stderr
prove -I$GITROOT/lib $GITROOT/t/$1 > $3

# vim: syntax=sh :
