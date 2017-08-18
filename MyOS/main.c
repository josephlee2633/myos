/**
  ******************************************************************************
  * @brief   The main function file
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
//#include "gd32f20x.h"

/* Private variables ---------------------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
typedef void (*taskfunc)( void );
typedef unsigned int stack_st;

void trigger_svc()
{
    __asm("svc 0");
}
typedef struct
{
    stack_st *cur_sp;
    stack_st task_sp[256];
}tcb;

tcb task1_tcb, task2_tcb;
tcb *cur_task_tcb;

void task1();
void task2();
int init_task_stack(tcb *ptask_tcb,unsigned int stack_size,taskfunc taskfun);

void task1()
{
    int i=0;
    while(i<3){
        i++;
    }
    i=0;
    init_task_stack(&task2_tcb,sizeof(task2_tcb.task_sp),task2); 
    cur_task_tcb=&task2_tcb;
    trigger_svc();
}
void task2()
{
    int i=0;
    while(i<3){
        i++;
    }
    i=0;
    init_task_stack(&task1_tcb,sizeof(task1_tcb.task_sp),task1);
    cur_task_tcb=&task1_tcb;
    trigger_svc();    
}
void task_exit()
{

}

/* Main program */
#define portINITIAL_XPSR                ( 0x01000000 )

int init_task_stack(tcb *ptask_tcb,unsigned int stack_size,taskfunc taskfun)
{
    int i;
    stack_st *task_sp_tmp=ptask_tcb->task_sp;
    for(i=0;i<stack_size/sizeof(stack_st);i++){
        *task_sp_tmp++=0;
    }
    ptask_tcb->cur_sp=task_sp_tmp-1;
    *ptask_tcb->cur_sp=portINITIAL_XPSR;
    ptask_tcb->cur_sp--;
    *ptask_tcb->cur_sp=(unsigned int)taskfun;
    ptask_tcb->cur_sp--;
    *ptask_tcb->cur_sp=(unsigned int)task_exit;
    ptask_tcb->cur_sp--;
#ifdef DEBUG_STACK
    *ptask_tcb->cur_sp=12;
    ptask_tcb->cur_sp--;
    *ptask_tcb->cur_sp=3;
    ptask_tcb->cur_sp--;
    *ptask_tcb->cur_sp=2;
    ptask_tcb->cur_sp--;
    *ptask_tcb->cur_sp=1;
    ptask_tcb->cur_sp--;
    *ptask_tcb->cur_sp=0xFFFFFFF0;
#else
    ptask_tcb->cur_sp-=4;
#endif
    return 0;
}
int main(void)
{
    int ret=0;
    ret=init_task_stack(&task1_tcb,sizeof(task1_tcb.task_sp),task1);
    ret=init_task_stack(&task2_tcb,sizeof(task2_tcb.task_sp),task2);  
#if 0
    int i;
    //rr_basic_init();
    for(i=0;i<sizeof(task1_tcb.task_sp)/sizeof(task1_tcb.task_sp[0]);i++){
        task1_tcb.task_sp[i]=0;
    }
    task1_tcb.cur_sp=task1_tcb.task_sp+sizeof(task1_tcb.task_sp)/sizeof(task1_tcb.task_sp[0])-sizeof(task1_tcb.task_sp[0]);
    *task1_tcb.cur_sp=portINITIAL_XPSR;
    task1_tcb.cur_sp--;
    *task1_tcb.cur_sp=(unsigned int)task1;
    task1_tcb.cur_sp--;
    *task1_tcb.cur_sp=0;
    task1_tcb.cur_sp-=5;
#endif
    cur_task_tcb=&task1_tcb;
    trigger_svc();
    return ret;
}

/******************************* END OF FILE **********************************/