touch x
rm -rf x .redo/
touch x
rm x $(find . -name 'run-perl')
touch x
rm x $(find lib/ -name '*.pmtested')
touch x
rm x $(find lib/ -name '*.do')
touch x
rm x $(find lib/ -name '*.syntax')
touch x
rm x $(find t/ -name '*.syntax')
touch x
rm x $(find t/ -name '*.do')
touch x
rm x $(find t/ -name '*.ttested')
touch x
rm x $(find bin/ -name '*.do')
touch x
rm x $(find bin/ -name '*.syntax')

# vim: set filetype=sh :
