#ifndef XS1_DEFS_H
#define XS1_DEFS_H

// Labels
#define LABEL_EXEP_HANDLER       "exepHandler"
#define LABEL_MAIN               "_main"
#define LABEL_BEGIN_BSS          "_fdp.bss"
#define LABEL_END_BSS            "_edp.bss"
#define LABEL_START              "_start"

// Hardware parameters
#define BYTES_PER_WORD           4
#define MAX_THREADS              20 
#define MAX_CHANNELS             32

// Architectural constants
#define SWITCH_SCRATCH_REG       3
                                
// Runtime specs 
#define MAX_PROCS                56 
#define KERNEL_SPACE             0x200
#define THREAD_STACK_SPACE       0x800

// Runtime exception types
#define et_INSUFFICIENT_THREADS  0
#define et_INSUFFICIENT_CHANNELS 1
#define et_INSUFFICIENT_SYNCS    2
#define et_INSUFFICIENT_MEMORY   3
#define et_INSUFFICIENT_TIMERS   4

// Emulated memory
#define CT_END                   1
#define CT_READ                  3
#define CT_WRITE                 4

#define TREE_SIZE                70000
#define LABVAL_SIZE              4000
#define CODEBUFFER_SIZE          20000
#define TOTAL_STORAGE            (TREE_SIZE+LABVAL_SIZE+CODEBUFFER_SIZE)
#define LEAF_OFFSET              1
#define NUM_LEAVES               (NUM_CORES-LEAF_OFFSET)
#define LEAF_STORAGE             ((TOTAL_STORAGE/NUM_LEAVES)+1) // Round up incase of decimals

#endif

