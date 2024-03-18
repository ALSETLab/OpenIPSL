within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.CTG1;
model CTG1MachineComplete_MPC_simple
  "Generation group for CTG1 containing the synchronous machine, excitation system, voltage compensator, and turbine governor system."
  extends OpenIPSL.Interfaces.Generator;

  replaceable OpenIPSL.Electrical.Machines.PSSE.GENROU machine(
    V_b=V_b,
    Tpd0=guData.guDynamics.machine.Tpd0,
    Tppd0=guData.guDynamics.machine.Tppd0,
    Tpq0=guData.guDynamics.machine.Tpq0,
    Tppq0=guData.guDynamics.machine.Tppq0,
    D=guData.guDynamics.machine.D,
    Xd=guData.guDynamics.machine.Xd,
    Xq=guData.guDynamics.machine.Xq,
    Xpd=guData.guDynamics.machine.Xpd,
    Xpq=guData.guDynamics.machine.Xpq,
    Xppd=guData.guDynamics.machine.Xppd,
    Xl=guData.guDynamics.machine.Xl,
    S10=guData.guDynamics.machine.S10,
    S12=guData.guDynamics.machine.S12,
    angle_0=angle_0,
    Xppq=guData.guDynamics.machine.Xppq,
    R_a=guData.guDynamics.machine.R_a,
    Xpp=guData.guDynamics.machine.Xpp,
    H=guData.guDynamics.machine.H,
    M_b=guData.guDynamics.machine.M_b,
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0) constrainedby
    OpenIPSL.Electrical.Machines.PSSE.BaseClasses.baseMachine
    annotation (choicesAllMatching=true,
                Placement(transformation(extent={{40,-10},
            {60,10}})));
  replaceable ModelPredictiveControl.GenerationUnits.SEXSMPC          exciter(
    T_AT_B=2,
    T_B=guData.guDynamics.excSystem.T_A,
    K=50,
    E_MIN=0)
    constrainedby OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-28,-24},
            {10,10}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-40,-64},{-32,-56}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-28,-76},{-20,-68}})));
  replaceable ModelPredictiveControl.GenerationUnits.GASTMPC     governor(
    R=guData.guDynamics.tg.R,
    T_1=guData.guDynamics.tg.T_1,
    T_2=guData.guDynamics.tg.T_2,
    T_3=guData.guDynamics.tg.T_3,
    AT=guData.guDynamics.tg.AT,
    K_T=guData.guDynamics.tg.K_T,
    V_MAX=guData.guDynamics.tg.V_MAX,
    V_MIN=guData.guDynamics.tg.V_MIN,
    D_turb=guData.guDynamics.tg.D_turb)
    constrainedby OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.BaseGovernor
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-30,40},
            {-10,60}})));
  DynParamRecords.GUDynamics guData(redeclare record GUnitDynamics =
        DynParamRecords.CTG1)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Electrical.Controls.PSSE.VC.IEEEVC iEEEVC(RC=0, XC=0.05)
    annotation (Placement(transformation(extent={{44,-60},{18,-38}})));
  Modelica.Blocks.Interfaces.RealInput Pm_ref
    "Connector of Real input signal 1" annotation (Placement(transformation(
          extent={{-140,40},{-100,80}}), iconTransformation(extent={{-140,40},{
            -100,80}})));
  Modelica.Blocks.Interfaces.RealInput E_ref annotation (Placement(
        transformation(extent={{-140,-80},{-100,-40}}), iconTransformation(
          extent={{-140,-80},{-100,-40}})));
equation
  connect(exciter.EFD, machine.EFD) annotation (Line(points={{11.9,-7},{38,-7},{
          38,-6}},                    color={0,0,127}));
  connect(exciter.XADIFD, machine.XADIFD) annotation (Line(points={{6.2,-25.7},{
          6.2,-30},{64,-30},{64,-9},{61,-9}},      color={0,0,127}));
  connect(machine.EFD0, exciter.EFD0) annotation (Line(points={{61,-5},{68,-5},{
          68,-34},{-34,-34},{-34,-13.8},{-29.9,-13.8}},          color={0,0,127}));
  connect(const.y, exciter.VUEL) annotation (Line(points={{-31.6,-60},{-16.6,
          -60},{-16.6,-25.7}},color={0,0,127}));
  connect(const1.y, exciter.VOEL) annotation (Line(points={{-19.6,-72},{-12,-72},
          {-12,-30},{-9,-30},{-9,-25.7}},
                              color={0,0,127}));
  connect(governor.PMECH, machine.PMECH) annotation (Line(points={{-9,50},{28,50},
          {28,6},{38,6}},       color={0,0,127}));
  connect(governor.SPEED, machine.SPEED) annotation (Line(points={{-28,56},{-40,
          56},{-40,68},{80,68},{80,7},{61,7}},       color={0,0,127}));

  connect(machine.p, iEEEVC.Gen_terminal) annotation (Line(points={{60,0},{74,0},
          {74,-41.1429},{41.1111,-41.1429}}, color={0,0,255}));
  connect(iEEEVC.VCT, exciter.ECOMP) annotation (Line(points={{15.6889,-50.5714},
          {-42,-50.5714},{-42,-7},{-29.9,-7}}, color={0,0,127}));
  connect(machine.p, pwPin)
    annotation (Line(points={{60,0},{110,0}}, color={0,0,255}));
  connect(machine.PMECH0, governor.PMECH0) annotation (Line(points={{61,5},{74,
          5},{74,32},{-44,32},{-44,44},{-28,44}}, color={0,0,127}));
  connect(Pm_ref, governor.PMECHControllable) annotation (Line(points={{-120,60},
          {-64,60},{-64,26},{-20,26},{-20,38}}, color={0,0,127}));
  connect(E_ref, exciter.EFd_input) annotation (Line(points={{-120,-60},{-90,
          -60},{-90,6.6},{-29.9,6.6}}, color={0,0,127}));
  connect(exciter.VOTHSG, const.y) annotation (Line(points={{-29.9,-0.2},{-50,
          -0.2},{-50,-46},{-22,-46},{-22,-60},{-31.6,-60}}, color={0,0,127}));
end CTG1MachineComplete_MPC_simple;
