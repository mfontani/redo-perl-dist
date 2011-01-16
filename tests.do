# Tests should be run if .ttested is too old
redo-ifchange $(find t -type f -name '*.t'  | perl -nle'print"$_.ttested"')

# vim: syntax=sh :
