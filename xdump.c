
#include "stdio.h"

#include "xtranslate.c"

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

#define et_kcall       15

#define res_thread      4

#define ieble         0x1
#define eeble         0x2
#define ink           0x4

FILE *codefile;

unsigned int mem[100000];
unsigned short *pmem = (unsigned short *) mem;

unsigned int length;

unsigned int regs[1024];

main() 
{
	
unsigned int iaddr;
unsigned int i;
unsigned int npc;
unsigned int ops;
unsigned int op1, op2, op3;
unsigned int ops456;	
unsigned int opd;	
	
load();	
	
iaddr = 0;

while (iaddr < length)	
{
	
i = pmem[iaddr >> 1]; 
npc = iaddr + 2;
	
ops = translate[i & 0x7ff];
	
priaddr(iaddr);
	
switch (((i >> 6) & 0x3f0) | (ops & 15))
{
	
/* first all the short instructions */
	
/* add */
  case 0x040: case 0x050: case 0x048: case 0x058:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15; 
	pr3r("add", op1, op2, op3); 
	break;
  
/* addi */
  case 0x240: case 0x250: case 0x248: case 0x258:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	pr2rus("addi", op1, op2, op3); 
	break;

/* and */
  case 0x0e0: case 0x0f0: case 0x0e8: case 0x0f8:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15; 
	pr3r("add", op1, op2, op3); 
	break;

/* andnot */
  case 0x0b2: case 0x0ba: 
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	pr2r("andnot", op1, op2);
	break;

/* bau */
  case 0x09d: 
	op1 = (ops >> 12) & 15;	   
	pr1r("bau", op1);
	break;
		   
/* bla */
  case 0x09c:
	op1 = (ops >> 12) & 15;	   
	pr1r("bla", op1);
	break;

/* blacp */
  case 0x380: case 0x381: case 0x382: case 0x383:
  case 0x384: case 0x385: case 0x386: case 0x387:
  case 0x388: case 0x389: case 0x38a: case 0x38b:
  case 0x38c: case 0x38d: case 0x38e: case 0x38f:
	pru10("blacp", i & 1023);
	break;

/* blat, also brfu, extdp, kcalli */
  case 0x1c8: case 0x1c9: case 0x1ca: case 0x1cb:
  case 0x1cc: case 0x1cd: case 0x1ce: case 0x1cf:
    switch ((i >> 6) & 3)
	{ /* brfu */
      case 0:
		pru6("brfu", i & 63);	
		prtgt(npc + ((i & 63) << 1));
	    break;		   
      /* blat */
      case 1:
		pru6("blat", i & 63);
		break;
      /* extdp */
      case 2:
		pru6("extdp", i & 63);	
	    break;
      /* kcalli */		
      case 3:
        pru6("kcalli", i & 63);
	    break;		
	};
	break;
				
/* blrb */
  case 0x350: case 0x351: case 0x352: case 0x353:
  case 0x354: case 0x355: case 0x356: case 0x357:
  case 0x358: case 0x359: case 0x35a: case 0x35b:
  case 0x35c: case 0x35d: case 0x35e: case 0x35f:
	pru10("blrb", i & 1023);
	prtgt(npc - ((i & 1023) << 1));		
    break;

/* blrf */
  case 0x340: case 0x341: case 0x342: case 0x343:
  case 0x344: case 0x345: case 0x346: case 0x347:
  case 0x348: case 0x349: case 0x34a: case 0x34b:
  case 0x34c: case 0x34d: case 0x34e: case 0x34f:
	pru10("blrf", i & 1023);
	prtgt(npc + ((i & 1023) << 1));
	break;

/* brbf */
  case 0x1f0: case 0x1f1: case 0x1f2: case 0x1f3:
  case 0x1f4: case 0x1f5: case 0x1f6: case 0x1f7:
	prru6("brbf", ((i >> 6) & 15), i & 63);		
	prtgt(npc - ((i & 63) << 1));
	break; 
		 
/* brbt */
  case 0x1d0: case 0x1d1: case 0x1d2: case 0x1d3:
  case 0x1d4: case 0x1d5: case 0x1d6: case 0x1d7:
	prru6("brbt", ((i >> 6) & 15), i & 63);		
    prtgt(npc - ((i & 63) << 1));
	break; 

/* brbu - also entsp, extsp, retsp */
  case 0x1d8: case 0x1d9: case 0x1da: case 0x1db:
  case 0x1dc: case 0x1dd: case 0x1de: case 0x1df:
    switch ((i >> 6) & 3)
    { /* brbu */
	  case 0:
		pru6("brbu", i & 63);	
		prtgt(npc - ((i & 63) << 1));
		break;
      /* entsp */
      case 1:
		pru6("entsp", i & 63);	  
		break;
	  /* extsp */
      case 2:
		pru6("extsp", i & 63);
	    break;
	  /* retsp */		
	  case 3:
		pru6("retsp", i & 63);
		break;
	};	
	break;

/* brff */
  case 0x1e0: case 0x1e1: case 0x1e2: case 0x1e3:
  case 0x1e4: case 0x1e5: case 0x1e6: case 0x1e7:
	prru6("brff", ((i >> 6) & 15), i & 63);		
	prtgt(npc + ((i & 63) << 1));
	break; 

/* brft */
  case 0x1c0: case 0x1c1: case 0x1c2: case 0x1c3:
  case 0x1c4: case 0x1c5: case 0x1c6: case 0x1c7:
	prru6("brff", ((i >> 6) & 15), i & 63);		
	prtgt(npc + ((i & 63) << 1));
	break;
					
/* brfu - see blat */

/* bru */
  case 0x0bc:
	op1 = (ops >> 12) & 15;	
	pr1r("bru", op1);
	break;

/* chkct */
  case 0x332: case 0x33a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	pr2r("chkct", op1, op2);
	break;
		
/* chkcti */
  case 0x333: case 0x33b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	prrus("chkcti", op1, op2);
	break;

/* clre - also freet, ssync, waiteu */
  case 0x01e:
    switch (i & 3)
    { /* waiteu */
      case 0:
		pr0r("waiteu");		
		break;	
      /* clre */		
      case 1:
		pr0r("clre");
		break;	
      /* ssync */		
      case 2:
		pr0r("ssync");		
		break;	
      /* freet */		
      case 3:
		pr0r("freet");
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
		pru6("clrsr", i & 63);
	    break;
      /* setsr */		
      case 1:
		pru6("setsr", i & 63);
		break;		
      /* kentsp */
      case 2:
		pru6("kentsp", i & 63);
		break;	 
      /* krestsp */ 
      case 3:
		pru6("krestsp", i & 63);
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
		pr0r("kret");	  
	    break;
      /* dret */
      case 2:
		break;		
      /* setkep */
      case 3:
		pr0r("setkep");
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
		pr0r("getid");
		break;		 
      case 2:
      /* getkep */		
      case 3:
		pr0r("getkep");
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
	pr1r("ecallf", op1);
	break;
		
/* ecallt */
  case 0x13d:
	op1 = (ops >> 12) & 15;
	pr1r("ecallt", op1);
	break;
		
/* edu */
  case 0x01c:
	op1 = (ops >> 12) & 15;
	pr1r("kcall", op1);
	break;
		
/* eef */
  case 0x0b3: case 0x0bb:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	pr2r("eef", op1, op2);
	break;
		
/* eet */
  case 0x093: case 0x09b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	pr2r("eet", op1, op2);
	break;
		
/* eeu */
  case 0x01d:
	op1 = (ops >> 12) & 15;
	pr1r("kcall", op1);
	break;
		
/* endin */
  case 0x253: case 0x25b:

/* entsp - see brbu */

/* eq */
  case 0x0c0: case 0x0d0: case 0x0c8: case 0x0d8:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	pr3r("eq", op1, op2, op3); 
	break;

/* eqi */
  case 0x2c0: case 0x2d0: case 0x2c8: case 0x2d8:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	pr2rus("eqi", op1, op2, op3); 
	break;

/* extdp - see blat */

/* freer */
  case 0x05c:
	op1 = (ops >> 12) & 15;
	pr1r("freer", op1);
	break;
		
/* freet  - see clre */

/* geted - also getet, stet, stsed */
 case 0x03f:
    switch (i & 3)
    { /* stsed */
      case 0:
		pr0r("stsed");
		break;
      /* stet */
      case 1:
		pr0r("stet");
		break;
      /* geted */
      case 2:
		pr0r("geted");	  
		break;
      /* getet */
      case 3:
		pr0r("getet");
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
		pr0r("getksp"); 
		break;
      /* ldsed */		
      case 1:
		pr0r("ldsed");
		break;
      /* ldet */
	  case 2:
		pr0r("ldet");
		break;
      case 3:
		break;	
	};
	break;

/* getr */
  case 0x212: case 0x21a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	prrus("getr", op1, op2);
	break;		

/* getsr - also ldawcp */
  case 0x1f8: case 0x1f9: case 0x1fa: case 0x1fb:
  case 0x1fc: case 0x1fd: case 0x1fe: case 0x1ff:
    switch ((i >> 6) & 3)
    { /* getsr */
      case 0:
		pru6("getsr", i & 63);
		break;		 
      /* ldawcp */		
	  case 1:
		pru6("ldawcp", i & 63);	
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
	pr2r("getst", op1, op2);
	break;		
		
/* getts */
  case 0x0f2: case 0x0fa:

/* in */
  case 0x2d2: case 0x2da:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	pr2r("in", op1, op2);
	break;
		
/* inct */
  case 0x213: case 0x21b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	pr2r("inct", op1, op2);
	break;		

/* inshr */
  case 0x2d3: case 0x2db:

/* int */
  case 0x233: case 0x23b:

/* kcall */
  case 0x11c:
    op1 = (ops >> 12) & 15;
	pr1r("kcall", op1);
    break;
			 
/* kcalli - see blat */

/* kentsp - see clrsr */

/* krestsp - see clrsr */

/* kret - see dcall */

/* ld16s */
  case 0x200: case 0x210: case 0x208: case 0x218:

/* ld8u */
  case 0x220: case 0x230: case 0x228: case 0x238:

/* ldapb */
  case 0x370: case 0x371: case 0x372: case 0x373:
  case 0x374: case 0x375: case 0x376: case 0x377:
  case 0x378: case 0x379: case 0x37a: case 0x37b:
  case 0x37c: case 0x37d: case 0x37e: case 0x37f:
	pru10("ldapb", i & 1023);
	prtgt(npc - ((i & 1023) << 1));
	break;

/* ldapf */
  case 0x360: case 0x361: case 0x362: case 0x363:
  case 0x364: case 0x365: case 0x366: case 0x367:
  case 0x368: case 0x369: case 0x36a: case 0x36b:
  case 0x36c: case 0x36d: case 0x36e: case 0x36f:
	pru10("ldapf", i & 1023);
	prtgt(npc + ((i & 63) << 1));
	break;

/* ldawcp - see getsr */

/* ldawdp */
  case 0x180: case 0x181: case 0x182: case 0x183:
  case 0x184: case 0x185: case 0x186: case 0x187:
  case 0x188: case 0x189: case 0x18a: case 0x18b:
  case 0x18c: case 0x18d: case 0x18e: case 0x18f:
	prru6("ldawdp", (i >> 6) & 15, i & 63);
	break;

/* ldawsp */
  case 0x190: case 0x191: case 0x192: case 0x193:
  case 0x194: case 0x195: case 0x196: case 0x197:
  case 0x198: case 0x199: case 0x19a: case 0x19b:
  case 0x19c: case 0x19d: case 0x19e: case 0x19f:
	prru6("ldawsp", (i >> 6) & 15, i & 63);
	break;

/* ldc */
  case 0x1a0: case 0x1a1: case 0x1a2: case 0x1a3:
  case 0x1a4: case 0x1a5: case 0x1a6: case 0x1a7:
  case 0x1a8: case 0x1a9: case 0x1aa: case 0x1ab:
  case 0x1ac: case 0x1ad: case 0x1ae: case 0x1af:
	prru6("ldc", (i >> 6) & 15, i & 63);
    break;

/* ldet - see getksp */

/* ldsed - see getksp */

/* ldspc - also ldssr, stspc, stssr */
  case 0x03e:
    switch (i & 3)
    { /* ldspc */
      case 0:
		pr0r("ldspc");
		break;
      /* stspc */
      case 1:
		pr0r("stspc");
	    break;
      /* ldssr */
      case 2:
		pr0r("ldssr");
	    break;
      /* stssr */
      case 3:
		pr0r("stssr");
		break;
    };
    break;

/* ldssr - see ldspc */

/* ldw */
  case 0x120: case 0x130: case 0x128: case 0x138:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	pr3r("ldw", op1, op2, op3);
	break;

/* ldwi */
  case 0x020: case 0x030: case 0x028: case 0x038:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	pr2rus("ldwi", op1, op2, op3);
	break;

/* ldwcp */
  case 0x1b0: case 0x1b1: case 0x1b2: case 0x1b3:
  case 0x1b4: case 0x1b5: case 0x1b6: case 0x1b7:
  case 0x1b8: case 0x1b9: case 0x1ba: case 0x1bb:
  case 0x1bc: case 0x1bd: case 0x1be: case 0x1bf:
	prru6("ldwcp", (i >> 6) & 15, i & 63);
    break;

/* ldwcpl */
  case 0x390: case 0x391: case 0x392: case 0x393:
  case 0x394: case 0x395: case 0x396: case 0x397:
  case 0x398: case 0x399: case 0x39a: case 0x39b:
  case 0x39c: case 0x39d: case 0x39e: case 0x39f:
	pru10("ldwcpl", i & 1023);		  
	break;

/* ldwdp */
  case 0x160: case 0x161: case 0x162: case 0x163:
  case 0x164: case 0x165: case 0x166: case 0x167:
  case 0x168: case 0x169: case 0x16a: case 0x16b:
  case 0x16c: case 0x16d: case 0x16e: case 0x16f:
	prru6("ldwdp", (i >> 6) & 15, i & 63);
	break;

/* ldwsp */
  case 0x170: case 0x171: case 0x172: case 0x173:
  case 0x174: case 0x175: case 0x176: case 0x177:
  case 0x178: case 0x179: case 0x17a: case 0x17b:
  case 0x17c: case 0x17d: case 0x17e: case 0x17f:
	prru6("ldwsp", (i >> 6) & 15, i & 63);
	break;
 
/* lss */
  case 0x300: case 0x310: case 0x308: case 0x318:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	pr3r("lss", op1, op2, op3);
    break;

/* lsu */
  case 0x320: case 0x330: case 0x328: case 0x338:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	pr3r("lsu", op1, op2, op3);
	break;
		
/* mjoin */
  case 0x05d:
	op1 = (ops >> 12) & 15;
	pr2r("mjoin", op1);
	break;

/* mkmsk */
  case 0x292: case 0x29a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;		 
	pr2r("mkmsk", op1, op2);
	break;
		
/* mkmski */
  case 0x293: case 0x29b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;		 
	prrus("mkmski", op1, op2);
	break;
		
/* msync */
  case 0x07d:
	op1 = (ops >> 12) & 15; 
	pr1r("msync", op1);
	break;
		
/* neg */
  case 0x252: case 0x25a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;		 
    pr2r("neg", op1, op2);
	break;

/* not */
  case 0x232: case 0x23a:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	pr2r("not", op1, op2);
	break;

/* or */
  case 0x100: case 0x110: case 0x108: case 0x118:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	pr3r("or", op1, op2, op3);
	break;

/* out */
  case 0x2b2: case 0x2ba:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	pr2r("out", op1, op2);
	break;
		
/* outct */
  case 0x132: case 0x13a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	pr2r("outct", op1, op2);
	break;
			
/* outcti */
  case 0x133: case 0x13b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	prrus("outcti", op1, op2);
	break;
		
/* outshr */
  case 0x2b3: case 0x2bb:

/* outt */
  case 0x033: case 0x03b:
	op2 = (ops >> 12) & 15; op1 = (ops >> 8) & 15;
	pr2r("outt", op1, op2);
	break;
		
/* peek */
  case 0x2f2: case 0x2fa:

/* setci */
  case 0x3a0: case 0x3a1: case 0x3a2: case 0x3a3:
  case 0x3a4: case 0x3a5: case 0x3a6: case 0x3a7:
  case 0x3a8: case 0x3a9: case 0x3aa: case 0x3ab:
  case 0x3ac: case 0x3ad: case 0x3ae: case 0x3af:
	prru6("setci", (i >> 6) & 15, i & 63);
	break;

/* setcp */
  case 0x0dd:		  
	op1 = (ops >> 12) & 15;
	pr1r("setcp", op1);
	break;

/* setd */
  case 0x053: case 0x05b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	pr2r("setd", op1, op2);
	break;	

/* setdp */
  case 0x0dc:
	op1 = (ops >> 12) & 15;
	pr1r("setdp", op1);
    break;

/* setev */
  case 0x0fd:
	op1 = (ops >> 12) & 15; 
	pr1r("setd", op1);
	break;	
		
/* setkep - see dcall */

/* setpsc */
  case 0x312: case 0x31a: 
 
/* setpt */
  case 0x0f3: case 0x0fb:

/* setsp */
  case 0x00bd:
	op1 = (ops >> 12) & 15;
	pr1r("setsp", op1);
	break;

/* setsr - see clrsr */

/* setv */
  case 0x11d:
	op1 = (ops >> 12) & 15; 
	pr1r("setv", op1);
	break;	
		
/* sext */
  case 0x0da:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;		 
	pr2r("sext", op1, op2);
	break;
		
/* sexti */
  case 0x0db:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;		 
	pr2r("sexti", op1, op2);
	break;
		
/* shl */
  case 0x080: case 0x090: case 0x088: case 0x098:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;		 
	pr3r("shl", op1, op2, op3);
	break;

/* shli */
  case 0x280: case 0x290: case 0x288: case 0x298:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;		 
	pr2rus("shli", op1, op2, op3);
	break;

/* shr */
  case 0x0a0: case 0x0b0: case 0x0a8: case 0x0b8:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;		 
	pr3r("shr", op1, op2, op3);
	break;

/* shri */
  case 0x2a0: case 0x2b0: case 0x2a8: case 0x2b8:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	pr2rus("shri", op1, op2, op3);
	break;

/* ssync - see clre */
	
/* stet - see geted */

/* stsed - see geted */

/* stspc - see ldspc */

/* stssr - see ldspc */

/* stwi */
  case 0x000: case 0x010: case 0x008: case 0x018:
  	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	pr2rus("stwi", op1, op2, op3);
    break;
			 
/* stwdp */
  case 0x140: case 0x141: case 0x142: case 0x143:
  case 0x144: case 0x145: case 0x146: case 0x147:
	prru6("stwdp", (i >> 6) & 15, i & 63);
	break;			 			 

/* stwsp */
  case 0x150: case 0x151: case 0x152: case 0x153:
  case 0x154: case 0x155: case 0x156: case 0x157:
	prru6("stwsp", (i >> 6) & 15, i & 63);
	break;
			 
/* sub */
  case 0x060: case 0x070: case 0x068: case 0x078:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	pr3r("shl", op1, op2, op3);
	break;

/* subi */
  case 0x260: case 0x270: case 0x268: case 0x278:
    op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	pr2rus("subi", op1, op2, op3);
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
	pr2r("tinitcp", op1, op2);
	break;

/* tinitdp */
  case 0x03a:		 
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	pr2r("tinitdp", op1, op2);
	break;		 

/* tinitpc */
  case 0x01a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	pr2r("tinitpc", op1, op2);
	break;
		 
/* tinitsp */
  case 0x05a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	pr2r("tinitsp", op1, op2);
	break;
		 
/* tsetmr */
  case 0x07b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
	pr2r("tsetmr", op1, op2);
	break;

/* tsetr */
  case 0x2e0: case 0x2f0: case 0x2e8: case 0x2f8:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
	pr2rus("tsetr", op1, op2, op3);
	break;
		
/* tstart */
  case 0x07c:

/* waitef */
  case 0x03d:
	op1 = (ops >> 12) & 15; 
	pr1r("waitef", op1);
	break;	
		
/* waitet */
  case 0x03c:
	op1 = (ops >> 12) & 15; 
	pr1r("waitef", op1);
	break;
		
/* waiteu - see clre */

/* zext */
  case 0x11a:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;		 
	pr2r("zext", op1, op2);
	break;
		
/* zexti */
  case 0x11b:
	op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;		 
	pr2r("zexti", op1, op2);
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
		pr2r("bitrev", op1, op2);
		break;
	  /* clz */
	  case 0x04:
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
		pr2r("clz", op1, op2);
		break;
	  /* testlcl */
	  case 0x10:
	  /* tinitlr */
	  case 0x08:
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15;
		pr2r("tinitlr", op1, op2);
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
		pr2r("byterev", op1, op2);
		break;
	  /* getd */
	  case 0x0c:
	  /* getn */
	  case 0x18:
	  /* getps */
	  case 0x08:
	  /* setc */
	  case 0x14:
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
		pr3r("ashr", op1, op2, op3);
		break; 
	  /* crc */
	  case 0x156:     
	  /* crc8 */
	  case 0x004:
	  /* divs */
	  case 0x086:  
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pr3r("divs", op1, op2, op3);
		break;  		 
	  /* divu */
	  case 0x096:
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pr3r("divu", op1, op2, op3);
		break;
	  /* ladd */
	  case 0x003:
	  /* lda16b */
	  case 0x066: 
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pr3r("stw", op1, op2, op3);
		break;
	  /* lda16f */
	  case 0x056: 
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pr3r("stw", op1, op2, op3);
		break;
	  /* ldawb */
	  case 0x046:  
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pr3r("ldawb", op1, op2, op3);
		break;	
	  /* ldawf */
	  case 0x036:
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pr3r("ldawf", op1, op2, op3);
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
		pr3r("mul", op1, op2, op3);
		break;
	  /* rems */
	  case 0x186:   
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pr3r("rems", op1, op2, op3);
		break;  
	  /* remu */
	  case 0x196:  op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pr3r("remu", op1, op2, op3);
		break;    
	  /* st16 */
	  case 0x106:    
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pr3r("st16", op1, op2, op3);
		break;
	  /* st8 */
	  case 0x116:  
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pr3r("st8", op1, op2, op3);
		break;
	  /* stw */
	  case 0x006:
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pr3r("stw", op1, op2, op3);
		break;
	  /* xor */
	  case 0x016:
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pr3r("xor", op1, op2, op3);
		break;
	  /* ldawbi */
	  case 0x146:   
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pr2rus("ldawbi", op1, op2, op3);
		break;	
	  /* ldawfi */
	  case 0x136:   
		op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		pr2rus("ldawfi", op1, op2, op3);
		break;	
	  /* ashri */     
	  case 0x126:  
		switch (i & 3)
		{ /* ashri */
		  case 0:
			op1 = (ops >> 12) & 15; op2 = (ops >> 8) & 15; op3 = (ops >> 4) & 15;
		    pr2rus("ashri", op1, op2, op3);
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
		pru10("blacp", opd);
		break;
	  /* blat */
	  case 0x1cd:
		opd = (opd << 6) | (i & 63);
		pru6("blat", opd);
		break;
	  /* blrb */
	  case 0x350: case 0x351: case 0x352: case 0x353:
	  case 0x354: case 0x355: case 0x356: case 0x357:
	  case 0x358: case 0x359: case 0x35a: case 0x35b:
	  case 0x35c: case 0x35d: case 0x35e: case 0x35f:
		opd = (opd << 10) | (i & 1023);
		pru10("blrb", opd);
		prtgt(npc - (opd << 1));
		break;
	  /* blrf */
	  case 0x340: case 0x341: case 0x342: case 0x343:
	  case 0x344: case 0x345: case 0x346: case 0x347:
	  case 0x348: case 0x349: case 0x34a: case 0x34b:
	  case 0x34c: case 0x34d: case 0x34e: case 0x34f:
		opd = (opd << 10) | (i & 1023);
		pru10("blrb", opd);
		prtgt(npc + (opd << 1));
		break;
	  /* brbf */
	  case 0x1f0: case 0x1f1: case 0x1f2: case 0x1f3:
	  case 0x1f4: case 0x1f5: case 0x1f6: case 0x1f7:
	  case 0x1f8: case 0x1f9: case 0x1fa: case 0x1fb:
		opd = (opd << 6) | (i & 63);
		prru6("brbf", ((i >> 6) & 15), opd);		
		prtgt(npc - (opd << 1));
		break; 					   
	  /* brbt */
	  case 0x1d0: case 0x1d1: case 0x1d2: case 0x1d3:
	  case 0x1d4: case 0x1d5: case 0x1d6: case 0x1d7:
	  case 0x1d8: case 0x1d9: case 0x1da: case 0x1db:
		opd = (opd << 6) | (i & 63);
		prru6("brbt", ((i >> 6) & 15), opd);		
		prtgt(npc - (opd << 1));
		break; 					   
	  /* brbu */
      case 0x1dc:
		opd = (opd << 6) | (i & 63);	
		pru6("brbu", opd); 
		prtgt(npc - (opd << 1));
		break; 
	  /* brff */
	  case 0x1e0: case 0x1e1: case 0x1e2: case 0x1e3:
	  case 0x1e4: case 0x1e5: case 0x1e6: case 0x1e7:
	  case 0x1e8: case 0x1e9: case 0x1ea: case 0x1eb:
		opd = (opd << 6) | (i & 63);
		prru6("brff", ((i >> 6) & 15), opd);		
		prtgt(npc + (opd << 1));
		break; 								
	  /* brft */
	  case 0x1c0: case 0x1c1: case 0x1c2: case 0x1c3:
	  case 0x1c4: case 0x1c5: case 0x1c6: case 0x1c7:
	  case 0x1c8: case 0x1c9: case 0x1ca: case 0x1cb:
		opd = (opd << 6) | (i & 63);
		prru6("brft", ((i >> 6) & 15), opd);		
		prtgt(npc + (opd << 1));
		break; 										 
	  /* brfu */
	  case 0x1cc:
		opd = (opd << 6) | (i & 63);	
		pru6("brbu", opd); 
		prtgt(npc + (opd << 1));
		break; 
	  /* clrsr */
	  case 0x1ec:
		opd = (opd << 6) | (i & 63);
		pru6("clrsr", opd);
		break;
	  /* entsp */
	  case 0x1dd:
		opd = (opd << 6) | (i & 63);		 
		pru6("entsp", opd);	  
		break;										  
	  /* extdp */
	  case 0x1ce:
	    opd = (opd << 6) | (i & 63);
		pru6("extdp", opd);	
		break;  
	  /* extsp */
	  case 0x1de:
		opd = (opd << 6) | (i & 63);
		pru6("extsp", opd);	
		break;							  
	  /* getsr */
	  case 0x1fc:
		opd = (opd << 6) | (i & 63);		  
		pru6("extsp", opd);
		break;
	  /* kcalli */
	  case 0x1cf:		  
		opd = (opd << 6) | (i & 63);
		pru6("kcalli", opd);
		break;
	  /* kentsp */
	  case 0x1ee:
		opd = (opd << 6) | (i & 63); 
		pru6("kentsp", opd);
		break;	 
	  /* krestsp */ 
	  case 0x1ef:
		opd = (opd << 6) | (i & 63);
		pru6("krestsp", opd);
		break;
	  /* ldapb */
	  case 0x370: case 0x371: case 0x372: case 0x373:
	  case 0x374: case 0x375: case 0x376: case 0x377:
	  case 0x378: case 0x379: case 0x37a: case 0x37b:
	  case 0x37c: case 0x37d: case 0x37e: case 0x37f:
	    opd = (opd << 10) | (i & 1023);
		pru10("ldapb", opd);
		prtgt(npc - (opd << 1));
		break;									  
	  /* ldapf */
	  case 0x360: case 0x361: case 0x362: case 0x363:
	  case 0x364: case 0x365: case 0x366: case 0x367:
	  case 0x368: case 0x369: case 0x36a: case 0x36b:
	  case 0x36c: case 0x36d: case 0x36e: case 0x36f:
		opd = (opd << 10) | (i & 1023);
		pru10("ldapf", opd);
		prtgt(npc + (opd << 1));
		break;											  
	  /* ldawcp */
	  case 0x1fd: 
		opd = (opd << 6) | (i & 63);
		pru6("ldawcp", opd);
		break;									  
	  /* ldawdp */
	  case 0x180: case 0x181: case 0x182: case 0x183:
	  case 0x184: case 0x185: case 0x186: case 0x187:
	  case 0x188: case 0x189: case 0x18a: case 0x18b:
		opd = (opd << 6) | (i & 63);
		prru6("ldawdp", (i >> 6) & 15, i & 63);
		break;											  
	  /* ldawsp */
	  case 0x190: case 0x191: case 0x192: case 0x193:
	  case 0x194: case 0x195: case 0x196: case 0x197:
	  case 0x198: case 0x199: case 0x19a: case 0x19b:
		opd = (opd << 6) | (i & 63);
		prru6("ldawsp", (i >> 6) & 15, opd);
		break;									  
	  /* ldc */
	  case 0x1a0: case 0x1a1: case 0x1a2: case 0x1a3:
	  case 0x1a4: case 0x1a5: case 0x1a6: case 0x1a7:
	  case 0x1a8: case 0x1a9: case 0x1aa: case 0x1ab:
		opd = (opd << 6) | (i & 63);
		prru6("ldc", (i >> 6) & 15, opd);
		break;											  
	  /* ldwcpl */
	  case 0x390: case 0x391: case 0x392: case 0x393:
	  case 0x394: case 0x395: case 0x396: case 0x397:
	  case 0x398: case 0x399: case 0x39a: case 0x39b:
	  case 0x39c: case 0x39d: case 0x39e: case 0x39f:
	    opd = (opd << 10) | (i & 1023);
		pru10("ldwcp", opd);
		break;										  
	  /* ldwcp */
	  case 0x1b0: case 0x1b1: case 0x1b2: case 0x1b3:
	  case 0x1b4: case 0x1b5: case 0x1b6: case 0x1b7:
	  case 0x1b8: case 0x1b9: case 0x1ba: case 0x1bb:
	    opd = (opd << 6) | (i & 63);
		prru6("ldwcp", (i >> 6) & 15, opd);
        break;
	  /* ldwdp */
	  case 0x160: case 0x161: case 0x162: case 0x163:
	  case 0x164: case 0x165: case 0x166: case 0x167:
	  case 0x168: case 0x169: case 0x16a: case 0x16b:
		opd = (opd << 6) | (i & 63);
		prru6("ldwdp", (i >> 6) & 15, opd);
		break;
	  /* ldwsp */
	  case 0x170: case 0x171: case 0x172: case 0x173:
	  case 0x174: case 0x175: case 0x176: case 0x177:
	  case 0x178: case 0x179: case 0x17a: case 0x17b:
		opd = (opd << 6) | (i & 63);
		prru6("ldwsp", (i >> 6) & 15, opd);
		break;
	  /* retsp */
	  case 0x1df:
		opd = (opd << 6) | (i & 63);
		pru6("retsp", opd);
	    break;										  
	  /* setci */
	  case 0x3a0: case 0x3a1: case 0x3a2: case 0x3a3:
	  case 0x3a4: case 0x3a5: case 0x3a6: case 0x3a7:
	  case 0x3a8: case 0x3a9: case 0x3aa: case 0x3ab: 
	  /* setsr */
	  case 0x1ed:
		opd = (opd << 6) | (i & 63);
		pru6("setsr", opd);
		break;
	  /* stwdp */
	  case 0x140: case 0x141: case 0x142: case 0x143:
	  case 0x144: case 0x145: case 0x146: case 0x147:
	  case 0x148: case 0x149: case 0x14a: case 0x14b:
		opd = (opd << 6) | (i & 63);
		prru6("stwdp", (i >> 6) & 15, opd);
		break;	
	  /* stwsp */
	  case 0x150: case 0x151: case 0x152: case 0x153:
	  case 0x154: case 0x155: case 0x156: case 0x157:
	  case 0x158: case 0x159: case 0x15a: case 0x15b:
		opd = (opd << 6) | (i & 63);
		prru6("stwsp", (i >> 6) & 15, opd);
		break;	
    };
	break;	
  };			  
  iaddr = npc;

};
	
};

load()
{ int lowlength;
  int n;
  codefile = fopen("a.bin", "rb");
  lowlength = inbin();	
  length = ((inbin() << 16) | lowlength) << 1;
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
}


priaddr(a)
{ printf("\n%6d:  ", a);
}	

prtgt(tgt)
{ printf("  :%6d", tgt);
}
	
pr3r(char opc[], int o1, int o2, int o3)
{ printf("%-8s", opc);
  proreg(o1); proreg(o2); proreg(o3);
};

pr2rus(char opc[], int o1, int o2, int o3)
{ printf("%-8s", opc);
  proreg(o1); proreg(o2); printf("%4d", o3);
};

pr2r(char opc[], int o1, int o2)
{ printf("%-8s", opc);
  proreg(o1); printf("    "); proreg(o2); 
};

prrus(char opc[], int o1, int o2, int o3)
{ printf("%-8s", opc);
  proreg(o1); printf("    "); printf("%4d", o2); 
};

pr1r(char opc[], int o1)
{ printf("%-8s", opc);
  printf("        "); proreg(o1);  
};

pr0r(char opc[])
{ printf("%-8s", opc);
  printf("            "); 
};

prru6(char opc[], int o1, int o2)
{ printf("%-8s", opc);
  proreg(o1); printf("%8d", o2);
};	

pru6(char opc[], int o1)
{ printf("%-8s", opc);
  printf("    %8d", o1);
};	

pru10(char opc[], int o1)
{ printf("%-8s", opc);
  printf("    %8d", o1);
};	

proreg(r)
{ switch (r)
  { case 0: case 1: case 2: case 3:
	case 4: case 5: case 6: case 7:
	case 8: case 9:
	  printf("  r%d", r);
	  break;
	case 10: case 11:
	  printf(" r%d", r);
	  break;	  	  
	case sp:      
	  printf("  sp");
	  break;
	case dp:     
	  printf("  dp");
	  break;
	case cp:   
	  printf("  cp");
	  break;
	case lr:
	  printf("  lr");
	  break;
    case pc:      
	  printf("  pc");
	  break;
	case sr:     
	  printf("  sr");
	  break;
	case spc:   
	  printf(" spc");
	  break;
	case ssr:
	  printf(" ssr");
	  break;
	case et:      
	  printf("  et");
	  break;
	case ed:     
	  printf("  ed");
	  break;
	case sed:   
	  printf(" sed");
	  break;
	case kep:
	  printf(" kep");
	  break;
	case ksp:
	  printf(" ksp");
	  break;
  };
};
	
	

