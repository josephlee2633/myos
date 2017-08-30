    SECTION    .text:CODE(2)
    THUMB
    REQUIRE8
    PRESERVE8

    ;PUBLIC MY_SVC_Handler
    IMPORT cur_task_tcb
    IMPORT change_task
    EXPORT MY_Pend_SVC_Handler
    EXPORT MY_SVC_Handler

MY_Pend_SVC_Handler:
    mrs r0, psp //after auto push R0-R3, R12, PC, LR, ...8registers
    isb
    ldr	r3, =cur_task_tcb			/* Get the location of the current TCB. */
    ldr	r2, [r3]
    teq r0, #0                  //if psp == 0, means now it the first time
    beq choose_new_task
    stmdb r0!, {r4-r11}
    str r0, [r2] 

choose_new_task:
    stmdb sp!, {r14}
    bl change_task
    ldmia sp!, {r14}
    ldr	r3, =cur_task_tcb
    ldr	r2, [r3]
    ldr r1, [r2]        ;now we got the dest task_sp addr 

    ldmia r1!, {r4-r11} ;recovery r4~r11, Do not use POP, because it will ctrl MSP, not PSP
    msr psp, r1         ;recovery task_sp (include we pushed r4~r11)
    isb
    orr r14, r14, #13
    bx r14
    
    
    
    
    
    
    
    
MY_SVC_Handler:
    tst lr, #0x4  ;����EXC_RETURN�ı���2
    ite eq    ;���Ϊ0
    mrseq r0, msp   ;��ʹ�õ�������ջ���ʰ�MSP��ֵȡ��
    mrsne r0, psp   ;����ʹ�õ��ǽ��̶�ջ���ʰ�PSP��ֵȡ��
    ldr r1, [r0,#24] ;��ջ�ж�ȡPCֵ
    ldrb r0, [r1,#-2] ;��SVCָ���ж�ȡ�������ŵ�R0   

    ldr	r3, =cur_task_tcb
    ldr	r2, [r3]
    ldr r1, [r2]        ;now we got the task_sp addr
    bx r14
    END
    
