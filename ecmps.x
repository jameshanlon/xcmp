port instream      : 0;
port messagestream : 0;
port binstream     : 2 << 8;

val EOF           = 255;

val t_op          = 0;
val t_op1         = 1;
val t_op2         = 2;
val t_op3         = 3;
val t_op4         = 4;
val t_op5         = 5;
val t_op6         = 6;

val s_null        = 0;
val s_name        = 1;
val s_number      = 2;
val s_lbracket    = 3; 
val s_rbracket    = 4;
val s_dot         = 5;

val s_lparen      = 6;
val s_rparen      = 7;
val s_fncall      = 8;
val s_pcall       = 9;
val s_if          = 10;
val s_then        = 11;
val s_else        = 12;
val s_while       = 13;
val s_do          = 14;
val s_ass         = 15;
val s_skip        = 16;
val s_begin       = 17;
val s_end         = 18;
val s_semicolon   = 19;
val s_comma       = 20;
val s_var         = 21;
val s_array       = 22;
val s_body        = 23;
val s_proc        = 24;
val s_func        = 25;
val s_is          = 26;
val s_server      = 27;
val s_prog        = 28;

val s_not         = 32;
val s_not1        = 33;
val s_neg         = 34;

val s_val         = 35;
val s_string      = 36;
val s_res         = 37;

val s_chan        = 38;
val s_port        = 39;
val s_input       = 40;
val s_output      = 41;
val s_mstrseq     = 42;
val s_slaveseq    = 43;
val s_with        = 44;

val s_move        = 45;
val s_movein      = 46;
val s_moveout     = 47;

val s_and         = 48;
val s_or          = 49;
val s_on          = 50;
val s_with        = 51;   
val s_true        = 52;
val s_false       = 53;
val s_return      = 54;

val s_when        = 55;
val s_after       = 56;
val s_at          = 57;

val s_bit         = 58;
val s_prop1       = 59;

val s_valp        = 60;
val s_resp        = 61;

val s_endfile     = 62;

val s_timer       = 63;

val s_master      = 64;
val s_slave       = 65;
val s_ms          = 66;

val s_diadic      = 128;

val s_plus        = s_diadic + 0;
val s_minus       = s_diadic + 1;
val s_mult        = s_diadic + 2;
val s_div         = s_diadic + 3;
val s_rem         = s_diadic + 4;

val s_logor       = s_diadic + 5;
val s_logand      = s_diadic + 6;
val s_xor         = s_diadic + 7;
val s_lshift      = s_diadic + 8;
val s_rshift      = s_diadic + 9;

val s_eq          = s_diadic + 10;
val s_ne          = s_diadic + 11;
val s_ls          = s_diadic + 12;
val s_le          = s_diadic + 13;
val s_gr          = s_diadic + 14;
val s_ge          = s_diadic + 15;

val s_sub         = s_diadic + 16;
val s_lsub        = s_diadic + 17;
val s_bitsub      = s_diadic + 18;
val s_lbitsub     = s_diadic + 19;

val s_for         = s_diadic + 20;
val s_colon       = s_diadic + 21;

val i_l3          = 20;
val i_l2          = 40;

val i_add         = 2; 
val i_sub         = 3;
val i_shl         = 4;
val i_shr         = 5;
val i_eq          = 6;
val i_and         = 7;
val i_or          = 8;
val i_ldw         = 9;

val i_ld16s       = 10;
val i_ld8u        = 11;
val i_tsetr       = 17;
val i_lss         = 18;
val i_lsu         = 19;

val i_stw         = i_l3 + 0;
val i_xor         = i_l3 + 1; 
val i_ashr        = i_l3 + 2;
val i_ldawf       = i_l3 + 3;
val i_ldawb       = i_l3 + 4;
val i_lda16f      = i_l3 + 5;
val i_lda16b      = i_l3 + 6;
val i_mul         = i_l3 + 7;
val i_divs        = i_l3 + 8;
val i_divu        = i_l3 + 9;
val i_st16        = i_l3 + 10;
val i_st8         = i_l3 + 11;
val i_crc32       = i_l3 + 15;
val i_rems        = i_l3 + 18;
val i_remu        = i_l3 + 19;

val i_stwi        = 0; 
val i_ldwi        = 1;
val i_addi        = 12;
val i_subi        = 13;
val i_shli        = 14;
val i_shri        = 15;
val i_eqi         = 16;

val i_ashri       = i_l3 + 12;  
val i_ldawfi      = i_l3 + 13;
val i_ldawbi      = i_l3 + 14;
val i_inpw        = i_l3 + 20;
val i_outpw       = i_l3 + 21;

val i_stwdp       = 0; 
val i_stwsp       = 1;
val i_ldwdp       = 2;
val i_ldwsp       = 3;
val i_ldawdp      = 4;
val i_ldawsp      = 5;
val i_ldc         = 6;
val i_ldwcp       = 7;
val i_brft        = 8;
val i_brbt        = 9;
val i_brff        = 10;
val i_brbf        = 11;
val i_setci       = 38;

val i_blrf        = 0;
val i_blrb        = 1;
val i_ldapf       = 2;
val i_ldapb       = 3;
val i_blacp       = 4;
val i_ldwcpl      = 5;

val i_brfu        = 0;
val i_blat        = 1;
val i_extdp       = 2;
val i_kcalli      = 3;
val i_brbu        = 4;
val i_entsp       = 5;
val i_extsp       = 6;
val i_retsp       = 7;
val i_clrsr       = 8;
val i_setsr       = 9;
val i_kentsp      = 10;
val i_krestsp     = 11;
val i_getsr       = 12;
val i_ldawcp      = 13;

val i_tinitpc     = 0;
val i_tinitdp     = 2;
val i_tinitsp     = 4;
val i_tinitcp     = 6;
val i_andnot      = 10;
val i_sext        = 12;
val i_getts       = 14;
val i_zext        = 16;
val i_outct       = 18;
val i_not         = 22;
val i_neg         = 24;
val i_mkmsk       = 28;
val i_out         = 30;
val i_in          = 32;
val i_peek        = 34;
val i_setpsc      = 36;
val i_chkct       = 38;

val i_getst       = 1;
val i_outt        = 3;
val i_setd        = 5;
val i_tsetmr      = 7;
val i_eet         = 9;
val i_eef         = 11;
val i_setpt       = 15;
val i_inct        = 21;
val i_int         = 23;
val i_endin       = 25;
val i_outshr      = 31;
val i_inshr       = 33;
val i_testct      = 35;
val i_testwct     = 37;

val i_sexti       = 13;
val i_zexti       = 17;
val i_outcti      = 19;
val i_getr        = 20;
val i_mkmski      = 29;
val i_chkcti      = 39;

val i_bitrev      = i_l2 + 0; 
val i_clz         = i_l2 + 2;
val i_tinitlr     = i_l2 + 4;
val i_setps       = i_l2 + 6;
val i_testlcl     = i_l2 + 8;
val i_setrdy      = i_l2 + 10;
val i_setn        = i_l2 + 12;

val i_byterev     = i_l2 + 1;
val i_setclk      = i_l2 + 3;
val i_getps       = i_l2 + 5;
val i_getd        = i_l2 + 7;
val i_settw       = i_l2 + 9;
val i_setc        = i_l2 + 11;
val i_getn        = i_l2 + 13;

val i_edu         = 0;
val i_eeu         = 1;
val i_waitet      = 2;
val i_waitef      = 3;
val i_freer       = 4;
val i_mjoin       = 5;
val i_tstart      = 6;
val i_msync       = 7;
val i_bla         = 8;
val i_bau         = 9;
val i_bru         = 10;
val i_setsp       = 11;
val i_setdp       = 12;
val i_setcp       = 13;
val i_dgetreg     = 14;
val i_setev       = 15;
val i_kcall       = 16;
val i_setv        = 17;
val i_ecallf      = 18;
val i_ecallt      = 19;
val i_clrpt       = 32;
val i_syncr       = 33;

val i_waiteu      = 0;
val i_clre        = 1;
val i_ssync       = 2;
val i_freet       = 3;
val i_dcall       = 4;
val i_kret        = 5;
val i_dret        = 6;
val i_setkp       = 7;
val i_ldspc       = 8;
val i_stspc       = 9;
val i_ldssr       = 10;
val i_stssr       = 11;
val i_stsed       = 12;
val i_stet        = 13;
val i_geted       = 14;
val i_getet       = 15;
val i_dentsp      = 16;
val i_drestsp     = 17;
val i_getid       = 18;
val i_getkep      = 19;
val i_getksp      = 20;
val i_ldsed       = 21;
val i_ldet        = 22;

val r_timer       = 1;
val r_chan        = 2;
val r_sync        = 3;

val c_uncond      = 1;
val c_after       = 9;

val tr_dis        = 0;
val tr_enb        = 1; 
  
val tr_toward     = 2;    
val tr_unco       = 3;   

val tr_after      = 4;
val tr_eq         = 5;
val tr_ne         = 6;
val tr_gr         = 7;
val tr_ls         = 8;


val treemax = 70000;

val linemax = 200;
val nametablesize = 128;
val nil = 0;

val hashmask = 127;

val bytesperword = 4;

var outstream;

var stree[treemax];
chan tree;

var treep;

var namenode;

var numval;

var symbol;

var nametable[nametablesize];

var wordv[100];
var wordp;
var wordsize;

var charv[100];
var charp;
var ch;

var linev[linemax];
var linep;
var linelength;

var linecount;

var prog;

val reg_min      = 0;
val reg_pmax     = 8;
val reg_max      = 11;
val reg_fnres    = 10;
val reg_gdest    = 11;
val reg_link     = 12;
val reg_stack    = 13;
val reg_data     = 14;
val reg_glob     = 15;

var names_n[1000];
var names_t[1000];
var names_d[1000];

var namep;
var nameb;

val n_local      = 0;
val n_global     = 1;
val n_proc       = 2;
val n_server     = 3;
val n_val        = 4;

val rsim_min      = 0;
val rsim_max      = 11;
val rsim_size     = 12;

var rsim_free[rsim_size];
var rsim_temp[rsim_size];
var rsim_hasvar[rsim_size];
var rsim_var[rsim_size];
var rsim_hasval[rsim_size];
var rsim_val[rsim_size];


var params_d[reg_max+1];
var params_x[reg_max+1];
var params_r[reg_max+1];

var param_count;
var param_min;

var v_state[32];
var v_vars[32];
var v_offs[32];

var varcount;
var topvarcount;

var skipnode;

var consts[1000];
var constp;

var insequence;

var strings[1000];
var stringp;

val g_num       = 0;
val g_lab       = 1;
val g_string    = 2;

var globvars;
var globvarcount;

var labelcount; 

var optimising;
var arrayspace;
var arraycount;

var binsize;
var codesize;

var stackoffset;
var frameoffset;

var procname;
var proclabel;
var procfreevars;

val b_stack      = #10;
val b_frame      = #20;
val b_reg        = #40;
val b_mem        = #80;
val b_malloc     = #100;
val b_rlock      = #200;
val b_regmask    = #F;

var lru_list[rsim_size];
var lru_size;

var stk_size;
var stk_max;

var frm_size;

var frm_start;

val labval_size  = 4000;
var labval[labval_size];

val cb_size      = 20000;
val cbf_lab      = 1 << 18;
val cbf_prog     = 2 << 18;
val cbf_stk      = 3 << 18;
val cbf_stkpos   = 4 << 18;
val cbf_stkrst   = 5 << 18;
val cbf_const    = 6 << 18;
val cbf_string   = 7 << 18;
val cbf_flags    = 7 << 18;
val cbf_long     = 1 << 21;

val cb_lablower  = 1023;
val cb_labupper  = 3 << 16;


var codebuffer[cb_size];
var cb_bufferp;
var cb_nextout;
var cb_pstart;
var cb_instcount;
var cb_loadpoint;
var cb_conststart;
var cb_stringstart;

var stackpoints[10];
var stackpp;

val ps_f          = #10;
val ps_1          = #20;
val pt_f          = #40;
val pt_1          = #80;

val p_reg         = #F;

val ct_null       = #0;
val ct_eom        = #1;
val ct_read       = #3;
val ct_write      = #4;

val sp_on         = #8;

proc main() is
{ treeserve() 
  & { 
      selectoutput(messagestream);  

      formtree();
      prints("%% tree size: "); printn(treep); newline(); 

      initbuffer();
  
      generate();

      tree !! ct_eom;

      prints("%% program size: "); printn(codesize * 2); newline();
  
      prints("%% size: "); printn((binsize * 2) + (arrayspace * 4)); newline() 
  }
}

proc treeserve() is
  var running;
  var request;
  var addr;
  var data;
{ running := true;
  while running do
  { tree$ ?? request;
    if request = 3
    then
    { tree$ ? addr;
      tree$ ! stree[addr]
    }
    else 
    if request = 4 
    then
    { tree$ ? addr;
      tree$ ? data;
      stree[addr] := data 
    }
    else
      running := false
  }
}


proc newline() is putval('\n')

proc prints(val s) is
  var n;
  var p;
  var w;
  var l;
  var b;
{ n := 1;
  p := 0;
  w := s[p];
  l := w and 255;
  w := w >> 8;   
  b := 1;
  while (n <= l) do 
  { putval(w and 255);
    w := w >> 8; 
    n := n + 1;
    b := b + 1;
    if (b = bytesperword)
    then
    { b := 0;
      p := p + 1;
      w := s[p]
    }
    else skip
  }  
}

proc printn(val n) is
{ if n > 9 then printn(n/10) else skip;
  putval((n rem 10) + '0')
}


proc printhex(val n) is
  var d;
{ if n > 15 then printhex(n >> 4) else skip;
  d := n and 15;
  if d < 10 
  then putval(d + '0')
  else putval((d - 10) + 'a')
}


proc putval(val c) is outstream ! c

proc selectoutput(val c) is outstream := c

proc formtree() is
var i;
var d;
  
{ linep := 0;
  wordp := 0;
  charp := 0;

  treep := 1;

  i := 0;
  while i < nametablesize do
  { nametable[i] := nil;
    i := i + 1
  };

  declsyswords();
  
  linecount := 0;
  
  rdline();
  rch();
  
  nextsymbol();
 
  d := rvardecls(); 
  prog := cons4(s_prog, 0, d, rprocdecls())

}  
 
proc cmperror(val s) is 
{ prints("error near line ");
  printn(linecount); prints(": ");
  prints(s);
  newline() 
}


func newvec(val n) is 
  var t;
{ t := treep
; treep := treep + n
; if treep > treemax then cmperror("out of space") else skip
; return t
}

func cons1(val op) is
  var t;
{ t := newvec(1)
; tree[t] := op
; return t
}

func cons2(val op, val t1) is
  var t;
{ t := newvec(2);
  tree[t] := op;
  tree[t+1] := t1;
  return t
}

func cons3(val op, val t1, val t2) is
  var t;
{ t := newvec(3);
  tree[t] := op;
  tree[t+1] := t1;
  tree[t+2] := t2;
  return t
}

func cons4(val op, val t1, val t2, val t3) is
  var t;
{ t := newvec(4);
  tree[t] := op;
  tree[t+1] := t1;
  tree[t+2] := t2;
  tree[t+3] := t3;
  return t
}

func cons5(val op, val t1, val t2, val t3, val t4) is
  var t;
{ t := newvec(5);
  tree[t] := op;
  tree[t+1] := t1;
  tree[t+2] := t2;
  tree[t+3] := t3;
  tree[t+4] := t4;
  return t
}

func cons6(val op, val t1, val t2, val t3, val t4, val t5) is
  var t;
{ t := newvec(6);
  tree[t] := op;
  tree[t+1] := t1;
  tree[t+2] := t2;
  tree[t+3] := t3;
  tree[t+4] := t4;
  tree[t+5] := t5;
  return t
}

func cons7(val op, val t1, val t2, val t3, val t4, val t5, val t6) is
  var t;
{ t := newvec(7);
  tree[t] := op;
  tree[t+1] := t1;
  tree[t+2] := t2;
  tree[t+3] := t3;
  tree[t+4] := t4;
  tree[t+5] := t5;
  tree[t+6] := t6;
  return t
}

func lookupword() is
  var a;
  var hashval;
  var i;
  var stype;
  var found;
  var searching;
{ a := wordv[0];
  hashval := ((a+(a>>3))+(wordv[wordsize]<<2)) and hashmask;
  namenode := nametable[hashval];
  found := false;
  searching := true;
  while searching do
  { if namenode = nil
    then 
    { found := false;
      searching := false
    }
    else
    { i := 0;
      while (i <= wordsize) and (tree[(namenode+i)+2] = wordv[i]) do
        i := i + 1;
      if i <= wordsize
      then 
        namenode := tree[namenode + 1]
      else 
      { stype := tree[namenode];
        found := true;
        searching := false
      }
    }   
  };
  if (found = false)
  then
  { namenode := newvec(wordsize+3);
    tree[namenode] := s_name;
    tree[namenode+1] := nametable[hashval];
    i := 0;
    while i <= wordsize do 
    { tree[(namenode+i)+2] := wordv[i];
      i := i + 1
    };
    nametable[hashval] := namenode;
    stype := s_name   
  }
  else skip;
  return stype
}


func packstring(val s, v) is 
  var n;
  var si;
  var vi;
  var w;
  var b;
{ n := s[0];
  si := 0;
  vi := 0;
  b := 0;
  w := 0;
  while si <= n do
  { w :=  w or (s[si] << (b<<3));
    b := b + 1;
    if (b = bytesperword) 
    then
    { v[vi] := w;
      vi := vi + 1;
      w := 0;
      b := 0  
    }
    else skip;
    si := si + 1
  };  
  if (b = 0)
  then
    vi := vi - 1
  else
    v[vi] := w; 
  return vi
}
  
proc unpackstring(val s, v) is
  var si;
  var vi;
  var b;
  var w;
  var n;
{ si := 0;
  vi := 0;
  b := 0;
  w := s[0];
  n := w and 255;
  while vi <= n do
  { v[vi] := w and 255;
    w := w >> 8;
    vi := vi + 1;
    b := b + 1;
    if b = bytesperword 
    then 
    { b := 0;
      si := si + 1; 
      w := s[si]
    }
    else skip  
  }
}

proc declare(val s, val item) is
{ unpackstring(s, charv);
  wordsize := packstring(charv, wordv);
  lookupword(); 
  tree[namenode] := item
}

proc declsyswords() is
{ declare("after", s_after);
  declare("and", s_logand);
  declare("at", s_at);
  declare("bit", s_bit);
  declare("chan", s_chan);
  declare("do", s_do);
  declare("else", s_else);
  declare("false", s_false);
  declare("for", s_for);
  declare("func", s_func);
  declare("if", s_if);
  declare("is", s_is);
  declare("or", s_logor);
  declare("port", s_port);
  declare("proc", s_proc);
  declare("rem", s_rem);
  declare("res", s_res);
  declare("return", s_return);
  declare("server", s_server);
  declare("skip", s_skip);
  declare("then", s_then);
  declare("timer", s_timer);
  declare("true", s_true);
  declare("val", s_val);
  declare("var", s_var);
  declare("when", s_when);
  declare("while", s_while);
  declare("with", s_with);
  declare("xor", s_xor)  
}  

func getchar() is 
  var c;
{ instream ? c; 
  return c
}

proc rdline() is
{ linelength := 1;
  linep := 1;
  linecount := linecount + 1;
  ch := getchar();
  linev[linelength] := ch;
  while (ch ~= '\n') and (ch ~= EOF) and (linelength < linemax) do
  { ch := getchar();
    linelength := linelength + 1;
    linev[linelength] := ch
  }  
}

proc rch() is
{ if (linep > linelength) then rdline() else skip; 
  ch := linev[linep];
  linep := linep + 1
}

proc rdtag() is
{ charp := 0;
  while ((ch>='A') and (ch<='Z')) or ((ch>='a') and (ch<='z')) or ((ch>='0') and (ch<='9')) or (ch = '_') do 
  { charp := charp + 1;
    charv[charp] := ch;
    rch()
  };
  charv[0] := charp;
  wordsize := packstring(charv, wordv)
}

proc readnumber(val base) is
  var d; 
{ d := value(ch);
  numval := 0;
  if (d >= base) then
    cmperror("error in number")
  else
    while (d < base) do
    { numval := (numval * base) + d;
      rch();
      d := value(ch)
    }
}

func value(val c) is
  var v;
{ if (c >= '0') and (c <= '9')
  then
    v := c - '0' 
  else
  if (c >= 'A') and (c <= 'Z')
  then
    v := (c + 10) - 'A'
  else
    v := 500;
  return v 
}

func readcharco() is
  var v;
{ if (ch = '\\')
  then
  { rch();
    if (ch = '\\')
    then 
     v := '\\'
    else
    if (ch = '\'')
    then
      v := '\''
    else
    if (ch = '\"')
    then
      v := '\"' 
    else
    if (ch = 'n')
    then
      v := '\n'
    else 
    if (ch = 'r')
    then 
      v := '\r'
    else
      cmperror("error in character constant")
  }
  else
    v := ch;
  rch();
  return v
}

proc readstring() is
  var charc;
{ charp := 0;
  while (ch ~= '\"') do
  { if (charp = 255)
    then cmperror("error in string constant")
    else skip;
    charc := readcharco();
    charp := charp + 1;
    charv[charp] := charc
  };
  charv[0] := charp;
  wordsize := packstring(charv, wordv)
}


proc nextsymbol() is
{ while (ch = '\n') or (ch = '\r') or (ch = ' ') do
     rch();   
  if (ch = '%') 
  then
  { rch();
    while (ch ~= '\n') do
      rch(); 
    nextsymbol()
  }
  else
  if ((ch >= 'A') and (ch <= 'Z')) or ((ch >= 'a') and (ch <= 'z'))  
  then
  { rdtag();
    symbol := lookupword()
  }
  else
  if (ch >= '0') and (ch <= '9')
  then
  { symbol := s_number;
    readnumber(10)
  }
  else
  if (ch = '#')
  then
  { rch();
    symbol := s_number;
    readnumber(16)
  }
  else 
  if (ch = '[')
  then 
  { rch();
    symbol := s_lbracket
  }  
  else 
  if (ch = ']')
  then
  { rch();
    symbol := s_rbracket
  }  
  else 
  if (ch = '(')
  then
  { rch();
    symbol := s_lparen
  }  
  else 
  if (ch = ')')
  then 
  { rch();
    symbol := s_rparen
  }  
  else 
  if (ch = '{')
  then
  { rch();
    symbol := s_begin
  }  
  else 
  if (ch = '}')
  then
  { rch();
    symbol := s_end
  }  
  else 
  if (ch = ';')
  then
  { rch();
    symbol := s_semicolon
  }  
  else 
  if (ch = ',')
  then
  { rch();
    symbol := s_comma
  }  
  else 
  if (ch = '+')
  then
  { rch();
    symbol := s_plus
  }  
  else 
  if (ch = '-')
  then
  { rch();
    symbol := s_minus
  }  
  else 
  if (ch = '*')
  then
  { rch();
    symbol := s_mult
  }  
  else 
  if (ch = '/')
  then
  { rch();
    symbol := s_div
  }  
  else 
  if (ch = '|')
  then
  { rch();
    symbol := s_or
  }  
  else 
  if (ch = '&')
  then
  { rch();
    symbol := s_and
  }  
  else 
  if (ch = '=')
  then
  { rch();
    symbol := s_eq
  }  
  else
  if (ch = '$') 
  then 
  { rch();
    symbol := s_master
  }
  else 
  if (ch = '?')
  then 
  { rch();
    if (ch = '?')
    then 
    { rch();
      symbol := s_movein
    }
    else
      symbol := s_input
  }
  else
  if (ch = '!')
  then 
  { rch();
    if (ch = '!')
    then 
    { rch();
      symbol := s_moveout
    }
    else 
      symbol := s_output
  }
  else
  if (ch = '<')
  then
  { rch();
    if (ch = '=')
    then
    { rch();
      symbol := s_le
    }
    else
    if (ch = '<')
    then
    { rch();
      symbol := s_lshift
    }
    else
      symbol := s_ls
  }  
  else
  if (ch = '>')
  then
  { rch();
    if (ch = '=')
    then
    { rch();
      symbol := s_ge
    }
    else
    if (ch = '>')
    then
    { rch();
      symbol := s_rshift
    }
    else
      symbol := s_gr
  }  
  else 
  if (ch = '~')
  then
  { rch();
    if (ch = '=')
    then
    { rch();
      symbol := s_ne
    }
    else
      symbol := s_not
  }  
  else
  if (ch = ':')
  then
  { rch();
    if (ch = ':')
    then
    { rch();
      if (ch = '=')
      then 
      { rch();
        symbol := s_move
      }
      else
        cmperror("illegal symbol")
    }
    else
    if (ch = '=')
    then
    { rch();
      symbol := s_ass
    }
    else
      symbol := s_colon
  }  
  else
  if (ch = '\'')
  then
  { rch();
    numval := readcharco();
    if (ch = '\'')
    then
      rch()
    else
      cmperror("error in character constant");      
    symbol := s_number
  }
  else
  if (ch = '\"')
  then
  { rch();
    readstring();
    if (ch = '\"')
    then
      rch()
    else
      cmperror("error in string constant");      
    symbol := s_string
  }   
  else
  if (ch = EOF)
  then
    symbol := s_endfile
  else
    cmperror("illegal character")
}


proc checkfor(val s, val m) is
{ if symbol = s
  then
    nextsymbol()
  else
    cmperror(m) 
}



func rname() is
  var a;
{ if symbol = s_name
  then
  {  a := namenode;
     nextsymbol();
     if symbol = s_master
     then
     { nextsymbol();
       a := cons2(s_master, a)
     }
     else skip
  }
  else 
    cmperror("name expected");
  return a
}

  
proc relement() is 
  var a;
  var b;
  var i;
{ if (symbol = s_name)
  then
  { a := rname();
    if (symbol = s_lbracket)
    then
    { nextsymbol(); 
      b := rexpression();
      a := cons3(s_sub, a, b); 
      checkfor(s_rbracket, "\']\' expected") 
    }
    else
    if (symbol = s_dot)
    then
    { nextsymbol();
      if (symbol = s_name)
      then
      { a := cons3(s_dot, a, rname());
        checkfor(s_lparen, "\'(\' expected");
        if (symbol = s_rparen)
        then
          b := nil 
        else
          b := rexplist();
        checkfor(s_rparen, "\')\' expected");
        a := cons4(s_fncall, a, b, 0)
      }
      else
        cmperror("name expected")
    }
    else
    if (symbol = s_lparen)
    then
    { nextsymbol();
      if (symbol = s_rparen)
      then
        b := nil 
      else
        b := rexplist();
      checkfor(s_rparen, "\')\' expected");
      a := cons4(s_fncall, a, b, 0)
    }
    else skip
  }
  else 
  if (symbol = s_number)
  then
  {  a := cons2(s_number, numval);
     nextsymbol()
  }
  else
  if ((symbol = s_true) or (symbol = s_false))
  then
  { a := namenode;
    nextsymbol()
  }  
  else
  if (symbol = s_string) 
  then
  { a := newvec(wordsize + 2); 
    tree[a + t_op] := s_string;
    i := 0;
    while i <= wordsize do
    { tree[a + i + 1] := wordv[i];
      i := i + 1
    };
    nextsymbol()
  }
  else
  if (symbol = s_lparen)
  then
  {  nextsymbol();
     a := rexpression();
     checkfor(s_rparen, "\')\' expected") 
  }
  else   
    cmperror("error in expression"); 
  return a
}

proc rexpression() is
  var a;
  var b;
  var s;
{ if (symbol = s_minus)
  then
  {  nextsymbol();
     b := relement();
     a := cons2(s_neg, b)
  }
  else
  if (symbol = s_not)
  then
  {  nextsymbol();
     b := relement();
     a := cons2(s_not, b)
  }
  else
  { a := relement();
    if ((symbol and s_diadic) ~= 0) 
    then
    { s := symbol;
      nextsymbol();
      a := cons3(s, a, rright(s))
    }
    else skip 
  };
  return a
}

proc rright(val s) is
  var b;
{ b := relement(); 
  if (associative(s) and (symbol = s))
  then
  { nextsymbol();
    b := cons3(s, b, rright(s))
  }
  else skip;   
  return b
}
    

func associative(val s) is 
  return (s = s_logand) or (s = s_logor) or (s = s_xor) or 
         (s = s_plus) or (s = s_mult)

        
func rstatement() is
  var a;
  var b;
  var c;
  var d; 
  var s;
{ if (symbol = s_skip)
  then
  { nextsymbol(); 
    a := cons1(s_skip)
  }
  else        
  if (symbol = s_return)
  then
  { nextsymbol();
    a := cons3(s_return, rexplist(), 0)
  }
  else
  if (symbol = s_if)
  then
  { nextsymbol();
    d := rexpression();
    if (symbol = s_when)
    then
    { nextsymbol();
      c := rstatement();
      checkinput(c);
      checkfor(s_do, "\'do\' expected");
      b := rstatement();
      a := cons6(s_when, d, c, b, 0, nil)
    }
    else
    if (symbol = s_then)
    then
    { nextsymbol();
      c := rstatement();
      checkfor(s_else, "\'else\' expected");
      b := rstatement();
      a := cons7(s_if, d, c, b, nil, nil, nil)
    }
    else
     cmperror("\'then\' or \'when\' expected")
  }
  else
  if (symbol = s_while)
  then
  { nextsymbol();
    c := rexpression();
    checkfor(s_do, "\'do\' expected");
    b := rstatement();
    a := cons5(s_while, c, b, nil, nil)
  }
  else
  if (symbol = s_when)
  then
  { nextsymbol();
    c := rstatement();
    checkinput(c);
    checkfor(s_do, "\'do\' expected");
    b := rstatement();
    a := cons6(s_when, nil, c, b, 0, nil)
  }
  else
  if (symbol = s_name) 
  then
  { a := rleft();
    if (tree[a + t_op] = s_fncall)
    then
      tree[a + t_op] := s_pcall
    else 
    if ((symbol = s_ass) or (symbol = s_move) or
        (symbol = s_input) or (symbol = s_output) or 
        (symbol = s_movein) or(symbol = s_moveout))
    then
    { s := symbol;
      nextsymbol();
      a := cons4(s, a, rexplist(), 0)
    }
    else
      cmperror("error in command") 
  }
  else
  if (symbol = s_with)
  then
  { nextsymbol();
    a := rname();
    if symbol = s_master
    then
    { nextsymbol();
      b := s_mstrseq
    }
    else
      b := s_slaveseq;
    checkfor(s_do, "\'do\' expected");
    b := rstatement();
    a := cons4(s, a, b, 0)
  }
  else 
  if (symbol = s_begin)
  then
  { nextsymbol();
    a := rstatements();
    checkfor(s_end, "\'}\' expected")
  }
  else
    cmperror("error in command");
  return a
}      


proc checkinput(val x) is 
  var op;
{ op := tree[x + t_op];
  if ((op ~= s_input) and (op ~= s_mstrseq) and (op ~= s_slaveseq) and (op ~= s_pcall))
  then
    cmperror("input expected")
  else skip
}

func rinput(val c) is
  var a;
{ a := nil;
  if (symbol = s_at) 
  then
  { nextsymbol();
    a := cons2(s_at, rexpression())
  }
  else
  if (symbol = s_after)
  then
  { nextsymbol();
    a := cons2(s_after, rexpression())
  }
  else
  { a := rleft();
    if (symbol = s_colon) 
    then
    { nextsymbol();
      a := cons3(s_colon, a, rexpression())
    }
    else skip
  };
  a := cons4(s_input, c, a, 0);
  return a
}      

func rleft() is
  var a;
  var b;
  var s;
{ a := relement();
  if (tree[a + t_op] = s_sub)
  then
    tree[a + t_op] := s_lsub
  else
  if ((tree[a + t_op] ~= s_name) and (tree[a + t_op] ~= s_master) and (tree[a + t_op] ~= s_fncall)) 
  then
    cmperror("error in command")
  else skip;  
  if (symbol = s_comma)
  then
  { nextsymbol();
    b := rleft();
    a := cons3(s_comma, a, b)
  }
  else skip;
  return a
}

func rstatements() is 
  var a;
  var b;
  var s;
{ a := rstatement();
  s := symbol;
  if (symbol = s_semicolon) or (symbol = s_or)
  then
  { nextsymbol();
    b := rstatements();
    a := cons4(s, a, b, 0)
  }
  else
  if (symbol = s_and)
  then
  { nextsymbol();
    b := rstatements();
    a := cons7(s_and, a, b, 0, 0, 0, 0)
  }
  else skip;
  return a
}

func rvardecls() is 
  var a;
  var b;
{ if ((symbol = s_chan) or (symbol = s_port) or (symbol = s_timer) or
      (symbol = s_var) or (symbol = s_val))
  then
  { a := rvardecl();
    checkfor(s_semicolon, "\';\' expected");
    while ((symbol = s_chan) or (symbol = s_port) or (symbol = s_timer) or
           (symbol = s_var) or (symbol = s_val)) do
    { b := rvardecl(); 
      checkfor(s_semicolon, "\';\' expected");
      a := cons3(s_semicolon, a, b)
    }
  } 
  else
    a := nil;  
  return a
}

func rprocdecls() is 
  var a;
  var b;
{ if (symbol = s_proc) or (symbol = s_func) 
  then
  { a := rprocdecl();
    while (symbol = s_proc) or (symbol = s_func) do
    { b := rprocdecl();
      a := cons3(s_semicolon, a, b)
    }
  }
  else
    a := nil;
  return a
}

func rexplist() is
  var a;
  var b;
{ a := rexpression();
  if (symbol = s_comma)
  then
  { nextsymbol();
    b := rexplist();
    a := cons3(s_comma, a, b)
  }
  else skip;
  return a
}

func rnamelist() is
  var a;
  var b;
{ a := rname();
  if (symbol = s_comma)
  then
  { nextsymbol();
    b := rnamelist();
    a := cons3(s_comma, a, b)
  }
  else skip;
  return a
}

func rvardecl() is
  var a;
  var b;
  var c;
{ if (symbol = s_chan)
  then
  { nextsymbol();
    a := rname();
    b := cons5(s_chan, a, -1, -1, s_slave);
    a := cons6(s_chan, a, -1, -1, s_ms, b)
  }
  else
  if (symbol = s_port)
  then
  { nextsymbol(); 
    if (symbol = s_name)
    then
    { b := rname();
      checkfor(s_colon, "\':\' expected");
      a := cons3(s_port, b, rexpression())
    }
    else 
      cmperror("name expected")
  }
  else
  if (symbol = s_timer)
  then
  { nextsymbol();
    a := cons4(s_timer, rname(), -1, -1)
  }
  else
  if (symbol = s_var)
  then
  { nextsymbol(); 
    if (symbol = s_name)
    then
    { a := rname();
      if (symbol = s_lbracket)
      then
      {  nextsymbol();
         b := rexpression();
         checkfor(s_rbracket, "\']\' expected");
         a := cons5(s_array, a, -1, -1, b) 
      }
      else
        a := cons4(s_var, a, -1, -1) 
    }
    else
      cmperror("name expected")
  }
  else
  if (symbol = s_val) 
  then
  { nextsymbol();
    if (symbol = s_name)
    then
    { a := rname();
      checkfor(s_eq, "\'=\' expected");
      b := rexpression();
      a := cons3(s_val, a, b)
    }
    else 
      cmperror("name expected")
  }
  else 
  if (symbol = s_server)
  then
  { nextsymbol();
    a := cons2(s_server, rvardecl())
  }
  else skip;
  return a
}


func rformals() is 
  var a;
  var b;
  var c;
{ if (symbol = s_val) 
  then
  { nextsymbol();
    if (symbol = s_name)
    then
      a := cons4(s_valp, rname(), -1, -1)
    else
      cmperror("name expected") 
  }
  else 
  if (symbol = s_res) 
  then
  { nextsymbol();
    if (symbol = s_name)
    then
      a := cons4(s_resp, rname(), -1, -1)
    else
      cmperror("name expected") 
  }
  else
  if (symbol = s_chan)
  then
  { nextsymbol();
    if symbol = s_name
    then
    { b := namenode;
      nextsymbol();
      if symbol = s_master
      then 
      { nextsymbol(); 
        c := s_master
      }
      else
        c := s_slave
    }
    else 
      cmperror("name expected");
    a := cons5(s_chan, b, -1, -1, c) 
  }
  else
  if (symbol = s_name) 
  then
  { b := rname();
    if (symbol = s_lbracket)
    then
    { nextsymbol();
      if (symbol = s_rbracket)
      then
      { nextsymbol();
        c := nil
      }
      else 
      { c := rexpression();
        checkfor(s_rbracket, "\']\' expected")
      };
      a := cons5(s_array, b, -1, -1, c)
    }
    else  
      a := cons4(s_var, b, -1, -1)
  }
  else
    cmperror("name expected"); 
  if (symbol = s_comma)
  then
  { nextsymbol();
    b := rformals();
    a := cons3(s_comma, a, b)
  }
  else skip;
  return a
}

func rbody() is 
  var a;
  var b;
{ a := rvardecls();
  b := rstatement();
  return cons3(s_body, a, b)
}

func rprocdecl() is  
  var a;
  var b;
  var c;
  var d;
  var s;
  var extp;
{ if ((symbol = s_proc) or (symbol = s_func))
  then
  { s := symbol; 
    nextsymbol();
    a := rname();
    checkfor(s_lparen, "\'(\' expected");
    if (symbol = s_rparen)
    then
      b := nil
    else 
      b := rformals();
    checkfor(s_rparen, "\')\' expected");
    checkfor(s_is, "\'is\' expected");
    c := rbody();
    d := cons5(s, a, b, c, 0)
  }        
  else 
  if (symbol = s_server)
  then
  { nextsymbol();
    d := cons2(s_server, rprocdecl())
  }
  else 
    cmperror("function or procedure definition expected");
  return d
}



proc namemessage(val s, val x) is
  var n;
  var p;
  var w;
  var l;
  var b;
{ prints(s);
  if (x ~= nil) 
  then
  { n := 1;
    p := 2;
    w := tree[x + p];
    l := w and 255;
    w := w >> 8;   
    b := 1;
    while (n <= l) do 
    { putval(w and 255);
      w := w >> 8; 
      n := n + 1;
      b := b + 1;
      if (b = bytesperword)
      then
      { b := 0;
        p := p + 1;
        w := tree[x + p]
      }
      else skip
    }  
  }
  else skip;
  newline()
}


proc generror(val s) is
{ prints(s); newline();
  namemessage("in function ", procname)
}


proc declprocs(val x) is
  var p;
{ if (tree[x + t_op] = s_semicolon)
  then
  { declprocs(tree[x + t_op1]);
    declprocs(tree[x + t_op2])
  }
  else
  if (tree[x + t_op] = s_server)
  then
  { p := tree[x + t_op1];
    names_n[namep] := tree[p + t_op1];
    names_t[namep] := n_server;
    names_d[namep] := x;
    tree[p + t_op4] := 0;
    namep := namep + 1
  }
  else
  { names_n[namep] := tree[x + t_op1];
    names_t[namep] := n_proc;
    names_d[namep] := x;
    tree[x + t_op4] := getlabel();
    namep := namep + 1
  }
}
   
proc scopeproc(val x) is
  var name;
  var body;
{ namep := nameb;
  varcount := 0;
  topvarcount := 0;
  if (tree[x + t_op2] ~= nil)
  then
    declformals(tree[x + t_op2])
  else skip;
  body := tree[x + t_op3]; 
  if (tree[body + t_op1] ~= nil) 
  then
    declvars(tree[body + t_op1], n_local)
  else skip;
  tree[x + t_op1] := scopenamesexpr(tree[x + t_op1]);
  scopenames(tree[body + t_op2])
}

proc declformals(val x) is
  var formals;
{ formals := x;
  while (tree[formals + t_op] = s_comma) do
  { declformal(tree[formals + t_op1]);
    formals := tree[formals + t_op2]
  };
  declformal(formals)
}

proc declformal(val x) is
{ names_n[namep] := tree[x + t_op1];    
  names_t[namep] := n_local;    
  names_d[namep] := x;  
  namep := namep + 1;
  setvnum(x)
}

proc declvars(val x, val t) is
{ if (tree[x + t_op] = s_semicolon) 
  then
  { declvars(tree[x + t_op1], t);
    declvars(tree[x + t_op2], t)
  }
  else
  if (tree[x + t_op] = s_port)
  then 
  { names_n[namep] := tree[x + t_op1];
    names_d[namep] := x;
    names_t[namep] := t;
    tree[x + t_op2] := scopenamesexpr(tree[x + t_op2]);
    namep := namep + 1
  }
  else
  if (tree[x + t_op] = s_var) or (tree[x + t_op] = s_chan) or (tree[x + t_op] = s_timer)
  then
  { names_n[namep] := tree[x + t_op1];
    names_d[namep] := x;
    names_t[namep] := t;    
    namep := namep + 1;
    if (t = n_local)
    then
    { setvnum(x);
      if (tree[x + t_op] = s_chan)
      then setvnum(tree[x + t_op5])
      else skip
    }
    else skip
  }
  else 
  if (tree[x + t_op] = s_array)
  then
  { names_n[namep] := tree[x + t_op1];
    names_d[namep] := x;
    names_t[namep] := t;
    namep := namep + 1;
    tree[x + t_op4] := scopenamesexpr(tree[x + t_op4])
  }
  else
  if (tree[x + t_op] = s_val)
  then
  { names_n[namep] := tree[x + t_op1];
    names_d[namep] := x;
    names_t[namep] := n_val;
    tree[x + t_op2] := scopenamesexpr(tree[x + t_op2]);
    namep := namep + 1
  }
  else skip
}

func findname(val x) is
  var n;
  var found;
{ found := false;
  n := namep - 1;
  while ((found = false) and (n >= 0)) do
  { if (names_n[n] = x)
    then
      found := true
    else
      n := n - 1
  };
  if (found ~= true) 
  then
  { namemessage("name not declared ", x);
    namemessage("in function", procname)
  }
  else skip;
  return n
}


proc scopenames(val x) is
  var op;
  var name;
  var ch; 
{ op := tree[x + t_op];
  if (op = s_skip)
  then
    skip
  else
  if (op = s_return)
  then
    tree[x + t_op1] := scopenamesexpr(tree[x + t_op1])
  else
  if (op = s_if)
  then
  { tree[x + t_op1] := scopenamesexpr(tree[x + t_op1]);
    scopenames(tree[x + t_op2]);
    scopenames(tree[x + t_op3])
  }
  else
  if (op = s_while)
  then
  { tree[x + t_op1] := scopenamesexpr(tree[x + t_op1]);
    scopenames(tree[x + t_op2])
  }  
  else
  if (op = s_ass) or (op = s_input) or (op = s_output) or
     (op = s_movein) or (op = s_moveout)
  then
  { tree[x + t_op2] := scopenamesexpr(tree[x + t_op2]);
    tree[x + t_op1] := scopenamesexpr(tree[x + t_op1])
  }
  else  
  if (op = s_pcall)
  then
  { if (tree[x + t_op2] ~= nil)
    then
      tree[x + t_op2] := scopenamesexpr(tree[x + t_op2])
    else skip;
    tree[x + t_op1] := scopenamesexpr(tree[x + t_op1])
  }   
  else
  if (op = s_when)
  then
  { if (tree[x + t_op1] ~= nil)
    then
      tree[x + t_op1] := scopenamesexpr(tree[x + t_op1])
    else skip;
    scopenames(tree[x + t_op2]);
    scopenames(tree[x + t_op3])
  }
  else
  if (op = s_mstrseq) or (op = s_slaveseq)
  then
  { tree[x + t_op1] := scopenamesexpr(tree[x + t_op1]);
    scopenames(tree[x + t_op2])
  }
  else
  if ((op = s_semicolon) or (op = s_and) or (op = s_or))
  then
  { scopenames(tree[x + t_op1]);
    scopenames(tree[x + t_op2])
  }
  else skip
}

func scopenamesexpr(val x) is
  var op;
  var name;
  var r;
{ r := x;
  op := tree[x + t_op];
  if (op = s_dot)
  then
  { name := findname((tree[x + t_op1] << 16) or tree[x + t_op2]);
    r := names_d[name] 
  }
  else
  if (op = s_master)
  then
  { name := findname(tree[x + t_op1]);
    r := scopen(name, s_master);
    setvnum(r)
  }
  else
  if (op = s_name)
  then
  { name := findname(x); 
    r := scopen(name, s_slave);
    setvnum(r)
  }
  else
  if (op = s_fncall)
  then
  { if (tree[x + t_op2] ~= nil)
    then
      tree[x + t_op2] := scopenamesexpr(tree[x + t_op2])
    else skip;
    tree[x + t_op1] := scopenamesexpr(tree[x + t_op1])
  }    
  else
  if (monadic(op))
  then
    tree[x + t_op1] := scopenamesexpr(tree[x + t_op1])
  else
  if (diadic(op) or (op = s_comma))
  then
  { tree[x + t_op2] := scopenamesexpr(tree[x + t_op2]);
    tree[x + t_op1] := scopenamesexpr(tree[x + t_op1])
  }
  else skip;  
  return r
}

func scopen(val n, val ms) is
  var decl;
{ decl := names_d[n]; 
  if (names_t[n] = n_local) or (names_t[n] = n_global)
  then
    if tree[decl + t_op] = s_chan
    then 
      if (tree[decl + t_op4] = ms) 
      then 
        skip
      else
      if (tree[decl + t_op4] = s_ms) 
      then 
        if (ms = s_slave)
        then
          decl := tree[decl + t_op5]
        else skip
      else
        cmperror("misuse of channel")
    else skip
  else skip;
  return decl
}    


func flatten(val x) is
  var op;
  var s;
  var r;
  var rhs;
{ s := nil;
  r := x;
  op := tree[x + t_op];
  if (op = s_skip)
  then 
    skip
  else
  if (op = s_return)
  then
  { s := liftcalls(tree[x + t_op1], nil);
    if (s ~= nil)
    then
      r := cons3(s_semicolon, s, r)
    else skip
  }
  else
  if (op = s_if)
  then
  { s := liftcalls(tree[x + t_op1], nil);
    if (s ~= nil)
    then
      r := cons3(s_semicolon, s, r)
    else skip;
    tree[x + t_op2] := flatten(tree[x + t_op2]);
    tree[x + t_op3] := flatten(tree[x + t_op3])
  }
  else
  if (op = s_while)
  then
  { s := liftcalls(tree[x + t_op1], nil);
    if (s ~= nil)
    then
      r := cons3(s_semicolon, s, r)
    else skip;
    tree[x + t_op2] := flatten(tree[x + t_op2])
  }  
  else
  if (op = s_ass)
  then
  { rhs := tree[x + t_op2];
    s := liftcalls(tree[x + t_op1], nil);
    if (tree[rhs + t_op] = s_fncall)
    then
    { if (tree[rhs + t_op2] ~= nil)
      then
        s := liftcalls(tree[rhs + t_op2], s)
      else skip;
      r := cons5(s_fncall, tree[x + t_op1], tree[rhs + t_op1], tree[rhs + t_op2], nil)
    }
    else
      s := liftcalls(tree[x + t_op2], s);
    if (s ~= nil)
    then
      r := cons3(s_semicolon, s, r)
    else skip    
  }
  else
  if (op = s_pcall)
  then
  { if (tree[x + t_op2] ~= nil)
    then
      s := liftcalls(tree[x + t_op2], nil)
    else skip;
    r := cons5(s_fncall, nil, tree[x + t_op1], tree[x + t_op2], nil);
    if (s ~= nil) 
    then
      r := cons3(s_semicolon, s, r)    
    else skip
  }
  else
  if (op = s_input) or (op = s_movein)
  then
    skip  
  else
  if (op = s_output) or (op = s_moveout)
  then
  { s := liftcalls(tree[x + t_op2], nil);
    if (s ~= nil)
    then
      r := cons3(s_semicolon, s, r)
    else skip
  }
  else
  if (op = s_when)
  then
  { if (tree[x + t_op1] ~= nil)
    then
    { s := liftcalls(tree[x + t_op1], nil);
      if (s ~= nil)
      then
        r := cons3(s_semicolon, s, r)
      else skip
    }
    else skip;
    tree[x + t_op2] := flatten(tree[x + t_op2]);
    tree[x + t_op3] := flatten(tree[x + t_op3])
  }
  else
  if (op = s_mstrseq) or (op = s_slaveseq)
  then
    tree[x + t_op2] := flatten(tree[x + t_op2])
  else
  if ((op = s_semicolon) or (op = s_and) or (op = s_or))
  then
  { tree[x + t_op1] := flatten(tree[x + t_op1]);
    tree[x + t_op2] := flatten(tree[x + t_op2])
  }
  else skip;
  return r
}

func liftcalls(val x, val slist) is
  var vc;
  var s;
{ vc := varcount;
  s := liftnestcalls(x, slist);
  varcount := vc;
  return s
}
 
func liftnestcalls(val x, val slist) is
  var op;
  var s;
  var temp;
  var fncall;
{ s := slist;
  op := tree[x + t_op];
  if (op = s_fncall)
  then
  { if (tree[x + t_op2] ~= nil)
    then
      s := liftnestcalls(tree[x + t_op2], s)
    else skip;
    fncall := cons5(s_fncall, x, tree[x + t_op1], tree[x + t_op2], nil);
    tree[x + t_op] := s_var;
    tree[x + t_op1] := nil;
    tree[x + t_op2] := -1;
    setvnum(x);   
    if (s = nil)
    then
      s := fncall
    else
      s := cons3(s_semicolon, s, fncall)
  } 
  else
  if (monadic(op))
  then
    s := liftnestcalls(tree[x + t_op1], s)
  else
  if (diadic(op) or (op = s_comma))
  then
  { s := liftnestcalls(tree[x + t_op1], s);
    s := liftnestcalls(tree[x + t_op2], s)
  }
  else skip; 
  return s
}


func linearise(val x) is
  var op;
  var r;
  var l;
  var last;
{ r := x;
  op := tree[x + t_op];
  if (op = s_if)
  then
  { tree[x + t_op2] := linearise(tree[x + t_op2]);
    tree[x + t_op3] := linearise(tree[x + t_op3])
  }
  else
  if (op = s_while)
  then
    tree[x + t_op2] := linearise(tree[x + t_op2]) 
  else
  if (op = s_when)
  then
  { tree[x + t_op1] := linearise(tree[x + t_op1]);
    tree[x + t_op3] := linearise(tree[x + t_op3])
  }
  else
  if (op = s_mstrseq) or (op = s_slaveseq)
  then
    tree[x + t_op2] := linearise(tree[x + t_op2])
  else
  if ((op = s_semicolon) or (op = s_and) or (op = s_or))
  then
  { l := linearise(tree[x + t_op1]);
    if (tree[l + t_op] = op) 
    then
    { r := l;
      last := lastnode(op, l);
      tree[x + t_op1] := tree[last + t_op2];
      tree[last + t_op2] := linearise(x) 
    }
    else
      tree[x + t_op2] := linearise(tree[x + t_op2])
  }
  else skip;
  return r
}

func lastnode(val op, val x) is
  var t;
  var last;
{ t := x;  
  while (tree[t + t_op] = op) do 
  { last := t;
    t := tree[t + t_op2]     
  };
  return last
}  


proc optimise(val x) is
  var op;
{ op := tree[x + t_op];
  if (op = s_skip)
  then
    skip
  else
  if (op = s_return)
  then
    tree[x + t_op1] := optimiseexpr(tree[x + t_op1])
  else
  if (op = s_if)
  then
  { tree[x + t_op1] := optimiseexpr(tree[x + t_op1]);
    optimise(tree[x + t_op2]);
    optimise(tree[x + t_op3])
  }
  else
  if (op = s_while)
  then
  { tree[x + t_op1] := optimiseexpr(tree[x + t_op1]);
    optimise(tree[x + t_op2])
  }  
  else
  if (op = s_ass) or (op = s_input) or (op = s_output) or
     (op = s_movein) or (op = s_moveout)
  then
  { tree[x + t_op2] := optimiseexpr(tree[x + t_op2]);
    tree[x + t_op1] := optimiseexpr(tree[x + t_op1])
  }
  else
  if (op = s_fncall)
  then
  { if (tree[x + t_op3] ~= nil)
    then
      tree[x + t_op3] := optimiseexpr(tree[x + t_op3])
    else skip;
    tree[x + t_op1] := optimiseexpr(tree[x + t_op1])
  }   
  else
  if (op = s_when)
  then
  { if (tree[x + t_op1] ~= nil)
    then
      tree[x + t_op1] := optimiseexpr(tree[x + t_op1])
    else skip;
    optimise(tree[x + t_op2]);
    optimise(tree[x + t_op3])
  }
  else
  if (op = s_mstrseq) or (op = s_slaveseq)
  then
    optimise(tree[x + t_op2])
  else
  if ((op = s_semicolon) or (op = s_and) or (op = s_or))
  then
  { optimise(tree[x + t_op1]);
    optimise(tree[x + t_op2])
  }
  else skip
}


func optimiseexpr(val x) is
  var op;
  var name;
  var r;
  var temp;
  var left;
  var right;
  var leftop;
  var rightop;
{ r := x;
  op := tree[x + t_op];
  if (op = s_val)
  then
  { r := optimiseexpr(tree[x + t_op2]);
    if (tree[r + t_op] ~= s_number)
    then
      generror("error in constant definition")
    else skip
  }
  else
  if (op = s_port)
  then
  { tree[x + t_op2] := optimiseexpr(tree[x + t_op2]);
    if (~isval(tree[x + t_op2]))
    then
      generror("error in port definition")
    else skip
  }
  else
  if (op = s_array)
  then
  { tree[x + t_op4] := optimiseexpr(tree[x + t_op4]);
    if (~isval(tree[x + t_op4])) 
    then
      generror("error in array definition")
    else skip
  }          
  else
  if (monadic(op))
  then
  { tree[x + t_op1] := optimiseexpr(tree[x + t_op1]);
    op := tree[x + t_op];
    if (isval(tree[r + t_op1]))
    then
    { tree[x + t_op1] := evalmonadic(x);
      tree[x + t_op] := s_number
    }
    else
    if (op = s_not)
    then
    { left := tree[x + t_op1];
      if (tree[left + t_op] = s_not)
      then
        r := tree[left + t_op1]
      else
      if (tree[left + t_op] = s_not1)
      then
      { r := left;
        tree[left + t_op] := s_neg
      }
      else skip
    }
    else skip
  }
  else
  if (diadic(op))
  then
  { tree[x + t_op2] := optimiseexpr(tree[x + t_op2]);
    tree[x + t_op1] := optimiseexpr(tree[x + t_op1]);
    left := tree[x + t_op1];
    right := tree[x + t_op2];
    leftop := tree[left + t_op];
    rightop := tree[right + t_op];
    if (isval(left) and isval(right))
    then
    { tree[x + t_op1] := evaldiadic(x);
      tree[x + t_op] := s_number
    }
    else
    if (op = s_eq)
    then
    { r := cons2(s_prop1, x);
      if ((leftop = s_not) or (leftop = s_not1) or (leftop = s_prop1)) 
      then
        if (leftop = rightop)
        then
        { tree[x + t_op1] := tree[left + t_op1];
          tree[x + t_op2] := tree[right + t_op1]
        }    
        else skip
      else skip  
    }   
    else
    if (op = s_ne)
    then
    { tree[x + t_op] := s_eq;
      r := cons2(s_not1, x);
      if ((leftop = s_not) or (leftop = s_not1) or (leftop = s_prop1)) 
      then 
        if (leftop = rightop)
        then
        { tree[x + t_op1] := tree[left + t_op1];
          tree[x + t_op2] := tree[right + t_op1]
        }     
        else skip
      else skip
    } 
    else
    if (op = s_ls)
    then
      r := cons2(s_prop1, x)
    else
    if (op = s_ge)
    then
    { tree[x + t_op] := s_ls;
      r := cons2(s_not1, x)
    } 
    else
    if (op = s_gr)
    then
    { temp := tree[x + t_op1];
      tree[x + t_op1] := tree[x + t_op2];
      tree[x + t_op2] := temp;
      tree[x + t_op] := s_ls;
      r := cons2(s_prop1, x) 
    }
    else
    if (op = s_le)
    then
    { temp := tree[x + t_op1];
      tree[x + t_op1] := tree[x + t_op2];
      tree[x + t_op2] := temp;
      tree[x + t_op] := s_ls;
      r := cons2(s_not1, x)
    }
    else
    if ((op = s_logor) or (op = s_logand))
    then
    { if ((leftop = s_not) or (leftop = s_not1) or (leftop = s_prop1))
      then
        if (leftop = rightop)
        then
        { if (leftop = s_prop1)
          then
            r := cons2(s_prop1, x)
          else
          { r := cons2(leftop, x);
            if (tree[x + t_op] = s_logand)
            then
              tree[x + t_op] := s_logor
            else 
              tree[x + t_op] := s_logand
          };
          tree[x + t_op1] := tree[left + t_op1];
          tree[x + t_op2] := tree[right + t_op1]
        }
        else skip
      else skip
    }
    else
    if (op = s_xor)
    then
    { if ((leftop = s_not) or (leftop = s_not1) or (leftop = s_prop1)) 
      then
        if (leftop = rightop)
        then
        { if (leftop ~= s_not)
          then
            r := cons2(s_prop1, x)
          else skip;
          tree[x + t_op1] := tree[left + t_op1];
          tree[x + t_op2] := tree[right + t_op1]
        }
        else skip
      else skip      
    }
    else     
    if ((op = s_plus) and (iszero(tree[x + t_op1]) or iszero(tree[x + t_op2])))
    then
    { if (iszero(tree[x + t_op1]))
      then
        r := tree[x + t_op2]
      else
      if (iszero(tree[x + t_op2]))
      then
        r := tree[x + t_op1]
      else skip
    }
    else skip    
  }
  else  
  if (op = s_comma)
  then
  { tree[x + t_op2] := optimiseexpr(tree[x + t_op2]);
    tree[x + t_op1] := optimiseexpr(tree[x + t_op1])
  }
  else skip;
  return r
}

func isval(val x) is
  var op;
{ op := tree[x + t_op];
  return ((op = s_true) or (op = s_false) or (op = s_number) or (op = s_port))
}

func getval(val x) is
  var op;
  var result;
{ op := tree[x + t_op];
  if (op = s_true)
  then
    result := -1
  else
  if (op = s_false)
  then
    result := 0
  else
  if (op = s_number)
  then
    result := tree[x + t_op1]
  else
  if (op = s_port)
  then
    result := getval(tree[x + t_op2]) << 8
  else skip;
  return result
}  

func evalmonadic(val x) is
  var op;
  var opd;
  var result;
{ op := tree[x + t_op];
  opd := getval(tree[x + t_op1]);
  if (op = s_neg) 
  then
    result := - opd
  else
  if (op = s_not)
  then
    result := ~ opd
  else
  if (op = s_not1) 
  then
    result := opd xor 1
  else
  if (op = s_prop1)
  then
    result := opd
  else
    generror("compiler error");
  return result
}

func evaldiadic(val x) is
  var op;
  var left;
  var right;
  var result;
{ op := tree[x + t_op];
  left := getval(tree[x + t_op1]);
  right := getval(tree[x + t_op2]);
  if (op = s_plus)
  then
      result := left + right
  else
  if (op = s_minus)
  then
      result := left - right
  else
  if (op = s_mult)
  then
      result := left * right
  else
  if (op = s_div)
  then
      result := left / right
  else
  if (op = s_rem)
  then
      result := left rem right
  else
  if (op = s_eq)
  then
      result := left = right
  else
  if (op = s_ne)
  then
      result := left ~= right
  else
  if (op = s_ls)
  then
      result := left < right
  else
  if (op = s_gr)
  then
      result := left > right
  else
  if (op = s_le)
  then
      result := left <= right
  else
  if (op = s_ge)
  then
      result := left >= right
  else
  if (op = s_logor)
  then
      result := left or right
  else
  if (op = s_logand)
  then
      result := left and right
  else
  if (op = s_xor)
  then
      result := left xor right
  else
  if (op = s_lshift)
  then
      result := left << right
  else
  if (op = s_rshift)
  then
      result := left >> right
  else  
    cmperror("optimise error");
  return result
}

func livevars(val x, val livelist) is
  var op;
  var livel;
  var thenl;
  var elsel;
  var whilel;
  var dest;
  var sources;
  var dests;
  var frees;
  var decl;
{ op := tree[x + t_op];
  if (op = s_skip)
  then
    livel := livelist
  else
  if (op = s_return)
  then
  { tree[x + t_op2] := livelist;
    livel := sunion(rhsourceset(tree[x + t_op1]), livelist)
  }
  else
  if (op = s_if)
  then
  { tree[x + t_op4] := livelist;
    thenl := livevars(tree[x + t_op2], livelist); 
    elsel := livevars(tree[x + t_op3], livelist);
    tree[x + t_op5] := thenl;
    tree[x + t_op6] := elsel;
    livel := sunion(thenl, elsel); 
    livel := sunion(rhsourceset(tree[x + t_op1]), livel)
  }
  else
  if (op = s_while)
  then
  { tree[x + t_op3] := livelist;
    livel := livevars(tree[x + t_op2], livelist);
    livel := sunion(rhsourceset(tree[x + t_op1]), livel);
    livel := sunion(livel, livelist);
    livel := livevars(tree[x + t_op2], livel);
    tree[x + t_op4] := livel;
    livel := sunion(livel, livelist);
    livel := sunion(rhsourceset(tree[x + t_op1]), livel)
  }
  else
  if (op = s_ass)
  then
  { tree[x + t_op3] := livelist;
    sources := rhsourceset(tree[x + t_op2]);      
    dest := tree[x + t_op1];
    sources := sunion(sources, lhsourceset(dest));
    dests := expdestset(dest);
    livel := sminus(livelist, dests);
    livel := sunion(livel, sources)
  }
  else
  if (op = s_fncall)
  then
  { tree[x + t_op4] := livelist;
    decl := tree[x + t_op2];
    dest := tree[x + t_op1];
    sources := fnsourceset(tree[x + t_op3], tree[decl + t_op2]);
    dests := fndestset(tree[x + t_op3], tree[decl + t_op2]); 
    if (dest ~= nil)
    then
    { sources := sunion(sources, lhsourceset(dest));
      dests := sunion(dests, expdestset(dest))
    }
    else skip;
    livel := sminus(livelist, dests);
    livel := sunion(livel, sources);
    livel := sunion(livel, procfreevars)
  }
  else
  if (op = s_input) or (op = s_movein)
  then
  { tree[x + t_op3] := livelist;
    sources := rhsourceset(tree[x + t_op1]);
    sources := sunion(sources, lhsourceset(tree[x + t_op2]));
    dests := expdestset(tree[x + t_op2]);
    livel := sminus(livelist, dests);
    livel := sunion(livel, sources)
  }   
  else
  if (op = s_output) or (op = s_moveout)
  then
  { tree[x + t_op3] := livelist;
    sources := sunion(rhsourceset(tree[x + t_op1]), rhsourceset(tree[x + t_op2]));
    livel := sunion(livelist, sources)
  }   
  else
  if (op = s_when)
  then
  { tree[x + t_op5] := livelist;
    livel := livevars(tree[x + t_op3], livelist);
    livel := livevars(tree[x + t_op2], livel);
    livel := sunion(rhsourceset(tree[x + t_op1]), livel)
  }
  else
  if (op = s_mstrseq) or (op = s_slaveseq)
  then
  { tree[ x + t_op3] := livelist;
    livel := livevars(tree[x + t_op2], livelist);
    livel := sunion(rhsourceset(tree[x + t_op1]), livel)
  }
  else
  if (op = s_and)
  then
  { tree[x + t_op4] := livevars(tree[x + t_op1], livelist);
    livel := sunion(livevars(tree[x + t_op2], livelist), tree[x + t_op4]);
    tree[x + t_op3] := livel
  }
  else      
  if (op = s_or)
  then
  { tree[x + t_op3] := livelist;
    livel := sunion(livevars(tree[x + t_op1], livelist), livevars(tree[x + t_op2], livelist))
  }
  else    
  if (op = s_semicolon)
  then
  { livel := livevars(tree[x + t_op2], livelist); 
    livel := livevars(tree[x + t_op1], livel)
  }
  else 
    livel := sunion(rhsourceset(x), livelist);
  return livel
}

func freevars(val x) is
  return sminus(sunion(sourceset(x), destset(x)), boundset(x))
  

func fvarset(val x) is
  var s;
  var op;
{ if (x = nil)
  then
    s := nil
  else
  if (tree[x + t_op] = s_comma)
  then
    s := sunion(fvarset(tree[x + t_op1]), fvarset(tree[x + t_op2]))
  else
    s := smember(x);
  return s
}

func varset(val x) is
  var s;
  var op;
{ op := tree[x + t_op];
  if (op = s_semicolon) 
  then
    s := sunion(varset(tree[x + t_op1]), varset(tree[x + t_op2]))
  else
  if ((op = s_var) or (op = s_array) or (op = s_timer))
  then
    s := smember(x)
  else
  if (op = s_chan)
  then 
    s := sunion(smember(x), smember(tree[x + t_op5]))
  else
    s := nil; 
  return s
}


func boundset(val x) is
  var op;
  var dest;
  var bounds;
  var conds;
  var thens;
  var elses;
  var body;
{ bounds := nil;
  op := tree[x + t_op];
  if ((op = s_proc) or (op = s_func))
  then
  { if (tree[x + t_op2] ~= nil)
    then
      bounds := sunion(fvarset(tree[x + t_op2]), bounds)
    else skip;
    body := tree[x + t_op3];
    if (tree[body + t_op1] ~= nil)
    then
      bounds := sunion(varset(tree[body + t_op1]), bounds)
    else skip; 
    bounds := sunion(boundset(tree[body + t_op2]), bounds)
  }
  else
  if (op = s_if) 
  then
  { conds := boundset(tree[x + t_op1]);
    thens := boundset(tree[x + t_op2]); 
    elses := boundset(tree[x + t_op3]);
    bounds := sunion(sunion(thens, elses), conds)
  }
  else
  if (op = s_while)
  then
  { conds := boundset(tree[x + t_op1]);
    bounds := sunion(boundset(tree[x + t_op2]), conds)
  }
  else
  if (op = s_fncall)
  then
  { if (tree[x + t_op1] ~= nil)
    then
    { dest := tree[x + t_op1];
      if (tree[dest + t_op1] = nil)
      then
        bounds := expdestset(dest)
      else skip
    }
    else skip
  }     
  else
  if (op = s_when)
  then
  { conds := boundset(tree[x + t_op1]);
    bounds := sunion(conds, boundset(tree[x + t_op2]));
    bounds := sunion(bounds, boundset(tree[x + t_op3]))
  }
  else
  if (op = s_mstrseq) or (op = s_slaveseq)
  then
    bounds := boundset(tree[x + t_op2])
  else
  if ((op = s_semicolon) or (op = s_and) or (op = s_or))
  then
    bounds := sunion(boundset(tree[x + t_op1]), boundset(tree[x + t_op2])) 
  else skip;
  return bounds
}

func allvarset(val x) is
  return sunion(sourceset(x), destset(x))


func sourceset(val x) is
  var op;
  var dest;
  var sources;
  var cset;
  var thens;
  var elses;
  var decl;
  var body;
{ op := tree[x + t_op];
  if ((op = s_proc) or (op = s_func))
  then
  { body := tree[x + t_op3];
    sources := sourceset(tree[body + t_op2])
  }
  else
  if (op = s_skip)
  then
    sources := nil
  else
  if (op = s_return)
  then
    sources := rhsourceset(tree[x + t_op1])
  else
  if (op = s_if)
  then
  { cset := rhsourceset(tree[x + t_op1]);
    thens := sourceset(tree[x + t_op2]); 
    elses := sourceset(tree[x + t_op3]);
    sources := sunion(cset, sunion(thens, elses))
  }
  else
  if (op = s_while)
  then
    sources := sunion(rhsourceset(tree[x + t_op1]), sourceset(tree[x + t_op2]))
  else
  if (op = s_ass)
  then
  { sources := rhsourceset(tree[x + t_op2]);      
    dest := tree[x + t_op1];
    sources := sunion(sources, lhsourceset(dest))
  }
  else
  if (op = s_fncall)
  then
  { decl := tree[x + t_op2];
    dest := tree[x + t_op1];
    sources := fnsourceset(tree[x + t_op3], tree[decl + t_op2]);
    if (dest ~= nil)
    then
      sources := sunion(sources, lhsourceset(dest))
    else skip
  } 
  else
  if (op = s_input) or (op = s_movein)
  then
    sources := sunion(rhsourceset(tree[x + t_op1]), lhsourceset(tree[x + t_op2]))
  else
  if (op = s_output) or (op = s_moveout)
  then
    sources := sunion(rhsourceset(tree[x + t_op1]), rhsourceset(tree[x + t_op2]))
  else
  if (op = s_when)
  then
  { sources := sunion(sourceset(tree[x + t_op2]), sourceset(tree[x + t_op3])); 
    if (tree[x + t_op1] ~= nil)
    then
      sources := sunion(rhsourceset(tree[x + t_op1]), sources)
    else skip
  }
  else
  if (op = s_mstrseq) or (op = s_slaveseq)
  then
    sources := sunion(rhsourceset(tree[x + t_op1]), sourceset(tree[x + t_op2]))
  else
  if ((op = s_semicolon) or (op = s_and) or (op = s_or))
  then
    sources := sunion(sourceset(tree[x + t_op1]), sourceset(tree[x + t_op2])) 
  else
    sources := rhsourceset(x);
  return sources
}

func destset(val x) is
  var op;
  var dest;
  var dests;
  var cset;
  var thens;
  var elses;
  var decl;
  var body;
{ op := tree[x + t_op];
  if ((op = s_proc) or (op = s_func))
  then
  { body := tree[x + t_op3];
    dests := destset(tree[body + t_op2])
  }
  else
  if (op = s_skip) 
  then
    dests := nil
  else
  if (op = s_return)
  then
    dests := nil
  else
  if (op = s_if)
  then
  { cset := destset(tree[x + t_op1]);
    thens := destset(tree[x + t_op2]);
    elses := destset(tree[x + t_op3]);
    dests := sunion(cset, sunion(thens, elses))
  }
  else
  if (op = s_while)
  then
    dests := sunion(destset(tree[x + t_op1]), destset(tree[x + t_op2]))
  else
  if (op = s_ass)
  then
  { dest := tree[x + t_op1];
    if (tree[dest + t_op] = s_lsub)
    then
      dests := nil 
    else
      dests := expdestset(dest)
  }
  else
  if (op = s_fncall)
  then
  { decl := tree[x + t_op2];
    dests := fndestset(tree[x + t_op3], tree[decl + t_op2]);
    if (tree[x + t_op1] ~= nil)
    then
      dests := sunion(dests, expdestset(tree[x + t_op1]))
    else skip
  }
  else
  if (op = s_input) or (op = s_movein)
  then
    dests := expdestset(tree[x + t_op2])
  else
  if (op = s_output) or (op = s_moveout)
  then
    dests := nil
  else
  if (op = s_when)
  then
    dests := sunion(destset(tree[x + t_op2]), destset(tree[x + t_op3]))
  else
  if (op = s_mstrseq) or (op = s_slaveseq)
  then
    dests := destset(tree[x + t_op2])
  else
  if ((op = s_semicolon) or (op = s_and) or (op = s_or)) 
  then
    dests := sunion(destset(tree[x + t_op1]), destset(tree[x + t_op2])) 
  else
    dests := expdestset(x); 
 return dests
}

func expdestset(val x) is
  var op;
  var list;
{ op := tree[x + t_op];
  if ((op = s_var) or (op = s_resp))
  then
    list := smember(x)
  else
  if (op = s_colon)
  then
    list := smember(tree[x + t_op1])
  else
  if (op = s_comma)
  then
    list := sunion(expdestset(tree[x + t_op1]), expdestset(tree[x + t_op2]))
  else  
    list := nil;
  return list
}

func rhsourceset(val x) is
  var op;
  var list;
{ op := tree[x + t_op];
  if ((op = s_var) or (op = s_array) or (op = s_valp) or (op = s_chan) or (op = s_timer))
  then
    list := smember(x)
  else
  if (monadic(op)) 
  then
    list := rhsourceset(tree[x + t_op1])
  else
  if (diadic(op) or (op = s_comma))
  then
    list := sunion(rhsourceset(tree[x + t_op1]), rhsourceset(tree[x + t_op2]))
  else
    list := nil;
  return list
}

func lhsourceset(val x) is
  var op;
  var list;
{ op := tree[x + t_op];
  if (op = s_lsub)
  then
    list := sunion(rhsourceset(tree[x + t_op1]), rhsourceset(tree[x + t_op2]))
  else
  if (op = s_after)
  then
    list := rhsourceset(tree[x + t_op1])
  else
  if (op = s_colon)
  then
    list := rhsourceset(tree[x + t_op2])
  else
  if (op = s_comma)
  then
    list := sunion(lhsourceset(tree[x + t_op1]), lhsourceset(tree[x + t_op2]))
  else
    list := nil;
  return list
}

func smember(val x) is
  var vnumber;
{ vnumber := tree[x + t_op2];
  return 1 << vnumber
}

func sunion(val s1, val s2) is
  return s1 or s2


func intersection(val s1, val s2) is 
  return s1 and s2


func sminus(val s1, val s2) is
  return s1 and (~s2)


func ssize(val s) is
  var n;
  var x;
{ x := s;
  n := 0;
  while (x ~= 0) do
  { x := x and (x - 1);
    n := n + 1
  };
  return n
} 

proc printtree(val x) is
  if (tree[x + t_op] = s_semicolon)
  then 
  { prints("{"); printtree(tree[x + t_op1]);
    prints(";"); printtree(tree[x + t_op2]);
    prints("}") 
  }
  else
    printn(tree[x + t_op])
  

proc genprocs(val x) is
  var body;
  var liveformals;
  var allvars;
  var liveafter;
  var livebefore;
  var offslab;
  var savetreep;
  var pstart;
{ if (tree[x + t_op] = s_semicolon)
  then
  { genprocs(tree[x + t_op1]);
    genprocs(tree[x + t_op2])
  }
  else
  { savetreep := treep;  
    procname := tree[x + t_op1];
    proclabel := tree[x + t_op4];
    body := tree[x + t_op3]; 
    scopeproc(x);
    tree[body + t_op2] := flatten(tree[body + t_op2]); 
    tree[body + t_op2] := linearise(tree[body + t_op2]);  
    optimise(tree[body + t_op2]);
    setlab(proclabel);
    vn_init(); rsim_init(); lru_init();
    stk_init();
    procfreevars := freevars(x);
    allvars := procfreevars;
    if (tree[x + t_op2] ~= nil)
    then
    { bindformals(tree[x + t_op2]);
      allvars := sunion(allvars, fvarset(tree[x + t_op2]))
    }     
    else skip;
    if (tree[body + t_op1] ~= nil) 
    then
    { bindvars(tree[body + t_op1], b_stack);
      initports(tree[body + t_op1]);
      allvars := sunion(allvars, varset(tree[body + t_op1]))
    }
    else skip; 
    liveformals := fndestset(tree[x + t_op2], tree[x + t_op2]);
    liveafter := sunion(procfreevars, liveformals);
    livebefore := livevars(tree[body + t_op2], liveafter);
    setfreestates(procfreevars);
    insequence := false;
    if ((tree[x + t_op] = s_proc) or (tree[x + t_op] = s_func))
    then
    { if (optimizable(x))
      then
      { optimising := true;
        pstart := cb_bufferp;
        setstk(0);
        lockintoregs(allvars, livebefore);
        genstatement(tree[body + t_op2]);
        savelivevars(procfreevars);      
        param_min := 0;
        genresults(tree[x + t_op2]);
        genreturn(tree[body + t_op2]);
        genu6stk(i_retsp, 0);
        insertsetstk(pstart, stk_max);
        unlockregs(allvars);
        optimising := false
      } 
      else
      { pstart := cb_bufferp;
        setstk(0);
        stk_alloc(1);
        genu6stk(i_entsp, 0);
        initstkchans(tree[body + t_op1]);  
        genstatement(tree[body + t_op2]); 
        savelivevars(procfreevars);
        param_min := 0;
        genresults(tree[x + t_op2]);
        genreturn(tree[body + t_op2]);
        genu6stk(i_retsp, 0);
        insertsetstk(pstart, stk_max)
      }
    }
    else
    { pstart := cb_bufferp;
      setstk(0);
      stk_alloc(2); 
      genu6stk(i_entsp, 0);
      genru6(i_stwsp, reg_data, 1);
      gen1r(i_setdp, 11);        
      initstkchans(tree[body + t_op1]);     
      genstatement(tree[body + t_op2]); 
      savelivevars(procfreevars);
      param_min := 0;
      genresults(tree[x + t_op2]);
      genreturn(tree[body + t_op2]);
      genru6stk(i_ldwsp, reg_data, 1);
      genu6stk(i_retsp, 0);
      insertsetstk(pstart, stk_max)
    };
    forgetregs();
    treep := savetreep; 
    clearvnums()
  }
}

proc bindformals(val x) is
  var reg;
  var formals;
{ reg := 0;
  formals := x;
  while (tree[formals + t_op] = s_comma) do
  { bindformal(tree[formals + t_op1], reg);
    formals := tree[formals + t_op2]; 
    reg := reg + 1
  };
  bindformal(formals, reg)
}

proc bindformal(val x, val r) is
{ vn_initstate(vnum(x), (b_stack or b_reg or r));
  rsim_free[r] := false;
  rsim_hasvar[r] := true;
  rsim_var[r] := vnum(x);
  rsim_hasval[r] := false
}

proc initports(val x) is
  var value;
{ if (tree[x + t_op] = s_semicolon)
  then
  { initports(tree[x + t_op1]);
    initports(tree[x + t_op2])
  }
  else
  { if (tree[x + t_op] = s_port) 
    then
    { tree[x + t_op2] := optimiseexpr(tree[x + t_op2]);
      movetoreg(10, tree[x + t_op2]);
      genru6(i_setci, 10, sp_on)
    }
    else skip
  }
}

proc initfrmchans(val x) is
  var y;
{ if (tree[x + t_op] = s_semicolon)
  then
  { initfrmchans(tree[x + t_op1]);
    initfrmchans(tree[x + t_op2])
  }
  else
  { if (tree[x + t_op] = s_chan) 
    then
    { % Check for a 'tree' channel and assume no other chanends are allocated
      %y := tree[x + t_op1];
      %if((((tree[y+2]>>8) and 255) = 't') and (((tree[y+2]>>16) and 255) = 'r') and
      %  (((tree[y+2]>>24) and 255) = 'e') and ((tree[y+3] and 255) = 'e'))
      %then
      %{ 
        genrus(i_getr, 10, r_chan);
        genrus(i_chkcti, 10, ct_eom);
        gen2r(i_in, 9, 10);
        gen2r(i_setd, 9, 10);
        genru6(i_stwdp, 10, tree[tree[x + t_op5] + t_op3])
      %}
      %else
      %{ genrus(i_getr, 10, r_chan);
      %  genrus(i_getr, 9, r_chan);
      %  gen2r(i_setd, 9, 10);
      %  gen2r(i_setd, 10, 9);
      %  genru6(i_stwdp, 10, tree[x + t_op3]);
      %  genru6(i_stwdp, 9, tree[tree[x + t_op5] + t_op3])
      %}
    }
    else 
    if (tree[x + t_op] = s_timer)
    then
    { genrus(i_getr, 10, r_timer);
      genru6(i_stwdp, 10, tree[x + t_op3])
    }
    else skip
  }
}

proc initstkchans(val x) is
  var reg1;
  var reg2;
{ if (tree[x + t_op] = s_semicolon)
  then
  { initstkchans(tree[x + t_op1]);
    initstkchans(tree[x + t_op2])
  }
  else
  { if (tree[x + t_op] = s_chan) 
    then
    { reg1 := getchan(x, r_chan);
      reg2 := getchan(tree[x + t_op5], r_chan);
      gen2r(i_setd, reg1, reg2);
      gen2r(i_setd, reg2, reg1)
    }
    else 
    if (tree[x + t_op] = s_timer)
    then
      reg1 := getchan(x, r_timer)
    else skip
  }
}    


func getchan(val x, val t) is 
  var r;
{ r := a_getreg();
  genrus(i_getr, r, t);
  vn_setstate(vnum(x), b_reg);
  vn_setreg(vnum(x), r);
  rsim_hasvar[r] := true;
  rsim_var[r] := x; 
  return r
}

proc freestkchans(val x) is
  var reg;
{ if (tree[x + t_op] = s_semicolon)
  then
  { freestkchans(tree[x + t_op1]);
    freestkchans(tree[x + t_op2])
  }
  else
  if (tree[x + t_op] = s_timer) 
  then
  { reg := movetoanyreg(x);
    gen1r(i_freer, reg)
  }
  else
  if (tree[x + t_op] = s_chan) 
  then
  { reg := movetoanyreg(x);
    gen1r(i_freer, reg);
    reg := movetoanyreg(tree[x + t_op5]);
    gen1r(i_freer, reg)
  }
  else skip  
}    


proc bindvars(val x, val b) is
{ if (tree[x + t_op] = s_semicolon) 
  then
  { bindvars(tree[x + t_op1], b);
    bindvars(tree[x + t_op2], b)
  }
  else
    bindvar(x, b)
}

proc bindvar(val x, val b) is
{ if (tree[x + t_op] = s_chan) 
  then
  { vn_initstate(vnum(x), b) %;
    % vn_initstate(vnum(tree[x + t_op5]), b)
  }
  else
  if (tree[x + t_op] = s_var) or (tree[x + t_op] = s_timer)
  then
    vn_initstate(vnum(x), b)
  else 
  if (tree[x + t_op] = s_array)
  then
    vn_initstate(vnum(x), (b or b_mem))
  else skip
}


proc setfreestates(val freevars) is
  var vn;
  var v;
{ vn := 0;
  while (vn < topvarcount) do
  { v := v_vars[vn];
    if (visinset(freevars, vn))
    then
    { bindvar(v, b_frame);
      vn_setstate(vn, b_mem or b_malloc);
      vn_setoffset(vn, tree[v + t_op3])
    }
    else skip;
    vn := vn + 1
  }
}



proc bindtemp(val x, val r) is
{ if (vn_isset(vnum(x), b_malloc))
  then
    vn_initstate(vnum(x), (b_malloc or b_stack or b_reg or r))  
  else
    vn_initstate(vnum(x), (b_stack or b_reg or r));
  rsim_free[r] := false;
  rsim_hasvar[r] := true;
  rsim_var[r] := vnum(x);
  rsim_hasval[r] := false
}

proc allocfrm(val x) is
{ if (tree[x + t_op] = s_semicolon) 
  then
  { allocfrm(tree[x + t_op1]);
    allocfrm(tree[x + t_op2])
  }
  else
  if ((tree[x + t_op] = s_var) or (tree[x + t_op] = s_timer))
  then
    tree[x + t_op3] := frm_alloc()
  else
  if (tree[x + t_op] = s_chan)
  then
  { tree[x + t_op3] := frm_alloc();
    tree[tree[x + t_op5] + t_op3] := frm_alloc()
  }
  else skip
} 

proc allocfrmarrays(val x) is
{ if (tree[x + t_op] = s_semicolon)
  then
  { allocfrmarrays(tree[x + t_op1]);
    allocfrmarrays(tree[x + t_op2])
  }
  else
  if (tree[x + t_op] = s_array) 
  then
  { tree[x + t_op3] := frm_alloc();
    arrayspace := arrayspace + tree[x + t_op4]
  }
  else skip
} 

proc genframe(val x) is
{ if (tree[x + t_op] = s_semicolon)
  then
  { genframe(tree[x + t_op1]);
    genframe(tree[x + t_op2])
  }
  else
  if (tree[x + t_op] = s_var) or (tree[x + t_op] = s_timer)
  then
  { outbin(0); outbin(0)
  }
  else
  if (tree[x + t_op] = s_chan)
  then
  {  outbin(0); outbin(0); outbin(0); outbin(0)
  }
  else skip
}

proc genframearrays(val x) is
{ if (tree[x + t_op] = s_semicolon)
  then
  { genframearrays(tree[x + t_op1]);
    genframearrays(tree[x + t_op2])
  }
  else
  if (tree[x + t_op] = s_array)
  then
  { outbin(arrayspace and 65535);
    outbin(arrayspace >> 16); 
    arrayspace := arrayspace + getval(optimiseexpr(tree[x + t_op4])) 
  }
  else skip
} 

func fncheckargs(val a, val f) is
  var m;
{ if (tree[f + t_op] = s_comma) and (tree[a + t_op] = s_comma) 
  then
    m := fncheckargs(tree[a + t_op1], tree[f + t_op1]) and fncheckargs(tree[a + t_op2], tree[f + t_op2])
  else
  if (tree[f + t_op] = s_var) and ((tree[a + t_op] ~= s_var) and (tree[a + t_op] ~= s_array))
  then
    m := false
  else 
    m := true;
  return m
}

func fnsourceset(val a, val f) is
  var s;
{ if (tree[f + t_op] = s_comma) and (tree[a + t_op] = s_comma) 
  then
    s := sunion(fnsourceset(tree[a + t_op1], tree[f + t_op1]), fnsourceset(tree[a + t_op2], tree[f + t_op2]))
  else
  if (tree[f + t_op] = s_var) or (tree[f + t_op] = s_valp) or (tree[f + t_op] = s_chan)
  then
    s := rhsourceset(a)
  else
    s := nil;
  return s
}

func fndestset(val a, val f) is
  var s;
{ if (tree[f + t_op] = s_comma) and (tree[a + t_op] = s_comma) 
  then
    s := sunion(fndestset(tree[a + t_op1], tree[f + t_op1]), fndestset(tree[a + t_op2], tree[f + t_op2]))
  else
  if (tree[f + t_op] = s_var) or (tree[f + t_op] = s_resp)
  then
    s := expdestset(a)
  else
    s := nil;
  return s
}

proc setresults(val a, val f) is
  var actuals;
  var formals;
  if a = nil
  then skip
  else
  { actuals := a;
    formals := f;
    param_count := 0;
    while (tree[actuals + t_op] = s_comma) do
    { setresult(tree[actuals + t_op1], tree[formals + t_op1]);
      actuals := tree[actuals + t_op2];
      formals := tree[formals + t_op2]; 
      param_count := param_count + 1
    };
    setresult(actuals, formals);
    param_count := param_count + 1
  }

proc setresult(val a, val f) is
  var vn;
{ if ((tree[f + t_op] = s_resp) or (tree[f + t_op] = s_var))
  then
  { vn := vnum(a);
    if (~ ((tree[a + t_op] = s_array) or (tree[a + t_op] = s_chan) or (tree[a + t_op] = s_timer)))
    then
      vn_clearstate(vn, b_mem)
    else skip;
    vn_setstate(vn, b_reg);
    vn_setreg(vn, param_count);
    rsim_free[param_count] := false;
    rsim_hasvar[param_count] := true;
    rsim_var[param_count] := vn;
    rsim_hasval[param_count] := false
  }
  else skip
}
     

func s_remove(val s, val r) is
  return s and (~ (1 << r))


func s_reg(val r) is 
  return 1 << r


func s_setsize(val s) is
  var count;
  var bitval;
{ count := 0;
  bitval := s;
  while (bitval ~= 0) do
  { count := count + 1;
    bitval := bitval and (bitval-1)
  };
  return count
}

func listsize(val x) is 
  var s;
{ if (tree[x + t_op] = nil)
  then
    s := 0
  else
  if (tree[x + t_op] = s_comma)
  then
    s := listsize(tree[x + t_op1]) + listsize(tree[x + t_op2])
  else 
    s := 1;
  return s
}

proc prepareactuals(val x) is
  var actuals;
  var act;
{ act := 0;
  act := reg_min; 
  while act <= reg_max do
  { params_d[act] := 0;
    act := act + 1
  };
  actuals := x;
  param_count := 0;
  while (tree[actuals + t_op] = s_comma) do
  { prepareactual(tree[actuals + t_op1]);
    actuals := tree[actuals + t_op2]; 
    param_count := param_count + 1
  };
  prepareactual(actuals);
  param_count := param_count + 1
}

proc prepareactual(val x) is
{ params_x[param_min + param_count] := x;
  params_r[param_min + param_count] := param_count;
  preparedepends(x, param_min + param_count)
}

proc preparedepends(val a, val reg) is
  var op;
  var source;
  var an;
{ op := tree[a + t_op];
  if ((op = s_var) or (op = s_valp) or (op = s_chan) or (op = s_timer))
  then
  { an := vnum(a);
    if (vn_isset(an, b_reg))
    then
    { source := vn_reg(an);
      params_d[source] := params_d[source] or s_reg(reg)
    } 
    else skip
  }
  else
  if (diadic(op))
  then 
  { preparedepends(tree[a + t_op1], reg);
    preparedepends(tree[a + t_op2], reg)
  }
  else skip
}

proc sortdepends() is
  var r;
  var j;
  var temp;
  var mindep;
  var minset;
{ r := param_min; 
  while r < (param_min + param_count) do 
  { params_r[r] := r;
    r := r + 1
  };
  r := param_min; 
  while r < (param_min + param_count) do
  { minset := s_setsize(params_d[r]); 
    mindep := r; 
    j := r+1;
    while j < (param_min + param_count) do
    { if (s_setsize(params_d[j]) < minset)
      then
      { minset := s_setsize(params_d[j]);
        mindep := j
      }
      else skip;
      j := j + 1 
    };
    temp := params_r[r];
    params_r[r] := params_r[mindep];
    params_r[mindep] := temp;
    temp := params_d[r];
    params_d[r] := params_d[mindep];
    params_d[mindep] := temp;
    j := r;
    while j < (param_min + param_count) do
    { params_d[j] := s_remove(params_d[j], params_r[r]);
      j := j + 1
    };
    r := r + 1    
  }
}

proc genactuals(val x) is
  var act;
  var pname;
  var actual;
  var a;
{ if (x ~= nil)
  then
  { prepareactuals(x);
    sortdepends();
    act := param_min;
    while (act < (param_min + param_count)) do
    { if ((params_d[act] ~= 0) and (params_d[act] ~= s_reg(params_r[act])))
      then
        makeregfree(params_r[act])
      else skip;
      act := act + 1
    };
    act := param_min;
    while (act < (param_min + param_count)) do
    { actual := params_x[params_r[act]];
      movetoreg(params_r[act], actual);
      act := act + 1
    }
  }
  else skip
}  

proc prepareresults(val x) is
  var result;
  var resc;
{ resc := reg_min;
  while resc <= reg_max do
  { params_d[resc] := 0;
    resc := resc + 1
  };
  result := x;
  param_count := 0;
  while (tree[result + t_op] = s_comma) do
  { prepareresult(tree[result + t_op1]);
    result := tree[result + t_op2]; 
    param_count := param_count + 1
  };
  prepareresult(result);
  param_count := param_count + 1
}

proc prepareresult(val x) is
{ params_x[param_count] := x;
  params_r[param_count] := param_count;
  prepareresdepends(x, param_count)
}

proc prepareresdepends(val r, val reg) is
  var op;
  var source;
  var rn;
{ op := tree[r + t_op];
  if ((op = s_var) or (op = s_resp))
  then
  { rn := vnum(r);
    if (vn_isset(rn, b_reg))
    then
    { source := vn_reg(rn);
      params_d[source] := params_d[source] or s_reg(reg)
    } 
    else skip
  }
  else
    params_x[reg] := nil
}

proc genresults(val x) is
  var resc;
  var pname;
  var result;
  var a;
{ if (x ~= nil)
  then
  { prepareresults(x);
    sortdepends();
    resc := param_min;
    while (resc < (param_min + param_count)) do
    { if ((params_d[resc] ~= 0) and (params_d[resc] ~= s_reg(params_r[resc])))
      then
        makeregfree(params_r[resc])
      else skip;
      resc := resc + 1
    };
    resc := param_min;
    while (resc < (param_min + param_count)) do
    { result := params_x[params_r[resc]];
      if (result ~= nil)
      then
        movetoreg(params_r[resc], result)
      else skip;
      resc := resc + 1
    }
  }
  else skip
}  

proc genconst(val n) is
  var i;
  var cp;
  var found;
{ found := false;
  i := 0;
  while ((i < constp) and (found = false)) do
    if (consts[i] = n) 
    then
    { found := true;
      cp := i
    }
    else
      i := i + 1;
  if (found = false)
  then
  { consts[constp] := n;
    cp := constp;
    constp := constp + 1 
  }   
  else skip;
  return cp
}
    
proc genstring(val x) is
  var i;
  var sp;
{ sp := stringp;
  i := 0;
  while i <= ((tree[x + 1] and 255) / bytesperword) do
  { strings[stringp] := tree[x + i + 1];
    stringp := stringp + 1;
    i := i + 1
  };
  return sp
}

proc loadconstaddr(val offs) is
{ if (~((rsim_hasval[reg_gdest]) and (rsim_val[reg_gdest] = offs))) 
  then
  { genu10ref(i_ldapf, offs, cbf_const);
    rsim_hasval[reg_gdest] := true;
    rsim_val[reg_gdest] := offs
  }
  else skip
}

proc loadstringaddr(val offs) is
{ genu10ref(i_ldapf, offs, cbf_string);
  rsim_hasval[reg_gdest] := true;
  rsim_val[reg_gdest] := offs
}
    

func getlabel() is
{ labelcount := labelcount + 1;
  return labelcount
}

proc generate() is
  var s;
  
{ namep := 0;
  nameb := 0;

  labelcount := 0;
 
  constp := 0;
  stringp := 0;
 
  param_count := 0;
  
  frameoffset := 0;
  stackoffset := 0;

  skipnode := cons1(s_skip);
  optimising := false;
 
  arrayspace := 0;

  genprog(prog)

}

proc genprog(val x) is
  var dlab;
  var mainlab;
{ frm_init();
  if (tree[x + t_op2] ~= nil)
  then
    declvars(tree[x + t_op2], n_global)  
  else skip;
  declprocs(tree[x + t_op3]);
  nameb := namep;
  if (tree[x + t_op2] ~= nil)
  then
  { vn_init(); rsim_init(); lru_init();
    allocfrmarrays(tree[x + t_op2]);
    arraycount := frm_size; 
    allocfrm(tree[x + t_op2]);
    initports(tree[x + t_op2])
  }
  else skip;
  initfrmchans(tree[x + t_op2]);
  adjustarrays();
  mainlab := getlabel();
  genu10ref(i_blrf, mainlab, cbf_prog);
  gen0r(i_waiteu);
  setlab(mainlab);  

  genprocs(tree[x + t_op3]); 

  dlab := getlabel(); 
  setlab(dlab);
  
  flushbuffer();
  arrayspace := frm_size;
  genframearrays(tree[x + t_op2]);
  genframe(tree[x + t_op2]);

  outbin(0); outbin(0) 
}

proc adjustarrays() is
  var lab;
{ if (arraycount > 0)
  then
  { lab := getlabel();
    genru6(i_ldc, 10, arraycount);
    setlab(lab);
    gen2rus(i_subi, 10, 10, 1);
    gen3r(i_ldw, 9, reg_gdest, 10);
    gen3r(i_ldawf, 9, reg_gdest, 9);
    gen3r(i_stw, 9, reg_gdest, 10);
    genrlab(i_brbt, 10, lab)
  }
  else skip
}


func optimizable(val x) is
  return ~ (((ssize(allvarset(x)) > 11) or containscall(x)))


func containscall(val x) is
  var op;
  var cc;
  var body;
{ cc := false;
  op := tree[x + t_op];
  if ((op = s_proc) or (op = s_func))
  then
  { body := tree[x + t_op3];
    cc := containscall(tree[body + t_op2])
  }
  else
  if (op = s_return)
  then
    cc := containscall(tree[x + t_op1])
  else
  if (op = s_if)
  then
    cc := containscall(tree[x + t_op1]) or containscall(tree[x + t_op2]) or containscall(tree[x + t_op3])
  else
  if (op = s_while)
  then
    cc := containscall(tree[x + t_op1]) or containscall(tree[x + t_op2])
  else
  if (op = s_fncall)
  then
    cc := true
  else
  if (op = s_when)
  then
    cc := containscall(tree[x + t_op3])
  else
  if (op = s_mstrseq) or (op = s_slaveseq)
  then
    cc := containscall(tree[x + t_op2])
  else
  if (monadic(op))
  then
    cc := containscall(tree[x + t_op1])
  else
  if (diadic(op))
  then
    cc := containscall(tree[x + t_op1]) or containscall(tree[x + t_op2])
  else
  if ((op = s_semicolon) or (op = s_or))
  then
    cc := containscall(tree[x + t_op1]) or containscall(tree[x + t_op2]) 
  else
  if (op = s_and)
  then 
    cc := true
  else skip;
  return cc
}



proc genif(val x) is
  var fv;
  var thenpart;
  var elsepart;
  var elselab;
  var endlab;
  var livesafter;
  var livesthen;
  var liveselse;
  var livestop;
  var post;
{ fv := freevars(x);
  thenpart := tree[x + t_op2];
  elsepart := tree[x + t_op3];
  livesafter := tree[x + t_op4];
  livesthen := tree[x + t_op5];
  liveselse := tree[x + t_op6];
  livestop := sunion(sunion(livesthen, liveselse), rhsourceset(tree[x + t_op1]));
  if ((~ optimising) and (optimizable(x)))
  then
  { optimising := true;
    keeponly(fv);
    lockintoregs(fv, livestop); 
    genif(x); 
    unlockregs(fv);
    optimising := false
  }
  else
  if ((tree[thenpart + t_op] = s_skip) or (tree[elsepart + t_op] = s_skip))
  then
  { endlab := getlabel();
    if (optimising)
    then
    { post := gencondjump(tree[x + t_op1], (tree[thenpart + t_op] = s_skip), endlab);
      setpostsucc(post);
      if (tree[thenpart + t_op] = s_skip)
      then
      { checklive(liveselse);
        genstatement(elsepart)
      }
      else
      { checklive(livesthen);
        genstatement(thenpart)
      };
      setlab(endlab);
      forgetregvals();
      checklive(livesafter)
    }
    else
    { savelivevars(livesafter);
      post := gencondjump(tree[x + t_op1], (tree[thenpart + t_op] = s_skip), endlab); 
      setpostsucc(post);
      if (tree[thenpart + t_op] = s_skip)
      then
      { checklive(liveselse);
        genstatement(elsepart)
      }
      else
      { checklive(livesthen);
        genstatement(thenpart)
      };
      savelivevars(livesafter);
      setlab(endlab);
      forgetregs();
      checklive(livesafter)
    }
  }   
  else
  { elselab := getlabel();
    endlab := getlabel(); 
    if (optimising)
    then
    { post := gencondjump(tree[x + t_op1], false, elselab);
      checklive(livesthen);
      setpostsucc(post);
      genstatement(thenpart);
      genu6lab(i_brfu, endlab);
      setlab(elselab);
      forgetregvals();
      setlive(liveselse);  
      setposttarget(post);
      genstatement(elsepart);
      setlab(endlab);
      forgetregvals();
      checklive(livesafter)
    }
    else
    { savelivevars(liveselse);
      post := gencondjump(tree[x + t_op1], false, elselab);
      checklive(livesthen);
      setpostsucc(post);
      genstatement(thenpart);
      savelivevars(livesafter);
      genu6lab(i_brfu, endlab);
      forgetregs();
      setlivemem(liveselse);
      setposttarget(post);
      setlab(elselab);
      genstatement(elsepart);
      savelivevars(livesafter);
      setlab(endlab);
      forgetregs();
      checklive(livesafter)
    }
  }
}


proc genwhile(val x) is
  var fv;
  var startlab;
  var endlab;
  var livesdo;
  var livestop;
  var livesafter;
  var post;
{ startlab := getlabel();
  endlab := getlabel(); 
  fv := freevars(x);
  livesdo := tree[x + t_op4];
  livesafter := tree[x + t_op3];
  livestop := sunion(livesdo, livesafter);
  livestop := sunion(livestop, rhsourceset(tree[x + t_op1]));
  if ((~ optimising) and (optimizable(x)))
  then
  { optimising := true;
    keeponly(fv);
    lockintoregs(fv, livestop); 
    genwhile(x);
    unlockregs(fv);
    optimising := false
  }
  else 
  if (optimising)
  then
  { setlab(startlab);
    forgetregvals();
    post := gencondjump(tree[x + t_op1], false, endlab);
    checklive(livesdo);
    setpostsucc(post);
    genstatement(tree[x + t_op2]);
    genu6lab(i_brbu, startlab);
    setlab(endlab);
    forgetregvals();
    setposttarget(post);
    checklive(livesafter)
  }
  else
  { savelivevars(livestop);
    setlab(startlab);
    forgetregs();
    post := gencondjump(tree[x + t_op1], false, endlab);
    checklive(livesdo);
    setpostsucc(post);
    genstatement(tree[x + t_op2]);
    savelivevars(livestop);
    genu6lab(i_brbu, startlab);
    setlab(endlab);
    forgetregs();
    setposttarget(post);
    checklive(livesafter)
  }
}

proc genreturn(val x) is
  var r;
  var fv;
{ r := x;
  while tree[r + t_op] = s_semicolon do
    r := tree[r + t_op2];
  if tree[r + t_op] = s_return
  then
  { fv := freevars(r);
    param_min := (reg_fnres - listsize(tree[r + t_op1])) + 1;
    genactuals(tree[r + t_op1]);
    checklive(tree[r + t_op2])
  }
  else skip
}    
        
proc genstatement(val x) is
  var op;
  var reg;
  var bind;
  var dest;
  var source;
  var endlab;
  var fv;
  var lives;
  var cchan;
  var entry;
  var sourceop; 
{ op := tree[x + t_op];
  if ((op = s_skip) or (op = s_return))
  then
    skip
  else  
  if (op = s_if)
  then
    genif(x)
  else
  if (op = s_while)
  then
    genwhile(x)
  else
  if (op = s_ass) 
  then
  { fv := freevars(x);
    dest := tree[x + t_op1]; 
    source := tree[x + t_op2];
    sourceop := tree[source + t_op];
    if ((tree[dest + t_op] = s_var) or (tree[dest + t_op] = s_resp))
    then
    { if (visinset(tree[x + t_op3], vnum(dest)))  
      then
      { if (vn_isset(vnum(dest), b_rlock) or (vn_isset(vnum(dest), b_reg)))
        then
        { reg := vn_reg(vnum(dest)); 
          movetoreg(reg, source)          
        }
        else
        if ((sourceop = s_var) or (sourceop = s_valp)) 
        then
          if vn_isset(vnum(source), b_reg)
          then
          { if (visinset(tree[x + t_op3], vnum(source)))
            then
            { reg := a_getvarreg(vnum(dest));
              movetoreg(reg, source)
            }
            else
            { reg := vn_reg(vnum(source));
              vn_clearstate(vnum(source), b_reg)
            }
          }          
          else
          { reg := a_getvarreg(vnum(dest));
            movetoreg(reg, source);
            vn_clearstate(vnum(source), b_reg)
          }
        else
          reg := movetoanynewreg(source);          
        vn_setstate(vnum(dest), b_reg);
        vn_setreg(vnum(dest), reg);
        if (vn_isset(vnum(dest), b_mem))
        then
          vn_clearstate(vnum(dest), b_mem)
        else skip;
        rsim_free[reg] := false;
        if (isval(source))
        then
        { rsim_hasval[reg] := true;
          rsim_val[reg] := getval(source)
        }
        else
          rsim_hasval[reg] := false; 
        rsim_hasvar[reg] := true;
        rsim_var[reg] := vnum(dest)
      }
      else skip
    }
    else
    { reg := movetoanyreg(tree[x + t_op2]);
      arrayassign(tree[x + t_op1], reg);
      a_freetempreg(reg)
    };
    checklive(tree[x + t_op3])
  }
  else
  if (op = s_fncall)
  then
  { entry := tree[x + t_op2];
    if (fncheckargs(tree[x + t_op3], tree[entry + t_op2]))
    then 
    { lives := sminus(tree[x + t_op4], destset(x)); 
      lives := sunion(lives, procfreevars);
      if (tree[x + t_op1] ~= nil)
      then 
        lives := sunion(lives, rhsourceset(tree[x + t_op1]))
      else skip;
      savelivevars(lives);
      param_min := reg_min;
      genactuals(tree[x + t_op3]);
      gencall(tree[entry+ t_op4]);
      forgetregs();
      assignreturns(tree[x + t_op1]);
      setresults(tree[x + t_op3], tree[x + t_op2])
    }
    else
      namemessage("parameter mismatch in: ", procname);  
    checklive(tree[x + t_op4])  
  }
  else
  if (op = s_output)
  then
  { dest := tree[x + t_op1];
    cchan := movetoanyreg(dest);
    genoutput(tree[x + t_op2], cchan);
    checklive(tree[x + t_op3])
  }
  else
  if (op = s_moveout)
  then
  { dest := tree[x + t_op1];
    cchan := movetoanyreg(dest);
    genoutputtag(tree[x + t_op2], cchan);
    checklive(tree[x + t_op3])
  }
  else
  if (op = s_input)
  then
  { source := tree[x + t_op1];
    cchan := movetoanyreg(source);
    if tree[x + t_op] = s_timer
    then
      gentimerin(tree[x + t_op2], cchan)
    else
      geninput(tree[x + t_op2], cchan, i_in);
    checklive(tree[x + t_op3]) 
  }
  else
  if (op = s_movein)
  then
  { source := tree[x + t_op1];
    cchan := movetoanyreg(source);
    geninput(tree[x + t_op2], cchan, i_inct);
    checklive(tree[x + t_op3])
  } 
  else
  if (op = s_when)
  then
  { genorguards(x);
    gen0r(i_waiteu);
    genorbody(x);
    checklive(tree[x + t_op5])
  }
  else
  if (op = s_mstrseq) or (op = s_slaveseq)
  then
  { checkseq(tree[x + t_op1], tree[x + t_op2]);
    if insequence
    then
      genstatement(tree[x + t_op2])
    else 
    { insequence := true;
      genstatement(tree[x + t_op2]);
      insequence := false
    };
    cchan := movetoanyreg(tree[x + t_op1]);
    checklive(tree[x + t_op3])
  } 
  else
  if (op = s_and)
  then
  { lives := tree[x + t_op3];
    genand(x);
    checklive(lives)
  }
  else
  if (op = s_or)
  then
    genor(x) 
  else
  if (op = s_semicolon)
  then
  { genstatement(tree[x + t_op1]);
    genstatement(tree[x + t_op2])
  }
  else skip
}


proc sequence(val x, val cchan) is
{ if tree[x + t_op4] = s_slave
  then
    genrus(i_chkcti, cchan, ct_eom)
  else skip;
  genrus(i_outcti, cchan, ct_eom);
  geninput(tree[x + t_op2], cchan, i_in);
  genrus(i_chkcti, cchan, ct_eom);
  if tree[x + t_op4] = s_slave
  then
    genrus(i_outcti, cchan, ct_eom)
  else skip
} 


proc gencall(val entry) is 
{ if entry > proclabel
  then
    genu10ref(i_blrf, entry, cbf_prog)
  else
    genu10ref(i_blrb, entry, cbf_prog)
}


proc assignreturns(val dest) is
  var d;
  var firstreg;
  var reg;
  if dest = nil
  then skip
  else
  { firstreg := (reg_fnres - listsize(dest)) + 1;
    d := dest;
    reg := firstreg;
    while (tree[d + t_op] = s_comma) do
    { varassign(tree[d + t_op1], reg);
      d := tree[d + t_op2];
      reg := reg + 1
    };
    varassign(d, reg);
    d := dest;
    reg := firstreg;
    while (tree[d + t_op] = s_comma) do
    { arrayassign(tree[d + t_op1], reg);
      d := tree[d + t_op2];
      reg := reg + 1
    };
    arrayassign(d, reg)
  }
    
proc varassign(val dest, val reg) is
{ if ((tree[dest + t_op] = s_var) or (tree[dest + t_op] = s_resp))
  then
  { if (tree[dest + t_op1] = nil) 
    then
      bindtemp(dest, reg)
    else
    { vn_setstate(vnum(dest), b_reg); 
      vn_setreg(vnum(dest), reg);  
      if (vn_isset(vnum(dest), b_mem))
      then
        vn_clearstate(vnum(dest), b_mem)
      else skip;
      rsim_free[reg] := false;
      rsim_hasvar[reg] := true;
      rsim_var[reg] := vnum(dest);
      rsim_hasval[reg] := false
    }
  }
  else skip
}
      
proc arrayassign(val dest, val sourcereg) is
  var base;
  var subscript;
  var basereg;
  var subreg;
  if (tree[dest + t_op] = s_lsub)
  then
  { base := tree[dest + t_op1];
    subscript := tree[dest + t_op2];
    rsim_free[sourcereg] := false;
    if (tree[base + t_op] = s_chan)
    then
    { basereg := movetoanyreg(base);
      rsim_free[basereg] := false;
      subreg := movetoanyreg(subscript);
      genrus(i_outcti, basereg, ct_write);
      gen2r(i_out, subreg, basereg); 
      gen2r(i_out, sourcereg, basereg);
      a_freetempreg(subreg)
    } 
    else
    if (isimmediate12(subscript))
    then
    { basereg := movetoanyreg(base);
      gen2rus(i_stwi, sourcereg, basereg, getval(subscript))
    }
    else 
    { basereg := movetoanyreg(base);
      rsim_free[basereg] := false;
      subreg := movetoanyreg(subscript);
      gen2rus(i_stw, sourcereg, basereg, subreg);
      a_freetempreg(subreg) 
    };      
    a_freetempreg(basereg);
    a_freetempreg(sourcereg)
  }
  else 
    skip


proc genand(val x) is
  var initlab;
  var reg;
  var sreg;
  var child;
  var sstk;
  var ssize;
  var savevc;
  var syncv;
{ child := x;
  initlab := getlabel();
  savelivevars(tree[x + t_op3]);  
  ssize := stk_size;
  genu6lab(i_brfu, initlab);
  while (tree[child + t_op] = s_and) do
  { tree[child + t_op5] := getlabel();
    setlab(tree[child + t_op5]);
    forgetregs();
    sstk := cb_bufferp;
    setstk(0); 
    genstatement(tree[child + t_op1]);
    savelivevars(tree[child + t_op3]);
    forgetregs();
    gen0r(i_ssync); 
    insertsetstk(sstk, stk_size);
    tree[child + t_op6] := stk_size;
    reststk();
    stk_alloc(100);
    child := tree[child + t_op2]
  };
  setlab(initlab);
  forgetregs();
  setlive(tree[x + t_op4]);
  setlivemem(tree[x + t_op4]);
  sreg := a_getreg();
  genrus(i_getr, sreg, r_sync); 
  savevc := varcount;
  syncv := allocv();
  vn_initstate(syncv, b_reg or b_stack);
  vn_setreg(syncv, sreg);
  reg := a_getreg();
  child := x;
  while (tree[child + t_op] = s_and) do
  { gen2r(i_getst, reg, sreg);
    genu10ref(i_ldapb, tree[child + t_op5], cbf_prog);
    gen2r(i_tinitpc, reg_gdest, reg);
    genru6(i_ldawdp, reg_gdest, 0);
    gen2r(i_tinitdp, reg_gdest, reg);
    genru6stk(i_ldawsp, reg_gdest, tree[child + t_op6]);
    gen2r(i_tinitsp, reg_gdest, reg);
    child := tree[child + t_op2]
  };  
  a_freereg(reg);
  gen1r(i_msync, sreg);
  genstatement(child);
  if vn_isset(syncv, b_reg)
  then skip
  else 
  { sreg := a_getreg();
    vn_setreg(syncv, sreg);
    loadvar(syncv)
  };
  gen1r(i_mjoin, sreg);
  gen1r(i_freer, sreg); 
  a_freereg(sreg);
  vn_clearstate(syncv, b_reg);
  varcount := savevc;
  stk_size := ssize
}


proc genor(val x) is
  var waitlabel;
  var endlabel;
{ waitlabel := getlabel();
  endlabel := getlabel();
  genorguards(x);
  genu6lab(i_brfu, endlabel);
  setlab(waitlabel);
  gen0r(i_waiteu);
  genorbodies(x);
  setlab(endlabel);
  genu6lab(i_blrb, waitlabel)
}


proc genorguards(val x) is
  var op;
  var cond;
  var nextlab;
{ op := tree[x + t_op];
  if op = s_or
  then
  { genorguards(tree[x + t_op1]);
    genorguards(tree[x + t_op2])
  }
  else
  if op = s_fncall
  then
    genorcall(x)
  else
  { tree[x + t_op4] := getlabel();
    genevent(tree[x + t_op1], tree[x + t_op2])
  }    
}

proc genorbodies(val x) is
  var body;
{ body := x; 
  while (tree[body + t_op] = s_or) do
  { genorbody(tree[body + t_op1]);
    forgetregs();
    genu6(i_retsp, 0);
    body := tree[body + t_op2]
  };
  genorbody(body);
  genu6(i_retsp, 0)
}

proc genorbody(val x) is
  var inp;
  var cchan;
  var dest; 
  if tree[x + t_op] = s_fncall
  then skip
  else
  { inp := tree[x + t_op2];
    setlab(tree[x + t_op4]);
    gen0r(i_clre);
    if (tree[inp + t_op] = s_fncall)
    then
      geneventcall(x)
    else
      genstatement(x);
    genstatement(tree[x + t_op3])
  }

proc genevent(val c, val x) is
  var dest;
  var cmp;
  var cmpval;
  var cchan;
  var op;
  var cond;
  var skipl;
{ op := tree[x + t_op];
  if (op = s_input) 
  then
  { dest := tree[x + t_op2];
    cchan := movetoanyreg(tree[x + t_op1]);
    if (tree[dest + t_op] = s_colon)
    then
    { cmp := tree[dest + t_op2];
      if (tree[cmp + t_op] = s_eq) or (tree[cmp + t_op] = s_ne)  
      then
      { if (tree[cmp + t_op1] ~= tree[dest + t_op1])
        then 
          generror("error in input condition")
        else
        { if (tree[cmp + t_op] = s_eq)
          then
            genrus(i_setci, cchan, tr_eq)
          else  
          if (tree[cmp + t_op] = s_ne)
          then
            genrus(i_setci, cchan, tr_ne)
          else skip; 
          cmpval := movetoanyreg(tree[cmp + t_op2]);
          gen2r(i_setd, cchan, cmpval)
        }  
      }
      else
        generror("error in input")  
    }
    else
    if (tree[dest + t_op] = s_after)
    then
    { cmpval := movetoanyreg(tree[dest + t_op1]);
      gen2r(i_setd, cchan, cmpval)
    }
    else skip;   
    genu10ref(i_ldapf, tree[x + t_op4], cbf_prog);
    gen2r(i_setv, cchan, reg_gdest);
    gencenble(c, true, cchan)
  }
  else
  if op = s_mstrseq 
  then
  { cchan := movetoanyreg(tree[x + t_op1]);
    genu10ref(i_ldapf, tree[x + t_op4], cbf_prog);
    gen2r(i_setv, cchan, reg_gdest);
    gencenble(c, true, cchan)
  }  
  else
  if (op = s_fncall)
  then
  { if c = nil
    then
      genenablecall(x)
    else
    { skipl := getlabel();
      gencondjump(c, false, skipl);
      genenablecall(x);
      setlab(skipl)
    }
  }
  else skip
}      

proc genenablecall(val x) is 
  var sig;
  var lives;
{ sig := tree[x + t_op2];
  if fncheckargs(tree[x + t_op3], sig)
  then 
  { lives := sminus(tree[x + t_op4], destset(x)); 
    savelivevars(lives);
    param_min := reg_min;
    genactuals(tree[x + t_op3]);
    
    genru6(i_ldawsp, 10, 0);
    gencall(sig);
    forgetregs()
  }
  else
    namemessage("parameter mismatch in: ", procname);  
  checklive(tree[x + t_op4])  
}

proc geneventcall(val x) is 
  var sig;
  var lives;
{ sig := tree[x + t_op2];
  if fncheckargs(tree[x + t_op3], sig)
  then 
  { lives := sminus(tree[x + t_op4], destset(x)); 
    savelivevars(lives);
    
    
    gencall(sig);
    forgetregs();
    assignreturns(tree[x + t_op1])
  }
  else
    namemessage("parameter mismatch in: ", procname);  
  checklive(tree[x + t_op4])  
}
  
proc genorcall(val x) is skip
%   similar effect as genorguards (may even be the same)

proc genoutput(val list, val cchan) is
  var reg;
{ if (tree[list + t_op] = s_comma)
  then
  { genoutput(tree[list + t_op1], cchan);
    genoutput(tree[list + t_op2], cchan)
  }
  else
  { reg := movetoanyreg(list);
    gen2r(i_out, reg, cchan);
    a_freetempreg(reg) 
  }
}

proc genoutputtag(val list, val cchan) is
{ if (tree[list + t_op] = s_comma)
  then
  { genoutputtag(tree[list + t_op1], cchan);
    genoutputtag(tree[list + t_op2], cchan)
  }
  else
    genrus(i_outcti, cchan, getval(list)) 
}


proc geninput(val list, val rreg, val inst) is
  var reg;
  var name;
{ if (tree[list + t_op] = s_comma)
  then
  { geninput(tree[list + t_op1], rreg, inst);
    geninput(tree[list + t_op2], rreg, inst)
  }
  else
    geninassign(list, rreg, inst)
}


proc gentimerin(val list, val rreg) is
  var reg;
{ if (tree[list + t_op] = s_after)
  then
  { genru6(i_setci, rreg, c_after);
    reg := movetoanyreg(tree[list + t_op1]);      
    gen2r(i_setd, reg, rreg);
    gen2r(i_in, reg, rreg);
    a_freereg(reg)
  }  
  else
  { genru6(i_setci, rreg, c_uncond);
    geninassign(list, rreg, i_in)
  }
}

proc genportin(val list, val rreg) is skip


proc geninassign(val list, val rreg, val inst) is
  var reg;
{ if ((tree[list + t_op] = s_var) or (tree[list + t_op] = s_resp))
  then
  { if (vn_isset(vnum(list), b_reg))
    then
      gen2r(inst, vn_reg(vnum(list)), rreg)
    else
    { reg := a_getvarreg(vnum(list));
      gen2r(inst, reg, rreg);          
      vn_setreg(vnum(list), reg);  
      rsim_hasvar[reg] := true;
      rsim_var[reg] := vnum(list)
    };
    vn_setstate(vnum(list), b_reg);
    if (vn_isset(vnum(list), b_mem))
    then
      vn_clearstate(vnum(list), b_mem)
    else skip
  }
  else
    generror("error in input")
}


proc checkseq(val c, val x) is
  var op;
{ op := tree[x + t_op];
  if (op = s_if)
  then
  { checkseq(c, tree[x + t_op2]);
    checkseq(c, tree[x + t_op3])
  }
  else
  if (op = s_while)
  then
    checkseq(c, tree[x + t_op2])
  else
  if (op = s_output) or (op = s_input)
  then
    if c = tree[x + t_op1]
    then skip
    else
      cmperror("channel mismatch")    
  else
  if (op = s_fncall)
  then
    skip
  else
  if (op = s_mstrseq) or (op = s_slaveseq)
  then
    checkseq(c, tree[x + t_op2])
  else
  if (op = s_semicolon) 
  then
  { checkseq(c, tree[x + t_op1]);
    checkseq(c, tree[x + t_op2])
  }
  else skip
}

func gencondjump(val x, val f, val label) is
  var op;
  var seq;
  var post;
{ seq := x;
  op := tree[x + t_op];
  if op = s_semicolon
  then
  { while op = s_semicolon do
    { genstatement(tree[seq + t_op1]);
      seq := tree[seq + t_op2];
      op := tree[seq + t_op]
    };
    post := gencjump(seq, f, label);
    makedead(reg_fnres)
  }      
  else
    post := gencjump(x, f, label);
  return post
} 
      
proc gencjump(val x, val f, val label) is
  var cond;
  var reg;
  var op;
  var cx;
  var postval;
  var postvalid;
{ cx := x;
  cond := f;
  postvalid := true;
  op := tree[x + t_op];
  if (op = s_not) or (op = s_not1)
  then
  { cond := ~ cond;
    cx := tree[x + t_op1]
  } 
  else
  if op = s_prop1
  then
    cx := tree[x + t_op1]
  else skip;
  if tree[cx + t_op] = s_eq
  then
  { if iszero(tree[cx + t_op1]) 
    then
    { cx := tree[cx + t_op2];
      cond := ~ cond;
      postvalid := false
    }
    else skip;
    if iszero(tree[cx + t_op2]) 
    then
    { cx := tree[cx + t_op1];
      cond := ~ cond;
      postvalid := false
    }
    else skip
  }
  else skip;    
  reg := movetoanyreg(cx);
  if cond
  then
  { genrlab(i_brft, reg, label);
    postval := ps_f or reg
  }
  else
  { genrlab(i_brff, reg, label);
    postval := pt_f or reg
  }; 
  a_freetempreg(reg);
  if postvalid
  then
    if (op = s_not1) or (op = s_prop1)
    then
      if cond
      then postval := postval or pt_1
      else postval := postval or ps_1
    else skip
  else skip;   
  return postval
}

proc setpostsucc(val p) is  
  var reg;
{ reg := p and p_reg;
  if (p and ps_f) ~= 0
  then
  { rsim_hasval[reg] := true;
    rsim_val[reg] := 0
  }
  else
  if (p and ps_1) ~= 0
  then
  { rsim_hasval[reg] := true;
    rsim_val[reg] := 1
  }
  else skip
}

proc setposttarget(val p) is  
  var reg;
{ reg := p and p_reg;
  if (p and pt_f) ~= 0
  then
  { rsim_hasval[reg] := true;
    rsim_val[reg] := 0
  }
  else
  if (p and pt_1) ~= 0
  then
  { rsim_hasval[reg] := true;
    rsim_val[reg] := 1
  }
  else skip
}

proc gencenble(val x, val f, val prt) is
  var cond;
  var reg;
  var op;
  var cx;
{ cx := x;
  cond := f;
  if x = nil
  then
    gen1r(i_eeu, prt)
  else
  { op := tree[x + t_op];
    if (op = s_not) or (op = s_not1)
    then
    { cond := ~ cond;
      cx := tree[x + t_op1]
    } 
    else
    if (op = s_prop1)
    then
      cx := tree[x + t_op1]
    else skip;
    reg := movetoanyreg(cx);
    if cond
    then
      gen2r(i_eet, reg, prt)
    else
      gen2r(i_eef, reg, prt); 
    a_freetempreg(reg)
  }
}

func iszero(val x) is
  return (isval(x) and (getval(x) = 0))


func isimmediate12(val x) is
  var value;
{ value := getval(x);
  return (isval(x) and (value >= 0) and (value < 12))
}
  
func isimmediate64(val x) is
  var value;
{ value := getval(x);
  return (isval(x) and (value >= 0) and (value < 64))
}  

func isimmediate1024(val x) is
  var value;
{ value := getval(x);
  return (isval(x) and (value >= 0) and (value < 1024))  
}  

func isimmediate65536(val x) is
  var value;
{ value := getval(x);
  return (isval(x) and (value >= 0) and (value < 65536))
}  


proc genimmshift(val op, val dreg, val reg, val shiftval) is    
{ if shiftval < 0
  then
    generror("negative shift")
  else
  if shiftval >= 32
  then
    genru6(i_ldc, dreg, 0)
  else        
  if shiftval >= 24
  then
  { gen2rus(op, dreg, reg, 10);
    genimmshift(op, dreg, dreg, shiftval - 24)
  }
  else
  if shiftval >= 16
  then
  { gen2rus(op, dreg, reg, 9);
    genimmshift(op, dreg, dreg, shiftval - 16)
  }
  else
  if shiftval >= 8
  then
  { gen2rus(op, dreg, reg, 8);
    genimmshift(op, dreg, dreg, shiftval - 8)
  }
  else
  if shiftval > 0
  then
    gen2rus(op, dreg, reg, shiftval)
  else 
  if dreg ~= reg
  then 
    genmov(dreg, reg)
  else skip 
}
     
   
func expdepth(val x) is 
  var op;
  var left;
  var right;
  var d;
  var dleft;
  var dright;
{ op := tree[x + t_op];
  if monadic(op)
  then
    d := expdepth(tree[x + t_op1])
  else
  if diadic(op)
  then
  { dleft := expdepth(tree[x + t_op1]);  
    dright := expdepth(tree[x + t_op2]);
    if dleft = dright 
    then
      d := 1 + dleft
    else
    if dleft > dright
    then
      d := dleft
    else 
      d := dright
  } 
  else
    d := 0;
  return d
}    

proc movetoreg(val reg, val x) is
  var op;
  var left;
  var right;
  var leftreg;
  var rightreg;
  var offs;
  var value;
{ op := tree[x + t_op];
  if isval(x)
  then
  { value := getval(x);
    if isimmediate64(x)
    then
      genru6(i_ldc, reg, value)
    else
    if value = (-1)
    then
      genrus(i_mkmski, reg, 0)
    else 
    if value = 127
    then 
      genrus(i_mkmski, reg, 7)
    else
    if value = 255
    then 
      genrus(i_mkmski, reg, 8)
    else
    if value = 65535
    then 
      genrus(i_mkmski, reg, 9)
    else
    { rightreg := a_findnumreg(value);
      if rightreg >= 0
      then
        gen3r(i_or, reg, rightreg, rightreg)
      else
      if isimmediate65536(x) 
      then
        genru6(i_ldc, reg, value)
      else
      { offs := genconst(value);
        loadconstaddr((offs / 12) * 12);
        gen2rus(i_ldwi, reg, reg_gdest, offs rem 12)
      }
    };
    rsim_free[reg] := false;
    rsim_hasvar[reg] := false;
    rsim_hasval[reg] := true;
    rsim_val[reg] := value
  }
  else   
  if op = s_string
  then
  { makeregfree(reg_gdest);
    offs := genstring(x);
    loadstringaddr(offs);
    if reg ~= reg_gdest
    then
      gen3r(i_or, reg, reg_gdest, reg_gdest)
    else skip;
    rsim_hasvar[reg] := false;
    rsim_hasval[reg] := false;
    rsim_free[reg] := false 
  }
  else
  if (op = s_var) or (op = s_array) or (op = s_valp) or (op = s_chan) or (op = s_timer)
  then
  { if vn_isset(vnum(x), b_reg) 
    then
    { if vn_reg(vnum(x)) ~= reg
      then
      { genmov(reg, vn_reg(vnum(x)));    
        rsim_hasval[reg] := false;
        rsim_hasvar[reg] := false    
      }
      else skip
    }
    else
    { vn_setreg(vnum(x), reg);
      loadvar(vnum(x))
    };
    rsim_free[reg] := false
  }             
  else
  if op = s_neg
  then
  { left := tree[x + t_op1];
    rsim_free[reg] := false;
    leftreg := moveop1toreg(reg, left, nil);
    gen2r(i_neg, reg, leftreg);
    a_freetempregbut(reg, leftreg)  
  }
  else
  if op = s_prop1
  then
  { left := tree[x + t_op1];
    leftreg := moveop1toreg(reg, left, nil);
    gen2r(i_neg, reg, leftreg);
    a_freetempregbut(reg, leftreg)  
  }
  else  
  if op = s_not1
  then
  { left := tree[x + t_op1];
    if (relop(tree[left + t_op1]))
    then
    { movectoreg(reg, left);
      gen2rus(i_subi, reg, reg, 1)
    }
    else
    { leftreg := moveop1toreg(reg, left, nil);
      gen2rus(i_subi, reg, reg, 1);
      a_freetempregbut(reg, leftreg)  
    }  
  }
  else 
  if op = s_not
  then
  { left := tree[x + t_op1];
    leftreg := moveop1toreg(reg, left, nil);
    gen2r(i_not, reg, leftreg);
    a_freetempregbut(reg, leftreg)  
  }  
  else
  if (op = s_sub) or (op = s_lsub)
  then
  { left := tree[x + t_op1];
    right := tree[x + t_op2];
    rsim_free[reg] := false;
    if (tree[left + t_op] = s_chan)
    then
    { rightreg := moveop1toreg(reg, right, left);
      leftreg := moveop2toreg(reg, rightreg, left);
      genrus(i_outcti, leftreg, ct_read);
      gen2r(i_out, rightreg, leftreg);
      gen2r(i_in, reg, leftreg);
      a_freetempregbut(reg, leftreg);
      a_freetempregbut(reg, rightreg)
    } 
    else
    if isimmediate12(right)
    then
    { leftreg := moveop1toreg(reg, left, nil);
      if (op = s_sub)
      then
        gen2rus(i_ldwi, reg, leftreg, getval(right))
      else 
        gen2rus(i_ldawfi, reg, leftreg, getval(right))            
    }
    else 
    { rightreg := moveop1toreg(reg, right, left);
      leftreg := moveop2toreg(reg, rightreg, left);
      if (op = s_sub)
      then
        gen3r(i_ldw, reg, leftreg, rightreg)
      else 
        gen3r(i_ldawf, reg, leftreg, rightreg);
      a_freetempregbut(reg, leftreg);
      a_freetempregbut(reg, rightreg)
    };
    rsim_hasvar[reg] := false;
    rsim_hasval[reg] := false     
  }
  else
  if ((op = s_lshift) or (op = s_rshift)) and (isval(tree[x + t_op2]))
  then
  { left := tree[x + t_op1];
    right := tree[x + t_op2];
    rsim_free[reg] := false;
    leftreg := moveop1toreg(reg, left, nil);
    if op = s_lshift
    then
      genimmshift(i_shli, reg, leftreg, getval(tree[x + t_op2]))
    else
      genimmshift(i_shri, reg, leftreg, getval(tree[x + t_op2]));
    rsim_hasvar[reg] := false;
    rsim_hasval[reg] := false
  }
  else 
  if relop(op)
  then
    movectoreg(reg, x)
  else
  if diadic(op)
  then
  { left := tree[x + t_op1];
    right := tree[x + t_op2];
    rsim_free[reg] := false;
    if (op = s_plus) and isimmediate12(left)  
    then
    { rightreg := moveop1toreg(reg, right, nil);
      gen2rus(i_addi, reg, rightreg, getval(left));
      a_freetempregbut(reg, rightreg)  
    }  
    else 
    if (op = s_plus) and isimmediate12(right)
    then
    { leftreg := moveop1toreg(reg, left, nil);
      gen2rus(i_addi, reg, leftreg, getval(right));
      a_freetempregbut(reg, leftreg)
    }
    else
    if (op = s_minus) and isimmediate12(right)
    then
    { leftreg := moveop1toreg(reg, left, nil);
      gen2rus(i_subi, reg, leftreg, getval(right));
      a_freetempregbut(reg, leftreg)
    }
    else
    { if expdepth(left) >= expdepth(right)
      then
      { leftreg := moveop1toreg(reg, left, right);
        rightreg := moveop2toreg(reg, leftreg, right)
      }
      else
      { rightreg := moveop1toreg(reg, right, left);
        leftreg := moveop2toreg(reg, rightreg, left)
      };
      gendiadic(op, reg, leftreg, rightreg);
      a_freetempregbut(reg, leftreg);
      a_freetempregbut(reg, rightreg)
    };
    rsim_hasvar[reg] := false;
    rsim_hasval[reg] := false
  }
  else skip
}         

proc a_freetempregbut(val reg, val r) is
{ if reg ~= r
  then
    a_freetempreg(r)
  else skip
}

func moveop1toreg(val dreg, val x, val y) is
  var reg;
  var numval;
  var op;
{ op := tree[x + t_op];
  if isval(x)
  then
  { reg := a_findnumreg(getval(x));
    if reg < 0
    then
    { reg := a_getreg();
      movetoreg(reg, x)
    }
    else skip
  }      
  else
  if op = s_string
  then
  { reg := reg_gdest;
    movetoreg(reg, x)
  }
  else
  if (op = s_var) or (op = s_valp) or (op = s_array) or (op = s_chan)
  then
  { if vn_isset(vnum(x), b_reg) 
    then
      reg := vn_reg(vnum(x))
    else
    { reg := a_getvarreg(vnum(x));
      vn_setreg(vnum(x), reg);
      loadvar(vnum(x))
    };
    lru_ref(reg)
  }
  else
  if needsreg(dreg, y) 
  then
    reg := movetoanyreg(x)
  else
  { movetoreg(dreg, x);
    reg := dreg
  };
  return reg
}

func needsreg(val dreg, val x) is
  var r;
{ if x = nil
  then 
    r := false
  else
    r := (rsim_hasvar[dreg] and visinset(rhsourceset(x), rsim_var[dreg]));
  return r
}

func moveop2toreg(val dreg, val regop1, val x) is
  var reg;
{ if dreg = regop1
  then
    reg := movetoanyreg(x)
  else
    reg := moveop1toreg(dreg, x, nil);
  return reg
}

func movetoanynewreg(val x) is
  var reg;
  var numval;
  var op;
{ op := tree[x + t_op];
  if isval(x)
  then
  { reg := a_getreg();
    movetoreg(reg, x)
  }      
  else
  if (op = s_string)
  then
  { reg := reg_gdest;
    movetoreg(reg, x)
  }
  else
  if (op = s_var) or (op = s_valp) or (op = s_array) or (op = s_chan) or (op = s_timer)
  then
  { if vn_isset(vnum(x), b_reg) 
    then
      reg := vn_reg(vnum(x))
    else
    { reg := a_getvarreg(vnum(x));
      vn_setreg(vnum(x), reg);
      loadvar(vnum(x))
    };
    lru_ref(reg) 
  }
  else 
  { reg := a_getreg();
    rsim_temp[reg] := true;
    movetoreg(reg, x)
  };
  return reg
}

func movetoanyreg(val x) is
  var reg;
{ if isval(x)
  then
  { reg := a_findnumreg(getval(x));
    if reg < 0
    then
      reg := movetoanynewreg(x)
    else skip
  }
  else
    reg := movetoanynewreg(x);
  return reg
}


proc movectoreg(val reg, val x) is
  var op;
  var left;
  var right;
  var tset;
  var leftreg;
  var rightreg;
{ op := tree[x + t_op];
  left := tree[x + t_op1];
  right := tree[x + t_op2];
  if ((op = s_eq) and isimmediate12(left))  
  then
  { rightreg := moveop1toreg(reg, right, nil);
    gen2rus(i_eqi, reg, rightreg, getval(left));
    a_freetempregbut(reg, rightreg)
  }  
  else 
  if ((op = s_eq) and isimmediate12(right))
  then
  { leftreg := moveop1toreg(reg, left, nil);
    gen2rus(i_eqi, reg, leftreg, getval(right));
    a_freetempregbut(reg, leftreg)
  }
  else  
  { if (expdepth(left) >= expdepth(right)) 
    then
    { leftreg := moveop1toreg(reg, left, right);
      rightreg := moveop2toreg(reg, leftreg, right)
    }
    else
    { rightreg := moveop1toreg(reg, right, left);
      leftreg := moveop2toreg(reg, rightreg, left)
    };    
    if (op = s_eq)
    then
      gen3r(i_eq, reg, leftreg, rightreg)
    else
      gen3r(i_lss, reg, leftreg, rightreg);
    a_freetempregbut(reg, leftreg);
    a_freetempregbut(reg, rightreg);
    rsim_hasvar[reg] := false;
    rsim_hasval[reg] := false             
  }
}


proc lru_init() is
  lru_size := 0


proc lru_ref(val n) is
  var i;
{ i := lru_size;
  while ((i > 0) and (lru_list[i-1] ~= n)) do
    i := i - 1;
  if (i = 0)
  then
  { lru_size := lru_size + 1;
    i := lru_size
  }
  else skip;
  while (i > 1) do    
  { lru_list[i-1] := lru_list[i-2];
    i := i - 1
  };
  lru_list[0] := n
}

func lru_oldest() is
  return lru_list[lru_size - 1]


proc lru_del(val n) is
  var i;
{ i := 1;
  while ((i <= lru_size) and (lru_list[i-1] ~= n)) do
    i := i + 1;
  if (lru_list[i-1] = n)
  then
  { while (i <= lru_size) do 
    { lru_list[i-1] := lru_list[i];
      i := i + 1
    };
    lru_size := lru_size - 1
  }
  else skip
}

proc stk_init() is 
{ stk_size := 0;
  stk_max := 0
}

func stk_alloc(val n) is
{ stk_size := stk_size + n;
  if stk_max < stk_size
  then 
    stk_max := stk_size
  else
    skip;
  return stk_size - n
}

proc frm_init() is
  frm_size := 0

func frm_alloc() is
{ frm_size := frm_size + 1;
  return frm_size - 1
}

proc rsim_init() is
  var r;
{ r := 0;
  while r <= rsim_max do
  { rsim_free[r] := true; 
    rsim_temp[r] := false;
    rsim_hasval[r] := false;
    rsim_hasvar[r] := false;
    r := r + 1
  }
}

func a_getreg() is
  var r; 
  var found;
{ found := false;
  r := rsim_max - 1;
  while ((r >= 0) and (~ found)) do
    if (rsim_free[r] and (~ rsim_hasval[r])) 
    then
      found := true
    else
      r := r - 1;
  if (~ found)
  then
  { r := rsim_max - 1;
    while ((r >= 0) and (~ found)) do
      if (rsim_free[r]) 
      then
        found := true
      else
        r := r - 1
  }
  else skip;
  if (~ found)
  then
  { r := rsim_max - 1;
    while ((r >= 0) and (~ found)) do
      if ((~ rsim_hasvar[r]) and rsim_hasval[r]) 
      then
        found := true
      else
        r := r - 1
  }
  else skip;
  if (~ found)
  then
  { r := lru_oldest();
    makeregfree(r)
  }
  else skip;
  rsim_free[r] := false;
  return r
}
      
func a_getvarreg(val vn) is
  var r; 
{ if (vn_isset(vn, b_rlock))
  then
    r := vn_reg(vn)
  else
    r := a_getreg();
  rsim_temp[r] := false;
  rsim_free[r] := false;
  rsim_hasvar[r] := true;
  rsim_var[r] := vn;
  return r
}

func a_findnumreg(val n) is
  var r; 
  var found;
{ found := false;
  r := rsim_max - 1;
  while ((r >= 0) and (~ found)) do
    if ((rsim_hasval[r]) and (rsim_val[r] = n))
    then
      found := true
    else
      r := r - 1;
  return r
}

func a_getnumreg(val n) is
  var r;
{ r := a_getreg();
  rsim_free[r] := false;
  rsim_hasval[r] := true;
  rsim_hasvar[r] := false;
  rsim_val[r] := n;
  return r
}

proc a_freereg(val r) is
{ rsim_free[r] := true;
  lru_del(r)
}

proc a_clearreg(val r) is
{ a_freereg(r);
  rsim_hasval[r] := false;
  rsim_hasvar[r] := false
}

proc a_clearregval(val r) is
  rsim_hasval[r] := false


proc a_freetempreg(val r) is
{ if (~ (rsim_hasvar[r] ))
  then
    a_freereg(r)
  else skip
}

proc keeponly(val vset) is
  var r;
  var v; 
{ r := rsim_max;
  while (r >= 0) do 
  { if ((~ rsim_free[r]) and (rsim_hasvar[r]))
    then
    { v := rsim_var[r];
      if (~ visinset(vset, v)) 
      then
        storevar(v)
      else skip
    } 
    else skip; 
    r := r - 1
  }
}

func visinset(val set, val vn) is
  return ((1 << vn) and set) ~= 0 

proc vn_initstate(val vnum, val s) is
  v_state[vnum] := s

proc vn_setstate(val vnum, val s) is
  v_state[vnum] := v_state[vnum] or s 

proc vn_clearstate(val vnum, val s) is
  v_state[vnum] := v_state[vnum] and (~ s)

func vn_isset(val vnum, val s) is
  return (v_state[vnum] and s) ~= 0 

func vn_isclear(val vnum, val s) is
  return (v_state[vnum] and s) = 0 

func vn_offset(val vnum) is
  return v_offs[vnum]
 
proc vn_setoffset(val vnum, val offs) is
  v_offs[vnum] := offs

func vn_reg(val vnum) is
  return (v_state[vnum] and b_regmask)

proc vn_setreg(val vnum, val r) is
  v_state[vnum] := (v_state[vnum] and (~ b_regmask)) or r

proc vn_init() is
  var vnum; 
{ vnum := 0;
  while vnum<32 do
  { vn_initstate(vnum, 0);
    vnum := vnum + 1
  }
}

func vnum(val x) is
  return tree[x + t_op2]


proc setvnum(val x) is
  var op;
  var v;
{ op := tree[x + t_op];
  if ((op = s_var) or (op = s_array) or (op = s_valp) or (op = s_resp) or
      (op = s_chan) or (op = s_timer)) 
  then
  { if (tree[x + t_op2] < 0)
    then
    { v := allocv();
      tree[x + t_op2] := v;
      v_vars[v] := x
    } 
    else skip
  }
  else skip
}


func allocv() is 
  var v;
{ if varcount = 32
  then
  { cmperror("too many variables");
    namemessage("in function", procname)
  }
  else 
  { v := varcount;
    varcount := varcount + 1;
    if (varcount > topvarcount)
    then
      topvarcount := varcount
    else skip
  };
  v_vars[v] := 0;
  return v 
} 


proc clearvnums() is
  var vnum;
{ vnum := 0;
  while vnum<topvarcount do
  { if v_vars[vnum] = 0
    then skip
    else
      tree[v_vars[vnum] + t_op2] := -1;
    vnum := vnum + 1
  }
}

proc makeregfree(val r) is
  var v;
{ if (~ rsim_free[r]) 
  then
  { v := rsim_var[r];
    if (vn_isset(v, b_reg) and vn_isclear(v, b_mem))
    then
      storevar(v)
    else skip;  
    vn_clearstate(v, b_reg) 
  }
  else skip;
  a_clearreg(r)
}


proc savevar(val vn) is
  var offs;
{ if (vn_isset(vn, b_reg) and vn_isclear(vn, b_mem))
  then
  { if (vn_isset(vn, b_stack))
    then
    { if (vn_isclear(vn, b_malloc))
      then
        vn_setoffset(vn, stk_alloc(1))
      else skip;
      genru6stk(i_stwsp, vn_reg(vn), vn_offset(vn))
    }
    else
    if (vn_isset(vn, b_frame))
    then
    { if (vn_isclear(vn, b_malloc))
      then
        vn_setoffset(vn, frm_alloc())
      else skip;
      genru6(i_stwdp, vn_reg(vn), vn_offset(vn))
    }
    else skip;    
    vn_setstate(vn, b_malloc);
    vn_setstate(vn, b_mem)
  }
  else skip
}

proc storevar(val vn) is
{ savevar(vn);
  vn_clearstate(vn, b_reg);
  a_clearreg(vn_reg(vn))
}

proc loadvar(val vn) is
  var offs;
  var reg;
{ if (vn_isset(vn, b_stack))
  then
    genru6stk(i_ldwsp, vn_reg(vn), vn_offset(vn))
  else
  if (vn_isset(vn, b_frame))
  then
    genru6(i_ldwdp, vn_reg(vn), vn_offset(vn))
  else skip;
  vn_setstate(vn, b_reg); 
  reg := vn_reg(vn);
  rsim_hasval[reg] := false;
  rsim_hasvar[reg] := true;
  rsim_var[reg] := vn
}


proc printlist(val s, val vset) is
  var h;
  var vn;
{ prints(s); newline(); 
  vn := 0;
  while (vn < topvarcount) do
  { if (visinset(vset, vn)) 
    then
    { h := v_vars[vn];
      namemessage("name:", tree[h + t_op1]) 
    }
    else skip;
    vn := vn + 1
  }
} 


proc checklive(val liveset) is
  var vn;
  var op;
{ vn := 0;
  while (vn < topvarcount) do
  { if (v_vars[vn] = 0) or visinset(liveset, vn)
    then skip
    else 
    if vn_isset(vn, b_reg)
    then
    { op := tree[v_vars[vn] + t_op];
      if (op = s_chan) or (op = s_timer) 
      then
        gen1r(i_freer, vn_reg(vn))
      else skip;
      vn_clearstate(vn, b_reg);
      a_clearreg(vn_reg(vn))
    }
    else skip; 
    vn := vn + 1
  }
}      


proc setlivemem(val liveset) is
  var vn;
  var reg;
{ vn := 0;
  while vn < topvarcount do
  { if visinset(liveset, vn)
    then 
      vn_setstate(vn, b_mem) 
    else skip;
    vn := vn + 1
  }
}


proc setlive(val liveset) is
  var vn;
  var reg;
{ vn := 0;
  while vn < topvarcount do
  { if visinset(liveset, vn) and vn_isset(vn, b_rlock)
    then 
    { vn_setstate(vn, b_reg);
      reg := vn_reg(vn);
      rsim_free[reg] := false;
      rsim_hasvar[reg] := true;
      rsim_var[reg] := vn
    } 
    else skip;
    vn := vn + 1
  }
}
  


proc makedead(val reg) is
  var vn;
{ vn := rsim_var[reg];
  vn_clearstate(vn, b_mem);
  if (vn_isset(vn, b_reg))
  then
  { vn_clearstate(vn, b_reg);
    a_clearreg(vn_reg(vn))
  }
  else skip
}
    
proc savelivevars(val liveset) is
  var vn;
{ vn := 0;
  while (vn < topvarcount) do
  { if (v_vars[vn] = 0) or (visinset(liveset, vn))
    then
      savevar(vn)
    else skip;
    vn := vn + 1
  }
}

proc loadvars(val liveset) is
  var vn;
  var reg;
{ vn := 0;
  while (vn < topvarcount) do 
  { if (visinset(liveset, vn))
    then
    { if (vn_isclear(vn, b_reg) and (vn_isset(vn, b_mem)))
      then
      { reg := a_getvarreg(vn);
        vn_setreg(vn, reg);
        loadvar(vn)
      }
      else skip
    }
    else skip;
    vn := vn + 1
  }
}

proc lockintoregs(val varset, val liveset) is
  var vn;
  var reg;
{ vn := 0;
  while (vn < topvarcount) do
  { if (visinset(varset, vn))
    then 
    { if (vn_isclear(vn, b_reg))
      then
      { reg := a_getreg();      
        rsim_temp[reg] := false;
        rsim_hasvar[reg] := true;
        rsim_var[reg] := vn;
        vn_setreg(vn, reg);
        vn_setstate(vn, b_reg);
        if (vn_isset(vn, b_mem) and visinset(liveset, vn))
        then
          loadvar(vn)
        else skip
      }
      else skip;
      vn_setstate(vn, b_rlock)
    }
    else skip;
    vn := vn + 1
  };
  checklive(liveset) 
}   


proc unlockregs(val varset) is
  var vn;
{ vn := 0;
  while (vn < topvarcount) do
  { if (visinset(varset, vn))
    then
      vn_clearstate(vn, b_rlock)
    else skip;
    vn := vn + 1
  }
}   


proc forgetregvals() is
  var r;
{ r := 0;
  while r <= rsim_max do
  { rsim_hasval[r] := false;
    r := r + 1
  }
}  


proc forgetregs() is
  var vn;
{ vn := 0;
  while (vn < topvarcount) do
  { vn_clearstate(vn, b_reg);   
    vn := vn + 1
  };
  rsim_init()
}    



func monadic(val op) is
  return ((op = s_not) or (op = s_not1) or (op = s_prop1) or (op = s_neg) or (op = s_after))


func diadic(val op) is 
  return ((op and s_diadic) ~= 0)


func relop(val op) is
  return ((op = s_eq) or (op = s_ne) or
         (op = s_ls) or (op = s_le) or
         (op = s_gr) or (op = s_ge))


proc genmov(val dest, val src) is
  gen3r(i_or, dest, src, src) 


proc gendiadic(val op, val op1, val op2, val op3) is 
  var i;
{ if (op = s_plus)
  then
    i := i_add
  else   
  if (op = s_minus)
  then
    i := i_sub
  else   
  if (op = s_mult)
  then
    i := i_mul
  else   
  if (op = s_div)
  then
    i := i_divs
  else   
  if (op = s_rem)
  then
    i := i_rems
  else   
  if (op = s_logor)
  then
    i := i_or
  else   
  if (op = s_logand)
  then
    i := i_and
  else   
  if (op = s_xor)
  then
    i := i_xor
  else   
  if (op = s_lshift)
  then
    i := i_shl
  else   
  if (op = s_rshift)
  then
    i := i_shr
  else skip;
  gen3r(i, op1, op2, op3)
}

proc gen3r(val op, val op1, val op2, val op3) is
  var opc;
  var subopc;
  var operands;
  var highpart;
  var lowpart;
  var pfixop;
{ opc := op;
  subopc := (op1 >> 2) + ((op2 >> 2) * 3) + ((op3 >> 2) * 9);
  operands := (subopc << 6) or ((op1 and 3) << 4) or ((op2 and 3) << 2) or (op3 and 3);
  if (opc >= i_l3)
  then
  { opc := opc - i_l3;
    if (opc > 20)
    then
    { pfixop := opc - 8;
      opc := 12
    }
    else
      pfixop := 12;
    if (opc > 9)
    then
      opc := opc + 6
    else skip;
    lowpart := (31 << 11) or operands;
    highpart :=  (opc << 11) or (31 << 6) or 32 or pfixop;
    genl((highpart << 16) or lowpart)
  }    
  else
  { if (opc > 9)
    then
      opc := opc + 6
    else skip;
    gens((opc << 11) or operands)
  }
}

proc gen2rus(val op, val op1, val op2, val op3) is
  gen3r(op, op1, op2, op3)
 

proc gen2r(val op, val op1, val op2) is
  var opc;
  var subopc;
  var bit4;
  var bit5;
  var operands;
  var highpart;
  var lowpart;
{ bit4 := (op and 1) << 4;
  opc := op >> 1;
  subopc := (op1 >> 2) + ((op2 >> 2) * 3);
  bit5 := (subopc / 5) << 5;
  subopc := 27 + (subopc rem 5);
  operands := (subopc << 6) or bit5 or ((op1 and 3) << 2) or (op2 and 3);
  if (opc >= i_l2)
  then
  { opc := opc - i_l2;
    if (opc > 9)
    then
      opc := opc + 6
    else skip;
    lowpart := (31 << 11) or bit4 or operands;
    highpart :=  (opc << 11) or (31 << 6) or 32 or 12;
    genl((highpart << 16) or lowpart)
  }    
  else
  { if (opc > 9)
    then
      opc := opc + 6
    else skip;
    gens((opc << 11) or bit4 or operands)
  }
}

proc genrus(val op, val op1, val op2) is
  gen2r(op, op1, op2)
 

proc gen1r(val op, val op1) is
  var opc;
  var bit4;
{ bit4 := (op and 1) << 4;
  opc := op >> 1;
  if (opc > 9)
  then
    opc := opc + 6
  else skip;
  gens((opc << 11) or (31 << 6) or (1 << 5) or bit4 or op1)
}

proc gen0r(val op) is
  var opc;
  var bit4;
{ bit4 := (op and 4) << 2;
  opc := op >> 3;
  gens((opc << 11) or (31 << 6) or (1 << 5) or bit4 or ((op and 3) + 12))
}

proc genru6(val op, val op1, val op2) is
  var opc;
  var highpart;
  var lowpart;
{ opc := op + 20;
  if (op2 < 64)
  then
    gens((opc << 10) or (op1 << 6) or op2)
  else
  { lowpart := (30 << 11) or (op2 >> 6);
    highpart := (opc << 10) or (op1 << 6) or (op2 and 63);
    genl((highpart << 16) or lowpart)
  }
}

proc genu6(val op, val op1) is
  var opc;
  var subopc;
  var highpart;
  var lowpart;
{ subopc := (((op and 3) + 12) << 6) or ((op and 4) << 8);
  opc := (op >> 2) + 28;
  if (op1 < 64)
  then
    gens((opc << 10) or subopc or (op1 and 63))
  else
  { lowpart := (30 << 11) or (op1 >> 6);
    highpart := (opc << 10) or subopc or (op1 and 63);
    genl((highpart << 16) or lowpart)  
  }
}

proc genrlab(val op, val op1, val op2) is
  var opc;
{ opc := op + 20;
  genslab((opc << 10) or (op1 << 6), op2, cbf_prog)  
}

proc genu6lab(val op, val op1) is
  var opc;
  var subopc;
{ subopc := (((op and 3) + 12) << 6) or ((op and 4) << 8);
  opc := (op >> 2) + 28;
  genslab((opc << 10) or subopc, op1, cbf_prog)  
}

proc genu6stk(val op, val op1) is
  var opc;
  var subopc;
{ subopc := (((op and 3) + 12) << 6) or ((op and 4) << 8);
  opc := (op >> 2) + 28;
  genslab((opc << 10) or subopc, op1, cbf_stk)  
}

proc genru6stk(val op, val op1, val op2) is
  var opc;
{ opc := op + 20;
  genslab((opc << 10) or (op1 << 6), op2, cbf_stk)
}

proc genu10ref(val op, val op1, val t) is
  var opc;
{ opc := op + 52; 
  genslab(opc << 10, op1, t)
}

proc gens(val i) is
{ codebuffer[cb_bufferp] := i;
  cb_bufferp := cb_bufferp + 1;
  cb_loadpoint := cb_loadpoint + 1;
  cb_instcount := cb_instcount + 1;
  if (cb_bufferp = cb_size)
  then
    generror("code buffer overflow")
  else skip
}

proc genl(val i) is
{ codebuffer[cb_bufferp] := i;
  cb_bufferp := cb_bufferp + 1;
  cb_loadpoint := cb_loadpoint + 2;
  cb_instcount := cb_instcount + 1;
  if (cb_bufferp = cb_size)
  then
    generror("code buffer overflow")
  else skip
}

proc genslab(val i, val l, val t) is
{ cb_setlabval(cb_bufferp, i, l);
  cb_setflag(cb_bufferp, t);
  cb_bufferp := cb_bufferp + 1;
  cb_loadpoint := cb_loadpoint + 1;
  cb_instcount := cb_instcount + 1;
  if (cb_bufferp = cb_size)
  then
    generror("code buffer overflow")
  else skip
}
 
proc setlab(val l) is
{ if (l>labval_size)
  then
    generror("too many labels")
  else skip;
  labval[l] := cb_loadpoint;
  cb_setlabval(cb_bufferp, 0, l);
  cb_setflag(cb_bufferp, cbf_lab);
  cb_bufferp := cb_bufferp + 1;
  if (cb_bufferp = cb_size)
  then
    generror("code buffer overflow")
  else skip
}

proc setstk(val l) is
{ cb_setlabval(cb_bufferp, 0, l);
  cb_setflag(cb_bufferp, cbf_stkpos);
  cb_bufferp := cb_bufferp + 1;
  if (cb_bufferp = cb_size)
  then
    generror("code buffer overflow")
  else skip
}

proc insertsetstk(val p, val l) is
{ cb_setlabval(p, 0, l);
  cb_setflag(p, cbf_stkpos)
}

proc reststk() is
{ cb_setlabval(cb_bufferp, 0, 0);
  cb_setflag(cb_bufferp, cbf_stkrst);
  cb_bufferp := cb_bufferp + 1;
  if (cb_bufferp = cb_size)
  then
    generror("code buffer overflow")
  else skip
}

proc initbuffer() is
{ cb_instcount := 0;
  cb_bufferp := 0;
  cb_loadpoint := 0
}   

func cb_labentry(val p) is
  return (((codebuffer[p] >> 10) and 63) = 61)

func cb_labval(val p) is
  return (codebuffer[p] and cb_lablower) or ((codebuffer[p] and cb_labupper) >> 6) 

proc cb_setlabval(val p, val i, val l) is
  codebuffer[p] := (i << 16) or (61 << 10) or (l and cb_lablower) or ((l << 6) and cb_labupper)  

proc cb_setflag(val p, val f) is
  codebuffer[p] := (codebuffer[p] and (~ cbf_flags)) or f

func cb_flagset(val p, val f) is
  return (codebuffer[p] and cbf_flags) = f

proc cb_setlong(val p) is
  codebuffer[p] := codebuffer[p] or cbf_long

func cb_longset(val p) is
  return (codebuffer[p] and cbf_long) ~= 0

func u10(val op) is
  var opc;
{ opc := op - 52;
  return (opc = i_blrf) or (opc = i_blrb) or (opc = i_ldapf)
}

func forward(val op) is
  return (op and 1) = 0

func expand() is
  var newcs;
  var bufferp;
  var inst;
  var opc;
  var lopc;
  var range;
  var offset;
  var changing;
  var stackpoint;
{ changing := false;
  cb_loadpoint := 0;
  stackpoint := 0;
  stackpp := 0;
  bufferp := 0; 
  while bufferp < cb_bufferp do
  { inst := codebuffer[bufferp];
    opc := (inst >> 11) and 31;
    if (opc < 30)
    then
      cb_loadpoint := cb_loadpoint + 1
    else
    if (cb_labentry(bufferp))
    then
    { if (cb_flagset(bufferp, cbf_lab))
      then
        if labval[cb_labval(bufferp)] ~= cb_loadpoint
        then
        { changing := true;
          labval[cb_labval(bufferp)] := cb_loadpoint
        }
        else skip
      else
      if (cb_flagset(bufferp, cbf_stkpos))
      then 
      { stackpoints[stackpp] := stackpoint;
        stackpp := stackpp + 1;
        stackpoint := cb_labval(bufferp)
      }
      else
      if (cb_flagset(bufferp, cbf_stkrst))
      then
      { stackpp := stackpp - 1;
        stackpoint := stackpoints[stackpp]
      }
      else
      if cb_longset(bufferp)
      then
        cb_loadpoint := cb_loadpoint + 2
      else
      if (cb_flagset(bufferp, cbf_prog))
      then
      { lopc := (inst >> 26) and 63; 
        offset := labval[cb_labval(bufferp)] - (cb_loadpoint + 1);
        if (u10(lopc))  
        then
          range := 1023
        else
          range := 63;
        if ((forward(lopc) and (offset >= 0)) or ((~forward(lopc)) and (offset < 0)))
        then
        { if (outofrange(offset, range))
          then 
          { cb_loadpoint := cb_loadpoint + 1;
            cb_setlong(bufferp)
          }
          else skip;
          cb_loadpoint := cb_loadpoint + 1          
        }
        else
          cb_loadpoint := cb_loadpoint + 1
      }
      else
      if (cb_flagset(bufferp, cbf_stk))
      then
      { offset := stackpoint - cb_labval(bufferp);
        if (outofrange(offset, 63))
        then
        { cb_loadpoint := cb_loadpoint + 1;
          cb_setlong(bufferp)
        }
        else skip;
        cb_loadpoint := cb_loadpoint + 1
      }
      else
      if (cb_flagset(bufferp, cbf_const))
      then
      { offset := (((inst and 1023) * 2) + cb_conststart) - (cb_loadpoint+1);
        if (outofrange(offset, 1023))
        then
        { cb_loadpoint := cb_loadpoint + 1;
          cb_setlong(bufferp)
        }
        else skip;
        cb_loadpoint := cb_loadpoint + 1
      }
      else
      { offset := (((inst and 1023) * 2) + cb_stringstart) - (cb_loadpoint+1);
        if (outofrange(offset, 1023))
        then
        { cb_loadpoint := cb_loadpoint + 1;
          cb_setlong(bufferp)
        }
        else skip;
        cb_loadpoint := cb_loadpoint + 1
      }
    }    
    else
      cb_loadpoint := cb_loadpoint + 2; 
    bufferp := bufferp + 1
  };
  if (cb_loadpoint and 1) = 0
  then
    newcs := cb_loadpoint
  else
    newcs := cb_loadpoint + 1;
  if cb_conststart ~= newcs  
  then
  { cb_conststart := newcs;
    changing := true
  }
  else skip;
  cb_stringstart := cb_conststart + (constp * 2);
  return changing
}

func outofrange(val v, val r) is
  return (v > r) or (v < (-r))


proc flushbuffer() is
  var newlp;
  var bufferp;
  var exp;
  var inst;
  var opc;
  var opd;
  var lopc;
  var longinst;
  var stackpoint;
{ bufferp := 0;
  newlp := 0;
  exp := expand();
  while (exp) do
    exp := expand();
  outelfhdr();
  cb_loadpoint := 0;
  stackpoint := 0;
  bufferp := 0; 
  while bufferp < cb_bufferp do
  { inst := codebuffer[bufferp];
    opc := (inst >> 11) and 31;
    if (cb_labentry(bufferp))
    then
    { lopc := (inst >> 26) and 63;
      newlp := cb_loadpoint + 1;
      longinst := cb_longset(bufferp);
      if longinst
      then
        newlp := newlp + 1
      else skip;
      if (cb_flagset(bufferp, cbf_stkpos))
      then 
      { stackpoints[stackpp] := stackpoint;
        stackpp := stackpp + 1;
        stackpoint := cb_labval(bufferp)
      }
      else
      if (cb_flagset(bufferp, cbf_stkrst))
      then
      { stackpp := stackpp - 1;
        stackpoint := stackpoints[stackpp]
      }
      else
      if (cb_flagset(bufferp, cbf_prog)) 
      then
      { opd := labval[cb_labval(bufferp)] - newlp;
        if ~ (forward(lopc))
        then
          opd := - opd
        else skip; 
        if (u10(lopc))
        then
          outu10ref(lopc, longinst, opd)
        else
        { if longinst
          then
          { outbin((30 << 11) or (opd >> 6));
            outbin(((inst >> 16) and (~63)) or (opd and 63))
          }
          else
            outbin(((inst >> 16) and (~63)) or opd)  
        };
        cb_loadpoint := newlp
      }
      else
      if (cb_flagset(bufferp, cbf_stk))
      then
      { opd := stackpoint - cb_labval(bufferp);
        if longinst
        then
        { outbin((30 << 11) or (opd >> 6));
          outbin(((inst >> 16) and (~63)) or (opd and 63))
        }
        else
          outbin(((inst >> 16) and (~63)) or opd);
        cb_loadpoint := newlp
      }
      else
      if (cb_flagset(bufferp, cbf_const))
      then
      { opd := (((inst and 1023) * 2) + cb_conststart) - newlp;
        outu10ref(lopc, longinst, opd);
        cb_loadpoint := newlp
      }
      else
      if (cb_flagset(bufferp, cbf_string))
      then
      { opd := (((inst and 1023)  * 2) + cb_stringstart) - newlp;
        outu10ref(lopc, longinst, opd);
        cb_loadpoint := newlp
      }
      else skip
    }
    else
    if ((opc = 31) or (opc = 30))
    then     
    { cb_loadpoint := cb_loadpoint + 2;
      outbin(inst and 65535);
      outbin(inst >> 16)
    }
    else  
    { cb_loadpoint := cb_loadpoint + 1;
      outbin(inst and 65535)
    };
    bufferp := bufferp + 1
  };
  outconsts();
  outstrings()
}


proc outu10ref(val opc, val longinst, val opd) is       
{ if longinst
  then
  { outbin((30 << 11) or (opd >> 10));
    outbin((opc << 10) or (opd and 1023))  
  }
  else
  { outbin((opc << 10) or opd)
  }
}


proc outconsts() is
  var cp;
{ cp := 0;
  if ((cb_loadpoint and 1) ~= 0)
  then
    outbin(0)
  else skip;
  while (cp < constp) do 
  { outbin(consts[cp] and 65535);
    outbin(consts[cp] >> 16);
    cp := cp + 1
  }
}

proc outstrings() is
  var sp;
{ sp := 0;
  while (sp < stringp) do 
  { outbin(strings[sp] and 65535);
    outbin(strings[sp] >> 16);
    sp := sp + 1
  }
}


proc outbin(val d) is
{ selectoutput(binstream);
  putval(d and 255);
  putval(d >> 8);
  selectoutput(messagestream)
}


proc outelfhdr() is
{ 
  binsize := cb_loadpoint;

  if ((cb_loadpoint and 1) ~= 0)
  then
    binsize := binsize + 1
  else skip;
 
  binsize := binsize + (constp * 2) + (stringp * 2); 

  binsize := binsize + 2;  
  if (binsize > 1023)
  then
    binsize := binsize + 2
  else skip;

  frm_start := binsize;

  binsize := binsize + 4;     
  
  codesize := binsize;  

  binsize := binsize + (frm_size * 2);

  %outbin(binsize >> 1);  outbin(0);
  % waiteu for exceptions
  outbin(2028); outbin(0);
 
  % ldapf r11, 0x8FFFC ; or r0, r0, r0 ; setsp r11
  outbin((30 << 11) or 255);
  outbin(((i_ldapf + 52) << 10) or 1020);  
  outbin(8 << 11);
  outbin((5 << 11) or (31 << 6) or (3 << 4) or reg_gdest); 
 
  % Set dp
  if (frm_start > 1023)
  then
  { outbin((30 << 11) or ((frm_start - 2) >> 10));
    outbin(((i_ldapf + 52) << 10) or ((frm_start - 2) and 1023));  
    outbin(8 << 11)
  } 
  else
    outbin(((i_ldapf + 52) << 10) or (frm_start - 1));    
  outbin((6 << 11) or (31 << 6) or (1 << 5) or reg_gdest)

}

proc fopen(val s, val n) is
{ selectoutput(binstream);
  putval(-1);
  prints(n);
  putval(0);
  selectoutput(messagestream)
}

