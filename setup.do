# Any executable in bin/ should be tested for syntax
pushd bin
    if [ ! -f default.syntax.do ]; then
        ln -s ./$(git rev-parse --show-cdup)/_default.syntax.do default.syntax.do >/dev/null 2>&1
    fi
popd
# Every directory in lib/ needs a link back to the _default.syntax.do
# so that all .pm files in the lib/ can be checked for syntax
for dir in $(find lib -type d); do
    pushd $dir
    if [ ! -f default.syntax.do ]; then
        ln -s ./$(git rev-parse --show-cdup)/_default.syntax.do default.syntax.do
    fi
    popd
done >/dev/null 2>&1
# Every directory under t/ also needs links to _default.ttested.do so that
# the tests can be run and dependencies checked.
for dir in $(find t -type d); do
    pushd $dir
    if [ ! -f default.syntax.do ]; then
        ln -s ./$(git rev-parse --show-cdup)/_default.syntax.do  default.syntax.do
    fi
    if [ ! -f default.ttested.do ]; then
        ln -s ./$(git rev-parse --show-cdup)/_default.ttested.do default.ttested.do
    fi
    popd
done > /dev/null 2>&1

exit 0

# vim: syntax=sh :
