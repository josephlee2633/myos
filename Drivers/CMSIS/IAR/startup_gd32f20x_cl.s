;/**
;  ******************************************************************************
;  * @brief   gd32f20x startup code.
;  ******************************************************************************
;  */


        MODULE  ?cstartup

        ;; Forward declaration of sections.
        SECTION CSTACK:DATA:NOROOT(3)

        SECTION .intvec:CODE:NOROOT(2)

        EXTERN  __iar_program_start
        EXTERN  SystemInit
        PUBLIC  __vector_table
        IMPORT  MY_SVC_Handler
        IMPORT  MY_Pend_SVC_Handler
        EXTERN  MY_UsageFault_Handler

        DATA
__vector_table
        DCD     sfe(CSTACK)
        DCD     Reset_Handler                     ; Reset Handler
                                                  
        DCD     NMI_Handler                       ; NMI Handler
        DCD     HardFault_Handler                 ; Hard Fault Handler
        DCD     MemManage_Handler                 ; MPU Fault Handler  
        DCD     BusFault_Handler                  ; Bus Fault Handler 
        DCD     UsageFault_Handler                ; Usage Fault Handler 
        DCD     0                                 ; Reserved
        DCD     0                                 ; Reserved
        DCD     0                                 ; Reserved
        DCD     0                                 ; Reserved
        DCD     MY_SVC_Handler                       ; SVCall Handler
        DCD     DebugMon_Handler                  ; Debug Monitor Handler
        DCD     0                                 ; Reserved
        DCD     MY_Pend_SVC_Handler                    ; PendSV Handler
        DCD     SysTick_Handler                   ; SysTick Handler
                                                  
        ; External Interrupts                     
        DCD     WWDG_IRQHandler                   ; Vector Number 16,Window Watchdog
        DCD     LVD_IRQHandler                    ; Vector Number 17,LVD through EXTI Line detect
        DCD     TAMPER_IRQHandler                 ; Vector Number 18,Tamper Interrupt   
        DCD     RTC_IRQHandler                    ; Vector Number 19,RTC through EXTI Line
        DCD     FMC_IRQHandler                    ; Vector Number 20,FMC
        DCD     RCC_IRQHandler                    ; Vector Number 21,RCC
        DCD     EXTI0_IRQHandler                  ; Vector Number 22,EXTI Line 0
        DCD     EXTI1_IRQHandler                  ; Vector Number 23,EXTI Line 1
        DCD     EXTI2_IRQHandler                  ; Vector Number 24,EXTI Line 2
        DCD     EXTI3_IRQHandler                  ; Vector Number 25,EXTI Line 3
        DCD     EXTI4_IRQHandler                  ; Vector Number 26,EXTI Line 4
        DCD     DMA1_Channel1_IRQHandler          ; Vector Number 27,DMA1 Channel 1
        DCD     DMA1_Channel2_IRQHandler          ; Vector Number 28,DMA1 Channel 2
        DCD     DMA1_Channel3_IRQHandler          ; Vector Number 29,DMA1 Channel 3
        DCD     DMA1_Channel4_IRQHandler          ; Vector Number 30,DMA1 Channel 4
        DCD     DMA1_Channel5_IRQHandler          ; Vector Number 31,DMA1 Channel 5
        DCD     DMA1_Channel6_IRQHandler          ; Vector Number 32,DMA1 Channel 6 
        DCD     DMA1_Channel7_IRQHandler          ; Vector Number 33,DMA1 Channel 7
        DCD     ADC1_2_IRQHandler                 ; Vector Number 34,ADC1 and ADC2
        DCD     CAN1_TX_IRQHandler                ; Vector Number 35,CAN1 TX
        DCD     CAN1_RX0_IRQHandler               ; Vector Number 36,CAN1 RX0
        DCD     CAN1_RX1_IRQHandler               ; Vector Number 37,CAN1 RX1
        DCD     CAN1_SCE_IRQHandler               ; Vector Number 38,CAN1 SCE
        DCD     EXTI9_5_IRQHandler                ; Vector Number 39,EXTI Line 9..5
        DCD     TIMER1_BRK_TIMER9_IRQHandler      ; Vector Number 40,TIMER1 Break and TIMER9 global
        DCD     TIMER1_UP_TIMER10_IRQHandler      ; Vector Number 41,TIMER1 Update and TIMER10 global
        DCD     TIMER1_TRG_COM_TIMER11_IRQHandler ; Vector Number 42,TIMER1 Break, Update, Trigger and Commutation and TIMER11 global
        DCD     TIMER1_CC_IRQHandler              ; Vector Number 43,TIMER1 Capture Compare
        DCD     TIMER2_IRQHandler                 ; Vector Number 44,TIMER2
        DCD     TIMER3_IRQHandler                 ; Vector Number 45,TIMER3
        DCD     TIMER4_IRQHandler                 ; Vector Number 46,TIMER4
        DCD     I2C1_EV_IRQHandler                ; Vector Number 47,I2C1 Event
        DCD     I2C1_ER_IRQHandler                ; Vector Number 48,I2C1 Error
        DCD     I2C2_EV_IRQHandler                ; Vector Number 49,I2C2 Event
        DCD     I2C2_ER_IRQHandler                ; Vector Number 50,I2C1 Error
        DCD     SPI1_IRQHandler                   ; Vector Number 51,SPI1
        DCD     SPI2_IRQHandler                   ; Vector Number 52,SPI2
        DCD     USART1_IRQHandler                 ; Vector Number 53,USART1
        DCD     USART2_IRQHandler                 ; Vector Number 54,USART2
        DCD     USART3_IRQHandler                 ; Vector Number 55,USART3
        DCD     EXTI15_10_IRQHandler              ; Vector Number 56,External Line[15:10]
        DCD     RTCAlarm_IRQHandler               ; Vector Number 57,RTC Alarm through EXTI Line
        DCD     OTG_FS_WKUP_IRQHandler            ; Vector Number 58,USB OTG FS WakeUp from suspend through EXTI Line
        DCD     TIMER8_BRK_TIMER12_IRQHandler     ; Vector Number 59,TIMER8 Break Interrupt and TIMER12 global
        DCD     TIMER8_UP_TIMER13_IRQHandler      ; Vector Number 60,TIMER8 Update Interrupt and TIMER13 global
        DCD     TIMER8_TRG_COM_TIMER14_IRQHandler ; Vector Number 61,TIMER8 Trigger and Commutation Interrupt and TIMER14
        DCD     TIMER8_CC_IRQHandler              ; Vector Number 62,TIMER8 Capture Compare 
        DCD     ADC3_IRQHandler                   ; Vector Number 63,ADC3
        DCD     EXMC_IRQHandler                   ; Vector Number 64,EXMC
        DCD     SDIO_IRQHandler                   ; Vector Number 65,SDIO
        DCD     TIMER5_IRQHandler                 ; Vector Number 66,TIMER5
        DCD     SPI3_IRQHandler                   ; Vector Number 67,SPI3
        DCD     UART4_IRQHandler                  ; Vector Number 68,UART4
        DCD     UART5_IRQHandler                  ; Vector Number 69,UART5
        DCD     TIMER6_IRQHandler                 ; Vector Number 70,TIMER6
        DCD     TIMER7_IRQHandler                 ; Vector Number 71,TIMER7
        DCD     DMA2_Channel1_IRQHandler          ; Vector Number 72,DMA2 Channel1
        DCD     DMA2_Channel2_IRQHandler          ; Vector Number 73,DMA2 Channel2
        DCD     DMA2_Channel3_IRQHandler          ; Vector Number 74,DMA2 Channel3
        DCD     DMA2_Channel4_IRQHandler          ; Vector Number 75,DMA2 Channel4
        DCD     DMA2_Channel5_IRQHandler          ; Vector Number 76,DMA2 Channel5
        DCD     ETH_IRQHandler                    ; Vector Number 77,Ethernet
        DCD     ETH_WKUP_IRQHandler               ; Vector Number 78,Ethernet Wakeup through EXTI line
        DCD     CAN2_TX_IRQHandler                ; Vector Number 79,CAN2 TX
        DCD     CAN2_RX0_IRQHandler               ; Vector Number 80,CAN2 RX0
        DCD     CAN2_RX1_IRQHandler               ; Vector Number 81,CAN2 RX1
        DCD     CAN2_SCE_IRQHandler               ; Vector Number 82,CAN2 SCE
        DCD     OTG_FS_IRQHandler                 ; Vector Number 83,USB OTG FS
        DCD     0                                 ; Vector Number 84,Reserved
        DCD     DMA2_Channel6_IRQHandler          ; Vector Number 85,DMA2 Channel6
        DCD     DMA2_Channel7_IRQHandler          ; Vector Number 86,DMA2 Channel7
        DCD     USART6_IRQHandler                 ; Vector Number 87,USART6
        DCD     I2C3_EV_IRQHandler                ; Vector Number 88,I2C3 Event
        DCD     I2C3_ER_IRQHandler                ; Vector Number 89,I2C3 Error
        DCD     0                                 ; Vector Number 90,Reserved
        DCD     0                                 ; Vector Number 91,Reserved
        DCD     0                                 ; Vector Number 92,Reserved
        DCD     0                                 ; Vector Number 93,Reserved
        DCD     DCI_IRQHandler                    ; Vector Number 94,DCI                                            
        DCD     CRYP_IRQHandler                   ; Vector Number 95,CRYP                                      
        DCD     HASH_RNG_IRQHandler               ; Vector Number 96,Hash and Rng
        DCD     0                                 ; Vector Number 97,Reserved
        DCD     UART7_IRQHandler                  ; Vector Number 98,UART7
        DCD     UART8_IRQHandler                  ; Vector Number 99,UART8
        DCD     0                                 ; Vector Number 100,Reserved
        DCD     0                                 ; Vector Number 101,Reserved
        DCD     0                                 ; Vector Number 102,Reserved
        DCD     0                                 ; Vector Number 103,Reserved
        DCD     TLDI_IRQHandler                   ; Vector Number 104,TLDI
        DCD     TLDI_ER_IRQHandler                ; Vector Number 105,TLDI error
        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Default interrupt handlers.
;;
        THUMB

        PUBWEAK Reset_Handler
        SECTION .text:CODE:NOROOT:REORDER(2)
Reset_Handler
        LDR     R0, = SystemInit
        BLX     R0
        LDR     R0, =__iar_program_start
        BX      R0
        
        PUBWEAK NMI_Handler
        SECTION .text:CODE:NOROOT:REORDER(1)
NMI_Handler
        B NMI_Handler

        PUBWEAK HardFault_Handler
        SECTION .text:CODE:NOROOT:REORDER(1)
HardFault_Handler
        B HardFault_Handler
              
        PUBWEAK MemManage_Handler
        SECTION .text:CODE:NOROOT:REORDER(1)
MemManage_Handler
        B MemManage_Handler

        PUBWEAK BusFault_Handler
        SECTION .text:CODE:NOROOT:REORDER(1)
BusFault_Handler
        B BusFault_Handler

        PUBWEAK UsageFault_Handler
        SECTION .text:CODE:NOROOT:REORDER(1)
UsageFault_Handler
        B UsageFault_Handler
        
        PUBWEAK SVC_Handler
        SECTION .text:CODE:NOROOT:REORDER(1)
SVC_Handler
        B SVC_Handler
       
         PUBWEAK DebugMon_Handler
        SECTION .text:CODE:NOROOT:REORDER(1)
DebugMon_Handler
        B DebugMon_Handler
                
        PUBWEAK PendSV_Handler
        SECTION .text:CODE:NOROOT:REORDER(1)
PendSV_Handler
        B PendSV_Handler
                
        PUBWEAK SysTick_Handler
        SECTION .text:CODE:NOROOT:REORDER(1)
SysTick_Handler
        B SysTick_Handler
                
        PUBWEAK WWDG_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
WWDG_IRQHandler
        B WWDG_IRQHandler
                        
        PUBWEAK LVD_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
LVD_IRQHandler
        B LVD_IRQHandler
        
        PUBWEAK TAMPER_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TAMPER_IRQHandler
        B TAMPER_IRQHandler

        PUBWEAK RTC_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
RTC_IRQHandler
        B RTC_IRQHandler
                       
        PUBWEAK FMC_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
FMC_IRQHandler
        B FMC_IRQHandler
                        
        PUBWEAK RCC_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
RCC_IRQHandler
        B RCC_IRQHandler
                        
        PUBWEAK EXTI0_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
EXTI0_IRQHandler
        B EXTI0_IRQHandler
                        
        PUBWEAK EXTI1_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
EXTI1_IRQHandler
        B EXTI1_IRQHandler
                        
        PUBWEAK EXTI2_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
EXTI2_IRQHandler
        B EXTI2_IRQHandler

        PUBWEAK EXTI3_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
EXTI3_IRQHandler
        B EXTI3_IRQHandler

        PUBWEAK EXTI4_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
EXTI4_IRQHandler
        B EXTI4_IRQHandler
                        
        PUBWEAK DMA1_Channel1_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DMA1_Channel1_IRQHandler
        B DMA1_Channel1_IRQHandler
        
                
        PUBWEAK DMA1_Channel2_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DMA1_Channel2_IRQHandler
        B DMA1_Channel2_IRQHandler

        PUBWEAK DMA1_Channel3_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DMA1_Channel3_IRQHandler
        B DMA1_Channel3_IRQHandler
                        
        PUBWEAK DMA1_Channel4_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DMA1_Channel4_IRQHandler
        B DMA1_Channel4_IRQHandler

        PUBWEAK DMA1_Channel5_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DMA1_Channel5_IRQHandler
        B DMA1_Channel5_IRQHandler
        
        PUBWEAK DMA1_Channel6_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DMA1_Channel6_IRQHandler
        B DMA1_Channel6_IRQHandler

        PUBWEAK DMA1_Channel7_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DMA1_Channel7_IRQHandler
        B DMA1_Channel7_IRQHandler
                
        PUBWEAK ADC1_2_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
ADC1_2_IRQHandler
        B ADC1_2_IRQHandler
                         
        PUBWEAK CAN1_TX_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
CAN1_TX_IRQHandler
        B CAN1_TX_IRQHandler
                        
        PUBWEAK CAN1_RX0_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
CAN1_RX0_IRQHandler
        B CAN1_RX0_IRQHandler
                        
        PUBWEAK CAN1_RX1_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
CAN1_RX1_IRQHandler
        B CAN1_RX1_IRQHandler
                        
        PUBWEAK CAN1_SCE_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
CAN1_SCE_IRQHandler
        B CAN1_SCE_IRQHandler
                        
        PUBWEAK EXTI9_5_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
EXTI9_5_IRQHandler
        B EXTI9_5_IRQHandler
        
        PUBWEAK TIMER1_BRK_TIMER9_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TIMER1_BRK_TIMER9_IRQHandler
        B TIMER1_BRK_TIMER9_IRQHandler
                        
        PUBWEAK TIMER1_UP_TIMER10_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TIMER1_UP_TIMER10_IRQHandler
        B TIMER1_UP_TIMER10_IRQHandler
        
        PUBWEAK TIMER1_TRG_COM_TIMER11_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TIMER1_TRG_COM_TIMER11_IRQHandler
        B TIMER1_TRG_COM_TIMER11_IRQHandler
                       
        PUBWEAK TIMER1_CC_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TIMER1_CC_IRQHandler
        B TIMER1_CC_IRQHandler
                        
        PUBWEAK TIMER2_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TIMER2_IRQHandler
        B TIMER2_IRQHandler
                        
        PUBWEAK TIMER3_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TIMER3_IRQHandler
        B TIMER3_IRQHandler
        
       PUBWEAK TIMER4_IRQHandler
       SECTION .text:CODE:NOROOT:REORDER(1)
TIMER4_IRQHandler
       B TIMER4_IRQHandler
                        
        PUBWEAK I2C1_EV_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
I2C1_EV_IRQHandler
        B I2C1_EV_IRQHandler
                
        PUBWEAK I2C1_ER_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
I2C1_ER_IRQHandler
        B I2C1_ER_IRQHandler
                        
        PUBWEAK I2C2_EV_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
I2C2_EV_IRQHandler
        B I2C2_EV_IRQHandler
                       
        PUBWEAK I2C2_ER_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
I2C2_ER_IRQHandler
        B I2C2_ER_IRQHandler
                        
        PUBWEAK SPI1_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
SPI1_IRQHandler
        B SPI1_IRQHandler
                        
        PUBWEAK SPI2_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
SPI2_IRQHandler
        B SPI2_IRQHandler
        
          PUBWEAK USART1_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
USART1_IRQHandler
        B USART1_IRQHandler
        
        PUBWEAK USART2_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
USART2_IRQHandler
        B USART2_IRQHandler
        
        PUBWEAK USART3_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
USART3_IRQHandler
        B USART3_IRQHandler

        PUBWEAK EXTI15_10_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
EXTI15_10_IRQHandler
        B EXTI15_10_IRQHandler
        
        PUBWEAK RTCAlarm_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
RTCAlarm_IRQHandler
        B RTCAlarm_IRQHandler
        
         PUBWEAK OTG_FS_WKUP_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
OTG_FS_WKUP_IRQHandler
        B OTG_FS_WKUP_IRQHandler
        
        PUBWEAK TIMER8_BRK_TIMER12_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TIMER8_BRK_TIMER12_IRQHandler
        B TIMER8_BRK_TIMER12_IRQHandler

        PUBWEAK TIMER8_UP_TIMER13_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TIMER8_UP_TIMER13_IRQHandler
        B TIMER8_UP_TIMER13_IRQHandler

        PUBWEAK TIMER8_TRG_COM_TIMER14_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TIMER8_TRG_COM_TIMER14_IRQHandler
        B TIMER8_TRG_COM_TIMER14_IRQHandler

        PUBWEAK TIMER8_CC_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TIMER8_CC_IRQHandler
        B TIMER8_CC_IRQHandler

        PUBWEAK ADC3_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
ADC3_IRQHandler
        B ADC3_IRQHandler

        PUBWEAK EXMC_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
EXMC_IRQHandler
        B EXMC_IRQHandler

        PUBWEAK SDIO_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
SDIO_IRQHandler
        B SDIO_IRQHandler

        PUBWEAK TIMER5_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TIMER5_IRQHandler
        B TIMER5_IRQHandler

        PUBWEAK SPI3_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
SPI3_IRQHandler
        B SPI3_IRQHandler

        PUBWEAK UART4_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
UART4_IRQHandler
        B UART4_IRQHandler

        PUBWEAK UART5_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
UART5_IRQHandler
        B UART5_IRQHandler

        PUBWEAK TIMER6_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TIMER6_IRQHandler
        B TIMER6_IRQHandler

        PUBWEAK TIMER7_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TIMER7_IRQHandler
        B TIMER7_IRQHandler

        PUBWEAK DMA2_Channel1_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DMA2_Channel1_IRQHandler
        B DMA2_Channel1_IRQHandler

        PUBWEAK DMA2_Channel2_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DMA2_Channel2_IRQHandler
        B DMA2_Channel2_IRQHandler
        
        PUBWEAK DMA2_Channel3_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DMA2_Channel3_IRQHandler
        B DMA2_Channel3_IRQHandler

        PUBWEAK DMA2_Channel4_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DMA2_Channel4_IRQHandler
        B DMA2_Channel4_IRQHandler

        PUBWEAK DMA2_Channel5_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DMA2_Channel5_IRQHandler
        B DMA2_Channel5_IRQHandler

        PUBWEAK ETH_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
ETH_IRQHandler
        B ETH_IRQHandler

        PUBWEAK ETH_WKUP_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
ETH_WKUP_IRQHandler
        B ETH_WKUP_IRQHandler

        PUBWEAK CAN2_TX_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
CAN2_TX_IRQHandler
        B CAN2_TX_IRQHandler

        PUBWEAK CAN2_RX0_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
CAN2_RX0_IRQHandler
        B CAN2_RX0_IRQHandler

        PUBWEAK CAN2_RX1_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
CAN2_RX1_IRQHandler
        B CAN2_RX1_IRQHandler

        PUBWEAK CAN2_SCE_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
CAN2_SCE_IRQHandler
        B CAN2_SCE_IRQHandler

        PUBWEAK OTG_FS_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
OTG_FS_IRQHandler
        B OTG_FS_IRQHandler
        
        PUBWEAK DMA2_Channel6_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DMA2_Channel6_IRQHandler
        B DMA2_Channel6_IRQHandler
        
        PUBWEAK DMA2_Channel7_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DMA2_Channel7_IRQHandler
        B DMA2_Channel7_IRQHandler
        
        PUBWEAK USART6_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
USART6_IRQHandler
        B USART6_IRQHandler
        
        PUBWEAK I2C3_EV_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
I2C3_EV_IRQHandler
        B I2C3_EV_IRQHandler
        
        PUBWEAK I2C3_ER_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
I2C3_ER_IRQHandler
        B I2C3_ER_IRQHandler
        
        PUBWEAK DCI_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
DCI_IRQHandler
        B DCI_IRQHandler
        
        PUBWEAK CRYP_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
CRYP_IRQHandler
        B CRYP_IRQHandler

        PUBWEAK HASH_RNG_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
HASH_RNG_IRQHandler
        B HASH_RNG_IRQHandler
        
        PUBWEAK UART7_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
UART7_IRQHandler
        B UART7_IRQHandler

        PUBWEAK UART8_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
UART8_IRQHandler
        B UART8_IRQHandler
                                    
        PUBWEAK TLDI_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TLDI_IRQHandler
        B TLDI_IRQHandler

        PUBWEAK TLDI_ER_IRQHandler
        SECTION .text:CODE:NOROOT:REORDER(1)
TLDI_ER_IRQHandler
        B TLDI_ER_IRQHandler
        END
