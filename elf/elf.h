#define EI_NIDENT     16
#define EI_MAG0       0
#define EI_MAG1       1
#define EI_MAG2       2
#define EI_MAG3       3
#define EI_CLASS      4
#define EI_DATA       5
#define EI_VERSION    6
#define EI_PAD        7
#define ET_EXEC       2
#define EM_XCORE      0xB49E
#define EV_CURRENT    1
#define SHN_UNDEF     0
#define ELFCLASS32    1
#define ELFDATA2LSB   1 
#define ELFDATA2MSB   2
#define PT_LOAD       1
#define PF_X          0x1
#define SHT_NULL      0
#define SHT_PROGBITS  1
#define SHT_STRTAB    3
#define SHF_WRITE     0x1
#define SHF_ALLOC     0x2
#define SHF_EXECINSTR 0x4

typedef unsigned int   Elf32_Addr;
typedef unsigned short Elf32_Half;
typedef unsigned int   Elf32_Off;
typedef int            Elf32_Sword;
typedef unsigned int   Elf32_Word;

// Elf header
typedef struct {
    unsigned char e_ident[EI_NIDENT];
    Elf32_Half    e_type;
    Elf32_Half    e_machine;
    Elf32_Word    e_version;
    Elf32_Addr    e_entry;
    Elf32_Off     e_phoff;
    Elf32_Off     e_shoff;
    Elf32_Word    e_flags;
    Elf32_Half    e_ehsize;
    Elf32_Half    e_phentsize;
    Elf32_Half    e_phnum;
    Elf32_Half    e_shentsize;
    Elf32_Half    e_shnum;
    Elf32_Half    e_shstrndx;
} Elf32_Ehdr;

// Program header
typedef struct {
    Elf32_Word    p_type;
    Elf32_Off     p_offset;
    Elf32_Addr    p_vaddr;
    Elf32_Addr    p_paddr;
    Elf32_Word    p_filesz;
    Elf32_Word    p_memsz;
    Elf32_Word    p_flags;
    Elf32_Word    p_align;
} Elf32_Phdr;

// Section header
typedef struct {
    Elf32_Word    sh_name;
    Elf32_Word    sh_type;
    Elf32_Word    sh_flags;
    Elf32_Addr    sh_addr;
    Elf32_Off     sh_offset;
    Elf32_Word    sh_size;
    Elf32_Word    sh_link;
    Elf32_Word    sh_info;
    Elf32_Word    sh_addralign;
    Elf32_Word    sh_entsize;
} Elf32_Shdr;

// Symbol table entry
typedef struct {
    Elf32_Word    st_name;
    Elf32_Addr    st_value;
    Elf32_Word    st_size;
    unsigned char st_info;
    unsigned char st_other;
    Elf32_Half    st_shndx;
} Elf32_Sym;

void createElfHeader(Elf32_Ehdr *p,
    Elf32_Half,
    Elf32_Half,
    Elf32_Word,
    Elf32_Addr,
    Elf32_Off,
    Elf32_Off,
    Elf32_Word,
    Elf32_Half,
    Elf32_Half,
    Elf32_Half,
    Elf32_Half,
    Elf32_Half,
    Elf32_Half);

void createPrgHeader(Elf32_Phdr *,
    Elf32_Word,
    Elf32_Off, 
    Elf32_Addr,
    Elf32_Addr,
    Elf32_Word,
    Elf32_Word,
    Elf32_Word,
    Elf32_Word);

void createSecHeader(Elf32_Shdr *, 
    Elf32_Word, 
    Elf32_Word,
    Elf32_Word,
    Elf32_Addr,
    Elf32_Off,  
    Elf32_Word, 
    Elf32_Word, 
    Elf32_Word, 
    Elf32_Word,
    Elf32_Word);

void createElfSym(Elf32_Sym *,
    Elf32_Word,
    Elf32_Addr,
    Elf32_Word,
    unsigned char,
    unsigned char,
    Elf32_Half);

