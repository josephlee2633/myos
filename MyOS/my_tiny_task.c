void trigger_task_schedule()
{
#define NVIC_PEND_SVC_INT_CTRL_REG		( * ( ( volatile unsigned int * ) 0xe000ed04 ) )
#define NVIC_PEND_SVC_SET_BIT		( 1UL << 28UL )
    NVIC_PEND_SVC_INT_CTRL_REG = NVIC_PEND_SVC_SET_BIT;
    __asm("dsb");												\
    __asm("isb");
}