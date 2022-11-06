within OpenIPSL.DataSets.Anderson.ES_Data;
record ExcSystemData_SC1
  extends ExcSystemData_Template(VR_type = "A",
    IEEE_type = "DC1x",
    Name = "WMA",
    RR = 0.50,
    T_R = 0.000,
    K_A = 400.000,
    T_A1 = 0.050,
    T_A2 = 0.000,
    V_RMAX = 4.407,
    V_RMIN = -4.407,
    K_E = -0.170,
    T_E = 0.950,
    E_1 = 4.2375,
    E_2 = 5.650,
    S_EE_1 = 0.2200,
    S_EE_2 = 0.9500,
    A_ex = 0.0027,
    B_ex = 1.0356,
    Efd_max = 5.650,
    Efd_min = -5.650,
    K_F = 0.040,
    T_F1 = 1.000,
    T_F2 = 0.000);
end ExcSystemData_SC1;
