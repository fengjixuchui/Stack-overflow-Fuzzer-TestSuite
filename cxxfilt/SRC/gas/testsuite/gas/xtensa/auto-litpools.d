#as: --auto-litpools
#objdump: -d
#name: auto literal pool placement

.*: +file format .*xtensa.*
#...
.*8:.*l32r.a2, 4 .*
#...
.*3f029:.*j.3f030 .*
#...
.*40752:.*l32r.a2, 3f02c .*
#...