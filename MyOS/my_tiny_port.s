    SECTION    .text:CODE(2)
    THUMB
    REQUIRE8
    PRESERVE8
    
    ;PUBLIC MY_SVC_Handler
    IMPORT cur_task_tcb
    EXPORT MY_SVC_Handler

MY_SVC_Handler:
    ldr	r3, =cur_task_tcb
    ldr	r2, [r3]
    ldr r1, [r2]
    msr psp, r1
    isb
    orr r14, r14, #13
    bx r14
    END
    
