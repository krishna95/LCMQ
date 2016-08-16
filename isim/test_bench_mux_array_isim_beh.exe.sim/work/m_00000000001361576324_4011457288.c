/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xa0883be4 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Krishna/IOT/LCMQ/LCMQ/tag.v";
static unsigned int ng1[] = {1U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U};
static unsigned int ng2[] = {3U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U, 0U};
static int ng3[] = {0, 0};
static int ng4[] = {1, 0};
static const char *ng5 = "A=%b B=%b B_R=%b sel=%b O=%b clk=%b";



static void Cont_328_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 3784U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(328, ng0);
    t2 = (t0 + 2384);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5224);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t4, 0, 163);
    xsi_driver_vfirst_trans(t5, 0, 162);
    t10 = (t0 + 5096);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_329_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 4032U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(329, ng0);
    t2 = (t0 + 2544);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5288);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t4, 0, 163);
    xsi_driver_vfirst_trans(t5, 0, 162);
    t10 = (t0 + 5112);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_330_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 4280U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(330, ng0);
    t2 = (t0 + 2704);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5352);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 5128);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_331_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 4528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(331, ng0);
    t2 = (t0 + 2864);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5416);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 5144);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Initial_332_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    t1 = (t0 + 4776U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(333, ng0);

LAB4:    xsi_set_current_line(334, ng0);
    t2 = (t0 + 4584);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(335, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2384);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 163);
    xsi_set_current_line(336, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2544);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 163);
    xsi_set_current_line(337, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2704);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(338, ng0);
    t2 = (t0 + 4584);
    xsi_process_wait(t2, 2000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(339, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 2864);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(340, ng0);
    t2 = (t0 + 4584);
    xsi_process_wait(t2, 3000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(341, ng0);
    t3 = (t0 + 1184U);
    t4 = *((char **)t3);
    t3 = (t0 + 1344U);
    t5 = *((char **)t3);
    t3 = (t0 + 1664U);
    t6 = *((char **)t3);
    t3 = (t0 + 1824U);
    t7 = *((char **)t3);
    t3 = (t0 + 1504U);
    t8 = *((char **)t3);
    t3 = (t0 + 1984U);
    t9 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng5, 7, t0, (char)118, t4, 163, (char)118, t5, 163, (char)118, t6, 163, (char)118, t7, 1, (char)118, t8, 163, (char)118, t9, 1);
    xsi_set_current_line(342, ng0);
    t2 = (t0 + 4584);
    xsi_process_wait(t2, 4000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(343, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 2864);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(344, ng0);
    t2 = (t0 + 4584);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB9;
    goto LAB1;

LAB9:    xsi_set_current_line(345, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 2704);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(346, ng0);
    t2 = (t0 + 4584);
    xsi_process_wait(t2, 6000LL);
    *((char **)t1) = &&LAB10;
    goto LAB1;

LAB10:    xsi_set_current_line(347, ng0);
    t3 = (t0 + 1184U);
    t4 = *((char **)t3);
    t3 = (t0 + 1344U);
    t5 = *((char **)t3);
    t3 = (t0 + 1664U);
    t6 = *((char **)t3);
    t3 = (t0 + 1824U);
    t7 = *((char **)t3);
    t3 = (t0 + 1504U);
    t8 = *((char **)t3);
    t3 = (t0 + 1984U);
    t9 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng5, 7, t0, (char)118, t4, 163, (char)118, t5, 163, (char)118, t6, 163, (char)118, t7, 1, (char)118, t8, 163, (char)118, t9, 1);
    xsi_set_current_line(348, ng0);
    t2 = (t0 + 4584);
    xsi_process_wait(t2, 7000LL);
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB11:    xsi_set_current_line(349, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 2864);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(350, ng0);
    t2 = (t0 + 4584);
    xsi_process_wait(t2, 8000LL);
    *((char **)t1) = &&LAB12;
    goto LAB1;

LAB12:    xsi_set_current_line(351, ng0);
    t3 = (t0 + 1184U);
    t4 = *((char **)t3);
    t3 = (t0 + 1344U);
    t5 = *((char **)t3);
    t3 = (t0 + 1664U);
    t6 = *((char **)t3);
    t3 = (t0 + 1824U);
    t7 = *((char **)t3);
    t3 = (t0 + 1504U);
    t8 = *((char **)t3);
    t3 = (t0 + 1984U);
    t9 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng5, 7, t0, (char)118, t4, 163, (char)118, t5, 163, (char)118, t6, 163, (char)118, t7, 1, (char)118, t8, 163, (char)118, t9, 1);
    goto LAB1;

}


extern void work_m_00000000001361576324_4011457288_init()
{
	static char *pe[] = {(void *)Cont_328_0,(void *)Cont_329_1,(void *)Cont_330_2,(void *)Cont_331_3,(void *)Initial_332_4};
	xsi_register_didat("work_m_00000000001361576324_4011457288", "isim/test_bench_mux_array_isim_beh.exe.sim/work/m_00000000001361576324_4011457288.didat");
	xsi_register_executes(pe);
}
