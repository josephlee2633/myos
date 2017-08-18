/**
  ******************************************************************************
  * @brief   The main function file
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
//#include "gd32f20x.h"

/* Private variables ---------------------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
void task1()
{
    int i=0;
    while(1){
        i++;
    }
}
void trigger_svc()
{
    __asm("svc 0");
}
typedef struct
{
    unsigned int *cur_sp;
    unsigned int task_sp[0xFF];
}tcb;

tcb task1_tcb;
tcb *cur_task1_tcb;
/* Main program */
#define portINITIAL_XPSR                ( 0x01000000 )
int main(void)
{
    int ret=0,i;
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
    cur_task1_tcb=&task1_tcb;
    trigger_svc();
    return ret;
}

/******************************* END OF FILE **********************************/