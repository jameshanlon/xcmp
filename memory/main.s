          .file     "main.xc"
          .section .netinfo,       "", @netinfo
          .int      0x1eaba15c
.extern configure_in_port_handshake, "f{0}(w:p,i:p,o:p,ck)"
.extern configure_out_port_handshake, "f{0}(w:p,i:p,o:p,ck,ui)"
.extern configure_in_port_strobed_master, "f{0}(w:p,o:p,:ck)"
.extern configure_out_port_strobed_master, "f{0}(w:p,o:p,:ck,ui)"
.extern configure_in_port_strobed_slave, "f{0}(w:p,i:p,ck)"
.extern configure_out_port_strobed_slave, "f{0}(w:p,i:p,ck,ui)"
.extern configure_in_port, "f{0}(w:p,:ck)"
.extern configure_out_port, "f{0}(w:p,:ck,ui)"
.extern configure_port_clock_output, "f{0}(w:p,:ck)"
.extern start_port, "f{0}(w:p)"
.extern stop_port, "f{0}(w:p)"
.extern configure_clock_src, "f{0}(ck,w:p)"
.extern configure_clock_ref, "f{0}(ck,uc)"
.extern configure_clock_rate, "f{0}(ck,ui,ui)"
.extern configure_clock_rate_at_least, "f{0}(ck,ui,ui)"
.extern configure_clock_rate_at_most, "f{0}(ck,ui,ui)"
.extern set_clock_src, "f{0}(ck,w:p)"
.extern set_clock_ref, "f{0}(ck)"
.extern set_clock_div, "f{0}(ck,uc)"
.extern set_clock_rise_delay, "f{0}(ck,ui)"
.extern set_clock_fall_delay, "f{0}(ck,ui)"
.extern set_port_clock, "f{0}(w:p,:ck)"
.extern set_port_ready_src, "f{0}(w:p,w:p)"
.extern set_clock_ready_src, "f{0}(ck,w:p)"
.extern set_clock_on, "f{0}(ck)"
.extern set_clock_off, "f{0}(ck)"
.extern start_clock, "f{0}(ck)"
.extern stop_clock, "f{0}(ck)"
.extern set_port_use_on, "f{0}(w:p)"
.extern set_port_use_off, "f{0}(w:p)"
.extern set_port_mode_data, "f{0}(w:p)"
.extern set_port_mode_clock, "f{0}(w:p)"
.extern set_port_mode_ready, "f{0}(w:p)"
.extern set_port_drive, "f{0}(w:p)"
.extern set_port_drive_low, "f{0}(w:p)"
.extern set_port_pull_up, "f{0}(w:p)"
.extern set_port_pull_down, "f{0}(w:p)"
.extern set_port_pull_none, "f{0}(w:p)"
.extern set_port_master, "f{0}(w:p)"
.extern set_port_slave, "f{0}(w:p)"
.extern set_port_no_ready, "f{0}(w:p)"
.extern set_port_strobed, "f{0}(w:p)"
.extern set_port_handshake, "f{0}(w:p)"
.extern set_port_no_sample_delay, "f{0}(w:p)"
.extern set_port_sample_delay, "f{0}(w:p)"
.extern set_port_no_inv, "f{0}(w:p)"
.extern set_port_inv, "f{0}(w:p)"
.extern set_port_shift_count, "f{0}(w:p,ui)"
.extern set_pad_delay, "f{0}(w:p,ui)"
.extern set_thread_fast_mode_on, "f{0}(0)"
.extern set_thread_fast_mode_off, "f{0}(0)"
.extern start_streaming_slave, "f{0}(chd)"
.extern start_streaming_master, "f{0}(chd)"
.extern stop_streaming_slave, "f{0}(chd)"
.extern stop_streaming_master, "f{0}(chd)"
.extern outuchar, "f{0}(chd,uc)"
.extern outuint, "f{0}(chd,ui)"
.extern inuchar, "f{uc}(chd)"
.extern inuint, "f{ui}(chd)"
.extern inuchar_byref, "f{0}(chd,&(uc))"
.extern inuint_byref, "f{0}(chd,&(ui))"
.extern sync, "f{0}(w:p)"
.extern peek, "f{ui}(w:p)"
.extern clearbuf, "f{0}(w:p)"
.extern endin, "f{ui}(w:p)"
.extern partin, "f{ui}(w:p,ui)"
.extern partout, "f{0}(w:p,ui,ui)"
.extern partout_timed, "f{ui}(w:p,ui,ui,ui)"
.extern partin_timestamped, "f{ui,ui}(w:p,ui)"
.extern partout_timestamped, "f{ui}(w:p,ui,ui)"
.extern outct, "f{0}(chd,uc)"
.extern chkct, "f{0}(chd,uc)"
.extern inct, "f{uc}(chd)"
.extern inct_byref, "f{0}(chd,&(uc))"
.extern testct, "f{si}(chd)"
.extern testwct, "f{si}(chd)"
.extern soutct, "f{0}(m:chd,uc)"
.extern schkct, "f{0}(m:chd,uc)"
.extern sinct, "f{uc}(m:chd)"
.extern sinct_byref, "f{0}(m:chd,&(uc))"
.extern stestct, "f{si}(m:chd)"
.extern stestwct, "f{si}(m:chd)"
.extern out_char_array, "ft{0}(chd,&(a(:c:uc)),ui)"
.extern in_char_array, "ft{0}(chd,&(a(:uc)),ui)"
.extern crc32, "f{0}(&(ui),ui,ui)"
.extern crc8shr, "f{ui}(&(ui),ui,ui)"
.extern lmul, "f{ui,ui}(ui,ui,ui,ui)"
.extern mac, "f{ui,ui}(ui,ui,ui,ui)"
.extern macs, "f{si,ui}(si,si,si,ui)"
.extern sext, "f{si}(ui,ui)"
.extern zext, "f{ui}(ui,ui)"
.extern pinseq, "f{0}(ui)"
.extern pinsneq, "f{0}(ui)"
.extern pinseq_at, "f{0}(ui,ui)"
.extern pinsneq_at, "f{0}(ui,ui)"
.extern timerafter, "f{0}(ui)"
.extern getps, "f{ui}(ui)"
.extern setps, "f{0}(ui,ui)"
.extern read_pswitch_reg, "f{si}(ui,ui,&(ui))"
.extern read_sswitch_reg, "f{si}(ui,ui,&(ui))"
.extern write_pswitch_reg, "f{si}(ui,ui,ui)"
.extern write_sswitch_reg, "f{si}(ui,ui,ui)"
.extern get_core_id, "f{ui}(0)"
.extern get_thread_id, "f{ui}(0)"
.extern __builtin_getid, "f{si}(0)"
.extern printchar, "f{si}(uc)"
.extern printcharln, "f{si}(uc)"
.extern printint, "f{si}(si)"
.extern printintln, "f{si}(si)"
.extern printuint, "f{si}(ui)"
.extern printuintln, "f{si}(ui)"
.extern printhex, "f{si}(ui)"
.extern printhexln, "f{si}(ui)"
.extern printstr, "f{si}(&(a(:c:uc)))"
.extern printstrln, "f{si}(&(a(:c:uc)))"
          .text
          .align    2
.cc_top foo.function,foo
          .align    4
.globl foo, "f{0}(0)"
.globl foo.nstackwords
.globl foo.maxthreads
.globl foo.maxtimers
.globl foo.maxchanends
.globl foo.maxsync
.type  foo, @function
.linkset foo.locnoside, 1
.linkset foo.locnochandec, 1
.linkset foo.nstackwords, 0
foo:
.L0:
          retsp     0x0 
.size foo, .-foo
.cc_bottom foo.function
.linkset foo.maxchanends, 0
.linkset foo.maxtimers, 0
.linkset foo.maxthreads, 1
.cc_top memory.function,memory
          .align    4
.globl memory, "f{0}(0)"
.globl memory.nstackwords
.globl memory.maxthreads
.globl memory.maxtimers
.globl memory.maxchanends
.globl memory.maxsync
.type  memory, @function
.linkset memory.locnoside, 1
.linkset memory.locnochandec, 1
.linkset memory.nstackwords, 0
memory:
.L1:
          ldc       r1, 0x2
          getr r0, 2
.L4:
          setd res[r0], r1
.L6:
          out res[r0], r0
.L7:
          retsp     0x0 
.size memory, .-memory
.cc_bottom memory.function
.linkset memory.maxchanends, 0
.linkset memory.maxtimers, 0
.linkset memory.maxthreads, 1
          .section .netinfo,       "", @netinfo
main.parinfo.debugstring0:
.asciiz "# 16 \"main.xc\""
main.parinfo.debugstring1:
.asciiz "# 15 \"main.xc\""
.cc_top main.parinfo.cc, main.parinfo
.globl main.parinfo, "pi"
.type  main.parinfo, @object
main.parinfo:
          .int      0x00000004
          .long __main_default_network
          .long main.parinfo.debugstring0
          .long main.parinfo.debugstring1
          .int      0x00000002
          .int      0x00000000
          .int      $N __main_xm_0
          .long stdcore
          .int      0x00000000
          .int      $N __main_xm_1
          .long stdcore + 4
          .int      0x00000000
.cc_bottom main.parinfo.cc
          .text
.cc_top __main_xm_1.function,__main_xm_1
          .align    4
.call __main_xm_1, memory
.globl __main_xm_1, "f{0}(0)"
.globl __main_xm_1.nstackwords
.globl __main_xm_1.maxthreads
.globl __main_xm_1.maxtimers
.globl __main_xm_1.maxchanends
.globl __main_xm_1.maxsync
.type  __main_xm_1, @function
.linkset __main_xm_1.locnoside, 1
.linkset __main_xm_1.locnochandec, 1
.linkset .LLNK1, memory.nstackwords $M memory.nstackwords
.linkset .LLNK0, .LLNK1 + 1
.linkset __main_xm_1.nstackwords, .LLNK0
__main_xm_1:
          entsp     0x1 
.L9:
.L11:
          bl        memory 
.L10:
          retsp     0x1 
.size __main_xm_1, .-__main_xm_1
.cc_bottom __main_xm_1.function
.linkset __main_xm_1.maxchanends, memory.maxchanends
.linkset __main_xm_1.maxtimers, memory.maxtimers
.linkset .LLNK4, memory.maxthreads - 1
.linkset .LLNK3, 1 + .LLNK4
.linkset .LLNK2, 1 $M .LLNK3
.linkset __main_xm_1.maxthreads, .LLNK2
.cc_top __main_xm_0.function,__main_xm_0
          .align    4
.call __main_xm_0, foo
.globl __main_xm_0, "f{0}(0)"
.globl __main_xm_0.nstackwords
.globl __main_xm_0.maxthreads
.globl __main_xm_0.maxtimers
.globl __main_xm_0.maxchanends
.globl __main_xm_0.maxsync
.type  __main_xm_0, @function
.linkset __main_xm_0.locnoside, 1
.linkset __main_xm_0.locnochandec, 1
.linkset .LLNK6, foo.nstackwords $M foo.nstackwords
.linkset .LLNK5, .LLNK6 + 1
.linkset __main_xm_0.nstackwords, .LLNK5
__main_xm_0:
          entsp     0x1 
.L13:
.L15:
          bl        foo 
.L14:
          retsp     0x1 
.size __main_xm_0, .-__main_xm_0
.cc_bottom __main_xm_0.function
.linkset __main_xm_0.maxchanends, foo.maxchanends
.linkset __main_xm_0.maxtimers, foo.maxtimers
.linkset .LLNK9, foo.maxthreads - 1
.linkset .LLNK8, 1 + .LLNK9
.linkset .LLNK7, 1 $M .LLNK8
.linkset __main_xm_0.maxthreads, .LLNK7
.par memory, foo, "main.xc:16: error: use of `%s' violates parallel usage rules"
# Thread names for recovering thread graph in linker
.set thread.anon.0, 0  #unreal
.set thread.anon.1, 0  #unreal
.set thread.anon.2, 0  #unreal
.set thread.anon.3, 0  #unreal
.set thread.anon.4, 0  #unreal
.extern __builtin_getid, "f{si}(0)"
.extern stdcore, "a(4:cr)"
.extern __builtin_getid, "f{si}(0)"
          .section .xtalabeltable,       "", @progbits
.L16:
          .int      .L17-.L16
          .int      0x00000000
          .asciiz   "/home/jamie/repos/xcmp/memory"
.cc_top __main_xm_0.function, __main_xm_0
          .asciiz  "main.xc"
          .int      0x00000015
          .int      0x00000015
# line info for line 21 
          .long    .L14
          .asciiz  "main.xc"
          .int      0x00000011
          .int      0x00000011
# line info for line 17 
          .long    .L13
.cc_bottom __main_xm_0.function
.cc_top __main_xm_1.function, __main_xm_1
          .asciiz  "main.xc"
          .int      0x00000015
          .int      0x00000015
# line info for line 21 
          .long    .L10
          .asciiz  "main.xc"
          .int      0x00000012
          .int      0x00000012
# line info for line 18 
          .long    .L9
.cc_bottom __main_xm_1.function
.cc_top memory.function, memory
          .asciiz  "main.xc"
          .int      0x0000000d
          .int      0x0000000d
# line info for line 13 
          .long    .L7
          .asciiz  "main.xc"
          .int      0x0000000c
          .int      0x0000000c
# line info for line 12 
          .long    .L6
          .asciiz  "main.xc"
          .int      0x0000000b
          .int      0x0000000b
# line info for line 11 
          .long    .L4
          .asciiz  "main.xc"
          .int      0x00000009
          .int      0x00000009
# line info for line 9 
          .long    .L1
.cc_bottom memory.function
.cc_top foo.function, foo
          .asciiz  "main.xc"
          .int      0x00000005
          .int      0x00000005
# line info for line 5 
          .long    .L0
.cc_bottom foo.function
.L17:
          .section .dp.data,       "adw", @progbits
.align 4
          .align    4
          .section .dp.bss,        "adw", @nobits
.align 4
          .ident    "XMOS 32-bit XC Compiler 11.2.2 (build 1981)"
          .core     "XS1"
          .corerev  "REVB"
