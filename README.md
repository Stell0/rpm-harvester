# rpm-harvester
This is a yumdownloader wrapper that download RPMs and SRPMs using its repo configuration instead of system ones.

Configuration
=============

Put repo files in yum.repos.d directory. If you whant to use different yum variables than those used in your system (basearch, distroversion ...) put them in yum_variables.conf

Examples
========

download vim

 ./get_rpms.sh vim 

download vim source rpm

 ./get_rpms.sh --source vim 

download vi and vim from myrepo

 ./get_rpms.sh --disablerepo=* --enablerepo=myrepo vi vi vi vim
