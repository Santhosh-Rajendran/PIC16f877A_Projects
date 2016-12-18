#include<pic.h>
#define _XTAL_FREQ 4000000
#define DISP PORTD
#define SEGMENT PORTB
#define SWITCH RC0

#define HI  1
#define LO  0
typedef unsigned char U1;

bit ACCESSDISP = 0;
bit UPDATEDATA = 0;
bit MODIFYDATA = 0;
bit LCD_BLINK = 0;

void dispdata(void);
void UpdateData(unsigned int *);
void ModifyData(unsigned int *);

const U1 arr[10] = {0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x67};

U1 option = 0;
U1 timecounter = 0;
U1 display_toggle = 0;
U1 switch_press_time = 0;
U1 option_select_time = 0;
U1 exit_modification_time = 0;
unsigned int second = 0;


U1 data2segdisp[4] = {0x00,0x00,0x00,0x00};


interrupt ISR()
{
    if(LO != CCP1IF) //25 ms once interrupt occurs
    {
        RB4 = ~RB4;
        timecounter++;
        ACCESSDISP = HI;
        if(timecounter >= 40) //1 sec counter
        {
            timecounter = 0;
            UPDATEDATA = HI;   
            if(HI != SWITCH && HI != MODIFYDATA)
            {
                switch_press_time++;
                if((HI != MODIFYDATA) && switch_press_time >= 3) //pressed for 5 secs
                {
                    MODIFYDATA = HI;
                }
            }
            else if((HI != SWITCH) && LO != MODIFYDATA)
            {
                option_select_time++;
                if(option_select_time <= 2) //pressed for Less than 2 secs
                {
                    option++;
                    if(option >= 4)
                        option = 0;
                }
                
                
            }
            
            else if((LO != SWITCH) && (LO != MODIFYDATA))
            {
                exit_modification_time++;
                if(exit_modification_time >= 5) //leave it for more than 5 secs
                {
                    MODIFYDATA = LO;
                }
            }
            
            
            else
            {
                switch_press_time = 0;
                option_select_time = 0;
                exit_modification_time = 0;
            }
        
        }
        
        CCP1IF = 0; 
    }
    
    
    
}

void Initializations(void)
{
	TRISD = 0X00;
    TRISB = 0x00;
	TRISC0 = 1;
    
    TRISE0 = 0;
    RE0 = 0;
    
    PORTD = 0X00;
    PORTB = 0xff;
    
    T1CON = 0x20;
    TMR1H = 0; TMR1L = 0; 
    
    CCP1CON = 0x0B;
    CCP1IE = 1; CCP1IF = 0;
    CCPR1H = 0x61; CCPR1L = 0xA8;  //25000 => 0x61A8
}

void main(void)
{
    
    Initializations();

    GIE = 1; PEIE = 1;    /* Enable global interrupt */
    
    
    for(;;)
    {
        TMR1ON = 1; 		  /* Switch on the free running timer */
        
        if(LO != ACCESSDISP)
            dispdata();
        else 
            ;
        
        if(LO != UPDATEDATA)
            UpdateData(&second);
        else
            ;   
    }
    
}

void dispdata(void)
{

    ACCESSDISP = LO;
    U1 i = 0;
    
    //display_toggle++;
    
    if(display_toggle <= 20)
    {
        
        for(i = 0 ; i < 4 ; i++) //used to display the data in 7 segement display in specified interval
        {
            SEGMENT = 1 << i;
            DISP = data2segdisp[i];
            NOP();
            NOP();
            NOP();
            NOP();
            NOP();
            NOP();
            NOP();
            SEGMENT = 0x00;
        }

        
    }
    
    else if(display_toggle >= 20 && display_toggle <= 40)
    {
        display_toggle = 0;
        data2segdisp[option] = 0x00;
        
        for(i = 0 ; i < 4 ; i++) //used to display the data in LCD in specified interval
        {
            DISP = 0x00;
            NOP();
            NOP();
            NOP();
            SEGMENT = 1 << i;
            DISP = data2segdisp[i];
        }
    }
}

//updates the current value by each passing second
void UpdateData(unsigned int *rec_data) 
{
    UPDATEDATA = 0;
    U1 i = 0;
    
    for(i = 0 ; i < 4 ; i++)
    {
        data2segdisp[i] = arr[*rec_data];
        rec_data++;
    }
    
}




