#Add K-feldspar and observe precipiates forming
[TimeDependentReactionSolver]
  model_definition = definition
  geochemistry_reactor_name = reactor
  charge_balance_species = "Cl-"
  constraint_species = "H2O              H+       Na+                K+                 Ca++               Mg++               Al+++              SiO2(aq)           Cl-                SO4--                HCO3-"
  constraint_value = "  1.0              1E-5     2.175E-04          2.558E-05          3.743E-04          1.234E-04          3.706E-08          4.993E-05          8.463E-04          8.328E-05           8.194E-04"
  constraint_meaning = "kg_solvent_water activity moles_bulk_species moles_bulk_species moles_bulk_species moles_bulk_species moles_bulk_species moles_bulk_species moles_bulk_species moles_bulk_species moles_bulk_species"
  source_species_names = "K-feldspar"
  source_species_rates = "1.37779E-3" # 0.15cm^3 of K-feldspar (molar volume = 108.87 cm^3/mol) = 1.37779E-3 mol
  remove_fixed_activity_name = "H+"
  remove_fixed_activity_time = 0
  ramp_max_ionic_strength_initial = 0 # not needed for this simple problem
  stoichiometric_ionic_str_using_Cl_only = true # for comparison with GWB
  execute_console_output_on = '' # only CSV output for this example
[]

[Postprocessors]
  [./cm3_K-feldspar]
    type = PointValue
    point = '0 0 0'
    variable = 'free_cm3_K-feldspar'
  [../]
  [./cm3_Kaolinite]
    type = PointValue
    point = '0 0 0'
    variable = 'free_cm3_Kaolinite'
  [../]
  [./cm3_Muscovite]
    type = PointValue
    point = '0 0 0'
    variable = 'free_cm3_Muscovite'
  [../]
  [./cm3_Quartz]
    type = PointValue
    point = '0 0 0'
    variable = 'free_cm3_Quartz'
  [../]
  [./cm3_Phengite]
    type = PointValue
    point = '0 0 0'
    variable = 'free_cm3_Phengite'
  [../]
[]

[Executioner]
  type = Transient
  dt = 0.01
  end_time = 1
[]

[Outputs]
  csv = true
[]

[UserObjects]
  [./definition]
    type = GeochemicalModelDefinition
    database_file = "../../../database/moose_geochemdb.json"
    basis_species = "H2O H+ Na+ K+ Ca++ Mg++ Al+++ SiO2(aq) Cl- SO4-- HCO3-"
    equilibrium_minerals = "K-feldspar Kaolinite Muscovite Quartz Phengite"
    piecewise_linear_interpolation = true # for comparison with GWB
  [../]
[]

