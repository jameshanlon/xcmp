
#include "stdio.h"

#include "xtranslate.c"

#define nil      1
#define true     1
#define false    0

#define r11     11
#define sp      12
#define dp      13
#define cp      14
#define lr      15

#define pc      16
#define sr      17
#define spc     18
#define ssr     19
#define et      20
#define ed      21
#define sed     22
#define kep     23 
#define ksp     24

#define events  28
#define qnxt    29
#define sync    30
#define nxt     31

#define t_eom           0

#define et_ecall        8
#define et_kcall       15

#define res_port        0
#define res_timer       1
#define res_chanend     2
#define res_sync        3
#define res_thread      4
#define res_lock        5

#define r_v             0
#define r_ev            1
#define r_state         2
#define r_ctrl          3

#define ch_buffp        0
#define ch_wt           1
#define ch_qh           2
#define ch_qt           3

#define ch_d            0
#define ch_fbuff        1
#define ch_buff0        2
#define ch_buff1        3

#define s_qh            0
#define s_qt            1
#define s_max           2
#define s_count         3
#define s_mstr          4
#define s_join          5

#define ieble         0x1
#define eeble         0x2
#define ink           0x4

FILE *codefile;

FILE *simio[8];

char connected[] = {0, 0, 0, 0, 0, 0, 0, 0};

unsigned int mem[200000];
unsigned short *pmem = (unsigned short *) mem;
unsigned char *bmem = (unsigned char *) mem;

unsigned int length;

unsigned int t, lastt;

unsigned int regs[3200];
int *sregs = (int *) regs;

unsigned int regsp, regsl;

unsigned int rbase[1600];
unsigned short chanptr[1600];
unsigned int chanbuff[1600];
		
unsigned int rbasep, rbasel;
unsigned int chansp, chansl;

unsigned int syncs[800];
unsigned int syncsp, syncsl; 

unsigned short bitpos[] = {32, 1, 2, 3, 4, 5, 6, 7, 8, 16, 24, 32};

unsigned int npc;

unsigned int cycles;

#include "xtrace.c"

main() 
{
	
unsigned int iaddr;
unsigned int i;
unsigned int ops;
unsigned int op1, op2, op3;
unsigned int ops456;	
unsigned int opd;	

unsigned int rnum;	
unsigned int rctrl;	
unsigned int cnum;
unsigned int buffp;
unsigned int wt;	
unsigned int token;	
	
unsigned int temp;	
	
printf("\n");
	
regsp = 3200 - 32; regsl = nil;	
rbasep = 1600 - 4; rbasel = nil;	
	
chansp = 1600 - 4; chansl = nil;
syncsp = 800 - 8; syncsl = nil;	
	
t = regsp; 
lastt = t;
regs[t + nxt] = t;

load();
	
regs[t + pc] = 0;	
	
	cycles = 0;	
	
while (true) {


lastt = t;
t = regs[t + nxt];	
	
iaddr = regs[t + pc]; 
i = pmem[iaddr >> 1]; 
npc = iaddr + 2;
ops = translate[i & 0x7ff];

//trace();
	
/*	printf("%d\n", regs[t+pc]);	*/
/*	printf("\n t = %d sp = %d pc =%d\n", t, regs[t+sp], regs[t+pc]);	*/
/*	putchar('*');*/ 
	cycles = cycles + 1;	
switch (((i >> 6) & 0x3f0) | (ops & 15))
{
	
/* first all the short instructions */
	
/* add */
  case 0x040: case 0x050: case 0x048: case 0x058:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15; 
	regs[t + op1] = regs[t + op2] + regs[t + op3]; 
	regs[t + pc] = npc;
	break;
  
/* addi */
  case 0x240: case 0x250: case 0x248: case 0x258:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	regs[t + op1] = regs[t + op2] + op3;
    regs[t + pc] = npc;
	break;

/* and */
  case 0x0e0: case 0x0f0: case 0x0e8: case 0x0f8:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15; 
	regs[t + op1] = regs[t + op2] & regs[t + op3];
    regs[t + pc] = npc;
	break;

/* andnot */
  case 0x0b2: case 0x0ba: 
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	regs[t + op1] = regs[t + op1] & ~regs[t + op2];
    regs[t + pc] = npc;
	break;

/* bau */
  case 0x09d: 
	op1 = (ops >> 12) & 15;	   
    regs[t + pc] = regs[t + op1];
	break;
		   
/* bla */
  case 0x09c:
	op1 = (ops >> 12) & 15;	   
    regs[t + lr] = npc;
    regs[t + pc] = regs[t + op1];
	break;

/* blacp */
  case 0x380: case 0x381: case 0x382: case 0x383:
  case 0x384: case 0x385: case 0x386: case 0x387:
  case 0x388: case 0x389: case 0x38a: case 0x38b:
  case 0x38c: case 0x38d: case 0x38e: case 0x38f:
    regs[t + lr] = npc;
    regs[t + pc] = mem[(regs[t + cp] >> 2) + (i & 1023)];
	break;

/* blat, also brfu, extdp, kcalli */

  case 0x1c8: case 0x1c9: case 0x1ca: case 0x1cb:
  case 0x1cc: case 0x1cd: case 0x1ce: case 0x1cf:
    switch ((i >> 6) & 3)
	{ /* brfu */
      case 0:
	    regs[t + pc] = npc + ((i & 63) << 1);
	    break;		   
      /* blat */
      case 1:
	    regs[t + lr] = regs[t + pc];
	    regs[t + pc] = mem[(regs[t + 11] >> 2) + (i & 63)];
 	    break;
      /* extdp */
      case 2:		
        regs[t + dp] = regs[t + dp] - ((i & 63) << 2);
		regs[t + pc] = npc;
	    break;
      /* kcalli */		
      case 3:
        op1 = (ops >> 12) & 15;
	    regs[t + spc] = npc;		 
	    regs[t + ssr] = regs[t + sr];
	    regs[t + et] = et_kcall;
	    regs[t + sed] = i & 63;
	    regs[t + pc] = regs[kep] + 64;
	    regs[t + sr] = (regs[t + sr] | ink) & ~ (ieble | eeble);
	    break;		
	};
	break;
				
/* blrb */
  case 0x350: case 0x351: case 0x352: case 0x353:
  case 0x354: case 0x355: case 0x356: case 0x357:
  case 0x358: case 0x359: case 0x35a: case 0x35b:
  case 0x35c: case 0x35d: case 0x35e: case 0x35f:
    regs[t + lr] = npc;
    regs[t + pc] = npc - ((i & 1023) << 1);
    break;

/* blrf */
  case 0x340: case 0x341: case 0x342: case 0x343:
  case 0x344: case 0x345: case 0x346: case 0x347:
  case 0x348: case 0x349: case 0x34a: case 0x34b:
  case 0x34c: case 0x34d: case 0x34e: case 0x34f:
    regs[t + lr] = npc;
    regs[t + pc] = npc + ((i & 1023) << 1);
    break;

/* brbf */
  case 0x1f0: case 0x1f1: case 0x1f2: case 0x1f3:
  case 0x1f4: case 0x1f5: case 0x1f6: case 0x1f7:
    if (regs[t + ((i >> 6) & 15)] == 0)
      npc = npc - ((i & 63) << 1);
	regs[t + pc] = npc;			 
	break; 
		 
/* brbt */
  case 0x1d0: case 0x1d1: case 0x1d2: case 0x1d3:
  case 0x1d4: case 0x1d5: case 0x1d6: case 0x1d7:
    if (regs[t + ((i >> 6) & 15)] != 0)
	  npc = npc - ((i & 63) << 1);
	regs[t + pc] = npc;	
    break; 

/* brbu - also entsp, extsp, retsp */
  case 0x1d8: case 0x1d9: case 0x1da: case 0x1db:
  case 0x1dc: case 0x1dd: case 0x1de: case 0x1df:
    switch ((i >> 6) & 3)
    { /* brbu */
	  case 0:
	    regs[t + pc] = npc - ((i & 63) << 1);
        break;
      /* entsp */
      case 1:
	    if ((i & 63) != 0)
	    { mem[regs[t + sp] >> 2] = regs[t + lr];
	      regs[t + sp] = regs[t + sp] - ((i & 63) << 2);
	    };
        regs[t + pc] = npc;	
		break;
	  /* extsp */
      case 2:
		regs[t + sp] = regs[t + sp] - ((i & 63) << 2);
		regs[t + pc] = npc;	
	    break;
	  /* retsp */		
	  case 3:
	    if ((i & 63) != 0)
	    { regs[t + sp] = regs[t + sp] + ((i & 63) << 2);
	      regs[t + lr] = mem[regs[t + sp] >> 2];
	    };
		regs[t + pc] = regs[t + lr];
     	break;
	};	
	break;

/* brff */
  case 0x1e0: case 0x1e1: case 0x1e2: case 0x1e3:
  case 0x1e4: case 0x1e5: case 0x1e6: case 0x1e7:
    if (regs[t + ((i >> 6) & 15)] == 0)
	  npc = npc + ((i & 63) << 1);
	regs[t + pc] = npc;	
	break; 

/* brft */
  case 0x1c0: case 0x1c1: case 0x1c2: case 0x1c3:
  case 0x1c4: case 0x1c5: case 0x1c6: case 0x1c7:
    if (regs[t + ((i >> 6) & 15)] != 0)
	  npc = npc + ((i & 63) << 1);
	regs[t + pc] = npc;	
    break;
					
/* brfu - see blat */

/* bru */
  case 0x0bc:
	op1 = (ops >> 12) & 15;			 
	regs[t + pc] = npc + op1;
	break;

/* chkct */
  case 0x332: case 0x33a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	if ((regs[t + op1] & 255) == res_chanend)
    { intoken(regs[t + op1], op2, 1);	
	};
	break;
				
/* chkcti */
  case 0x333: case 0x33b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	if ((regs[t + op1] & 255) == res_chanend)
	{ intoken(regs[t + op1], op2, 1);	
	};
	break;		  
		  
/* clre - also freet, ssync, waiteu */
  case 0x01e:
    switch (i & 3)
    { /* waiteu */
      case 0:
		printf("\ncycles = %d\n", cycles);	
		return 0;
		break;	
      /* clre */		
      case 1:
		rnum = regs[t + events];
		while (rnum != nil)
		{ rctrl = rbase[rnum + r_ctrl];
		  rnum = rctrl >> 16;
		  rbase[rnum + r_ctrl] = rctrl & 0xffff;
		};
		regs[t + events] = nil;	
		regs[t + pc] = npc + op1;	
		break;	
      /* ssync */		
      case 2:
		rnum = regs[t + sync];
		regs[t + pc] = npc;
		if (syncs[rnum + s_count] == syncs[rnum + s_max])
		{ syncs[rnum + s_count] = 0;  
		  if (syncs[rnum + s_join])
		  { temp = syncs[rnum + s_mstr];
			regs[lastt + nxt] = temp;
			regs[temp + nxt] = t;
			lastt = temp;
			temp = t; 
			regs[lastt + nxt] = regs[t + nxt];
			t = lastt;
			regs[regsl + nxt] = temp;
			regs[temp + nxt] = syncs[rnum + s_qh];
			regs[syncs[rnum + s_qt] + nxt] = regsl;
		  }
		  else	
		  { temp = syncs[rnum + s_mstr];
            regs[lastt + nxt] = temp;
			regs[temp + nxt] = syncs[rnum + s_qh];
		    regs[syncs[rnum + s_qt] + nxt] = t;
		  };
		  syncs[rnum + s_qh] = nil;
		}	
	    else
		{ syncs[rnum + s_count] = syncs[rnum + s_count] + 1;
		  regs[lastt + nxt] = regs[t + nxt];
		  temp = t;	
		  t = lastt;
		  if (syncs[rnum + s_qh] == nil)
			syncs[rnum + s_qh] = temp;
		  else
			regs[syncs[rnum + s_qt] + nxt] = temp;
		  syncs[rnum + s_qt] = temp;		
		};	
		break;	
      /* freet */		
      case 3:
		temp = t;	
		t = regs[t + nxt];	
		regs[lastt + nxt] = t;
		regs[temp + nxt] = regsl;	
		regsl = temp;
		regs[t + pc] = npc;
		break;		
	};
	break;

/* clrpt */
  case 0x21c:

/* clrsr - also kentsp, krestsp, setsr */
  case 0x1e8: case 0x1e9: case 0x1ea: case 0x1eb:
  case 0x1ec: case 0x1ed: case 0x1ee: case 0x1ef:
    switch ((i >> 6) & 3)
    { /* clrsr */
      case 0:
	    regs[t + sr] = regs[t + sr] & ~(i & 63);
	    regs[t + pc] = npc;
		break;
      /* setsr */		
      case 1:
        regs[t + sr] = regs[t + sr] | (i & 63);
        regs[t + pc] = npc;
		break;		
      /* kentsp */
      case 2:
	    mem[regs[t + ksp] >> 2] = regs[t + sp];
	    regs[t + sp] = regs[t + ksp] - ((i & 63) << 2);
	    regs[t + pc] = npc;
		break;	 
      /* krestsp */ 
      case 3:
	    regs[t + ksp] = regs[t + sp] + ((i & 63) << 2);
	    regs[t + sp] = mem[regs[t + ksp] >> 2];
	    regs[t + pc] = npc;
		break;
    };
    break; 

/* dcall - also dret, kret, setkep */
  case 0x01f:
    switch (i & 3)
    { /* dcall */
      case 0: 
		break;		
      /* kret */
      case 1:
	    regs[t + pc] = regs[t + spc];
	    regs[t + sr] = regs[t + ssr];
	    regs[t + ed] = regs[t + sed];
	    break;
      /* dret */
      case 2:
		break;		
      /* setkep */
      case 3:
	    regs[t + pc] = npc;
		regs[t + kep] = regs[t + 11];
        break;
    };			
    break;
			 
/* dentsp - also drestsp, getid, getkep*/
  case 0x05e:
    switch (i & 3)
    { /* dentsp */
      case 0:
		break;		
      /* drestsp */
      case 1:
      /* getid */
		regs[t + 11] = t | res_thread;
	    regs[t + pc] = npc;
		break;		 
      case 2:
      /* getkep */		
      case 3:
	    regs[t + 11] = regs[t + kep];
     	regs[t + pc] = npc;
		break;
	};
	break;

/* dgetreg */
  case 0x0fc:

/* drestsp - see dentsp */

/* dret - see dcall */

/* ecallf */
  case 0x13c:
	op1 = (ops >> 12) & 15;
	if (op1 == 0)
	{ regs[t + spc] = npc;		 
	  regs[t + ssr] = regs[t + sr];
	  regs[t + sed] = regs[t + ed];
	  regs[t + et] = et_ecall;
	  regs[t + ed] = 0;
	  regs[t + sed] = op1;
	  regs[t + pc] = regs[kep] + 64;
	  regs[t + sr] = (regs[t + sr] | ink) & ~ (ieble | eeble);
	};
	break;

/* ecallt */
  case 0x13d:
	op1 = (ops >> 12) & 15;
	if (op1 != 0)
	{ regs[t + spc] = npc;		 
	  regs[t + ssr] = regs[t + sr];
	  regs[t + sed] = regs[t + ed];
	  regs[t + et] = et_ecall;
	  regs[t + ed] = 0;
	  regs[t + sed] = op1;
	  regs[t + pc] = regs[kep] + 64;
	  regs[t + sr] = (regs[t + sr] | ink) & ~ (ieble | eeble);
	};
	break;
		
/* edu */
  case 0x01c:
	op1 = (ops >> 12) & 15;
	rnum = regs[t + op1] << 2;
	rbase[rnum + r_ctrl] = rbase[rnum + r_ctrl] & (~ 1);
	regs[t + pc] = npc;
	break;
		
/* eef */
  case 0x0b3: case 0x0bb:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;	
	rnum = regs[t + op1] << 2;
	rctrl = rbase[rnum + r_ctrl];
	if (rctrl == 0)
	{ rctrl = regs[t + events] << 16; regs[t + events] = rnum; } 	
	rbase[rnum + r_ctrl] = rctrl | (regs[t + op2] == false);
	regs[t + pc] = npc;
	break;	
		
/* eet */
  case 0x093: case 0x09b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;		 
	rnum = regs[t + op1] << 2; 
	rctrl = rbase[rnum + r_ctrl];
	if (rctrl == 0)
	{ rctrl = regs[t + events] << 16; regs[t + events] = rnum; } 	
	rbase[rnum + r_ctrl] = rctrl | (regs[t + op2] == true);
	regs[t + pc] = npc;
	break;
		
/* eeu */
  case 0x01d:
	op1 = (ops >> 12) & 15;
	rnum = regs[t + op1] << 2;
	rctrl = rbase[rnum + r_ctrl];
	if (rctrl == 0)
	  { rctrl = regs[t + events] << 16; regs[t + events] = rnum; } 	
	rbase[rnum + r_ctrl] = rctrl | 1;
	regs[t + pc] = npc;
	break;	
		
/* endin */
  case 0x253: case 0x25b:

/* entsp - see brbu */

/* eq */
  case 0x0c0: case 0x0d0: case 0x0c8: case 0x0d8:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
    regs[t + op1] = (regs[t + op2] == regs[t + op3]);
    regs[t + pc] = npc;
	break;

/* eqi */
  case 0x2c0: case 0x2d0: case 0x2c8: case 0x2d8:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
    regs[t + op1] = (regs[t + op2] == op3);
    regs[t + pc] = npc;
	break;

/* extdp - see blat */

/* freer */
  case 0x05c:
    op1 = (ops >> 12) & 15;
	rnum = regs[t + op1] >> 8;
	switch (op1)	
	{ case res_thread:
		break;	
	  case res_sync:
		syncs[rnum] = syncsl;
		syncsl = rnum;
		break;	
	  case res_chanend: 
		cnum = rbase[rnum + r_state];	
		chanbuff[cnum] = chansl;
		chansl = cnum;
        rbase[rnum] = rbasel;
		rbasel = rnum;
		break;	
      case res_timer: case res_lock:
		break;		
	};
	regs[t + pc] = npc;
	break;

/* freet  - see clre */

/* geted - also getet, stet, stsed */
 case 0x03f:
    switch (i & 3)
    { /* stsed */
      case 0:
        mem[(regs[t + sp] >> 2) + 3] = regs[t + sed];
	    regs[t + pc] = npc;
		break;
      /* stet */
      case 1:
	    mem[(regs[t + sp] >> 2) + 4] = regs[t + et];
	    regs[t + pc] = npc;
		break;
      /* geted */
      case 2:
	    regs[t + 11] = regs[t + ed];
	    regs[t + pc] = npc;
		break;
      /* getet */
      case 3:
	    regs[t + 11] = regs[t + et];
	    regs[t + pc] = npc;
		break;
	};
	break;

/* getet - see geted */

/* getid - see dentsp */

/* getkep - see dentsp */

/* getksp - also ldet, ldsed */
  case 0x05f:
    switch (i & 3)
    { /* getksp */
	  case 0:
		regs[t + 11] = regs[t + ksp];
		regs[t + pc] = npc; 
	    break;
      /* ldsed */		
      case 1:
	    regs[t + sed] = mem[(regs[t + sp] >> 2) + 3];
	    regs[t + pc] = npc;
		break;
      /* ldet */
      case 2:
	    regs[t + et] = mem[(regs[t + sp] >> 2) + 4];
	    regs[t + pc] = npc;
		break;
      case 3:
		break;	
	};
	break;

/* getr */
  case 0x212: case 0x21a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	switch (op2)	
	{ case res_thread:
	    if (regsp > 0)
		{ regsp = regsp - 32; temp = regsp; }
		else 
		{ temp = regsl; regsl = regs[regsl]; };
		break;	
	  case res_sync:
	    if (syncsp > 0)
		{ syncsp = syncsp - 8; temp = syncsp; }
	    else 
		{ temp = syncsl; syncsl = syncs[syncsl]; };
		syncs[temp + s_qh] = nil;
		syncs[temp + s_qt] = nil;
		syncs[temp + s_max] = 0;
		syncs[temp + s_count] = 0;
		syncs[temp + s_mstr] = t;	
		break;	
	  case res_chanend: 
		if (chansp > 0)
		{ chansp = chansp - 4; cnum = chansp; }
		else 
		{ cnum = chansl; chansl = chanbuff[chansl]; };
		chanbuff[cnum + ch_d] = 0;
		chanbuff[cnum + ch_buff1] = 0;
		chanbuff[cnum + ch_buff0] = 0;
		chanbuff[cnum + ch_fbuff] = 0;	
		chanptr[cnum + ch_buffp] = 0;
		chanptr[cnum + ch_wt] = nil;
		chanptr[cnum + ch_qh] = nil;
		if (rbasep > 0)
		{ rbasep = rbasep - 4; temp = rbasep; }
		else 
		{ temp = rbasel; rbasel = rbase[rbasel]; };
		rbase[temp + r_state] = cnum;
		break;	
	  case res_timer: case res_lock:
		break;		
	}
	regs[t + op1] = (temp << 8) | op2;	
	regs[t + pc] = npc;
	break;
		
/* getsr - also ldawcp */
  case 0x1f8: case 0x1f9: case 0x1fa: case 0x1fb:
  case 0x1fc: case 0x1fd: case 0x1fe: case 0x1ff:
    switch ((i >> 6) & 3)
    { /* getsr */
      case 0:
	    regs[t + 11] = regs[t + sr] & (i & 63);
	    regs[t + pc] = npc;
		break;		 
      /* ldawcp */		
	  case 1:
	    regs[t + 11] = regs[t + cp] + ((i & 63) << 2);
	    regs[t + pc] = npc;
		break;
      case 2:
		break;	
      case 3:
		break;	
	};		
	break;
			 
/* getst */
  case 0x013: case 0x01b:		
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	rnum = regs[t + op2] >> 8;
	if (regsp > 0)
	{ regsp = regsp - 32; temp = regsp; }
	else 
	{ temp = regsl; regsl = regs[regsl]; };
	regs[t + op1] = (temp << 8) | res_thread;
	if (syncs[rnum + s_qh] == nil)
	  syncs[rnum + s_qh] = temp;
	else
	  regs[syncs[rnum + s_qt] + nxt] = temp;
	syncs[rnum + s_qt] = temp;
	regs[temp + sync] = rnum;	
	syncs[rnum + s_max] = syncs[rnum + s_max] + 1;
	syncs[rnum + s_count] = syncs[rnum + s_count] + 1;
	regs[t + pc] = npc;
	break;

/* getts */
  case 0x0f2: case 0x0fa:

/* in */
  case 0x2d2: case 0x2da:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	if ((regs[t + op2] & 255) == res_chanend)
	{ cnum = rbase[(regs[t + op2] >> 8) + r_state]; 
	  buffp = chanptr[cnum + ch_buffp] << 3;
	  if (buffp >= 32)
	  { regs[t + op1] = chanbuff[cnum + ch_buff0];
		chanbuff[cnum + ch_buff0] = chanbuff[cnum + ch_buff1];
		chanbuff[cnum + ch_buff1] = 0;
		chanbuff[cnum + ch_fbuff] = chanbuff[cnum + ch_fbuff] >> 4;
	    chanptr[cnum + ch_buffp] = chanptr[cnum + ch_buffp] - 4;  
		wt = chanptr[cnum + ch_wt];
		if (wt != nil) 
		{ regs[lastt + nxt] = wt;
		  regs[wt + nxt] = t;
		  lastt = wt;
		  chanptr[cnum + ch_wt] = nil;
		}; 
		regs[t + pc] = npc;
	  }	  
	  else 
	  { wt = t;	
		t = regs[t + nxt];
		regs[lastt + nxt] = t;
		chanptr[cnum + ch_wt] = wt; 
	  }; 
	}
	else
	{ regs[t + op1] = simin(regs[t + op2] >> 8) & 255;
	  regs[t + pc] = npc;
	}	
	break;		
		
/* inct */
	case 0x213: case 0x21b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	if ((regs[t + op2] & 255) == res_chanend)
	  intoken(regs[t + op2], op1, 1);	
	break;
		
/* inshr */
  case 0x2d3: case 0x2db:

/* int */
  case 0x233: case 0x23b:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	if ((regs[t + op2] & 255) == res_chanend)
	  intoken(regs[t + op2], op1, 0);	
    else
	{ regs[t + op1] = simin(regs[t + op2] >> 8) & 255;
	  regs[t + pc] = npc;
	}	
	break;		
		
/* kcall */
  case 0x11c:
    op1 = (ops >> 12) & 15;
	regs[t + spc] = npc;		 
	regs[t + ssr] = regs[t + sr];
	regs[t + sed] = regs[t + ed];
	regs[t + et] = et_kcall;
	regs[t + ed] = op1;
	regs[t + pc] = regs[kep] + 64;
	regs[t + sr] = (regs[t + sr] | ink) & ~ (ieble | eeble);
	break;
			 
/* kcalli - see blat */

/* kentsp - see clrsr */

/* krestsp - see clrsr */

/* kret - see dcall */

/* ld16s */
  case 0x200: case 0x210: case 0x208: case 0x218:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	regs[t + op1] = pmem[(regs[t + op2] >> 1) + regs[t + op3]];
	regs[t + pc] = npc;
	break;
		
/* ld8u */
  case 0x220: case 0x230: case 0x228: case 0x238:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	regs[t + op1] = bmem[regs[t + op2] + regs[t + op3]];
	regs[t + pc] = npc;
	break;	

/* ldapb */
  case 0x370: case 0x371: case 0x372: case 0x373:
  case 0x374: case 0x375: case 0x376: case 0x377:
  case 0x378: case 0x379: case 0x37a: case 0x37b:
  case 0x37c: case 0x37d: case 0x37e: case 0x37f:
	regs[t + 11] = npc - ((i & 1023) << 1);
	regs[t + pc] = npc;
	break;

/* ldapf */
  case 0x360: case 0x361: case 0x362: case 0x363:
  case 0x364: case 0x365: case 0x366: case 0x367:
  case 0x368: case 0x369: case 0x36a: case 0x36b:
  case 0x36c: case 0x36d: case 0x36e: case 0x36f:
	regs[t + 11] = npc + ((i & 1023) << 1);
    regs[t + pc] = npc;
	break;

/* ldawcp - see getsr */

/* ldawdp */
  case 0x180: case 0x181: case 0x182: case 0x183:
  case 0x184: case 0x185: case 0x186: case 0x187:
  case 0x188: case 0x189: case 0x18a: case 0x18b:
  case 0x18c: case 0x18d: case 0x18e: case 0x18f:
    regs[t + ((i >> 6) & 15)] = regs[t + dp] + ((i & 63) << 2);
    regs[t + pc] = npc;
	break;

/* ldawsp */
  case 0x190: case 0x191: case 0x192: case 0x193:
  case 0x194: case 0x195: case 0x196: case 0x197:
  case 0x198: case 0x199: case 0x19a: case 0x19b:
  case 0x19c: case 0x19d: case 0x19e: case 0x19f:
    regs[t + ((i >> 6) & 15)] = regs[t + sp] + ((i & 63) << 2);
    regs[t + pc] = npc;
	break;

/* ldc */
  case 0x1a0: case 0x1a1: case 0x1a2: case 0x1a3:
  case 0x1a4: case 0x1a5: case 0x1a6: case 0x1a7:
  case 0x1a8: case 0x1a9: case 0x1aa: case 0x1ab:
  case 0x1ac: case 0x1ad: case 0x1ae: case 0x1af:
    regs[t + ((i >> 6) & 15)] = i & 63;
    regs[t + pc] = npc;
	break;

/* ldet - see getksp */

/* ldsed - see getksp */

/* ldspc - also ldssr, stspc, stssr */
  case 0x03e:
    switch (i & 3)
    { /* ldspc */
      case 0:
	    regs[t + spc] = mem[(regs[t + sp] >> 2) + 1];
	    regs[t + pc] = npc;
	    break;
      /* stspc */
      case 1:
	    mem[(regs[t + sp] >> 2) + 1] = regs[t + spc];
	    regs[t + pc] = npc;
	    break;
      /* ldssr */
      case 2:
	    regs[t + ssr] = mem[(regs[t + sp] >> 2) + 2];
	    regs[t + pc] = npc;
	    break;
      /* stssr */
      case 3:
	    mem[(regs[t + sp] >> 2) + 2] = regs[t + ssr];
        regs[t + pc] = npc;
	    break;
    };
    break;

/* ldssr - see ldspc */

/* ldw */
  case 0x120: case 0x130: case 0x128: case 0x138:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	regs[t + op1] = mem[(regs[t + op2] >> 2) + regs[t + op3]];
	regs[t + pc] = npc;
	break;

/* ldwi */
  case 0x020: case 0x030: case 0x028: case 0x038:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	regs[t + op1] = mem[(regs[t + op2] >> 2) + op3];
	regs[t + pc] = npc;
	break;

/* ldwcp */
  case 0x1b0: case 0x1b1: case 0x1b2: case 0x1b3:
  case 0x1b4: case 0x1b5: case 0x1b6: case 0x1b7:
  case 0x1b8: case 0x1b9: case 0x1ba: case 0x1bb:
  case 0x1bc: case 0x1bd: case 0x1be: case 0x1bf:
    regs[t + ((i >> 6) & 15)] = mem[(regs[t + cp] >> 2) + (i & 63)];
    regs[t + pc] = npc;
	break;

/* ldwcpl */
  case 0x390: case 0x391: case 0x392: case 0x393:
  case 0x394: case 0x395: case 0x396: case 0x397:
  case 0x398: case 0x399: case 0x39a: case 0x39b:
  case 0x39c: case 0x39d: case 0x39e: case 0x39f:
    regs[t + 11] = mem[(regs[t + cp] >> 2) + (i & 1023)];
    regs[t + pc] = npc;
	break;

/* ldwdp */
  case 0x160: case 0x161: case 0x162: case 0x163:
  case 0x164: case 0x165: case 0x166: case 0x167:
  case 0x168: case 0x169: case 0x16a: case 0x16b:
  case 0x16c: case 0x16d: case 0x16e: case 0x16f:
    regs[t + ((i >> 6) & 15)] = mem[(regs[t + dp] >> 2) + (i & 63)];
    regs[t + pc] = npc;
	break;

/* ldwsp */
  case 0x170: case 0x171: case 0x172: case 0x173:
  case 0x174: case 0x175: case 0x176: case 0x177:
  case 0x178: case 0x179: case 0x17a: case 0x17b:
  case 0x17c: case 0x17d: case 0x17e: case 0x17f:
    regs[t + ((i >> 6) & 15)] = mem[(regs[t + sp] >> 2) + (i & 63)];
	regs[t + pc] = npc;
	break;
 
/* lss */
  case 0x300: case 0x310: case 0x308: case 0x318:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	regs[t + op1] = ((int) regs[t + op2]) < ((int) sregs[t + op3]);
    regs[t + pc] = npc;
	break;

/* lsu */
  case 0x320: case 0x330: case 0x328: case 0x338:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	regs[t + op1] = (regs[t + op2] < regs[t + op3]);
	regs[t + pc] = npc;
	break;

/* mjoin */
  case 0x05d:
	op1 = (ops >> 12) & 15;		
	rnum = regs[t + op1] >> 8;
	regs[t + pc] = npc;	
	if (syncs[rnum + s_count] == syncs[rnum + s_max])
	{ syncs[rnum + s_count] = 0; 
	  regs[regsl + nxt] = syncs[rnum + s_qh];
	  regs[syncs[rnum + s_qt] + nxt] = regsl;
	  syncs[rnum + s_qh] = nil;
	}
	else
	{ syncs[rnum + s_count] = syncs[rnum + s_count] + 1;
	  syncs[rnum + s_join] = true;	
	  regs[lastt + nxt] = regs[t + nxt];
	  t = lastt;
	};	
	break;
		
/* mkmsk */
  case 0x292: case 0x29a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	if ((regs[t + op2] >= 32) | (regs[t + op2] == 0))
	  regs[t + op1] = 0xffffffff;
	else 
	  regs[t + op1] = (1 << (regs[t + op2])) - 1;
	regs[t + pc] = npc;	
	break;
	
/* mkmski */
  case 0x293: case 0x29b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	temp = bitpos[op2];	
	if ((temp >= 32) | (temp == 0))
	  regs[t + op1] = 0xffffffff;
	else 
	  regs[t + op1] = (1 << temp) - 1;
	regs[t + pc] = npc;	
	break;
		
/* msync */
  case 0x07d:
	op1 = (ops >> 12) & 15;
    rnum = regs[t + op1] >> 8;
	regs[t + pc] = npc;	
	if (syncs[rnum + s_count] == syncs[rnum + s_max])
	{ syncs[rnum + s_count] = 0; 
	  regs[lastt + nxt] = syncs[rnum + s_qh];
	  regs[syncs[rnum + s_qt] + nxt] = t;
	  syncs[rnum + s_qh] = nil;	
	}
	else
	{ syncs[rnum + s_count] = syncs[rnum + s_count] + 1; 
	  syncs[temp + s_join] = false;
	  regs[lastt + nxt] = regs[t + nxt];
	  t = lastt;
	};	
	break;
		
/* neg */
  case 0x252: case 0x25a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;		 
    regs[t + op1] = -regs[t + op2];
    regs[t + pc] = npc;
	break;

/* not */
  case 0x232: case 0x23a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;		 
	regs[t + op1] = ~ regs[t + op2];
	regs[t + pc] = npc;
	break;
		
/* or */
  case 0x100: case 0x110: case 0x108: case 0x118:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	regs[t + op1] = regs[t + op2] | regs[t + op3];
    regs[t + pc] = npc;
	break;

/* out */
  case 0x2b2: case 0x2ba:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;	
	if ((regs[t + op1] & 255) == res_chanend)
	{ temp = rbase[(regs[t + op1] >> 8) + r_state];
		cnum = chanbuff[temp + ch_d] >> 8; 
	  if (chanptr[cnum + ch_qh] == nil)
	  { chanptr[cnum + ch_qh] = t; 
		chanptr[cnum + ch_qt] = t;
		regs[t + qnxt] = nil;  		  
      };
	  if (chanptr[cnum + ch_qh] == t)
	  { buffp = chanptr[cnum + ch_buffp] << 3;
		if (buffp <= 32)
	    { if (buffp > 0) 
			chanbuff[cnum + ch_buff1] = regs[t + op2] >> (32 - buffp);
		  if (buffp < 32)	
	        chanbuff[cnum + ch_buff0] = chanbuff[cnum + ch_buff0] | (regs[t + op2] << buffp);
	      chanptr[cnum + ch_buffp] = chanptr[cnum + ch_buffp] + 4;
	      wt = chanptr[cnum + ch_wt];
		  if (wt != nil) 
	      { regs[lastt + nxt] = wt;
	        regs[wt + nxt] = t;
	        lastt = wt;
	        chanptr[cnum + ch_wt] = nil;
	      };
		  regs[t + pc] = npc;	
	    }
	    else
	    { wt = t;	
	      t = regs[t + nxt];
	      regs[lastt + nxt] = t;
	      chanptr[cnum + ch_wt] = wt; 
	    };
	  }
	  else		
	  { temp = t;	
	    t = regs[t + nxt];
	    regs[lastt + nxt] = t;
	    regs[chanptr[cnum + ch_qt] + qnxt] = temp;
	    chanptr[cnum + ch_qt] = temp;
	  };
	}
	else
	{ simout(regs[t + op2], regs[t + op1] >> 8);	
	  regs[t + pc] = npc;	
	};
	break;
		
/* outct */
  case 0x132: case 0x13a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;	
	if ((regs[t + op2] & 255) == res_chanend)
	  outtoken(regs[t + op2], regs[t + op1], 1);
	break;
		
/* outcti */
	case 0x133: case 0x13b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;	
	if ((regs[t + op1] & 255) == res_chanend)
	  outtoken(regs[t + op1], op2, 1);
	break;

/* outshr */
  case 0x2b3: case 0x2bb:

/* outt */
  case 0x033: case 0x03b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;	
	if ((regs[t + op1] & 255) == res_chanend)
	{ outtoken(regs[t + op1], regs[t + op2], 0); }
	else	
	{ simout(regs[t + op2], regs[t + op1] >> 8);	
	  regs[t + pc] = npc;	
	};
	break;
			
/* peek */
  case 0x2f2: case 0x2fa:

/* setci */

  case 0x3a0: case 0x3a1: case 0x3a2: case 0x3a3:
  case 0x3a4: case 0x3a5: case 0x3a6: case 0x3a7:
  case 0x3a8: case 0x3a9: case 0x3aa: case 0x3ab:
  case 0x3ac: case 0x3ad: case 0x3ae: case 0x3af:
	regs[t + pc] = npc;
	break;

/* setcp */
  case 0x0dd:
	op1 = (ops >> 12) & 15;
	regs[t + cp] = regs[t + op1];
	regs[t + pc] = npc;
	break;

/* setd */
  case 0x053: case 0x05b:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	temp = rbase[(regs[t + op1] >> 8) + r_state];
	chanbuff[temp + ch_d] = regs[t + op2];
	regs[t + pc] = npc;
	break;
		
/* setdp */
  case 0x0dc:
	op1 = (ops >> 12) & 15;
	regs[t + dp] = regs[t + op1];
	regs[t + pc] = npc;
	break;

/* setev */
  case 0x0fd:
	op1 = (ops >> 12) & 15;
	rbase[(regs[t + op1] >> 8) + r_ev] = regs[t + 11];
	regs[t + pc] = npc;
	break;
		
/* setkep - see dcall */

/* setpsc */
   case 0x312: case 0x31a: 
 
/* setpt */
  case 0x0f3: case 0x0fb:

/* setsp */
  case 0x00bd:
	op1 = (ops >> 12) & 15;
	regs[t + sp] = regs[t + op1];
	regs[t + pc] = npc;
	break;

/* setsr - see clrsr */

/* setv */
  case 0x11d:
	op1 = (ops >> 12) & 15;
	rbase[(regs[t + op1] >> 8) + r_v] = regs[t + 11];
	regs[t + pc] = npc;
	break;
		
/* sext */
  case 0x0da:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;		 
	if ((regs[t + op2] < 32) & (regs[t + op2] != 0))
	{ temp = regs[t + op1] & (1 << regs[t + op2]);
	  regs[t + op1] = regs[t + op1] | (~ (temp - 1));
	};
	regs[t + pc] = npc;
	break;	
		
/* sexti */
  case 0x0db:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;		
	temp = bitpos[regs[t + op2]];
	if (temp < 32)
	{ temp = regs[t + op1] & (1 << temp);
	  regs[t + op1] = regs[t + op1] | (~ (temp - 1));
	};
	regs[t + pc] = npc;
	break;	
				
/* shl */
  case 0x080: case 0x090: case 0x088: case 0x098:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;		 
    regs[t + op1] = regs[t + op2] << regs[t + op3];
    regs[t + pc] = npc;
	break;

/* shli */
  case 0x280: case 0x290: case 0x288: case 0x298:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;		 
	temp = bitpos[op3];
	regs[t + op1] = regs[t + op2] << temp;
    regs[t + pc] = npc;
	break;

/* shr */
  case 0x0a0: case 0x0b0: case 0x0a8: case 0x0b8:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;		 
    regs[t + op1] = regs[t + op2] >> regs[t + op3];
    regs[t + pc] = npc;
	break;

/* shri */
  case 0x2a0: case 0x2b0: case 0x2a8: case 0x2b8:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	temp = bitpos[op3];
	regs[t + op1] = regs[t + op2] >> temp;
    regs[t + pc] = npc;
	break;

/* ssync - see clre */

/* stet - see geted */

/* stsed - see geted */

/* stspc - see ldspc */

/* stssr - see ldspc */

/* stwi */
  case 0x000: case 0x010: case 0x008: case 0x018:
 	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		checkmem((regs[t + op2] >> 2) + op3);
	mem[(regs[t + op2] >> 2) + op3] = regs[t + op1];  
	regs[t + pc] = npc;
    break;
			 
/* stwdp */
  case 0x140: case 0x141: case 0x142: case 0x143:
  case 0x144: case 0x145: case 0x146: case 0x147:
	mem[(regs[t + dp] >> 2) + (i & 63)] = regs[t + ((i >> 6) & 15)];  
	regs[t + pc] = npc;
	break;			 			 

/* stwsp */
  case 0x150: case 0x151: case 0x152: case 0x153:
  case 0x154: case 0x155: case 0x156: case 0x157:
 	mem[(regs[t + sp] >> 2) + (i & 63)] = regs[t + ((i >> 6) & 15)];  
	regs[t + pc] = npc;
	break;
			 
/* sub */
  case 0x060: case 0x070: case 0x068: case 0x078:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	regs[t + op1] = regs[t + op2] - regs[t + op3];
    regs[t + pc] = npc;
	break;

/* subi */
  case 0x260: case 0x270: case 0x268: case 0x278:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	regs[t + op1] = regs[t + op2] - op3;
    regs[t + pc] = npc;
	break;

/* syncr */
  case 0x21d:

/* testct */
  case 0x2fb:

/* testwct */
  case 0x31b:

/* tinitcp */
  case 0x07a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	regs[(regs[t + op2] >> 8) + cp] = regs[t + op1];
	regs[t + pc] = npc;
	break;

/* tinitdp */
  case 0x03a:		 
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	regs[(regs[t + op2] >> 8) + dp] = regs[t + op1];
	regs[t + pc] = npc;
	break;		 

/* tinitpc */
  case 0x01a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	regs[(regs[t + op2] >> 8) + pc] = regs[t + op1]; 
	regs[t + pc] = npc;
	break;
		 
/* tinitsp */
  case 0x05a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	regs[(regs[t + op2] >> 8) + sp] = regs[t + op1];
	regs[t + pc] = npc;
	break;
		 
/* tsetmr */
  case 0x07b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	temp = syncs[regs[op2 + sync] + s_mstr];
	regs[temp + op1] = regs[t + op2];
	regs[t + pc] = npc;
	break;
		
/* tsetr */
  case 0x2e0: case 0x2f0: case 0x2e8: case 0x2f8:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
    regs[(op2 << 5) + op3] = regs[t + op1];
	regs[t + pc] = npc;
	break;
		
/* tstart */
  case 0x07c:

/* waitef */
  case 0x03d:

/* waitet */
  case 0x03c:

/* waiteu - see clre */

/* zext */
  case 0x11a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;		 
	if ((regs[t + op2] < 32) & (regs[t + op2] != 0))
	{ temp = (1 << regs[t + op2]);
	  regs[t + op1] = regs[t + op1] & (temp - 1);
	};
	regs[t + pc] = npc;
	break;	
		
/* zexti */
  case 0x11b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	temp = bitpos[op2];	
	if (temp < 32)
	{ temp = (1 << regs[t + op2]);
	  regs[t + op1] = regs[t + op1] & (temp - 1);
	};
	regs[t + pc] = npc;
	break;	
		
/* then the long 2 operand instructions */
		 
  case 0x3f2:
	i = pmem[(npc >> 1)];
	npc = npc + 2;	
	ops = translate[i & 0x7ff];
	switch ((i >> 11) & 0x1f)
	{ /* bitrev */
	  case 0x00:
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
		temp = regs[t + op2];
		regs[t + op1] = rev[temp >> 24] | (rev[(temp >> 16) & 0xff] << 8) | (rev[(temp >> 8) & 0xff] << 16) | (rev[temp & 0xff] << 24);
		regs[t + pc] = npc;
		break;
	  /* clz */
	  case 0x04:
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
		temp = regs[t + op2] >> 24;
		regs[t + op1] = clz[temp]; 
		if (temp == 0)
		{ temp = regs[t + op2] >> 24;
		  regs[t + op1] = clz[temp] + 8;
		  if (temp == 0)
		  { temp = regs[t + op2] >> 16;
			regs[t + op1] = clz[temp] + 16;
			if (temp == 0)
			{ temp = regs[t + op2] >> 8;
			  regs[t + op1] = clz[temp] + 24;
			}
			else
			  regs[t + op1] = clz[regs[t + op2]];	
		  };
		};	
		regs[t + pc] = npc;
		break;
	  /* testlcl */
	  case 0x10:
	  /* tinitlr */
	  case 0x08:
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
		regs[(op1 << 5) + lr] = regs[t + op2];
		regs[t + pc] = npc;
		break;			
	  /* setn */
	  case 0x18:
	  /* setps */
	  case 0x0c:
	  /* setrdy */
	  case 0x14:
		break;	
	};
	break;
  case 0x3f3:
	i = pmem[(npc >> 1)];
	npc = npc + 2;
	ops = translate[i & 0x7ff];
    switch ((i >> 11) & 0x1f)
	{ /* byterev */
	  case 0x00:
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
		temp = regs[t + op2];
		regs[t + op1] = (temp >> 24) | ((temp >> 8) & 0xff00) | ((temp & 0xff00) << 8) | (temp << 24);
	    regs[t + pc] = npc;
		break;		
	  /* getd */
	  case 0x0c:
	  /* getn */
	  case 0x18:
	  /* getps */
	  case 0x08:
	  /* setc */
	  case 0x14:
		regs[t + pc] = npc;
		break;
	  /* setclk */
	  case 0x04:
	  /* settw */
	  case 0x10:
		break;	
	};
	break;	 
		 
/* then the long 3, 4, 5, 6 operand instructions */
		 
	case 0x3e0: case 0x3f0: case 0x3e8: case 0x3f8:
	i = pmem[(npc >> 1)];
	npc = npc + 2;	 
	ops456 = translate[i & 0x7ff];
	switch (((i >> 7) & 0x1f0) | (ops456 & 7))
	{ /* ashr */
	  case 0x026:  
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		regs[t + op1] = ((int) regs[t + op2]) >> regs[t + op3];
		regs[t + pc] = npc;
		break; 
	  /* crc */
	  case 0x156:     
	  /* crc8 */
	  case 0x004:
	  /* divs */
	  case 0x086:  
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		regs[t + op1] = ((int) regs[t + op2]) / ((int) regs[t + op3]);
		regs[t + pc] = npc;
		break;  		 
	  /* divu */
	  case 0x096: 
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		regs[t + op1] = regs[t + op2] / regs[t + op3];
		regs[t + pc] = npc;
		break;   
	  /* ladd */
	  case 0x003:
	  /* lda16b */
	  case 0x066:  
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		regs[t + op1] = regs[t + op2] - (regs[t + op3] << 1);
		regs[t + pc] = npc;	
	  /* lda16f */
	  case 0x056:    
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		regs[t + op1] = regs[t + op2] + (regs[t + op3] << 1);
		regs[t + pc] = npc;
	  /* ldawb */
	  case 0x046:  
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		regs[t + op1] = regs[t + op2] - (regs[t + op3] << 2);
		regs[t + pc] = npc;			
	  /* ldawf */
	  case 0x036:
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		regs[t + op1] = regs[t + op2] + (regs[t + op3] << 2);
		regs[t + pc] = npc;
		break;		 
	  /* ldivu */
	  case 0x002:
	  /* lmul */
	  case 0x000:
	  /* lsub */
	  case 0x012:
	  /* maccs */
	  case 0x014:
	  /* maccu */
	  case 0x005:
	  /* mul */
	  case 0x076: 
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		regs[t + op1] = regs[t + op2] * regs[t + op3];
		regs[t + pc] = npc;
		break;
	  /* rems */
	  case 0x186:   
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		regs[t + op1] = ((int) regs[t + op2]) % ((int) regs[t + op3]);
		regs[t + pc] = npc;
		break;  
	  /* remu */
	  case 0x196: 
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		regs[t + op1] = regs[t + op2] % regs[t + op3];
		regs[t + pc] = npc;
		break; 
	  /* st16 */
	  case 0x106:     
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pmem[(regs[t + op2] >> 1) + regs[t + op3]] = regs[t + op1];  
		regs[t + pc] = npc;
		break;
	  /* st8 */
	  case 0x116:  
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		bmem[regs[t + op2] + regs[t + op3]] = regs[t + op1];  
		regs[t + pc] = npc;
		break;
	  /* stw */
	  case 0x006:
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
			checkmem((regs[t + op2] >> 2) + regs[t + op3]);
		mem[(regs[t + op2] >> 2) + regs[t + op3]] = regs[t + op1];  
		regs[t + pc] = npc;
		break;
	  /* xor */
	  case 0x016:
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		regs[t + op1] = regs[t + op2] ^ regs[t + op3];
		regs[t + pc] = npc;
		break;
	  /* ldawbi */
	  case 0x146:   
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		regs[t + op1] = regs[t + op2] - (op3 << 2);
		regs[t + pc] = npc;
		break;	
	  /* ldawfi */
	  case 0x136:   
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		regs[t + op1] = regs[t + op2] + (op3 << 2);
		regs[t + pc] = npc;
		break;	
	  /* ashri */     
	  case 0x126:  
		switch (i & 3)
		{ /* ashri */
		  case 0:
			op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
			temp = bitpos[op3];
			regs[t + op1] = ((int) regs[t + op2]) >> temp;
			regs[t + pc] = npc;
			break; 
		  /* outpw */
		  case 1:
			break;	
		  /* inpw */
		  case 2:   
			break;		
		};
    };
	break;	
			  
/* then the long immediates */
			  
  case 0x3c0: case 0x3d0: case 0x3c8: case 0x3d8:
	opd = i & 1023;
	i = pmem[npc >> 1];
	npc = npc + 2;				 
	switch (i >> 6)  
	{ /* blacp */
	  case 0x380: case 0x381: case 0x382: case 0x383:
      case 0x384: case 0x385: case 0x386: case 0x387:
	  case 0x388: case 0x389: case 0x38a: case 0x38b:
	  case 0x38c: case 0x38d: case 0x38e: case 0x38f:
	    opd = (opd << 10) | (i & 1023);
		regs[t + lr] = npc;
		regs[t + pc] = mem[(regs[t + cp] >> 2) + opd];
		break;
	  /* blat */
	  case 0x1cd:
		opd = (opd << 6) | (i & 63);
		regs[t + lr] = npc;
		regs[t + pc] = mem[(regs[t + 11] >> 2) + opd];
		break;
	  /* blrb */
	  case 0x350: case 0x351: case 0x352: case 0x353:
	  case 0x354: case 0x355: case 0x356: case 0x357:
	  case 0x358: case 0x359: case 0x35a: case 0x35b:
	  case 0x35c: case 0x35d: case 0x35e: case 0x35f:
		opd = (opd << 10) | (i & 1023);
		regs[t + lr] = npc;
		regs[t + pc] = npc - (opd << 1);
		break;
	  /* blrf */
	  case 0x340: case 0x341: case 0x342: case 0x343:
	  case 0x344: case 0x345: case 0x346: case 0x347:
	  case 0x348: case 0x349: case 0x34a: case 0x34b:
	  case 0x34c: case 0x34d: case 0x34e: case 0x34f:
		opd = (opd << 10) | (i & 1023);
		regs[t + lr] = npc;
		regs[t + pc] = npc + (opd << 1);
		break;
	  /* brbf */
	  case 0x1f0: case 0x1f1: case 0x1f2: case 0x1f3:
	  case 0x1f4: case 0x1f5: case 0x1f6: case 0x1f7:
	  case 0x1f8: case 0x1f9: case 0x1fa: case 0x1fb:
		opd = (opd << 6) | (i & 63);
		if (regs[t + ((i >> 6) & 15)] == 0)
		  npc = npc - (opd <<  1);
		regs[t + pc] = npc;	
		break; 					   
	  /* brbt */
	  case 0x1d0: case 0x1d1: case 0x1d2: case 0x1d3:
	  case 0x1d4: case 0x1d5: case 0x1d6: case 0x1d7:
	  case 0x1d8: case 0x1d9: case 0x1da: case 0x1db:
		opd = (opd << 6) | (i & 63);
		if (regs[t + ((i >> 6) & 15)] != 0)
		  npc = npc - (opd <<  1);
		regs[t + pc] = npc;	
		break; 					   
	  /* brbu */
      case 0x1dc:
		opd = (opd << 6) | (i & 63);	
		regs[t + pc] = npc - (opd <<  1); 
		break; 
	  /* brff */
	  case 0x1e0: case 0x1e1: case 0x1e2: case 0x1e3:
	  case 0x1e4: case 0x1e5: case 0x1e6: case 0x1e7:
	  case 0x1e8: case 0x1e9: case 0x1ea: case 0x1eb:
		opd = (opd << 6) | (i & 63);
		if (regs[t + ((i >> 6) & 15)] == 0)
		  npc = npc + (opd <<  1);
		regs[t + pc] = npc;	
		break; 								
	  /* brft */
	  case 0x1c0: case 0x1c1: case 0x1c2: case 0x1c3:
	  case 0x1c4: case 0x1c5: case 0x1c6: case 0x1c7:
	  case 0x1c8: case 0x1c9: case 0x1ca: case 0x1cb:
		opd = (opd << 6) | (i & 63);
		if (regs[t + ((i >> 6) & 15)] != 0)
		  npc = npc + (opd <<  1);
	    regs[t + pc] = npc;	
		break; 										 
	  /* brfu */
	  case 0x1cc:
		opd = (opd << 6) | (i & 63);	
		regs[t + pc] = npc + (opd <<  1); 
		break; 
	  /* clrsr */
	  case 0x1ec:
		opd = (opd << 6) | (i & 63);
		regs[t + sr] = regs[t + sr] & ~opd;
		regs[t + pc] = npc;
		break;
	  /* entsp */
	  case 0x1dd:
		opd = (opd << 6) | (i & 63);		 
		if (opd != 0)
		{ mem[regs[t + sp] >> 2] = regs[t + lr];
		  regs[t + sp] = regs[t + sp] - (opd << 2);
		};
		regs[t + pc] = npc;
		break;										  
	  /* extdp */
	  case 0x1ce:
	    opd = (opd << 6) | (i & 63);
		regs[t + dp] = regs[t + dp] - (opd << 2);
		regs[t + pc] = npc;
		break;  
	  /* extsp */
	  case 0x1de:
		opd = (opd << 6) | (i & 63);
		regs[t + sp] = regs[t + sp] - (opd << 2);
		regs[t + pc] = npc;
		break;							  
	  /* getsr */
	  case 0x1fc:
		opd = (opd << 6) | (i & 63);		  
		regs[t + 11] = regs[t + sr] & opd;
		regs[t + pc] = npc;
		break;
	  /* kcalli */
	  case 0x1cf:		  
		opd = (opd << 6) | (i & 63);
		regs[t + spc] = npc;		 
		regs[t + ssr] = regs[t + sr];
		regs[t + et] = et_kcall;
		regs[t + sed] = opd;
		regs[t + pc] = regs[kep] + 64;
		regs[t + sr] = (regs[t + sr] | ink) & ~ (ieble | eeble);
		break;
	  /* kentsp */
	  case 0x1ee:
		opd = (opd << 6) | (i & 63); 
		mem[regs[t + ksp] >> 2] = regs[t + sp];
		regs[t + sp] = regs[t + ksp] - (opd << 2);
		regs[t + pc] = npc;
		break;	 
	  /* krestsp */ 
	  case 0x1ef:
		opd = (opd << 6) | (i & 63);
		regs[t + ksp] = regs[t + sp] + (opd << 2);
		regs[t + sp] = mem[regs[t + ksp] >> 2];
		regs[t + pc] = npc;
		break;
	  /* ldapb */
	  case 0x370: case 0x371: case 0x372: case 0x373:
	  case 0x374: case 0x375: case 0x376: case 0x377:
	  case 0x378: case 0x379: case 0x37a: case 0x37b:
	  case 0x37c: case 0x37d: case 0x37e: case 0x37f:
	    opd = (opd << 10) | (i & 1023);
		regs[t + 11] = npc - (opd << 1);
		regs[t + pc] = npc;
		break;									  
	  /* ldapf */
	  case 0x360: case 0x361: case 0x362: case 0x363:
	  case 0x364: case 0x365: case 0x366: case 0x367:
	  case 0x368: case 0x369: case 0x36a: case 0x36b:
	  case 0x36c: case 0x36d: case 0x36e: case 0x36f:
		opd = (opd << 10) | (i & 1023);
		regs[t + 11] = npc + (opd << 1);
		regs[t + pc] = npc;
		break;											  
	  /* ldawcp */
	  case 0x1fd: 
		opd = (opd << 6) | (i & 63);
		regs[t + ((i >> 6) & 15)] = regs[t + cp] + (opd << 2);
	    regs[t + pc] = npc;
		break;									  
	  /* ldawdp */
	  case 0x180: case 0x181: case 0x182: case 0x183:
	  case 0x184: case 0x185: case 0x186: case 0x187:
	  case 0x188: case 0x189: case 0x18a: case 0x18b:
		opd = (opd << 6) | (i & 63);
		regs[t + ((i >> 6) & 15)] = regs[t + dp] + (opd << 2);
		regs[t + pc] = npc;
		break;											  
	  /* ldawsp */
	  case 0x190: case 0x191: case 0x192: case 0x193:
	  case 0x194: case 0x195: case 0x196: case 0x197:
	  case 0x198: case 0x199: case 0x19a: case 0x19b:
		opd = (opd << 6) | (i & 63);
		regs[t + ((i >> 6) & 15)] = regs[t + sp] + (opd << 2);
		regs[t + pc] = npc;
		break;									  
	  /* ldc */
	  case 0x1a0: case 0x1a1: case 0x1a2: case 0x1a3:
	  case 0x1a4: case 0x1a5: case 0x1a6: case 0x1a7:
	  case 0x1a8: case 0x1a9: case 0x1aa: case 0x1ab:
		opd = (opd << 6) | (i & 63);
		regs[t + ((i >> 6) & 15)] = opd;
		regs[t + pc] = npc;
		break;											  
	  /* ldwcpl */
	  case 0x390: case 0x391: case 0x392: case 0x393:
	  case 0x394: case 0x395: case 0x396: case 0x397:
	  case 0x398: case 0x399: case 0x39a: case 0x39b:
	  case 0x39c: case 0x39d: case 0x39e: case 0x39f:
	    opd = (opd << 10) | (i & 1023);
		regs[t + 11] = mem[(regs[t + cp] >> 2) + opd];
		regs[t + pc] = npc;
		break;										  
	  /* ldwcp */
	  case 0x1b0: case 0x1b1: case 0x1b2: case 0x1b3:
	  case 0x1b4: case 0x1b5: case 0x1b6: case 0x1b7:
	  case 0x1b8: case 0x1b9: case 0x1ba: case 0x1bb:
	    opd = (opd << 6) | (i & 63);
		regs[t + ((i >> 6) & 15)] = mem[(regs[t + cp] >> 2) + opd];
		regs[t + pc] = npc;
		break;
	  /* ldwdp */
	  case 0x160: case 0x161: case 0x162: case 0x163:
	  case 0x164: case 0x165: case 0x166: case 0x167:
	  case 0x168: case 0x169: case 0x16a: case 0x16b:
		opd = (opd << 6) | (i & 63);
		regs[t + ((i >> 6) & 15)] = mem[(regs[t + dp] >> 2) + opd];
	    regs[t + pc] = npc;
		break;
	  /* ldwsp */
	  case 0x170: case 0x171: case 0x172: case 0x173:
	  case 0x174: case 0x175: case 0x176: case 0x177:
	  case 0x178: case 0x179: case 0x17a: case 0x17b:
		opd = (opd << 6) | (i & 63);
		regs[t + ((i >> 6) & 15)] = mem[(regs[t + sp] >> 2) + opd];
	    regs[t + pc] = npc;
		break;
	  /* retsp */
	  case 0x1df:
		opd = (opd << 6) | (i & 63);
		if (opd != 0)
		{ regs[t + sp] = regs[t + sp] + (opd << 2);
		  regs[t + lr] = mem[regs[t + sp] >> 2];
	    };
		regs[t + pc] = regs[t + lr];
	    break;										  
	  /* setci */
	  case 0x3a0: case 0x3a1: case 0x3a2: case 0x3a3:
	  case 0x3a4: case 0x3a5: case 0x3a6: case 0x3a7:
	  case 0x3a8: case 0x3a9: case 0x3aa: case 0x3ab: 
	  /* stwdp */
	  case 0x140: case 0x141: case 0x142: case 0x143:
	  case 0x144: case 0x145: case 0x146: case 0x147:
	  case 0x148: case 0x149: case 0x14a: case 0x14b:
		opd = (opd << 6) | (i & 63);
		mem[(regs[t + dp] >> 2) + opd] = regs[t + ((i >> 6) & 15)];  
		regs[t + pc] = npc;
		break;	
	  /* stwsp */
	  case 0x150: case 0x151: case 0x152: case 0x153:
	  case 0x154: case 0x155: case 0x156: case 0x157:
	  case 0x158: case 0x159: case 0x15a: case 0x15b:
		opd = (opd << 6) | (i & 63);
		mem[(regs[t + sp] >> 2) + opd] = regs[t + ((i >> 6) & 15)];  
		regs[t + pc] = npc;
		break;	
	  /* setsr */
	  case 0x1ed:
		opd = (opd << 6) | (i & 63);
		regs[t + sr] = regs[t + sr] | opd;
		regs[t + pc] = npc;
		break;
    };
	break;	
  };
};

};

outtoken(ch, token, flag)
{ unsigned int buffp;
  unsigned int wt;	
  unsigned int cnum;	
  unsigned int temp; 
  temp = rbase[(ch >> 8) + r_state]; 	 
  cnum = chanbuff[temp + ch_d] >> 8;
  if (chanptr[cnum + ch_qh] == nil)
  { chanptr[cnum + ch_qh] = t; 
	chanptr[cnum + ch_qt] = t;
	regs[t + qnxt] = nil;  
  };
  if (chanptr[cnum + ch_qh] == t)
  { buffp = chanptr[cnum + ch_buffp] << 3;
	if (buffp < 64)
	{ if (buffp < 32)
	    chanbuff[cnum + ch_buff0] = chanbuff[cnum + ch_buff0] | (token << buffp);
	  else 
		chanbuff[cnum + ch_buff1] = chanbuff[cnum + ch_buff1] | (token << (buffp - 32));
	  chanbuff[cnum + ch_fbuff] = chanbuff[cnum + ch_fbuff] | (flag << chanptr[cnum + ch_buffp]); 	
	  chanptr[cnum + ch_buffp] = chanptr[cnum + ch_buffp] + 1;
	  wt = chanptr[cnum + ch_wt]; 
	  if (wt != nil) 
	  { regs[lastt + nxt] = wt;
		regs[wt + nxt] = t;
		lastt = wt;
		chanptr[cnum + ch_wt] = nil;
	  };
	  if ((flag == 1) & (token == t_eom))
	  { temp = chanptr[cnum + ch_qh];
        chanptr[cnum + ch_qh] = regs[t + qnxt];
		if (temp != nil)
		{ regs[lastt + nxt] = temp;
		  regs[temp + nxt] = t;
		  lastt = temp;
		  chanptr[cnum + ch_wt] = nil;
		};
	  };
	  regs[t + pc] = npc;	
	}
	else
	{ temp = t;	
	  t = regs[t + nxt];
	  regs[lastt + nxt] = t;
	  chanptr[cnum + ch_wt] = temp; 
	}
  }  
  else	  
  { temp = t;	
	t = regs[t + qnxt];
	regs[lastt + qnxt] = t;
	regs[chanptr[cnum + ch_qt] + qnxt] = temp; 	
	chanptr[cnum + ch_qt] = temp;
  };
};

intoken(ch, destreg, flag)		
{ unsigned int token;
  unsigned int buffp;
  unsigned int wt;	
  unsigned int cnum;	
  cnum = rbase[(ch >> 8) + r_state];	
  buffp = chanptr[cnum + ch_buffp] << 3;
  if (buffp > 0)
  { if (flag == (chanbuff[cnum + ch_fbuff] & 1))
	regs[t + destreg] = (chanbuff[cnum + ch_buff0] & 255);
	chanbuff[cnum + ch_buff0] = (chanbuff[cnum + ch_buff0] >> 8) | ((chanbuff[cnum + ch_buff1] & 255) << 24);  
	chanbuff[cnum + ch_buff1] = chanbuff[cnum + ch_buff1] >> 8;
	chanbuff[cnum + ch_fbuff] = chanbuff[cnum + ch_fbuff] >> 1;
	chanptr[cnum + ch_buffp] = chanptr[cnum + ch_buffp] - 1;  
	wt = chanptr[cnum + ch_wt];
	if (wt != nil) 
	{ regs[lastt + nxt] = wt;
	  regs[wt + nxt] = t;
	  lastt = wt;
	  chanptr[cnum + ch_wt] = nil;
	}; 
	regs[t + pc] = npc;  
  }	  
  else 
  { wt = t;	
	t = regs[t + nxt];
    regs[lastt + nxt] = t;
	chanptr[cnum + ch_wt] = wt; 
  };
};
		  		  		  
load()
{ int lowlength;
  int n;
  codefile = fopen("a.bin", "rb");
  lowlength = inbin();	
  length = ((inbin() << 16) | lowlength) << 1;
  //printf("%d binary length\n", length);
  for (n = 0; n < length; n++)
    pmem[n] = inbin();
  length = length << 1;	
};

inbin(d) 
{ int lowbits;
  int highbits;
  lowbits = fgetc(codefile);
  highbits = fgetc(codefile);
  return (highbits << 8) | lowbits;
};

simout(b, s)
{ char fname[] = {'s', 'i', 'm', ' ', 0};
  int f;
  //printf("%x\n", s);
  if (s < 256)
	putchar(b);
  else 
  { f = (s >> 8) & 7;
	if (! connected[f])
	{ fname[3] = f + '0';
	  simio[f] = fopen(fname, "w");
	  connected[f] = true;
	};	
	fputc(b, simio[f]);
  };	  
};

simin(s)
{ char fname[] = {'s', 'i', 'm', ' ', 0};
  int f;
  if (s < 256) 
	return getchar();
  else 
  { f = (s >> 8) & 7;
	fname[3] = f + '0';
	if (! connected[f])
	{ simio[f] = fopen(fname, "r");
	  connected[f] = true;
	}	
	return fgetc(simio[f]);	  
  };
};

checkmem(a)
{ if ((a < 0) || (a >= 200000))
	printf("\n out of address range %d\n", a);
}		   
	

