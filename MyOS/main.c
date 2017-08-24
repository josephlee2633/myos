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
    __asm("svc 2");
}
typedef struct
{
    stack_st *cur_sp;
    stack_st task_sp[256];
}tcb;
tcb *cur_task_tcb;
tcb task0_tcb,task1_tcb, task2_tcb;


void task1();
void task2();
int init_task_stack(tcb *ptask_tcb,unsigned int stack_size,taskfunc taskfun);

void task1()
{
    int i=0;
    while(1){
        i++;
        if(!(i%5)){
            trigger_svc();            
        }
    }
}
void task2()
{
    int i=0;
    while(1){
        i++;
        if(!(i%5)){
            trigger_svc();
        }
    }
}
void change_task()
{
    if(cur_task_tcb==&task1_tcb){
        cur_task_tcb=&task2_tcb;    
    }else{
        cur_task_tcb=&task1_tcb;
    }
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
    *ptask_tcb->cur_sp=portINITIAL_XPSR; //Fake Push PSR
    ptask_tcb->cur_sp--;
    *ptask_tcb->cur_sp=(unsigned int)taskfun; //Fake Push PC
    ptask_tcb->cur_sp--;
    *ptask_tcb->cur_sp=(unsigned int)task_exit; //Fake Push LR
    ptask_tcb->cur_sp--;
    ptask_tcb->cur_sp-=4; //Fake Push R12,R3,R2,R1,R0 into
#if 1
    *ptask_tcb->cur_sp=0xFFFFFFFb; //Test for R11
    ptask_tcb->cur_sp--; //Fake Push R4~R11
    *ptask_tcb->cur_sp=0xFFFFFFFa; //Test for R10
    ptask_tcb->cur_sp--; //Fake Push R4~R11
    ptask_tcb->cur_sp--; //Fake Push R4~R11
    ptask_tcb->cur_sp--; //Fake Push R4~R11
    ptask_tcb->cur_sp--; //Fake Push R4~R11
    ptask_tcb->cur_sp--; //Fake Push R4~R11
    ptask_tcb->cur_sp--; //Fake Push R4~R11
    *ptask_tcb->cur_sp=0xFFFFFFF5; //Test for R5
    ptask_tcb->cur_sp--; //Fake Push R4~R11
    *ptask_tcb->cur_sp=0xFFFFFFF4; //Test for R4 
#else
    ptask_tcb->cur_sp-=8; //Fake Push R4~R11
#endif
    return 0;
}
int main(void)
{
    int ret=0;

    ret=init_task_stack(&task0_tcb,sizeof(task0_tcb.task_sp),task1);
    if(ret<0){
        return -1;
    }
    ret=init_task_stack(&task1_tcb,sizeof(task1_tcb.task_sp),task1);
    if(ret<0){
        return -1;
    }
    ret=init_task_stack(&task2_tcb,sizeof(task2_tcb.task_sp),task2);  
    if(ret<0){
        return -1;
    }
    cur_task_tcb=&task1_tcb;
    trigger_svc();
    return ret;
}

/******************************* END OF FILE **********************************/