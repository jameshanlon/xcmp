#include "elf.h"
//#include "../common/util.h"

// Construct an ELF header
void createElfHeader(Elf32_Ehdr *p,
        Elf32_Half    e_type,
        Elf32_Half    e_machine,
        Elf32_Word    e_version,
        Elf32_Addr    e_entry,
        Elf32_Off     e_phoff,
        Elf32_Off     e_shoff,
        Elf32_Word    e_flags,
        Elf32_Half    e_ehsize,
        Elf32_Half    e_phentsize,
        Elf32_Half    e_phnum,
        Elf32_Half    e_shentsize,
        Elf32_Half    e_shnum,
        Elf32_Half    e_shstrndx) {

    p->e_ident[EI_MAG0]    = 0x7f;
    p->e_ident[EI_MAG1]    = 'E';
    p->e_ident[EI_MAG2]    = 'L';
    p->e_ident[EI_MAG3]    = 'F';
    p->e_ident[EI_CLASS]   = ELFCLASS32;
    p->e_ident[EI_DATA]    = ELFDATA2LSB;
    p->e_ident[EI_VERSION] = EV_CURRENT;
    p->e_ident[EI_PAD]     = 0;
    p->e_type              = e_type;
    p->e_machine           = e_machine;
    p->e_version           = e_version;
    p->e_entry             = e_entry;
    // prog hdr offset (bytes)
    p->e_phoff             = e_phoff; 
    // sec hdr offset (bytes)
    p->e_shoff             = e_shoff; 
    p->e_flags             = e_flags;
    p->e_ehsize            = e_ehsize;
    p->e_phentsize         = e_phentsize;
    p->e_phnum             = e_phnum;
    p->e_shentsize         = e_shentsize;
    p->e_shnum             = e_shnum;
    // Index of section header strings 
    p->e_shstrndx          = e_shstrndx;
}

// Construct an ELF program header
void createPrgHeader(Elf32_Phdr *p,
        Elf32_Word    p_type,
        Elf32_Off     p_offset,
        Elf32_Addr    p_vaddr,
        Elf32_Addr    p_paddr,
        Elf32_Word    p_filesz,
        Elf32_Word    p_memsz,
        Elf32_Word    p_flags,
        Elf32_Word    p_align) {

    //Elf32_Phdr *p = chkalloc(sizeof(Elf32_Phdr));
    p->p_type       = p_type;
    // Offset of corresponding segment
    p->p_offset     = p_offset; 
    p->p_vaddr      = p_vaddr;
    p->p_paddr      = p_paddr;
    p->p_filesz     = p_filesz; // size of file image of segment
    p->p_memsz      = p_memsz; // size of mem image of segment
    p->p_flags      = p_flags;
    p->p_align      = p_align;
    //return p;
}

// Construct an ELF section header
void createSecHeader(Elf32_Shdr *p,
        Elf32_Word    sh_name,
        Elf32_Word    sh_type,
        Elf32_Word    sh_flags,
        Elf32_Addr    sh_addr,
        Elf32_Off     sh_offset,
        Elf32_Word    sh_size,
        Elf32_Word    sh_link,
        Elf32_Word    sh_info,
        Elf32_Word    sh_addralign,
        Elf32_Word    sh_entsize) {
    
    //Elf32_Shdr *p   = chkalloc(sizeof(Elf32_Shdr));
    p->sh_name      = sh_name;
    p->sh_type      = sh_type; 
    p->sh_flags     = sh_flags;
    p->sh_addr      = sh_addr;
    p->sh_offset    = sh_offset;
    p->sh_size      = sh_size;
    p->sh_link      = sh_link;
    p->sh_info      = sh_info;
    p->sh_addralign = sh_addralign;
    p->sh_entsize   = sh_entsize;
    //return p;
}

// Construct a symbol table entry
void createElfSym(Elf32_Sym *p,
        Elf32_Word    st_name,
        Elf32_Addr    st_value,
        Elf32_Word    st_size,
        unsigned char st_info,
        unsigned char st_other,
        Elf32_Half    st_shndx) {
    p->st_name      = st_name;
    p->st_value     = st_value;
    p->st_size      = st_size;
    p->st_info      = st_info;
    p->st_other     = st_other;
    p->st_shndx     = st_shndx;

}
