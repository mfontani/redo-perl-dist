# run-perl is used so that a custom perl can be specified
# The syntax checker should check the syntax is OK for:
# - each executable file in bin/
# - each .pm file in lib/
# - each .t  file in t/
# For each of the kind of files above, we keep track of
# whether the file's syntax has been checked by using a
# file with the same name of the file, just with '.syntax'
# appended.
redo-ifchange run-perl \
    $(find lib -type f -name '*.pm' | perl -nle 'print"$_.syntax"') \
    $(find t   -type f -name '*.t'  | perl -nle 'print"$_.syntax"') \
    $(find bin -type f -perm 755    | perl -nle 'print"$_.syntax"')

# vim: syntax=sh :
