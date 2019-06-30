### Libming 0.4.8
- Bug type: stack-overflow
- CVE ID: 
  - [issue#81](https://github.com/libming/libming/issues/181)
- Download:
  ```
  git clone https://github.com/libming/libming
  git checkout b72cc2fda0e8b3792b7b3f7361fc3f917f269433
  ```
- Reproduce: `listswf @@ `
- ASAN dumps the backtrace:

`POC`
```
AddressSanitizer:DEADLYSIGNAL
=================================================================
==12691==ERROR: AddressSanitizer: stack-overflow on address 0x7ffcbf939fe8 (pc 0x0000005bdd62 bp 0x7ffcbf93a040 sp 0x7ffcbf939ff0 T0)
    #0 0x5bdd61 in readUInt8 /home/hjwang/Mem_Obj/libming/util/read.c:129
    #1 0x577446 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:911:45
    #2 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #3 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #4 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #5 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #6 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #7 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #8 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #9 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #10 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #11 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #12 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #13 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #14 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #15 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #16 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #17 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #18 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #19 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #20 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #21 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #22 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #23 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #24 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #25 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #26 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #27 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #28 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #29 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #30 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #31 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #32 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #33 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #34 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #35 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #36 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #37 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #38 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #39 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #40 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #41 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #42 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #43 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #44 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #45 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #46 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #47 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #48 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #49 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #50 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #51 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #52 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #53 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #54 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #55 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #56 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #57 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #58 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #59 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #60 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #61 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #62 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #63 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #64 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #65 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #66 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #67 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #68 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #69 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #70 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #71 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #72 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #73 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #74 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #75 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #76 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #77 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #78 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #79 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #80 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #81 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #82 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #83 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #84 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #85 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #86 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #87 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #88 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #89 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #90 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #91 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #92 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #93 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #94 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #95 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #96 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #97 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #98 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #99 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #100 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #101 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #102 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #103 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #104 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #105 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #106 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #107 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #108 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #109 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #110 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #111 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #112 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #113 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #114 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #115 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #116 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #117 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #118 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #119 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #120 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #121 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #122 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #123 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #124 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #125 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #126 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #127 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #128 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #129 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #130 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #131 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #132 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #133 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #134 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #135 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #136 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #137 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #138 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #139 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #140 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #141 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #142 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #143 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #144 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #145 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #146 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #147 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #148 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #149 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #150 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #151 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #152 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #153 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #154 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #155 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #156 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #157 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #158 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #159 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #160 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #161 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #162 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #163 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #164 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #165 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #166 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #167 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #168 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #169 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #170 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #171 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #172 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #173 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #174 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #175 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #176 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #177 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #178 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #179 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #180 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #181 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #182 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #183 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #184 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #185 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #186 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #187 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #188 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #189 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #190 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #191 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #192 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #193 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #194 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #195 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #196 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #197 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #198 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #199 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #200 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #201 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #202 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #203 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #204 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #205 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #206 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #207 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #208 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #209 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #210 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #211 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #212 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #213 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #214 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #215 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #216 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #217 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #218 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #219 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #220 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #221 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #222 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #223 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #224 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #225 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #226 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #227 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #228 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #229 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #230 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #231 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #232 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #233 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #234 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #235 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #236 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #237 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #238 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #239 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #240 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #241 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #242 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #243 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #244 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #245 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #246 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #247 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #248 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #249 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4

SUMMARY: AddressSanitizer: stack-overflow /home/hjwang/Mem_Obj/libming/util/read.c:129 in readUInt8
==12691==ABORTING
```