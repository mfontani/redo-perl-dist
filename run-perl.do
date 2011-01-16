# Creates the run-perl for my perlbrew version

#echo "/usr/bin/perl \$@" > $3

echo "$HOME/perl5/perlbrew/bin/perl \$@" > $3
chmod +x $3

# vim: syntax=sh :
