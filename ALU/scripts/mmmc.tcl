create_library_set -name wcl_slow -timing { 
  ../../LIB/gsclib045_v3.5/timing/slow.lib
}
create_library_set -name wcl_fast -timing { 
  ../../LIB/gsclib045_v3.5/timing/fast.lib
}
create_library_set -name wcl_typical -timing { 
  ../../LIB/gsclib045_v3.5/timing/typical.lib
}

create_opcond -name op_cond_wcl_slow    -process 1 -voltage 1.08 -temperature 125
create_opcond -name op_cond_wcl_fast    -process 1 -voltage 1.32 -temperature 0
create_opcond -name op_cond_wcl_typical -process 1 -voltage 1.2 -temperature 25

create_timing_condition -name timing_cond_wcl_slow    -opcond op_cond_wcl_slow    -library_sets { wcl_slow }
create_timing_condition -name timing_cond_wcl_fast    -opcond op_cond_wcl_fast    -library_sets { wcl_fast }
create_timing_condition -name timing_cond_wcl_typical -opcond op_cond_wcl_typical -library_sets { wcl_typical }


create_rc_corner -name rc_corner -cap_table ../../Captable/cln28hpl_1p10m+alrdl_5x2yu2yz_typical.capTbl


create_delay_corner -name delay_corner_wcl_slow -early_timing_condition timing_cond_wcl_slow \
                    -late_timing_condition timing_cond_wcl_slow -early_rc_corner rc_corner \
                    -late_rc_corner rc_corner

create_delay_corner -name delay_corner_wcl_fast -early_timing_condition timing_cond_wcl_fast \
                    -late_timing_condition timing_cond_wcl_fast -early_rc_corner rc_corner \
                    -late_rc_corner rc_corner

create_delay_corner -name delay_corner_wcl_typical -early_timing_condition timing_cond_wcl_typical \
                    -late_timing_condition timing_cond_wcl_typical -early_rc_corner rc_corner \
                    -late_rc_corner rc_corner

create_constraint_mode -name functional_wcl_slow -sdc_files { \
   ../simple_alu_slow.sdc
}

create_constraint_mode -name functional_wcl_fast -sdc_files { \
   ../simple_alu_fast.sdc

}

create_constraint_mode -name functional_wcl_typical -sdc_files { \
   ../simple_alu_typical.sdc
}

create_analysis_view -name view_wcl_slow -constraint_mode functional_wcl_slow -delay_corner delay_corner_wcl_slow
create_analysis_view -name view_wcl_fast -constraint_mode functional_wcl_fast -delay_corner delay_corner_wcl_fast
create_analysis_view -name view_wcl_typical -constraint_mode functional_wcl_typical -delay_corner delay_corner_wcl_typical

set_analysis_view -setup { view_wcl_slow view_wcl_fast view_wcl_typical }
