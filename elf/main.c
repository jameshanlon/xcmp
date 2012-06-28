#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include "elf.h"

#define REG_GDEST   11
#define CRC_POLY    0xEDB88320
#define CRC_INIT    0xFFFFFFFF
#define CRC_DISABLE 0x0D15AB1E
#define RAM_SIZE    (1 << 16)
#define RAM_BASE    RAM_SIZE

// Elf data structures
#define PH_NUM 1
#define SH_NUM 3

Elf32_Ehdr eHdr;
Elf32_Phdr pHdr[PH_NUM];
Elf32_Shdr sHdr[SH_NUM];

const char strTab[] = {
    /* offset 0  */ '\0', // The NULL section
    /* offset 1  */ '.','t','e','x','t','\0',
    /* offset 7  */ '.', 's', 't', 'r', 't', 'a', 'b', '\0',
    /* padding */   0
};

// Generate the Elf headers
void genProgramHdr(int binSize, FILE *out) {

    // Elf header
    createElfHeader(&eHdr,
        ET_EXEC,
        EM_XCORE,
        EV_CURRENT,
        RAM_BASE + 4,
        sizeof(Elf32_Ehdr),
        sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr),
        /*EF_machine_flag*/ 0,
        sizeof(Elf32_Ehdr),
        sizeof(Elf32_Phdr),
        PH_NUM,
        sizeof(Elf32_Shdr),
        SH_NUM,
        2);
    fwrite(&eHdr, sizeof(Elf32_Ehdr), 1, out);

    // Program header
    createPrgHeader(&pHdr[0],
        PT_LOAD,
        eHdr.e_shoff + (eHdr.e_shentsize * SH_NUM),
        RAM_BASE,
        RAM_BASE,
        binSize,
        binSize,
        PF_X,
        0x4);
    fwrite(pHdr, sizeof(Elf32_Phdr), PH_NUM, out);
}

// Generate program sections header table
void genSectionHdr(int binSize, FILE *out) {
    
    // Index 0 undefined section
    createSecHeader(&sHdr[0],
        0, SHT_NULL, 0, 0, 0, 0, SHN_UNDEF, 0, 0, 0);
   
    // .text program instruction section
    createSecHeader(&sHdr[1],
        1, 
        SHT_PROGBITS, 
        SHF_ALLOC + SHF_EXECINSTR, 
        RAM_BASE, 
        eHdr.e_shoff + (eHdr.e_shentsize * SH_NUM), 
        binSize, 
        0, 
        0, 
        4, 
        0);
    
    // String table section
    createSecHeader(&sHdr[2],
        7, 
        SHT_STRTAB, 
        0, 
        0,
        eHdr.e_shoff + (eHdr.e_shentsize * SH_NUM) + binSize, 
        sizeof(strTab), 
        0, 
        0, 
        1, 
        0);
   
    // Write them 
    fwrite(sHdr, sizeof(Elf32_Shdr), SH_NUM, out);
}

// Generate the symbol table
//void genSymbols(FILE *out) {
//}

// Generate the string table
void genStrings(FILE *out) {
    fwrite(&strTab, sizeof(strTab), 1, out);
}

// Program size
void genBinSize(int progSize, FILE *out) {
    int size = progSize >> 1;
    fwrite(&size, sizeof(int), 1, out);
}

// CRC checksum
void genCRC(FILE *out) {
    int crc = CRC_DISABLE;
    fwrite(&crc, sizeof(int), 1, out);
}

// Main function: read command line arguments, and then invoke both assembler
// passes of the source file, the second emitting the binary file
// 
// -------------------------------------
// |  Elf header             (eHdr)    |
// -------------------------------------
// |  Program header table   (pHdr)    |
// -------------------------------------
// |  Section header table   (sHdr)    |
// -------------------------------------
// |  Program binary (segment)         |
// |    size (bytes / 2)               |
// |    instructions                   |
// |    crc                            |
// -------------------------------------
// |  String table           (stdTab)  |
// -------------------------------------
int main(int argc, char** argv) {

    char *outFile = "a.elf";
    char *buffer;
    int fileLen, n;
    FILE *in, *out;
    
    in = fopen(argv[1], "rb");
    if (!in) {
      fprintf(stderr, "Error opeining input file %s\n", argv[1]);
      return 1;
    }
   
    // Get file length
    fseek(in, 0, SEEK_END);
    fileLen = ftell(in);
    fseek(in, 0, SEEK_SET);

    //Allocate memory
    buffer=(char *) malloc(fileLen+1);
    if (!buffer) {
      fprintf(stderr, "Memory error!");
      fclose(in);
      return 1;
    }
    n = fread(buffer, fileLen, 1, in);
    fclose(in);
    printf("Read file %s, %d bytes\n", argv[1], fileLen);

    //// Add size and crc values to binSize and adjust to bytes
    int binSize = fileLen;
    ////binSize += 4; 
    //binSize *= 2;
    //
    //// And adjust progSize to multiple of 4 bytes
    //int progSize = binSize;
    //if((progSize & 1) != 0)
    //    progSize++;

    out = fopen(outFile, "wb");
    if (!in) {
      fprintf(stderr, "Error opeining output file %s\n", argv[1]);
      return 1;
    }

    //// Generate headers
    genProgramHdr(binSize, out);
    genSectionHdr(binSize, out);
    //genBinSize(progSize, out);

    // Dump program
    fwrite(buffer, fileLen, 1, out); 
  
    // Generate footers
    //genCRC(out);
    genStrings(out);

    // Finish up
    fclose(out);
    printf("Wrote file %s\n", outFile);;
    return 0;
} 
