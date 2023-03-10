within OpenIPSL.Examples.MPC;
model NetworkHard2_noInfiniteBus
  "Base network for testing MPC control over the islanded generator"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus BG1(v_0=0.998855, angle_0=0.15699114448641)
    annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
  OpenIPSL.Electrical.Buses.Bus B1(v_0=0.992504, angle_0=0.076251672237088)
    annotation (Placement(transformation(extent={{-50,60},{-30,80}})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T1(
    R=0.001,
    X=0.2,
    G=0,
    B=0,
    VNOM1=220000,
    VB1=220000,
    VNOM2=24000,
    VB2=24000) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=180,
        origin={-60,70})));
  OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G1 G1(
    v_0=0.998855,
    angle_0=0.15699114448641,
    P_0=40000000,
    Q_0=4547321,
    V_b=24000)
    annotation (Placement(transformation(extent={{-110,60},{-90,80}})));
  OpenIPSL.Electrical.Branches.PwLine L1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-26,66},{-14,74}})));
  OpenIPSL.Electrical.Buses.Bus B2(v_0=0.992681, angle_0=-0.0049879590159821)
    annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  OpenIPSL.Electrical.Buses.Bus B3(v_0=0.998705, angle_0=9.4873305611609e-06)
    annotation (Placement(transformation(extent={{50,60},{70,80}})));
  OpenIPSL.Electrical.Branches.PwLine L2_1(
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{24,86},{36,94}})));
  OpenIPSL.Electrical.Branches.PwLine L2_2(
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{24,46},{36,54}})));
  OpenIPSL.Electrical.Buses.Bus B4(angle_0=-0.00014475935348966,
                                                          v_0=0.997342)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,10})));
  OpenIPSL.Electrical.Branches.PwLine L3(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=-90,
        origin={80,40})));
  OpenIPSL.Electrical.Buses.Bus B5(v_0=1.0074, angle_0=0.0093371449790267)
                                   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-20})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T2(
    G=0,
    B=0,
    VNOM1=220000,
    VB1=220000,
    VNOM2=24000,
    VB2=24000,
    R=0.005,
    X=0.1) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=270,
        origin={60,-6})));
  OpenIPSL.Examples.MPC.GenerationUnits.G2_no_controls3 G2(
    v_0=1.0074,
    angle_0=0.0093371449790267,
    V_b=24000,
    P_0=10010220,
    Q_0=10204330)    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-40})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000,
                                                        fn=50)
    annotation (Placement(transformation(extent={{-140,100},{-80,120}})));
  OpenIPSL.Electrical.Loads.PSSE.Load LD1(
    V_b=220000,
    v_0=0.992681,
    angle_0=-0.0049879590159821,
    P_0=50000000,
    Q_0=10000000) annotation (Placement(transformation(extent={{-12,18},{0,30}})));
  Electrical.Events.Breaker breaker(enableTrigger=false)
                                           annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={80,24})));
  OpenCPS.Controls.FREQ_CALC fREQ_CALC(
    T_w=2,
    T_f=1,
    fi_0=-0.00014475935348966)
            annotation (Placement(transformation(extent={{-86,-30},{-66,-10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=B4.angle)
    annotation (Placement(transformation(extent={{-116,-30},{-96,-10}})));
  Modelica.Blocks.Interfaces.RealInput INPUT(start=0)
    "Connector of Real input signal 2" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-160,-78})));
  Modelica.Blocks.Math.Add AddU1
    annotation (Placement(transformation(extent={{-52,-94},{-32,-74}})));
  Modelica.Blocks.Sources.Constant in_u1(k=0)
    annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
  Electrical.Loads.PSSE.Load_variation load_variation(
    V_b=220000,
    P_0=10000000,
    Q_0=10000000,
    v_0=0.997342,
    angle_0=-0.00014475935348966,
    d_P=0.1,
    t1=1000,
    d_t=2000)
    annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
  Electrical.Loads.PSSE.Load load(
    V_b=220000,
    v_0=0.998705,
    angle_0=9.4873305611609e-06,
    P_0=-10067010,
    Q_0=-12058260)
    annotation (Placement(transformation(extent={{100,48},{120,68}})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_FreqCalcFirstOrderY
    annotation (Placement(transformation(extent={{200,-100},{220,-80}})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_IntegratorY
    "Connector of Real output signal"
    annotation (Placement(transformation(extent={{200,-120},{220,-100}})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_FreqCalcDerivativeX
    "Connector of Real output signal"
    annotation (Placement(transformation(extent={{200,-80},{220,-60}})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G2SexsSimpleLagState
    annotation (Placement(transformation(extent={{200,-60},{220,-40}})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G2SexsSimpleLagLimState
    annotation (Placement(transformation(extent={{200,-40},{220,-20}})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G2GenPSIppq
    annotation (Placement(transformation(extent={{200,-20},{220,0}})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G2GenPSIkd
    annotation (Placement(transformation(extent={{200,0},{220,20}})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G2GenDelta
    annotation (Placement(transformation(extent={{200,40},{220,60}})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G2GenW
    annotation (Placement(transformation(extent={{200,60},{220,80}})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1HygovIntegratorY
    annotation (Placement(transformation(extent={{200,80},{220,100}})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1HygovGState
    annotation (Placement(transformation(extent={{200,100},{220,120}})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1HygovQY
    annotation (Placement(transformation(extent={{200,120},{220,140}})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1HygovSimpleLag1State
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={210,150})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1SexsSimpleLagState annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={210,170})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1SexsSimpleLagLimState
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={210,190})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1GenPSIppq annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={210,210})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1GenPSIkd annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={210,230})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G2GenEpq annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={210,30})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1GenEpq annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={210,250})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1GenDelta annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={210,270})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1GenW annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={210,290})));
  Modelica.Blocks.Continuous.Integrator integrator(y_start=0.1)
    annotation (Placement(transformation(extent={{2,-46},{22,-26}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-32,-46},{-12,-26}})));
equation

  OUTPUT_FreqCalcDerivativeX = fREQ_CALC.derivative.x;
  OUTPUT_FreqCalcFirstOrderY = fREQ_CALC.derivative.y;
  OUTPUT_IntegratorY = integrator.y;
  OUTPUT_G2SexsSimpleLagState = G2.sEXS.simpleLag.state;
  OUTPUT_G2SexsSimpleLagLimState = G2.sEXS.simpleLagLim.state;
  OUTPUT_G2GenPSIppq = G2.gen.PSIppq;
  OUTPUT_G2GenPSIkd = G2.gen.PSIkd;
  OUTPUT_G2GenEpq = G2.gen.Epq;
  OUTPUT_G2GenDelta = G2.gen.delta;
  OUTPUT_G2GenW = G2.gen.w;
  OUTPUT_G1HygovIntegratorY = G1.hYGOV.integrator.y;
  OUTPUT_G1HygovGState = G1.hYGOV.g.state;
  OUTPUT_G1HygovQY = G1.hYGOV.q.y;
  OUTPUT_G1HygovSimpleLag1State = G1.hYGOV.SimpleLag1.state;
  OUTPUT_G1SexsSimpleLagState = G1.sEXS.simpleLag.state;
  OUTPUT_G1SexsSimpleLagLimState = G1.sEXS.simpleLagLim.state;
  OUTPUT_G1GenPSIppq = G1.gen.PSIppq;
  OUTPUT_G1GenPSIkd = G1.gen.PSIkd;
  OUTPUT_G1GenEpq = G1.gen.Epq;
  OUTPUT_G1GenDelta = G1.gen.delta;
  OUTPUT_G1GenW = G1.gen.w;




  connect(T1.p, B1.p)
    annotation (Line(points={{-53.4,70},{-40,70}},        color={0,0,255}));
  connect(BG1.p, T1.n)
    annotation (Line(points={{-80,70},{-66.6,70}},
                                                 color={0,0,255}));
  connect(G1.conn, BG1.p)
    annotation (Line(points={{-89,70},{-80,70}},          color={0,0,255}));
  connect(L1.n, B2.p)
    annotation (Line(points={{-14.6,70},{0,70}},            color={0,0,255}));
  connect(L1.p, B1.p) annotation (Line(points={{-25.4,70},{-40,70}},
        color={0,0,255}));
  connect(L2_2.n, B3.p) annotation (Line(points={{35.4,50},{56,50},{56,70},{60,
          70}}, color={0,0,255}));
  connect(L2_1.n, B3.p) annotation (Line(points={{35.4,90},{56,90},{56,70},{60,
          70}}, color={0,0,255}));
  connect(L2_1.p, B2.p) annotation (Line(points={{24.6,90},{4,90},{4,70},{0,70}},
                       color={0,0,255}));
  connect(L2_2.p, B2.p) annotation (Line(points={{24.6,50},{4,50},{4,70},{0,70}},
        color={0,0,255}));
  connect(T2.p, B4.p) annotation (Line(points={{60,0.6},{60,6},{80,6},{80,10}},
        color={0,0,255}));
  connect(G2.conn, B5.p)
    annotation (Line(points={{60,-29},{60,-20}}, color={0,0,255}));
  connect(LD1.p, B2.p)
    annotation (Line(points={{-6,30},{-6,70},{0,70}},color={0,0,255}));
  connect(L3.p, B3.p) annotation (Line(points={{80,45.4},{80,70},{60,70}},
                             color={0,0,255}));
  connect(breaker.s, B4.p)
    annotation (Line(points={{80,20},{80,10}},   color={0,0,255}));
  connect(breaker.r, L3.n)
    annotation (Line(points={{80,28},{80,34.6}},color={0,0,255}));
  connect(T2.n, B5.p)
    annotation (Line(points={{60,-12.6},{60,-20}}, color={0,0,255}));
  connect(realExpression.y, fREQ_CALC.ANGLE)
    annotation (Line(points={{-95,-20},{-85,-20}}, color={0,0,127}));
  connect(INPUT, AddU1.u1)
    annotation (Line(points={{-160,-78},{-54,-78}}, color={0,0,127}));
  connect(in_u1.y, AddU1.u2)
    annotation (Line(points={{-89,-100},{-62,-100},{-62,-90},{-54,-90}},
                                                   color={0,0,127}));
  connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,6},{80,
          6},{80,10}},                color={0,0,255}));
  connect(load.p, B3.p)
    annotation (Line(points={{110,68},{110,70},{60,70}}, color={0,0,255}));
  connect(feedback.y, integrator.u)
    annotation (Line(points={{-13,-36},{0,-36}}, color={0,0,127}));
  connect(G2.PELEC1, feedback.u2) annotation (Line(points={{49,-31},{40,-31},{40,
          -60},{-22,-60},{-22,-44}}, color={0,0,127}));
  connect(integrator.y, G2.Padd) annotation (Line(points={{23,-36},{26,-36},{26,
          -74},{58.8,-74},{58.8,-52}}, color={0,0,127}));
  connect(feedback.u1, AddU1.y) annotation (Line(points={{-30,-36},{-44,-36},{-44,
          -64},{-16,-64},{-16,-84},{-31,-84}}, color={0,0,127}));
  annotation ( Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-140,-120},{200,300}})),
    Documentation(info="<html>
<p>This example system shows how the preparation for resynchronization of Generator 2 to the grid. Note that at 2 seconds, a signal is triggered so voltages between buses 3 and 4 should be equal.</p>
<p>Simulate the system for 10 seconds. Variables of interest are:</p>
<ul>
<li><code>B3.v</code></li>
<li><code>B4.v</code></li>
<li><code>G1.gen.SPEED</code></li>
<li><code>G2.gen.SPEED</code></li>
</ul>
<p>Note the behavior of those variables before and after the connection of generator G2 to the main grid.</p>
</html>"),
    experiment(StopTime=50, __Dymola_Algorithm="Dassl"),
    Icon(coordinateSystem(extent={{-140,-120},{200,300}})));
end NetworkHard2_noInfiniteBus;