    SECTION    .text:CODE(2)
    THUMB
    REQUIRE8
    PRESERVE8
    
    ;PUBLIC MY_SVC_Handler
    IMPORT cur_task1_tcb
    EXPORT MY_SVC_Handler

MY_SVC_Handler:
    ldr	r3, =cur_task1_tcb
    ldr	r2, [r3]
    ldr r1, [r2]
    msr msp, r1
    isb
    bx r14
    END
    
