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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_3620187407;
char *IEEE_P_2592010699;
char *STD_TEXTIO;
char *STD_STANDARD;
char *IEEE_P_3499444699;
char *IEEE_P_1242562249;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    std_textio_init();
    work_a_1003314168_3212880686_init();
    work_a_1074805832_3212880686_init();
    work_a_1991350011_3212880686_init();
    work_a_0123541133_3212880686_init();
    work_a_1218464839_3212880686_init();
    work_a_0042905980_3212880686_init();
    work_a_1051510193_3212880686_init();
    work_a_3782236725_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_1891258420_3212880686_init();
    work_a_3961274036_3212880686_init();
    work_a_1348603967_3212880686_init();
    work_a_1155553963_3212880686_init();
    work_a_3948465925_2372691052_init();


    xsi_register_tops("work_a_3948465925_2372691052");

    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");

    return xsi_run_simulation(argc, argv);

}
