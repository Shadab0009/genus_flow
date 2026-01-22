#################################################################################
#
# Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Thu Jan 22 16:39:08 IST 2026
#
#################################################################################

## library_sets
create_library_set -name wcl_slow \
    -timing { /home/shadab/shadab/libs/libs/slow.lib }
create_library_set -name wcl_fast \
    -timing { /home/shadab/shadab/libs/libs/fast.lib }
create_library_set -name wcl_typical \
    -timing { /home/shadab/shadab/libs/libs/typical.lib }

## opcond
create_opcond -name op_cond_wcl_slow \
    -process 1.0 \
    -voltage 1.08 \
    -temperature 125.0
create_opcond -name op_cond_wcl_fast \
    -process 1.0 \
    -voltage 1.32 \
    -temperature 0.0
create_opcond -name op_cond_wcl_typical \
    -process 1.0 \
    -voltage 1.2 \
    -temperature 25.0

## timing_condition
create_timing_condition -name timing_cond_wcl_slow \
    -opcond op_cond_wcl_slow \
    -library_sets { wcl_slow }
create_timing_condition -name timing_cond_wcl_fast \
    -opcond op_cond_wcl_fast \
    -library_sets { wcl_fast }
create_timing_condition -name timing_cond_wcl_typical \
    -opcond op_cond_wcl_typical \
    -library_sets { wcl_typical }

## rc_corner
create_rc_corner -name rc_corner \
    -cap_table /home/shadab/shadab/libs/captable/t018s6mlv.capTbl \
    -pre_route_res 1.0 \
    -pre_route_cap 1.0 \
    -pre_route_clock_res 0.0 \
    -pre_route_clock_cap 0.0 \
    -post_route_res {1.0 1.0 1.0} \
    -post_route_cap {1.0 1.0 1.0} \
    -post_route_cross_cap {1.0 1.0 1.0} \
    -post_route_clock_res {1.0 1.0 1.0} \
    -post_route_clock_cap {1.0 1.0 1.0}

## delay_corner
create_delay_corner -name delay_corner_wcl_slow \
    -early_timing_condition { timing_cond_wcl_slow } \
    -late_timing_condition { timing_cond_wcl_slow } \
    -early_rc_corner rc_corner \
    -late_rc_corner rc_corner
create_delay_corner -name delay_corner_wcl_fast \
    -early_timing_condition { timing_cond_wcl_fast } \
    -late_timing_condition { timing_cond_wcl_fast } \
    -early_rc_corner rc_corner \
    -late_rc_corner rc_corner
create_delay_corner -name delay_corner_wcl_typical \
    -early_timing_condition { timing_cond_wcl_typical } \
    -late_timing_condition { timing_cond_wcl_typical } \
    -early_rc_corner rc_corner \
    -late_rc_corner rc_corner

## constraint_mode
create_constraint_mode -name functional_wcl_slow \
    -sdc_files { OUTPUT/outputs_21.14-s082_1/syn_opt_counter.functional_wcl_slow.sdc }
create_constraint_mode -name functional_wcl_fast \
    -sdc_files { OUTPUT/outputs_21.14-s082_1/syn_opt_counter.functional_wcl_fast.sdc }
create_constraint_mode -name functional_wcl_typical \
    -sdc_files { OUTPUT/outputs_21.14-s082_1/syn_opt_counter.functional_wcl_typical.sdc }

## analysis_view
create_analysis_view -name view_wcl_slow \
    -constraint_mode functional_wcl_slow \
    -delay_corner delay_corner_wcl_slow
create_analysis_view -name view_wcl_fast \
    -constraint_mode functional_wcl_fast \
    -delay_corner delay_corner_wcl_fast
create_analysis_view -name view_wcl_typical \
    -constraint_mode functional_wcl_typical \
    -delay_corner delay_corner_wcl_typical

## set_analysis_view
set_analysis_view -setup { view_wcl_slow view_wcl_fast view_wcl_typical } \
                  -hold { view_wcl_slow view_wcl_fast view_wcl_typical }
