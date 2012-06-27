          .file     "program.xc"
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
.extern _exit, "f{0}(si)"
.extern _done, "f{0}(0)"
.extern _open, "f{si}(&(a(:c:uc)),si,ui)"
.extern _close, "f{si}(si)"
.extern _read, "f{si}(si,&(a(:uc)),ui)"
.extern _write, "f{si}(si,&(a(:c:uc)),ui)"
.extern _lseek, "f{sl}(si,sl,si)"
.extern _remove, "f{si}(&(a(:c:uc)))"
.extern _rename, "f{si}(&(a(:c:uc)),&(a(:c:uc)))"
.extern _system, "f{si}(&(a(:c:uc)))"
.extern _time, "f{sl}(n:&(sl))"
.extern _exception, "f{0}(ui,ui)"
.extern _is_simulation, "f{si}(0)"
.extern _plugins, "f{0}(si,ui,ui)"
.extern exceptionHandler, "f{0}(0)"
.extern _main, "f{0}(0)"
.extern _createProcess, "f{0}(ui,&(a(:ui)))"
.extern initConnections, "f{0}(0)"
.extern _connectMaster, "f{ui}(si,si)"
.extern _connectSlave, "f{ui}(si,si)"
.extern _connectServer, "f{ui}(si)"
.extern _connectClient, "f{ui}(si,si)"
.extern serveConnReq, "f{0}(0)"
.extern _pointerUnsigned, "f{ui}(&(ui))"
.extern _pointerInt, "f{ui}(&(si))"
.extern _procId, "f{si}(0)"
.extern _memAlloc, "f{si}(&(ui),si)"
.extern _memFree, "f{si}(ui)"
.extern resetChanends, "f{0}(0)"
.extern initChanends, "f{0}(0)"
.extern initPorts, "f{0}(0)"
.extern initMemory, "f{0}(0)"
.extern masterSync, "f{0}(0)"
.extern slaveSync, "f{0}(0)"
.extern newAsyncThread, "f{0}(ui,ui,ui,ui,ui)"
.extern getAvailThreads, "f{si}(0)"
.extern claimAsyncThread, "f{ui}(0)"
.extern claimSyncThread, "f{ui}(ui)"
.extern releaseThread, "f{0}(0)"
.extern claimStackSlot, "f{ui}(si)"
.extern releaseStackSlot, "f{0}(si)"
.extern memAlloc, "f{ui}(ui)"
.extern memFree, "f{0}(ui)"
.extern readSSwitchReg, "f{0}(si,si,&(ui))"
.extern writeSSwitchReg, "f{0}(si,si,ui)"
          .text
          .align    2
.cc_top mulf8_24.function,mulf8_24
          .align    4
.call mulf8_24, __builtin_macs
.set __builtin_macs, 0
.linkset __builtin_macs.locnoside, 1
.linkset __builtin_macs.locnochandec, 1
.globl mulf8_24, "f{si}(si,si)"
.globl mulf8_24.nstackwords
.globl mulf8_24.maxthreads
.globl mulf8_24.maxtimers
.globl mulf8_24.maxchanends
.globl mulf8_24.maxsync
.type  mulf8_24, @function
.linkset mulf8_24.locnoside, 1
.linkset mulf8_24.locnochandec, 1
.linkset mulf8_24.nstackwords, 0
mulf8_24:
.L2:
          ldc       r3, 0x0
          ldc       r2, 0x8000
          maccs     r3, r2, r0, r1
.L3:
          shl       r1, r3, 0x8
          shr       r0, r2, 0x18
          or        r0, r1, r0
.L5:
          retsp     0x0 
.size mulf8_24, .-mulf8_24
.cc_bottom mulf8_24.function
.linkset mulf8_24.maxchanends, 0
.linkset mulf8_24.maxtimers, 0
.linkset mulf8_24.maxthreads, 1
.cc_top divf8_24.function,divf8_24
          .align    4
.globl divf8_24, "f{si}(si,si)"
.globl divf8_24.nstackwords
.globl divf8_24.maxthreads
.globl divf8_24.maxtimers
.globl divf8_24.maxchanends
.globl divf8_24.maxsync
.type  divf8_24, @function
.linkset divf8_24.locnoside, 1
.linkset divf8_24.locnochandec, 1
.linkset divf8_24.nstackwords, 0
divf8_24:
.L6:
          mkmsk     r3, 0x1
.L14:
          ldc       r11, 0x0
          lss       r2, r0, r11
          bt        r2, .L9 
.L8:
.L22:
          lss       r2, r1, r11
          bt        r2, .L17 
.L16:
.L24:
          ldivu r0,r2,r11,r0,r1
.L28:
          ldivu r2,r1,r2,r11,r1
.L32:
          shl       r1, r0, 0x18
          ldc       r0, 0x80
          add       r0, r2, r0
          shr       r0, r0, 0x8
          or        r0, r1, r0
.L33:
          mul       r0, r0, r3
.L35:
          retsp     0x0 
.L9:
.L12:
          mkmsk     r3, 0x20
.L13:
          neg       r0, r0
          bu        .L8 
.L17:
.L20:
          neg       r3, r3
.L21:
          neg       r1, r1
          bu        .L16 
.size divf8_24, .-divf8_24
.cc_bottom divf8_24.function
.linkset divf8_24.maxchanends, 0
.linkset divf8_24.maxtimers, 0
.linkset divf8_24.maxthreads, 1
.cc_top _readnextint.function,_readnextint
          .align    4
.call _readnextint, _read
.globl _readnextint, "f{0}(si,&(si))"
.globl _readnextint.nstackwords
.globl _readnextint.maxthreads
.globl _readnextint.maxtimers
.globl _readnextint.maxchanends
.globl _readnextint.maxsync
.type  _readnextint, @function
.linkset _readnextint.locnoside, 1
.linkset _readnextint.locnochandec, 1
.linkset .LLNK1, _read.nstackwords $M _read.nstackwords
.linkset .LLNK0, .LLNK1 + 1
.linkset _readnextint.nstackwords, .LLNK0
_readnextint:
          entsp     0x1 
.L38:
          ldc       r2, 0x4
          ldc       r3, 0x4
.L47:
          bl        _read 
.L42:
          mkmsk     r1, 0x20
          eq        r0, r0, r1
          eq        r0, r0, 0x0
          ecallf r0
.L46:
          retsp     0x1 
.size _readnextint, .-_readnextint
.cc_bottom _readnextint.function
.linkset _readnextint.maxchanends, _read.maxchanends
.linkset _readnextint.maxtimers, _read.maxtimers
.linkset .LLNK4, _read.maxthreads - 1
.linkset .LLNK3, 1 + .LLNK4
.linkset .LLNK2, 1 $M .LLNK3
.linkset _readnextint.maxthreads, .LLNK2
.cc_top _writenextint.function,_writenextint
          .align    4
.call _writenextint, _write
.globl _writenextint, "f{0}(si,&(si))"
.globl _writenextint.nstackwords
.globl _writenextint.maxthreads
.globl _writenextint.maxtimers
.globl _writenextint.maxchanends
.globl _writenextint.maxsync
.type  _writenextint, @function
.linkset _writenextint.locnoside, 1
.linkset _writenextint.locnochandec, 1
.linkset .LLNK6, _write.nstackwords $M _write.nstackwords
.linkset .LLNK5, .LLNK6 + 1
.linkset _writenextint.nstackwords, .LLNK5
_writenextint:
          entsp     0x1 
.L50:
          ldc       r2, 0x4
          ldc       r3, 0x4
.L59:
          bl        _write 
.L54:
          mkmsk     r1, 0x20
          eq        r0, r0, r1
          eq        r0, r0, 0x0
          ecallf r0
.L58:
          retsp     0x1 
.size _writenextint, .-_writenextint
.cc_bottom _writenextint.function
.linkset _writenextint.maxchanends, _write.maxchanends
.linkset _writenextint.maxtimers, _write.maxtimers
.linkset .LLNK9, _write.maxthreads - 1
.linkset .LLNK8, 1 + .LLNK9
.linkset .LLNK7, 1 $M .LLNK8
.linkset _writenextint.maxthreads, .LLNK7
.cc_top crc.function,crc
          .align    4
.call crc, __builtin_crc32
.set __builtin_crc32, 0
.linkset __builtin_crc32.locnoside, 0
.linkset __builtin_crc32.locnochandec, 1
.globl crc, "f{si}(si)"
.globl crc.nstackwords
.globl crc.maxthreads
.globl crc.maxtimers
.globl crc.maxchanends
.globl crc.maxsync
.type  crc, @function
.linkset crc.locnoside, 1
.linkset crc.locnochandec, 1
.linkset crc.nstackwords, 0
crc:
.L60:
.L63:
          ldc       r1, 0x0
          not       r1, r1
          ldw       r2, cp[.LC0]
          .section .cp.const4,     "acM", @progbits, 4
.LC0:
          .align    4
          .int      0xedb88320

          .text
          crc32     r0, r1, r2
.L64:
.L66:
          retsp     0x0 
.size crc, .-crc
.cc_bottom crc.function
.linkset crc.maxchanends, 0
.linkset crc.maxtimers, 0
.linkset crc.maxthreads, 1
.cc_top rand.function,rand
          .align    4
.call rand, __builtin_crc32
.globpassesref __builtin_crc32, _seed, "program.xc:135: error: `rand' makes alias of global '_seed' in call to `__builtin_crc32'"
.globwrite rand, _seed, 0, 4, "program.xc:135: error: previously used here (bytes 0..4)"
.globread rand, _seed, 0, 4, "program.xc:136: error: previously used here (bytes 0..4)"
.globread rand, _seed, 0, 4, "program.xc:136: error: previously used here (bytes 0..4)"
.globread rand, _seed, 0, 4, "program.xc:136: error: previously used here (bytes 0..4)"
.globl rand, "f{si}(0)"
.globl rand.nstackwords
.globl rand.maxthreads
.globl rand.maxtimers
.globl rand.maxchanends
.globl rand.maxsync
.type  rand, @function
.linkset rand.locnoside, 1
.linkset rand.locnochandec, 1
.linkset rand.nstackwords, 0
rand:
.L69:
          ldc       r1, 0x0
          not       r0, r1
          ldw       r3, dp[_seed] 
          ldw       r2, cp[.LC0]
          crc32     r3, r0, r2
          stw       r3, dp[_seed] 
.L70:
          ldw       r0, dp[_seed] 
          lss       r1, r0, r1
          bt        r1, .L71 
.L73:
.L76:
          retsp     0x0 
.L71:
          neg       r0, r0
          bu        .L73 
.size rand, .-rand
.cc_bottom rand.function
.linkset rand.maxchanends, 0
.linkset rand.maxtimers, 0
.linkset rand.maxthreads, 1
.extern _memController, "f{0}(ui,ui,ui,ui)"
.cc_top mix_50_10_40_emulated.function,mix_50_10_40_emulated
          .align    4
.call mix_50_10_40_emulated, _memAlloc
.call mix_50_10_40_emulated, _memFree
