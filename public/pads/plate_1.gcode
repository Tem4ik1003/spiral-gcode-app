; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 1h 15m 41s; total estimated time: 1h 23m 9s
; total layer number: 6
; total filament length [mm] : 18463.88
; total filament volume [cm^3] : 44410.84
; total filament weight [g] : 55.07
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 1.00
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auto_disable_filter_on_overheat = 0
; auxiliary_fan = 1
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 4
; bottom_shell_layers = 4
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0
; change_filament_gcode = ;=P1S 20251031=\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S{flush_temperatures[next_extruder]}\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_fan_the_first_x_layers = 1
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; cooling_filter_enabled = 0
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 4000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL P1S 0.4 nozzle"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.15
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = Standard#1
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow"
; fan_cooling_layer_time = 100
; fan_direction = left
; fan_max_speed = 100
; fan_min_speed = 100
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_change_length = 10
; filament_change_length_nc = 10
; filament_colour = #FFFFFF
; filament_colour_type = 1
; filament_cooling_before_tower = 0
; filament_cost = 20
; filament_density = 1.24
; filament_diameter = 1.75
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFL99
; filament_is_support = 0
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12
; filament_minimal_purge_on_wipe_tower = 15
; filament_multi_colour = #FFFFFF
; filament_notes = 
; filament_nozzle_map = 0
; filament_pre_cooling_temperature = 0
; filament_pre_cooling_temperature_nc = 0
; filament_prime_volume = 45
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_scarf_gap = 15%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Generic PLA"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA
; filament_velocity_adaptation_factor = 1
; filament_vendor = Generic
; filament_volume_map = 0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; group_algo_with_time = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; host_type = octoprint
; hot_plate_temp = 55
; hot_plate_temp_initial_layer = 55
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 150
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 200
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.16
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,500
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,500
; machine_max_speed_y = 500,500
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0
; machine_min_travel_rate = 0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: P1S-0.4 ========================\n;===== date: 20251031 =====================\n;===== turn on the HB fan & MC board fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\nM710 A1 S255 ;turn on MC fan by default(P1S)\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action:54\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 2000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 60
; overhang_1_4_speed = 60
; overhang_2_4_speed = 30
; overhang_3_4_speed = 10
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.16mm High Quality @BBL X1C
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab P1S
; printer_notes = 
; printer_settings_id = Bambu Lab P1S 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 8
; slow_down_min_speed = 20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = gyroid
; sparse_infill_speed = 200
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.16
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 25
; support_top_z_distance = 0.16
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 55
; textured_plate_temp_initial_layer = 55
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 6
; top_one_wall_type = all top
; top_shell_layers = 6
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 150
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 165
; wipe_tower_y = 214.804
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R83
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1S-0.4 ========================
;===== date: 20251031 =====================
;===== turn on the HB fan & MC board fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
M710 A1 S255 ;turn on MC fan by default(P1S)
;===== reset machine status =================
M290 X40 Y40 Z2.6666666
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action:54
M140 S55 ;set bed temp
M190 S55 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F299.339 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P1 R81
G1 E50 F200
M400
M104 S220
G92 E0
M73 P7 R77
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

M73 P7 R76
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X7.99999 Y7.99999 I240 J240
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F1480.95
G0 Y11 E0.700 F370.237
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F1480.95
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S150


;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/6
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S6000
M73 P8 R76
G1 Z.4 F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 53
G1 X132.158 Y245.068
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X107.311 Y8.667 I-4.167 J-119.068 E13.32207
G3 X128.202 Y6.859 I20.802 J118.745 E.782
G3 X132.218 Y245.066 I-.211 J119.141 E13.77564
M204 S6000
G1 X132.174 Y245.525 F30000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X107.232 Y8.217 I-4.183 J-119.525 E13.37317
G3 X128.206 Y6.402 I20.882 J119.203 E.78512
G3 X132.234 Y245.523 I-.215 J119.598 E13.82839
; WIPE_START
G1 X130.234 Y245.578 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X132.874 Y238.416 Z.6 F30000
G1 X207.072 Y37.129 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50054
G1 F6300
M204 S500
G3 X213.425 Y43.507 I-362.733 J367.657 E.3357
G3 X219.011 Y49.715 I-91.128 J87.614 E.31148
G1 X204.285 Y34.988 E.77662
G2 X200.928 Y32.278 I-93.773 J112.733 E.16089
G1 X221.722 Y53.072 E1.09659
G3 X223.717 Y55.715 I-74.655 J58.444 E.12347
G1 X198.285 Y30.283 E1.34115
G2 X195.994 Y28.639 I-97.233 J133.09 E.10516
G1 X225.361 Y58.006 E1.54869
G3 X226.747 Y60.039 I-57.618 J40.768 E.09177
G1 X193.961 Y27.253 E1.72902
G2 X192.09 Y26.029 I-35.95 J52.92 E.08337
G1 X227.971 Y61.91 E1.89222
G3 X229.068 Y63.654 I-49.437 J32.31 E.07684
G1 X190.346 Y24.932 E2.04204
G2 X188.703 Y23.936 I-29.374 J46.606 E.07166
G1 X230.064 Y65.297 E2.18122
G3 X230.978 Y66.859 I-44.246 J26.955 E.06747
G1 X187.141 Y23.022 E2.31178
G1 X185.651 Y22.179 E.06386
G1 X231.821 Y68.349 E2.43485
G3 X232.594 Y69.769 I-40.188 J22.791 E.06028
G1 X184.231 Y21.406 E2.55048
G2 X182.859 Y20.681 I-21.462 J38.957 E.05788
M73 P8 R75
G1 X233.319 Y71.141 E2.66109
G3 X234.004 Y72.473 I-37.832 J20.295 E.05586
G1 X181.527 Y19.996 E2.76746
G1 X180.236 Y19.353 E.05378
G1 X234.647 Y73.764 E2.86946
G3 X235.245 Y75.009 I-35.341 J17.731 E.05149
G1 X178.991 Y18.755 E2.96661
G2 X177.771 Y18.182 I-17.041 J34.694 E.05028
G1 X235.818 Y76.229 E3.0612
G1 X236.36 Y77.418 E.04873
G1 X176.582 Y17.64 E3.15249
G2 X175.426 Y17.132 I-15.134 J32.838 E.04707
M73 P9 R75
G1 X236.868 Y78.574 E3.24022
G3 X237.362 Y79.715 I-32.558 J14.766 E.04636
G1 X174.285 Y16.638 E3.32642
G1 X173.181 Y16.18 E.04459
G1 X237.819 Y80.819 E3.40882
G3 X238.263 Y81.91 I-31.056 J13.271 E.04393
G1 X172.09 Y15.737 E3.48977
G1 X171.022 Y15.316 E.0428
G1 X238.684 Y82.978 E3.56826
G3 X239.085 Y84.027 I-29.819 J12.014 E.04186
G1 X169.973 Y14.915 E3.64471
G1 X168.94 Y14.528 E.04115
G1 X239.472 Y85.06 E3.7196
G3 X239.836 Y86.072 I-28.806 J10.954 E.04011
G1 X167.928 Y14.164 E3.7922
G1 X166.926 Y13.809 E.03964
G1 X240.191 Y87.074 E3.86375
G3 X240.524 Y88.054 I-27.88 J10.021 E.03861
G1 X165.946 Y13.476 E3.93301
G1 X164.973 Y13.15 E.03824
G1 X240.85 Y89.027 E4.00147
G3 X241.156 Y89.98 I-27.174 J9.246 E.03733
G1 X164.02 Y12.844 E4.06785
G1 X163.075 Y12.546 E.03696
G1 X241.454 Y90.925 E4.13342
G3 X241.736 Y91.854 I-26.504 J8.551 E.03621
G1 X162.146 Y12.264 E4.19729
G1 X161.226 Y11.992 E.03576
G1 X242.008 Y92.774 E4.26015
G3 X242.269 Y93.682 I-25.913 J7.944 E.03525
G1 X160.318 Y11.731 E4.32183
G1 X159.422 Y11.482 E.03465
G1 X242.518 Y94.578 E4.38216
G3 X242.761 Y95.468 I-25.329 J7.394 E.03441
G1 X158.532 Y11.239 E4.44192
G1 X157.659 Y11.014 E.03362
G1 X242.986 Y96.341 E4.49986
G1 X243.212 Y97.214 E.03362
G1 X156.786 Y10.788 E4.5578
G2 X155.933 Y10.582 I-6.327 J24.349 E.03272
G1 X243.418 Y98.067 E4.61364
G1 X243.622 Y98.919 E.03266
G1 X155.081 Y10.377 E4.66934
G2 X154.241 Y10.184 I-5.949 J23.972 E.03215
G1 X243.816 Y99.759 E4.72382
M73 P9 R74
G1 X244 Y100.59 E.03176
G1 X153.41 Y10 E4.7774
G2 X152.581 Y9.818 I-5.608 J23.596 E.03165
G1 X244.182 Y101.419 E4.8307
G1 X244.347 Y102.232 E.03092
G1 X151.768 Y9.653 E4.88226
G1 X150.956 Y9.488 E.03092
G1 X244.512 Y103.044 E4.93383
G3 X244.666 Y103.845 I-22.839 J4.802 E.03042
G1 X150.155 Y9.334 E4.98418
G1 X149.36 Y9.187 E.03013
G1 X244.813 Y104.64 E5.03384
G3 X244.959 Y105.433 I-22.613 J4.573 E.03008
G1 X148.567 Y9.041 E5.08337
G1 X147.79 Y8.911 E.02939
G1 X245.089 Y106.21 E5.13122
G1 X245.219 Y106.987 E.02939
G1 X147.013 Y8.781 E5.17907
M73 P10 R74
G2 X146.243 Y8.658 I-3.901 J21.97 E.02908
G1 X245.342 Y107.757 E5.22616
G1 X245.456 Y108.518 E.02869
G1 X145.482 Y8.544 E5.27228
G1 X144.721 Y8.43 E.02869
G1 X245.57 Y109.279 E5.3184
G3 X245.672 Y110.028 I-21.397 J3.296 E.0282
G1 X143.972 Y8.328 E5.3633
G1 X143.226 Y8.23 E.02803
G1 X245.77 Y110.774 E5.40778
G1 X245.868 Y111.519 E.02803
G1 X142.481 Y8.132 E5.45226
G2 X141.75 Y8.049 I-2.623 J19.732 E.02742
G1 X245.951 Y112.25 E5.49518
G1 X246.035 Y112.98 E.02741
G1 X141.02 Y7.965 E5.53809
G2 X140.292 Y7.884 I-2.685 J20.867 E.02732
G1 X246.115 Y113.708 E5.58074
G1 X246.184 Y114.424 E.02683
G1 X139.576 Y7.816 E5.62214
G1 X138.86 Y7.747 E.02683
G1 X246.253 Y115.14 E5.66355
G3 X246.318 Y115.852 I-20.338 J2.216 E.02667
G1 X138.148 Y7.682 E5.70453
G1 X137.445 Y7.626 E.02628
G1 X246.374 Y116.555 E5.74449
G1 X246.429 Y117.257 E.02628
G1 X136.743 Y7.571 E5.78445
G2 X136.045 Y7.52 I-1.803 J19.977 E.02609
G1 X246.48 Y117.955 E5.82393
G1 X246.522 Y118.644 E.02575
G1 X135.356 Y7.478 E5.86251
G1 X134.666 Y7.436 E.02575
G1 X246.564 Y119.334 E5.90109
G3 X246.602 Y120.019 I-19.589 J1.425 E.02558
G1 X133.981 Y7.398 E5.9392
G1 X133.304 Y7.369 E.02526
G1 X246.631 Y120.696 E5.97645
G1 X246.661 Y121.372 E.02526
G1 X132.628 Y7.339 E6.01369
G2 X131.955 Y7.313 I-1.084 J19.279 E.02513
G1 X246.687 Y122.045 E6.05057
G1 X246.704 Y122.71 E.02479
G1 X131.29 Y7.296 E6.08654
G1 X130.625 Y7.278 E.02479
G1 X246.722 Y123.375 E6.1225
G3 X246.737 Y124.037 I-19.012 J.774 E.02472
G1 X129.963 Y7.263 E6.15826
G1 X129.31 Y7.257 E.02435
G1 X246.743 Y124.69 E6.19299
G1 X246.749 Y125.343 E.02435
G1 X128.657 Y7.251 E6.22772
G2 X128.007 Y7.249 I-.406 J20.463 E.02423
G1 X246.754 Y125.996 E6.26229
G1 X246.749 Y126.637 E.02393
G1 X127.365 Y7.253 E6.29588
G1 X126.722 Y7.258 E.02396
G1 X246.743 Y127.279 E6.32947
G1 X246.738 Y127.921 E.02393
G1 X126.08 Y7.263 E6.36306
G2 X125.446 Y7.276 I.044 J16.707 E.02363
G1 X246.724 Y128.554 E6.39574
G1 X246.707 Y129.185 E.02353
G1 X124.815 Y7.293 E6.42813
G1 X124.185 Y7.309 E.02353
G1 X246.691 Y129.815 E6.46051
G3 X246.669 Y130.441 I-17.956 J-.306 E.02334
G1 X123.559 Y7.331 E6.49237
G1 X122.939 Y7.358 E.02315
G1 X246.642 Y131.061 E6.52364
M73 P11 R74
G1 X246.615 Y131.681 E.02315
G1 X122.319 Y7.385 E6.55492
M73 P11 R73
G2 X121.7 Y7.414 I.507 J17.74 E.0231
G1 X246.586 Y132.3 E6.58604
G1 X246.549 Y132.91 E.02278
G1 X121.09 Y7.451 E6.61624
G1 X120.481 Y7.488 E.02278
G1 X246.512 Y133.519 E6.64643
G1 X246.475 Y134.129 E.02278
G1 X119.871 Y7.526 E6.67659
G1 X119.271 Y7.572 E.02247
G1 X246.43 Y134.732 E6.70592
G1 X246.383 Y135.332 E.02244
G1 X118.67 Y7.619 E6.73511
G1 X118.069 Y7.665 E.02247
G1 X246.335 Y135.932 E6.76431
G3 X246.285 Y136.529 I-17.109 J-1.136 E.02234
G1 X117.471 Y7.715 E6.79318
G1 X116.881 Y7.772 E.02212
G1 X246.228 Y137.119 E6.82132
G1 X246.172 Y137.709 E.02212
G1 X116.291 Y7.828 E6.84945
G1 X115.7 Y7.885 E.02212
G1 X246.115 Y138.3 E6.87758
G3 X246.05 Y138.882 I-16.705 J-1.551 E.02187
G1 X115.118 Y7.95 E6.90492
G1 X114.537 Y8.016 E.02181
G1 X245.984 Y139.463 E6.93207
G1 X245.918 Y140.044 E.02181
G1 X113.956 Y8.082 E6.95922
G2 X113.377 Y8.151 I1.672 J16.582 E.02173
G1 X245.849 Y140.623 E6.98611
G1 X245.774 Y141.195 E.02151
G1 X112.805 Y8.226 E7.0123
G1 X112.233 Y8.301 E.02151
G1 X245.699 Y141.767 E7.03849
G1 X245.624 Y142.339 E.02151
G1 X111.661 Y8.376 E7.06468
G2 X111.095 Y8.458 I2.046 J16.271 E.02132
G1 X245.542 Y142.905 E7.09024
G1 X245.458 Y143.468 E.02123
G1 X110.532 Y8.542 E7.1155
G1 X109.969 Y8.626 E.02123
G1 X245.374 Y144.031 E7.14075
G3 X245.29 Y144.593 I-16.13 J-2.131 E.02122
G1 X109.407 Y8.71 E7.16598
G1 X108.852 Y8.803 E.02096
G1 X245.197 Y145.148 E7.19032
G1 X245.104 Y145.702 E.02096
G1 X108.298 Y8.896 E7.21467
G1 X107.743 Y8.989 E.02096
G1 X245.011 Y146.257 E7.23901
G3 X244.915 Y146.808 I-14.579 J-2.252 E.02087
G1 X107.192 Y9.084 E7.26304
G1 X106.646 Y9.186 E.02071
G1 X244.813 Y147.353 E7.28646
M73 P12 R73
G1 X244.712 Y147.898 E.02068
G1 X106.1 Y9.287 E7.30987
G1 X105.554 Y9.388 E.02071
G1 X244.61 Y148.444 E7.33329
G3 X244.506 Y148.987 I-17.027 J-2.969 E.02063
G1 X105.013 Y9.494 E7.35635
G1 X104.475 Y9.604 E.02046
G1 X244.396 Y149.525 E7.37894
G1 X244.287 Y150.063 E.02046
G1 X103.937 Y9.713 E7.40153
G1 X103.4 Y9.822 E.02046
G1 X244.178 Y150.6 E7.42412
M73 P12 R72
G3 X244.062 Y151.131 I-15.205 J-3.045 E.02027
G1 X102.869 Y9.938 E7.446
G1 X102.339 Y10.056 E.02023
G1 X243.944 Y151.661 E7.46775
G1 X243.827 Y152.191 E.02023
G1 X101.809 Y10.173 E7.48949
G1 X101.279 Y10.291 E.02023
G1 X243.709 Y152.721 E7.51122
G1 X243.584 Y153.242 E.02001
G1 X100.758 Y10.416 E7.53214
G1 X100.236 Y10.541 E.02001
G1 X243.459 Y153.764 E7.55305
G1 X243.333 Y154.286 E.02001
G1 X99.714 Y10.667 E7.57397
G2 X99.193 Y10.793 I3.378 J15.047 E.01998
G1 X243.207 Y154.807 E7.59476
G1 X243.074 Y155.321 E.01981
G1 X98.679 Y10.926 E7.61486
G1 X98.165 Y11.059 E.01981
G1 X242.941 Y155.835 E7.63497
G1 X242.808 Y156.349 E.01981
G1 X97.65 Y11.192 E7.65507
G2 X97.138 Y11.327 I3.606 J14.74 E.01976
G1 X242.673 Y156.862 E7.67498
G1 X242.532 Y157.368 E.01961
G1 X96.632 Y11.468 E7.69429
G1 X96.125 Y11.608 E.01961
G1 X242.392 Y157.875 E7.71359
G1 X242.251 Y158.382 E.01961
G1 X95.618 Y11.749 E7.7329
G2 X95.114 Y11.891 I3.823 J14.468 E.01955
G1 X242.109 Y158.886 E7.75198
G1 X241.961 Y159.385 E.01942
G1 X94.615 Y12.039 E7.77051
G1 X94.115 Y12.187 E.01942
G1 X241.813 Y159.885 E7.78904
G1 X241.665 Y160.384 E.01942
G1 X93.616 Y12.335 E7.80757
M73 P13 R72
G2 X93.119 Y12.485 I4.043 J14.266 E.01936
G1 X241.515 Y160.881 E7.82585
G1 X241.36 Y161.373 E.01924
G1 X92.627 Y12.64 E7.84362
G1 X92.135 Y12.796 E.01924
G1 X241.204 Y161.865 E7.86138
G1 X241.049 Y162.357 E.01924
G1 X91.643 Y12.951 E7.87915
G2 X91.153 Y13.108 I4.257 J14.093 E.01919
G1 X240.892 Y162.847 E7.89668
G1 X240.73 Y163.332 E.01907
G1 X90.668 Y13.27 E7.9137
G1 X90.183 Y13.433 E.01907
G1 X240.567 Y163.817 E7.93071
G1 X240.405 Y164.302 E.01907
G1 X89.698 Y13.595 E7.94773
G2 X89.215 Y13.759 I4.467 J13.951 E.01903
G1 X240.241 Y164.785 E7.96456
G1 X240.072 Y165.263 E.01891
G1 X88.737 Y13.928 E7.98084
M73 P13 R71
G1 X88.259 Y14.097 E.01891
G1 X239.903 Y165.741 E7.99712
G1 X239.733 Y166.219 E.01891
G1 X87.781 Y14.267 E8.0134
G2 X87.305 Y14.437 I4.645 J13.751 E.01888
G1 X239.563 Y166.695 E8.02956
G1 X239.387 Y167.166 E.01875
G1 X86.834 Y14.613 E8.04511
G1 X86.363 Y14.789 E.01875
G1 X239.211 Y167.637 E8.06066
G1 X239.035 Y168.109 E.01875
G1 X85.891 Y14.965 E8.07622
G2 X85.421 Y15.142 I4.881 J13.741 E.01875
G1 X238.858 Y168.579 E8.09174
G1 X238.675 Y169.044 E.01861
G1 X84.956 Y15.325 E8.10658
G1 X84.492 Y15.507 E.01861
G1 X238.493 Y169.508 E8.12142
G1 X238.31 Y169.972 E.01861
G1 X84.028 Y15.69 E8.13626
G1 X83.564 Y15.873 E.01861
G1 X238.127 Y170.436 E8.1511
G3 X237.938 Y170.895 I-13.164 J-5.156 E.01849
G1 X83.105 Y16.062 E8.16531
G1 X82.648 Y16.252 E.01847
G1 X237.748 Y171.352 E8.17945
M73 P14 R71
G1 X237.559 Y171.81 E.01847
G1 X82.19 Y16.441 E8.19358
G1 X81.732 Y16.631 E.01847
G1 X237.369 Y172.268 E8.20772
G3 X237.175 Y172.721 I-13.124 J-5.359 E.01838
G1 X81.279 Y16.825 E8.22137
G1 X80.828 Y17.021 E.01834
G1 X236.979 Y173.172 E8.23481
G1 X236.783 Y173.623 E.01834
G1 X80.377 Y17.217 E8.24825
G1 X79.926 Y17.413 E.01834
G1 X236.587 Y174.074 E8.2617
G3 X236.387 Y174.522 I-12.893 J-5.47 E.01828
G1 X79.478 Y17.613 E8.27481
G1 X79.034 Y17.815 E.01822
G1 X236.185 Y174.966 E8.28757
G1 X235.982 Y175.411 E.01822
G1 X78.589 Y18.018 E8.30033
G1 X78.145 Y18.22 E.01822
G1 X235.775 Y175.851 E8.31286
G1 X235.568 Y176.291 E.01814
G1 X77.702 Y18.425 E8.32529
G1 X77.264 Y18.634 E.0181
G1 X235.361 Y176.731 E8.33747
G1 X235.154 Y177.171 E.01814
G1 X76.825 Y18.843 E8.34965
G1 X76.387 Y19.052 E.0181
G1 X234.946 Y177.611 E8.36184
G1 X234.739 Y178.051 E.01814
G1 X75.949 Y19.261 E8.37402
M73 P14 R70
G1 X75.517 Y19.476 E.018
G1 X234.524 Y178.483 E8.38545
G1 X234.309 Y178.915 E.01799
G1 X75.085 Y19.691 E8.39687
G1 X74.653 Y19.906 E.01799
G1 X234.094 Y179.347 E8.40829
G1 X233.878 Y179.778 E.01799
G1 X74.222 Y20.122 E8.41971
G2 X73.794 Y20.341 I6.073 J12.349 E.01792
G1 X233.659 Y180.206 E8.43068
G1 X233.437 Y180.632 E.01789
G1 X73.368 Y20.563 E8.44144
G1 X72.943 Y20.785 E.01789
G1 X233.215 Y181.057 E8.4522
G1 X232.994 Y181.483 E.01789
G1 X72.517 Y21.006 E8.46296
M73 P15 R70
G2 X72.094 Y21.23 I6.19 J12.219 E.01786
G1 X232.77 Y181.906 E8.47348
G1 X232.542 Y182.326 E.0178
G1 X71.674 Y21.458 E8.48359
G1 X71.255 Y21.685 E.0178
G1 X232.315 Y182.745 E8.4937
G1 X232.087 Y183.165 E.0178
G1 X70.835 Y21.913 E8.50381
G1 X70.416 Y22.141 E.0178
G1 X231.859 Y183.584 E8.5139
G1 X231.625 Y183.997 E.01771
G1 X70.003 Y22.375 E8.52337
G1 X69.59 Y22.609 E.01771
G1 X231.391 Y184.41 E8.53283
G1 X231.157 Y184.824 E.01771
G1 X69.176 Y22.843 E8.5423
G1 X68.763 Y23.076 E.01771
G1 X230.924 Y185.237 E8.55176
G3 X230.686 Y185.646 I-11.807 J-6.587 E.01765
G1 X68.354 Y23.314 E8.56081
G1 X67.946 Y23.554 E.01763
G1 X230.446 Y186.054 E8.56963
G1 X230.206 Y186.461 E.01763
G1 X67.539 Y23.794 E8.57846
G1 X67.132 Y24.034 E.01763
G1 X229.966 Y186.868 E8.58729
G3 X229.724 Y187.274 I-11.706 J-6.697 E.0176
G1 X66.726 Y24.276 E8.59594
G1 X66.325 Y24.521 E.01755
G1 X229.479 Y187.675 E8.60413
G1 X229.233 Y188.076 E.01755
G1 X65.924 Y24.767 E8.61232
G1 X65.522 Y25.013 E.01755
G1 X228.987 Y188.478 E8.62052
G1 X228.741 Y188.879 E.01755
M73 P15 R69
G1 X65.121 Y25.259 E8.62871
G2 X64.725 Y25.51 I6.997 J11.475 E.01749
G1 X228.49 Y189.275 E8.63636
G1 X228.238 Y189.67 E.01748
G1 X64.33 Y25.762 E8.64392
G1 X63.934 Y26.014 E.01748
G1 X227.986 Y190.066 E8.65149
M73 P16 R69
G1 X227.734 Y190.461 E.01748
G1 X63.539 Y26.266 E8.65906
G2 X63.146 Y26.52 I7.102 J11.386 E.01745
G1 X227.48 Y190.854 E8.66634
G1 X227.222 Y191.243 E.01741
G1 X62.757 Y26.778 E8.67329
G1 X62.368 Y27.036 E.01741
G1 X226.964 Y191.632 E8.68023
G1 X226.706 Y192.022 E.01741
G1 X61.978 Y27.294 E8.68717
G1 X61.589 Y27.551 E.01741
G1 X226.449 Y192.411 E8.69411
G1 X226.185 Y192.795 E.01736
G1 X61.205 Y27.815 E8.70043
G1 X60.822 Y28.079 E.01736
G1 X225.921 Y193.178 E8.70676
G1 X225.658 Y193.562 E.01736
G1 X60.438 Y28.342 E8.71309
G1 X60.055 Y28.606 E.01736
G1 X225.394 Y193.945 E8.71941
G3 X225.127 Y194.326 I-11.011 J-7.443 E.01733
G1 X59.674 Y28.873 E8.7254
G1 X59.296 Y29.142 E.0173
G1 X224.858 Y194.704 E8.73111
G1 X224.588 Y195.081 E.0173
G1 X58.919 Y29.412 E8.73682
G1 X58.541 Y29.681 E.0173
G1 X224.319 Y195.459 E8.74253
G3 X224.049 Y195.836 I-11.065 J-7.634 E.0173
G1 X58.164 Y29.951 E8.74818
G1 X57.792 Y30.226 E.01725
G1 X223.774 Y196.208 E8.75328
G1 X223.499 Y196.58 E.01725
G1 X57.42 Y30.501 E8.75838
G1 X57.048 Y30.777 E.01725
G1 X223.223 Y196.952 E8.76349
G1 X222.948 Y197.324 E.01725
G1 X56.676 Y31.052 E8.76859
G2 X56.308 Y31.331 I7.784 J10.671 E.01723
G1 X222.669 Y197.692 E8.77332
G1 X222.388 Y198.059 E.01721
G1 X55.941 Y31.612 E8.77781
M73 P17 R69
G1 X55.575 Y31.893 E.01721
G1 X222.107 Y198.425 E8.7823
M73 P17 R68
G1 X221.826 Y198.791 E.01721
G1 X55.212 Y32.176 E8.78666
G1 X54.85 Y32.461 E.01718
G1 X221.545 Y199.156 E8.79089
G1 X221.258 Y199.517 E.01717
G1 X54.488 Y32.747 E8.79485
G1 X54.126 Y33.032 E.01718
G1 X220.971 Y199.877 E8.79882
G1 X220.685 Y200.238 E.01718
G1 X53.764 Y33.317 E8.80278
G1 X53.402 Y33.603 E.01718
G1 X220.398 Y200.598 E8.80674
G3 X220.108 Y200.955 I-10.411 J-8.17 E.01716
G1 X53.045 Y33.892 E8.81028
G1 X52.69 Y34.185 E.01714
G1 X219.815 Y201.31 E8.81357
G1 X219.523 Y201.665 E.01714
G1 X52.335 Y34.477 E8.81686
G1 X51.981 Y34.77 E.01714
G1 X219.23 Y202.019 E8.82014
G3 X218.937 Y202.374 I-10.349 J-8.268 E.01714
G1 X51.626 Y35.063 E8.82336
G1 X51.277 Y35.361 E.01712
G1 X218.639 Y202.723 E8.82605
G1 X218.341 Y203.072 E.01712
G1 X50.928 Y35.659 E8.82873
G1 X50.579 Y35.957 E.01712
G1 X218.043 Y203.421 E8.83142
G1 X217.745 Y203.77 E.01712
G1 X50.23 Y36.255 E8.8341
G2 X49.885 Y36.557 I8.476 J10.066 E.01711
G1 X217.443 Y204.115 E8.83643
G1 X217.139 Y204.459 E.0171
G1 X49.541 Y36.861 E8.83852
G1 X49.198 Y37.164 E.0171
G1 X216.836 Y204.802 E8.84061
G1 X216.532 Y205.146 E.0171
G1 X48.854 Y37.468 E8.84269
G2 X48.512 Y37.772 I8.488 J9.913 E.0171
G1 X216.228 Y205.488 E8.84474
M73 P18 R68
G1 X215.918 Y205.826 E.01708
G1 X48.174 Y38.082 E8.84623
G1 X47.836 Y38.391 E.01708
G1 X215.609 Y206.164 E8.84772
G1 X215.299 Y206.502 E.01708
G1 X47.498 Y38.701 E8.84921
G1 X47.161 Y39.01 E.01708
G1 X214.99 Y206.839 E8.8507
M73 P18 R67
G3 X214.677 Y207.174 I-9.733 J-8.779 E.01708
G1 X46.826 Y39.323 E8.85186
G1 X46.494 Y39.638 E.01707
G1 X214.362 Y207.506 E8.85275
G1 X214.047 Y207.838 E.01707
G1 X46.162 Y39.953 E8.85364
G1 X45.83 Y40.268 E.01707
G1 X213.732 Y208.17 E8.85454
G3 X213.417 Y208.502 I-9.426 J-8.638 E.01707
G1 X45.498 Y40.583 E8.85542
G1 X45.172 Y40.904 E.01707
G1 X213.096 Y208.828 E8.85571
G1 X212.775 Y209.155 E.01707
G1 X44.845 Y41.225 E8.85601
G1 X44.519 Y41.546 E.01707
G1 X212.454 Y209.481 E8.85631
G1 X212.134 Y209.808 E.01707
G1 X44.192 Y41.866 E8.85661
G2 X43.869 Y42.19 I9.086 J9.412 E.01707
G1 X211.81 Y210.131 E8.85661
G1 X211.484 Y210.452 E.01707
G1 X43.548 Y42.516 E8.85631
G1 X43.227 Y42.843 E.01707
G1 X211.157 Y210.773 E8.85601
G1 X210.831 Y211.094 E.01707
G1 X42.906 Y43.169 E8.85572
G1 X42.586 Y43.496 E.01707
G1 X210.504 Y211.414 E8.85542
G3 X210.172 Y211.73 I-9.352 J-9.511 E.01707
G1 X42.27 Y43.827 E8.85454
G1 X41.955 Y44.16 E.01707
G1 X209.84 Y212.045 E8.85365
M73 P19 R67
G1 X209.508 Y212.36 E.01707
G1 X41.64 Y44.492 E8.85276
G1 X41.325 Y44.824 E.01707
G1 X209.176 Y212.675 E8.85186
G3 X208.842 Y212.988 I-9.119 J-9.423 E.01708
G1 X41.014 Y45.16 E8.8506
G1 X40.705 Y45.497 E.01708
G1 X208.504 Y213.297 E8.84914
G1 X208.166 Y213.606 E.01708
G1 X40.395 Y45.835 E8.84767
G1 X40.085 Y46.172 E.01708
G1 X207.829 Y213.916 E8.84621
G1 X207.491 Y214.225 E.01708
G1 X39.775 Y46.509 E8.84475
G2 X39.47 Y46.852 I8.806 J8.122 E.0171
G1 X207.148 Y214.53 E8.84271
G1 X206.805 Y214.833 E.0171
G1 X39.167 Y47.195 E8.84062
M73 P19 R66
G1 X38.863 Y47.539 E.0171
G1 X206.461 Y215.137 E8.83853
G1 X206.118 Y215.441 E.0171
G1 X38.559 Y47.882 E8.83645
G2 X38.257 Y48.228 I9.712 J8.778 E.01711
G1 X205.772 Y215.743 E8.83412
G1 X205.423 Y216.041 E.01712
G1 X37.959 Y48.577 E8.83144
G1 X37.661 Y48.926 E.01712
G1 X205.074 Y216.339 E8.82875
G1 X204.725 Y216.637 E.01712
G1 X37.363 Y49.275 E8.82607
G1 X37.065 Y49.624 E.01712
G1 X204.376 Y216.935 E8.82338
G3 X204.022 Y217.228 I-8.648 J-10.086 E.01714
G1 X36.772 Y49.978 E8.82017
G1 X36.479 Y50.333 E.01714
G1 X203.667 Y217.521 E8.81688
G1 X203.313 Y217.813 E.01714
G1 X36.187 Y50.687 E8.81359
G1 X35.895 Y51.042 E.01714
G1 X202.958 Y218.105 E8.81031
M73 P20 R66
G3 X202.601 Y218.396 I-8.488 J-10.07 E.01716
G1 X35.604 Y51.399 E8.8068
G1 X35.317 Y51.76 E.01718
G1 X202.24 Y218.683 E8.80291
G1 X201.88 Y218.969 E.01718
G1 X35.031 Y52.12 E8.79902
G1 X34.744 Y52.48 E.01718
G1 X201.52 Y219.256 E8.79513
G1 X201.159 Y219.543 E.01718
G1 X34.457 Y52.841 E8.79124
G2 X34.176 Y53.206 I10.405 J8.312 E.01721
G1 X200.794 Y219.824 E8.78683
G1 X200.427 Y220.105 E.01721
G1 X33.895 Y53.573 E8.78233
G1 X33.614 Y53.939 E.01721
G1 X200.061 Y220.386 E8.77784
G1 X199.695 Y220.667 E.01721
G1 X33.333 Y54.305 E8.77335
G2 X33.054 Y54.673 I10.401 J8.162 E.01723
G1 X199.327 Y220.946 E8.76862
G1 X198.955 Y221.221 E.01725
G1 X32.779 Y55.045 E8.76352
G1 X32.503 Y55.417 E.01725
G1 X198.583 Y221.497 E8.75842
G1 X198.211 Y221.772 E.01725
G1 X32.228 Y55.789 E8.75332
M73 P20 R65
G1 X31.953 Y56.161 E.01725
G1 X197.839 Y222.047 E8.74822
G3 X197.462 Y222.317 I-7.972 J-10.736 E.0173
G1 X31.683 Y56.538 E8.74257
G1 X31.413 Y56.916 E.0173
G1 X197.084 Y222.587 E8.73686
G1 X196.706 Y222.856 E.0173
G1 X31.144 Y57.294 E8.73115
G1 X30.875 Y57.671 E.0173
G1 X196.329 Y223.125 E8.72544
G3 X195.948 Y223.392 I-7.819 J-10.737 E.01733
G1 X30.608 Y58.052 E8.71946
G1 X30.344 Y58.435 E.01736
G1 X195.565 Y223.656 E8.71313
M73 P21 R65
G1 X195.181 Y223.919 E.01736
G1 X30.08 Y58.819 E8.70681
G1 X29.817 Y59.202 E.01736
G1 X194.798 Y224.183 E8.70048
G1 X194.414 Y224.447 E.01736
G1 X29.553 Y59.586 E8.69415
G1 X29.295 Y59.975 E.01741
G1 X194.025 Y224.705 E8.68722
G1 X193.635 Y224.962 E.01741
G1 X29.038 Y60.365 E8.68028
G1 X28.78 Y60.754 E.01741
G1 X193.246 Y225.22 E8.67334
G1 X192.856 Y225.478 E.01741
G1 X28.522 Y61.144 E8.66639
G2 X28.268 Y61.536 I11.114 J7.484 E.01745
G1 X192.464 Y225.732 E8.65911
G1 X192.069 Y225.984 E.01748
G1 X28.016 Y61.931 E8.65155
G1 X27.764 Y62.327 E.01748
G1 X191.673 Y226.236 E8.64398
G1 X191.278 Y226.488 E.01748
G1 X27.512 Y62.722 E8.63641
G2 X27.261 Y63.118 I11.267 J7.422 E.01749
G1 X190.882 Y226.739 E8.62877
G1 X190.481 Y226.985 E.01755
G1 X27.015 Y63.519 E8.62058
G1 X26.769 Y63.921 E.01755
G1 X190.079 Y227.231 E8.61238
G1 X189.678 Y227.477 E.01755
G1 X26.523 Y64.322 E8.60419
G1 X26.277 Y64.723 E.01755
G1 X189.277 Y227.723 E8.596
G3 X188.871 Y227.964 I-7.113 J-11.478 E.0176
G1 X26.036 Y65.129 E8.58735
M73 P21 R64
G1 X25.796 Y65.536 E.01763
G1 X188.464 Y228.204 E8.57852
G1 X188.057 Y228.444 E.01763
G1 X25.556 Y65.943 E8.5697
G1 X25.316 Y66.351 E.01763
G1 X187.649 Y228.684 E8.56087
G3 X187.24 Y228.922 I-6.987 J-11.55 E.01765
G1 X25.078 Y66.76 E8.55183
M73 P22 R64
G1 X24.844 Y67.173 E.01771
G1 X186.827 Y229.156 E8.54237
G1 X186.413 Y229.39 E.01771
G1 X24.61 Y67.587 E8.5329
G1 X24.377 Y68 E.01771
G1 X186 Y229.623 E8.52344
G1 X185.587 Y229.857 E.01771
G1 X24.143 Y68.413 E8.51397
G2 X23.915 Y68.832 I12.152 J6.879 E.0178
G1 X185.168 Y230.085 E8.50388
G1 X184.748 Y230.313 E.0178
G1 X23.687 Y69.252 E8.49377
G1 X23.459 Y69.671 E.0178
G1 X184.329 Y230.541 E8.48366
G1 X183.909 Y230.768 E.0178
G1 X23.232 Y70.091 E8.47355
G2 X23.008 Y70.514 I11.99 J6.613 E.01786
G1 X183.486 Y230.992 E8.46304
G1 X183.06 Y231.214 E.01789
G1 X22.786 Y70.94 E8.45228
G1 X22.565 Y71.365 E.01789
G1 X182.635 Y231.435 E8.44152
G1 X182.209 Y231.657 E.01789
G1 X22.343 Y71.791 E8.43076
G2 X22.123 Y72.218 I12.136 J6.506 E.01792
G1 X181.782 Y231.877 E8.41979
G1 X181.35 Y232.092 E.01799
G1 X21.908 Y72.65 E8.40837
G1 X21.693 Y73.082 E.01799
G1 X180.918 Y232.307 E8.39695
G1 X180.486 Y232.523 E.01799
G1 X21.477 Y73.514 E8.38553
G1 X21.262 Y73.946 E.018
G1 X180.054 Y232.738 E8.37411
G1 X179.616 Y232.947 E.0181
G1 X21.053 Y74.384 E8.36202
G1 X20.844 Y74.822 E.0181
G1 X179.178 Y233.156 E8.34994
G1 X178.74 Y233.365 E.0181
G1 X20.635 Y75.26 E8.33785
M73 P23 R64
G1 X20.426 Y75.699 E.0181
G1 X178.301 Y233.574 E8.32576
M73 P23 R63
G3 X177.859 Y233.778 I-6.088 J-12.617 E.01819
G1 X20.222 Y76.141 E8.31318
G1 X20.019 Y76.586 E.01822
G1 X177.414 Y233.981 E8.30042
G1 X176.969 Y234.183 E.01822
G1 X19.817 Y77.031 E8.28766
G1 X19.614 Y77.475 E.01822
G1 X176.525 Y234.386 E8.2749
G3 X176.077 Y234.585 I-5.471 J-11.713 E.01829
G1 X19.415 Y77.923 E8.26178
G1 X19.219 Y78.374 E.01834
G1 X175.625 Y234.78 E8.24831
G1 X175.173 Y234.976 E.01835
G1 X19.022 Y78.825 E8.23483
G1 X18.826 Y79.276 E.01834
G1 X174.722 Y235.172 E8.22136
G1 X174.27 Y235.367 E.01835
G1 X18.632 Y79.729 E8.20778
G1 X18.443 Y80.187 E.01847
G1 X173.813 Y235.557 E8.19369
G1 X173.356 Y235.747 E.01847
G1 X18.253 Y80.644 E8.17955
G1 X18.063 Y81.102 E.01847
G1 X172.898 Y235.937 E8.16541
G3 X172.44 Y236.125 I-5.653 J-13.065 E.01849
G1 X17.875 Y81.56 E8.15121
G1 X17.692 Y82.024 E.01861
G1 X171.975 Y236.308 E8.13637
G1 X171.511 Y236.491 E.01861
G1 X17.509 Y82.489 E8.12153
G1 X17.326 Y82.953 E.01861
G1 X171.047 Y236.674 E8.10669
G1 X170.583 Y236.857 E.01861
G1 X17.143 Y83.417 E8.09185
G2 X16.967 Y83.888 I13.396 J5.291 E.01875
G1 X170.112 Y237.033 E8.07633
G1 X169.641 Y237.21 E.01875
G1 X16.79 Y84.359 E8.06078
G1 X16.614 Y84.83 E.01875
G1 X169.17 Y237.386 E8.04522
M73 P24 R63
G1 X168.699 Y237.562 E.01875
G1 X16.438 Y85.301 E8.02967
G2 X16.268 Y85.778 I13.45 J5.078 E.01888
G1 X168.222 Y237.732 E8.01349
G1 X167.743 Y237.9 E.01892
G1 X16.098 Y86.256 E7.99718
G1 X15.929 Y86.734 E.01891
G1 X167.264 Y238.069 E7.98087
G1 X166.786 Y238.238 E.01892
G1 X15.76 Y87.212 E7.96456
M73 P24 R62
G2 X15.596 Y87.695 I13.806 J4.958 E.01903
G1 X166.305 Y238.404 E7.94786
G1 X165.82 Y238.566 E.01907
G1 X15.434 Y88.18 E7.93084
G1 X15.271 Y88.665 E.01907
G1 X165.335 Y238.729 E7.91382
G1 X164.85 Y238.891 E.01907
G1 X15.109 Y89.15 E7.89681
G2 X14.952 Y89.639 I13.929 J4.747 E.01918
G1 X164.361 Y239.048 E7.87928
G1 X163.869 Y239.203 E.01924
G1 X14.797 Y90.131 E7.86151
G1 X14.642 Y90.623 E.01924
G1 X163.377 Y239.358 E7.84374
G1 X162.885 Y239.514 E.01924
G1 X14.486 Y91.115 E7.82598
G2 X14.336 Y91.612 I14.134 J4.547 E.01936
G1 X162.388 Y239.664 E7.8077
G1 X161.888 Y239.812 E.01942
G1 X14.188 Y92.112 E7.78917
G1 X14.04 Y92.611 E.01942
G1 X161.389 Y239.96 E7.77064
G1 X160.89 Y240.108 E.01942
G1 X13.892 Y93.11 E7.75211
G2 X13.75 Y93.615 I14.374 J4.343 E.01955
G1 X160.385 Y240.25 E7.73304
G1 X159.879 Y240.391 E.01961
G1 X13.609 Y94.121 E7.71374
G1 X13.469 Y94.628 E.01961
G1 X159.372 Y240.531 E7.69443
G1 X158.866 Y240.672 E.01961
G1 X13.328 Y95.134 E7.67512
G2 X13.193 Y95.647 I14.599 J4.118 E.01976
G1 X158.353 Y240.807 E7.65522
M73 P25 R62
G1 X157.839 Y240.94 E.01981
G1 X13.06 Y96.161 E7.63511
G1 X12.927 Y96.675 E.01981
G1 X157.325 Y241.073 E7.61501
G1 X156.811 Y241.206 E.01981
G1 X12.794 Y97.189 E7.5949
G2 X12.668 Y97.71 I14.907 J3.898 E.01998
G1 X156.29 Y241.332 E7.57412
G1 X155.768 Y241.458 E.02001
G1 X12.542 Y98.232 E7.5532
G1 X12.417 Y98.754 E.02001
G1 X155.246 Y241.583 E7.53229
G1 X154.724 Y241.708 E.02001
G1 X12.292 Y99.276 E7.51138
G1 X12.174 Y99.805 E.02023
G1 X154.195 Y241.826 E7.48965
G1 X153.665 Y241.943 E.02023
G1 X12.057 Y100.335 E7.46791
G1 X11.939 Y100.865 E.02023
G1 X153.135 Y242.061 E7.44616
M73 P25 R61
G3 X152.604 Y242.177 I-3.597 J-15.172 E.02027
G1 X11.823 Y101.396 E7.42428
G1 X11.714 Y101.933 E.02046
G1 X152.067 Y242.286 E7.40169
G1 X151.529 Y242.396 E.02046
G1 X11.604 Y102.471 E7.3791
G1 X11.495 Y103.009 E.02046
G1 X150.991 Y242.505 E7.35651
G3 X150.45 Y242.611 I-3.317 J-15.455 E.02056
G1 X11.389 Y103.55 E7.33359
G1 X11.287 Y104.096 E.02071
G1 X149.904 Y242.713 E7.31013
G1 X149.358 Y242.814 E.02071
G1 X11.186 Y104.642 E7.28668
G1 X11.085 Y105.188 E.02071
G1 X148.812 Y242.915 E7.26322
G3 X148.261 Y243.011 I-3.021 J-15.771 E.02087
G1 X10.989 Y105.739 E7.23919
G1 X10.897 Y106.294 E.02096
G1 X147.706 Y243.103 E7.21484
G1 X147.152 Y243.196 E.02096
G1 X10.804 Y106.848 E7.1905
G1 X10.711 Y107.402 E.02096
G1 X146.597 Y243.289 E7.16616
M73 P26 R61
G3 X146.035 Y243.373 I-2.726 J-16.247 E.02122
G1 X10.627 Y107.965 E7.14094
G1 X10.542 Y108.528 E.02123
G1 X145.472 Y243.458 E7.11568
G1 X144.909 Y243.542 E.02123
G1 X10.458 Y109.091 E7.09043
G2 X10.377 Y109.657 I16.196 J2.614 E.02132
G1 X144.343 Y243.623 E7.06487
G1 X143.771 Y243.698 E.02151
G1 X10.302 Y110.229 E7.03868
G1 X10.226 Y110.801 E.02151
G1 X143.199 Y243.774 E7.01249
G1 X142.627 Y243.849 E.02151
G1 X10.151 Y111.373 E6.9863
G2 X10.082 Y111.951 I16.515 J2.253 E.02173
G1 X142.049 Y243.917 E6.95941
G1 X141.468 Y243.984 E.02181
G1 X10.016 Y112.532 E6.93227
G1 X9.95 Y113.113 E.02181
G1 X140.887 Y244.05 E6.90512
G3 X140.304 Y244.114 I-2.139 J-16.663 E.02186
G1 X9.886 Y113.696 E6.87779
G1 X9.829 Y114.286 E.02212
G1 X139.714 Y244.171 E6.84965
G1 X139.123 Y244.228 E.02212
G1 X9.772 Y114.877 E6.82152
G1 X9.715 Y115.467 E.02212
G1 X138.533 Y244.285 E6.79339
G3 X137.935 Y244.334 I-1.602 J-15.679 E.02236
G1 X9.665 Y116.064 E6.76452
M73 P26 R60
G1 X9.618 Y116.664 E.02244
G1 X137.335 Y244.381 E6.73532
G1 X136.734 Y244.427 E.02247
G1 X9.57 Y117.264 E6.70613
G2 X9.526 Y117.866 I17.248 J1.585 E.02253
G1 X136.133 Y244.474 E6.67681
G3 X135.524 Y244.512 I-1.513 J-19.334 E.02276
G1 X9.488 Y118.476 E6.64665
G1 X9.451 Y119.086 E.02278
G1 X134.914 Y244.549 E6.61645
G1 X134.304 Y244.586 E.02278
G1 X9.414 Y119.696 E6.58626
G2 X9.385 Y120.314 I17.719 J1.128 E.02309
G1 X133.686 Y244.615 E6.55514
G1 X133.065 Y244.642 E.02315
G1 X9.358 Y120.935 E6.52387
M73 P27 R60
G1 X9.331 Y121.555 E.02315
G1 X132.445 Y244.669 E6.4926
G3 X131.82 Y244.691 I-.933 J-17.908 E.02334
G1 X9.309 Y122.18 E6.46075
G1 X9.293 Y122.811 E.02353
G1 X131.189 Y244.707 E6.42836
G1 X130.558 Y244.724 E.02353
G1 X9.276 Y123.442 E6.39597
G2 X9.262 Y124.075 I18.108 J.717 E.02362
G1 X129.925 Y244.738 E6.36332
G1 X129.284 Y244.743 E.02393
G1 X9.257 Y124.716 E6.32978
G1 X9.251 Y125.358 E.02393
G1 X128.642 Y244.749 E6.29624
G1 X128.001 Y244.754 E.02393
G1 X9.246 Y125.999 E6.2627
G1 X9.251 Y126.652 E.02435
G1 X127.348 Y244.749 E6.22797
G1 X126.695 Y244.743 E.02435
G1 X9.257 Y127.305 E6.19324
G1 X9.263 Y127.958 E.02435
G1 X126.042 Y244.737 E6.15851
G3 X125.379 Y244.722 I.109 J-19.013 E.02471
G1 X9.278 Y128.621 E6.12276
G1 X9.295 Y129.285 E.02479
G1 X124.715 Y244.705 E6.0868
G1 X124.05 Y244.687 E.02479
G1 X9.313 Y129.95 E6.05084
G2 X9.339 Y130.623 I19.317 J-.409 E.02512
G1 X123.377 Y244.661 E6.01396
G1 X122.7 Y244.632 E.02526
G1 X9.368 Y131.3 E5.97672
G1 X9.398 Y131.976 E.02526
G1 X122.024 Y244.602 E5.93947
G3 X121.339 Y244.564 I.736 J-19.606 E.02558
G1 X9.436 Y132.661 E5.90136
G1 X9.478 Y133.351 E.02575
G1 X120.649 Y244.522 E5.86279
G1 X119.96 Y244.48 E.02575
G1 X9.52 Y134.04 E5.82421
G2 X9.571 Y134.738 I20.028 J-1.102 E.02609
G1 X119.262 Y244.429 E5.78474
G1 X118.56 Y244.374 E.02628
G1 X9.626 Y135.44 E5.74478
M73 P27 R59
G1 X9.681 Y136.143 E.02628
G1 X117.857 Y244.319 E5.70482
G3 X117.145 Y244.254 I1.498 J-20.375 E.02667
G1 X9.746 Y136.855 E5.66385
G1 X9.815 Y137.571 E.02683
G1 X116.429 Y244.185 E5.62244
G1 X115.713 Y244.116 E.02683
G1 X9.884 Y138.287 E5.58104
M73 P28 R59
G2 X9.965 Y139.015 I20.901 J-1.949 E.02731
G1 X114.985 Y244.035 E5.5384
G1 X114.255 Y243.952 E.02741
G1 X10.048 Y139.745 E5.49549
G1 X10.131 Y140.476 E.02742
G1 X113.524 Y243.869 E5.45258
G1 X112.779 Y243.771 E.02803
G1 X10.229 Y141.221 E5.4081
G1 X10.327 Y141.966 E.02803
G1 X112.034 Y243.673 E5.36362
G3 X111.285 Y243.571 I2.547 J-21.515 E.02819
G1 X10.429 Y142.715 E5.31874
G1 X10.543 Y143.476 E.02869
G1 X110.524 Y243.457 E5.27262
G1 X109.763 Y243.343 E.02869
G1 X10.657 Y144.237 E5.22649
G2 X10.78 Y145.007 I22.085 J-3.127 E.02908
G1 X108.993 Y243.22 E5.17942
G1 X108.216 Y243.09 E.02939
G1 X10.91 Y145.784 E5.13157
G1 X11.04 Y146.562 E.02939
G1 X107.438 Y242.96 E5.08372
G3 X106.644 Y242.813 I3.494 J-21.054 E.03013
G1 X11.186 Y147.355 E5.03412
G1 X11.333 Y148.149 E.03013
G1 X105.848 Y242.664 E4.98438
G3 X105.05 Y242.513 I4.333 J-25.13 E.03028
G1 X11.487 Y148.95 E4.9342
G1 X11.652 Y149.762 E.03092
G1 X104.238 Y242.348 E4.88264
G1 X103.425 Y242.183 E.03092
G1 X11.819 Y150.577 E4.83098
G1 X12.002 Y151.406 E.03168
G1 X102.596 Y242.001 E4.77764
G1 X101.765 Y241.817 E.03176
G1 X12.184 Y152.236 E4.72416
G2 X12.376 Y153.075 I22.179 J-4.63 E.0321
G1 X100.925 Y241.624 E4.66974
G1 X100.073 Y241.42 E.03266
G1 X12.58 Y153.927 E4.61405
G2 X12.786 Y154.78 I24.376 J-5.428 E.03272
G1 X99.22 Y241.214 E4.55822
G1 X98.347 Y240.988 E.03362
G1 X13.012 Y155.653 E4.50028
G1 X13.238 Y156.526 E.03362
G1 X97.474 Y240.762 E4.44234
G3 X96.584 Y240.519 I6.524 J-25.66 E.03441
G1 X13.481 Y157.416 E4.38259
G1 X13.729 Y158.311 E.03465
G1 X95.689 Y240.271 E4.32227
G3 X94.781 Y240.01 I7.021 J-26.138 E.03524
G1 X13.99 Y159.219 E4.2606
G1 X14.262 Y160.139 E.03576
G1 X93.861 Y239.738 E4.19775
G3 X92.932 Y239.456 I7.602 J-26.73 E.0362
G1 X14.544 Y161.068 E4.13389
G1 X14.842 Y162.013 E.03696
G1 X91.987 Y239.158 E4.06833
M73 P29 R59
G3 X91.034 Y238.852 I8.283 J-27.46 E.03732
G1 X15.148 Y162.966 E4.00197
M73 P29 R58
G1 X15.473 Y163.938 E.03824
G1 X90.062 Y238.527 E3.93351
G3 X89.081 Y238.194 I9.03 J-28.192 E.0386
G1 X15.811 Y164.923 E3.86403
G1 X16.163 Y165.922 E.03951
G1 X88.079 Y237.839 E3.79262
G3 X87.068 Y237.475 I9.938 J-29.17 E.0401
G1 X16.525 Y166.932 E3.72014
G1 X16.912 Y167.966 E.04115
G1 X86.034 Y237.088 E3.64526
G3 X84.986 Y236.687 I10.961 J-30.22 E.04185
G1 X17.313 Y169.014 E3.56883
G1 X17.734 Y170.082 E.0428
G1 X83.918 Y236.266 E3.49033
G3 X82.827 Y235.823 I12.172 J-31.49 E.04391
G1 X18.177 Y171.173 E3.40941
G1 X18.635 Y172.277 E.04459
G1 X81.723 Y235.365 E3.32702
G3 X80.582 Y234.872 I13.524 J-32.829 E.04634
G1 X19.128 Y173.418 E3.24085
G2 X19.636 Y174.573 I33.396 J-13.995 E.04705
G1 X79.427 Y234.364 E3.15315
G1 X78.238 Y233.822 E.04873
G1 X20.178 Y175.762 E3.06187
G2 X20.751 Y176.982 I35.207 J-15.788 E.05027
G1 X77.018 Y233.249 E2.96731
G3 X75.773 Y232.652 I16.501 J-35.98 E.05147
G1 X21.348 Y178.226 E2.8702
G1 X21.992 Y179.517 E.05378
G1 X74.483 Y232.008 E2.7682
G3 X73.151 Y231.324 I18.944 J-38.494 E.05584
G1 X22.676 Y180.849 E2.66187
G2 X23.401 Y182.221 I39.694 J-20.09 E.05786
G1 X71.779 Y230.599 E2.55132
G3 X70.36 Y229.827 I21.389 J-41.005 E.06026
G1 X24.173 Y183.64 E2.43574
G1 X25.016 Y185.13 E.06386
G1 X68.87 Y228.984 E2.31267
G3 X67.309 Y228.07 I25.348 J-45.094 E.06744
G1 X25.93 Y186.691 E2.18218
G2 X26.925 Y188.334 I47.524 J-27.676 E.07162
G1 X65.666 Y227.075 E2.04307
G3 X63.923 Y225.979 I30.546 J-50.515 E.07679
G1 X28.021 Y190.077 E1.89333
G2 X29.244 Y191.947 I54.156 J-34.078 E.08332
G1 X62.053 Y224.756 E1.73023
G3 X60.021 Y223.371 I38.694 J-58.958 E.09171
G1 X30.629 Y193.979 E1.55003
G2 X32.27 Y196.267 I132.914 J-93.591 E.10501
G1 X57.733 Y221.73 E1.34281
G3 X55.093 Y219.737 I55.765 J-76.62 E.12336
G1 X34.263 Y198.907 E1.09848
G2 X36.967 Y202.258 I113.747 J-89.012 E.16056
G1 X51.742 Y217.033 E.77919
G3 X44.326 Y210.265 I74.897 J-89.505 E.3745
G1 X39.093 Y205.032 E.27599
; CHANGE_LAYER
; Z_HEIGHT: 0.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F6300
G1 X40.507 Y206.446 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/6
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 53
G1 X132.167 Y245.316
G1 Z.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M204 S4000
G3 X83.276 Y15.304 I-4.176 J-119.314 E9.03447
G3 X128.581 Y6.616 I44.725 J110.754 E1.2579
G3 X132.227 Y245.314 I-.59 J119.386 E10.03238
M204 S10000
G1 X132.181 Y245.717 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X132.18 Y245.716 E.00004
G3 X83.126 Y14.933 I-4.19 J-119.714 E8.41051
G3 X128.585 Y6.215 I44.876 J111.126 E1.17107
M73 P30 R58
G3 X134.269 Y245.624 I-.594 J119.786 E9.28843
G1 X132.241 Y245.714 E.05105
; WIPE_START
M204 S4000
G1 X132.18 Y245.716 E-.02308
G1 X130.242 Y245.768 E-.73692
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.325 Y242.926 Z.76 F30000
G1 X207.649 Y214.712 Z.76
G1 Z.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420226
G1 F11661.354
M204 S4000
G2 X213.636 Y208.698 I-341.585 J-346.13 E.21348
G2 X218.642 Y203.172 I-83.434 J-80.609 E.18761
G1 X205.172 Y216.642 E.47922
G3 X202.092 Y219.177 I-107.858 J-127.942 E.10035
G1 X221.177 Y200.092 E.67898
G2 X223.073 Y197.65 I-69.062 J-55.584 E.07778
G1 X199.65 Y221.073 E.83331
G3 X197.59 Y222.587 I-137.606 J-185.051 E.0643
G1 X224.587 Y195.59 E.96044
G2 X225.895 Y193.736 I-52.416 J-38.376 E.05708
G1 X195.736 Y223.895 E1.07293
G3 X194.035 Y225.051 I-33.943 J-48.141 E.05175
G1 X227.051 Y192.035 E1.17458
G2 X228.091 Y190.449 I-44.899 J-30.578 E.0477
G1 X192.449 Y226.091 E1.26798
G3 X190.954 Y227.04 I-27.95 J-42.367 E.04455
G1 X229.04 Y188.954 E1.35493
G1 X229.904 Y187.545 E.04158
G1 X189.545 Y227.904 E1.4358
G3 X188.204 Y228.699 I-23.442 J-37.995 E.03923
G1 X230.699 Y186.204 E1.51182
G2 X231.446 Y184.911 I-36.681 J-22.064 E.03758
G1 X186.911 Y229.447 E1.58442
G3 X185.657 Y230.154 I-20.86 J-35.475 E.03622
G1 X232.154 Y183.657 E1.65421
G1 X232.803 Y182.463 E.03418
G1 X184.463 Y230.803 E1.71975
G3 X183.298 Y231.422 I-18.344 J-33.104 E.03319
G1 X233.422 Y181.298 E1.78323
M73 P30 R57
G1 X234.015 Y180.16 E.03228
G1 X182.159 Y232.015 E1.84481
G3 X181.066 Y232.562 I-16.246 J-31.073 E.03076
G1 X234.562 Y179.066 E1.90318
G2 X235.096 Y177.987 I-30.656 J-15.833 E.0303
G1 X179.987 Y233.096 E1.96059
G1 X178.943 Y233.594 E.02908
G1 X235.594 Y176.943 E2.01542
G2 X236.075 Y175.916 I-29.103 J-14.269 E.02854
G1 X177.916 Y234.075 E2.0691
G1 X176.913 Y234.532 E.02772
G1 X236.532 Y174.913 E2.12102
G2 X236.97 Y173.929 I-27.965 J-13.041 E.02709
G1 X175.929 Y234.97 E2.1716
G1 X174.964 Y235.39 E.02649
G1 X237.39 Y172.964 E2.22089
G2 X237.792 Y172.016 I-26.888 J-11.958 E.02589
G1 X174.016 Y235.792 E2.26889
G1 X173.085 Y236.178 E.02537
G1 X238.178 Y171.085 E2.31576
G2 X238.549 Y170.168 I-26.104 J-11.099 E.02488
G1 X172.168 Y236.549 E2.36157
G1 X171.268 Y236.904 E.02435
G1 X238.904 Y169.268 E2.40622
G2 X239.249 Y168.377 I-25.298 J-10.314 E.02404
G1 X170.377 Y237.249 E2.4502
G1 X169.505 Y237.575 E.02341
G1 X239.575 Y167.505 E2.4928
G2 X239.898 Y166.636 I-24.701 J-9.685 E.02333
G1 X168.636 Y237.898 E2.53522
G1 X167.791 Y238.197 E.02255
G1 X240.197 Y165.791 E2.57593
G1 X240.496 Y164.946 E.02255
G1 X166.946 Y238.496 E2.61663
G3 X166.12 Y238.776 I-8.435 J-23.523 E.02193
G1 X240.776 Y164.12 E2.65597
G1 X241.051 Y163.3 E.02176
G1 X165.3 Y239.051 E2.69491
G3 X164.489 Y239.316 I-8.013 J-23.096 E.02148
G1 X241.316 Y162.489 E2.73323
G1 X241.568 Y161.692 E.02102
G1 X163.692 Y239.568 E2.77052
G1 X162.895 Y239.819 E.02102
G1 X241.819 Y160.895 E2.80782
G2 X242.051 Y160.117 I-22.105 J-7.019 E.02042
G1 X162.117 Y240.051 E2.84375
G1 X161.342 Y240.281 E.02034
G1 X242.281 Y159.342 E2.87951
G2 X242.504 Y158.573 I-21.976 J-6.796 E.02014
G1 X160.573 Y240.504 E2.9148
G1 X159.817 Y240.713 E.01971
G1 X242.713 Y157.817 E2.94912
G1 X242.923 Y157.062 E.01971
G1 X159.062 Y240.923 E2.98343
G3 X158.32 Y241.12 I-5.989 J-21.105 E.01932
G1 X243.12 Y156.32 E3.01684
G1 X243.31 Y155.584 E.01913
G1 X157.584 Y241.31 E3.0498
G1 X156.848 Y241.5 E.01913
G1 X243.5 Y154.848 E3.08276
G2 X243.674 Y154.128 I-20.634 J-5.359 E.01861
G1 X156.128 Y241.674 E3.11453
G1 X155.41 Y241.846 E.01858
G1 X243.846 Y153.41 E3.14621
G2 X244.017 Y152.694 I-20.483 J-5.251 E.01852
G1 X154.694 Y242.017 E3.17775
G1 X153.993 Y242.172 E.01807
G1 X244.172 Y151.993 E3.20822
G1 X244.327 Y151.292 E.01807
G1 X153.292 Y242.327 E3.2387
G3 X152.594 Y242.479 I-4.703 J-19.938 E.01796
G1 X244.479 Y150.594 E3.26891
G1 X244.619 Y149.909 E.01759
G1 X151.909 Y242.619 E3.29824
G1 X151.224 Y242.758 E.01759
G1 X244.758 Y149.224 E3.32757
G2 X244.893 Y148.543 I-19.45 J-4.222 E.01747
G1 X150.543 Y242.893 E3.35663
G1 X149.873 Y243.018 E.01714
G1 X245.018 Y147.873 E3.38488
G1 X245.142 Y147.203 E.01714
G1 X149.203 Y243.142 E3.41313
G3 X148.536 Y243.263 I-3.798 J-19.008 E.01705
G1 X245.263 Y146.536 E3.44116
G1 X245.373 Y145.881 E.01672
G1 X147.881 Y243.373 E3.46838
G1 X147.225 Y243.482 E.01672
G1 X245.482 Y145.225 E3.4956
G2 X245.591 Y144.571 I-18.727 J-3.443 E.01669
G1 X146.571 Y243.591 E3.52274
G1 X145.929 Y243.687 E.01632
G1 X245.687 Y143.93 E3.54898
G1 X245.783 Y143.288 E.01632
G1 X145.288 Y243.783 E3.57521
G1 X144.646 Y243.879 E.01632
G1 X245.879 Y142.646 E3.60145
G2 X245.963 Y142.016 I-18.146 J-2.75 E.01599
G1 X144.016 Y243.963 E3.62687
G1 X143.388 Y244.046 E.01595
G1 X246.046 Y141.388 E3.65217
G1 X246.128 Y140.759 E.01595
G1 X142.759 Y244.128 E3.67747
M73 P31 R57
G3 X142.138 Y244.204 I-2.463 J-17.738 E.01573
G1 X246.204 Y140.138 E3.70224
G1 X246.274 Y139.522 E.01559
G1 X141.522 Y244.274 E3.72664
G1 X140.907 Y244.344 E.01559
G1 X246.344 Y138.907 E3.75105
G2 X246.411 Y138.294 I-17.557 J-2.235 E.01551
G1 X140.294 Y244.411 E3.77525
G1 X139.69 Y244.469 E.01526
G1 X246.469 Y137.69 E3.7988
G1 X246.527 Y137.086 E.01526
G1 X139.086 Y244.527 E3.82235
G1 X138.482 Y244.586 E.01526
G1 X246.585 Y136.482 E3.8459
G2 X246.634 Y135.888 I-16.916 J-1.684 E.015
G1 X137.89 Y244.632 E3.86871
G1 X137.3 Y244.676 E.01488
G1 X246.681 Y135.295 E3.89135
G1 X246.727 Y134.703 E.01495
G1 X136.71 Y244.72 E3.914
G1 X136.12 Y244.765 E.01488
G1 X246.77 Y134.114 E3.93651
G1 X246.806 Y133.533 E.01465
G1 X135.533 Y244.806 E3.95866
G1 X134.952 Y244.841 E.01465
G1 X246.841 Y132.952 E3.98061
G1 X246.877 Y132.37 E.01465
G1 X134.37 Y244.877 E4.00255
G3 X133.797 Y244.905 I-1.075 J-16.445 E.01444
G1 X246.905 Y131.797 E4.02392
G1 X246.929 Y131.226 E.01437
G1 X133.226 Y244.929 E4.04511
G1 X132.656 Y244.954 E.01437
G1 X246.954 Y130.656 E4.0663
G2 X246.978 Y130.086 I-16.357 J-.965 E.01434
G1 X132.086 Y244.978 E4.0874
G1 X131.526 Y244.993 E.0141
G1 X246.993 Y129.526 E4.10786
G1 X247.007 Y128.966 E.0141
G1 X130.966 Y245.007 E4.12831
G1 X130.405 Y245.022 E.0141
G1 X247.022 Y128.405 E4.14877
G2 X247.033 Y127.849 I-15.956 J-.581 E.014
G1 X129.849 Y245.033 E4.16894
G1 X129.298 Y245.037 E.01385
G1 X247.037 Y127.298 E4.1887
G1 X247.042 Y126.748 E.01385
G1 X128.748 Y245.042 E4.20845
G1 X128.197 Y245.047 E.01385
G1 X247.047 Y126.197 E4.22821
G2 X247.046 Y125.653 I-15.633 J-.235 E.0137
G1 X127.653 Y245.046 E4.24753
G1 X127.112 Y245.041 E.01361
G1 X247.041 Y125.112 E4.26661
G1 X247.036 Y124.571 E.01361
G1 X126.571 Y245.036 E4.28569
G1 X126.03 Y245.032 E.01361
G1 X247.032 Y124.03 E4.30477
G2 X247.019 Y123.496 I-15.321 J.08 E.01343
G1 X125.496 Y245.019 E4.32333
M73 P31 R56
G1 X124.964 Y245.006 E.01338
G1 X247.006 Y122.964 E4.34175
G1 X246.992 Y122.433 E.01338
G1 X124.433 Y244.992 E4.36017
G1 X123.901 Y244.978 E.01338
G1 X246.978 Y121.901 E4.3786
G2 X246.956 Y121.377 I-14.988 J.364 E.01319
G1 X123.377 Y244.956 E4.39645
G1 X122.854 Y244.933 E.01317
G1 X246.933 Y120.854 E4.41425
G1 X246.91 Y120.331 E.01317
G1 X122.331 Y244.91 E4.43204
G1 X121.808 Y244.887 E.01317
G1 X246.887 Y119.808 E4.44983
G2 X246.856 Y119.293 I-14.731 J.623 E.01298
G1 X121.293 Y244.856 E4.46705
G1 X120.779 Y244.825 E.01296
G1 X246.825 Y118.779 E4.48422
G1 X246.794 Y118.265 E.01296
G1 X120.265 Y244.794 E4.5014
G1 X119.751 Y244.762 E.01296
G1 X246.762 Y117.751 E4.51858
G2 X246.723 Y117.244 I-14.569 J.865 E.01279
G1 X119.244 Y244.723 E4.53522
G1 X118.738 Y244.683 E.01277
G1 X246.683 Y116.738 E4.55181
G1 X246.644 Y116.232 E.01277
G1 X118.232 Y244.644 E4.56839
G1 X117.726 Y244.604 E.01277
G1 X246.604 Y115.726 E4.58497
G2 X246.557 Y115.227 I-14.293 J1.073 E.01262
G1 X117.227 Y244.557 E4.60109
G1 X116.729 Y244.509 E.01258
G1 X246.51 Y114.729 E4.6171
G1 X246.462 Y114.231 E.01258
G1 X116.231 Y244.462 E4.6331
G1 X115.733 Y244.414 E.01258
G1 X246.414 Y113.733 E4.6491
G2 X246.361 Y113.24 I-14.147 J1.273 E.01247
G1 X115.24 Y244.361 E4.66475
G1 X114.751 Y244.305 E.0124
G1 X246.305 Y112.751 E4.68019
G1 X246.249 Y112.261 E.0124
G1 X114.261 Y244.249 E4.69563
G1 X113.771 Y244.193 E.0124
G1 X246.193 Y111.771 E4.71108
G2 X246.134 Y111.284 I-13.954 J1.448 E.01233
G1 X113.284 Y244.134 E4.72629
G1 X112.802 Y244.071 E.01224
G1 X246.071 Y110.802 E4.74118
G1 X246.007 Y110.32 E.01224
G1 X112.32 Y244.007 E4.75608
G1 X111.837 Y243.944 E.01224
G1 X245.944 Y109.837 E4.77098
G2 X245.879 Y109.356 I-13.844 J1.616 E.01221
G1 X111.356 Y243.879 E4.78579
G1 X110.882 Y243.808 E.01208
G1 X245.808 Y108.882 E4.80016
G1 X245.737 Y108.407 E.01208
G1 X110.407 Y243.737 E4.81452
M73 P32 R56
G1 X109.932 Y243.666 E.01208
G1 X245.666 Y107.932 E4.82889
G1 X245.595 Y107.457 E.01208
G1 X109.457 Y243.595 E4.84326
G3 X108.988 Y243.518 I1.975 J-13.487 E.01195
G1 X245.518 Y106.988 E4.8572
G1 X245.44 Y106.521 E.01192
G1 X108.521 Y243.44 E4.87104
G1 X108.053 Y243.362 E.01192
G1 X245.362 Y106.053 E4.88489
G1 X245.283 Y105.586 E.01192
G1 X107.586 Y243.283 E4.89874
G3 X107.122 Y243.202 I2.098 J-13.331 E.01186
G1 X245.202 Y105.122 E4.91236
G1 X245.117 Y104.661 E.01178
G1 X106.661 Y243.117 E4.92571
G1 X106.201 Y243.031 E.01178
G1 X245.031 Y104.201 E4.93905
G1 X244.946 Y103.74 E.01178
G1 X105.74 Y242.946 E4.95239
G1 X105.28 Y242.861 E.01178
G1 X244.861 Y103.28 E4.96573
G1 X244.768 Y102.827 E.01164
G1 X104.827 Y242.768 E4.97858
G1 X104.373 Y242.676 E.01164
G1 X244.676 Y102.373 E4.99143
G1 X244.584 Y101.92 E.01164
G1 X103.92 Y242.584 E5.00428
G1 X103.466 Y242.492 E.01164
G1 X244.492 Y101.466 E5.01713
G2 X244.396 Y101.016 I-12.967 J2.524 E.01157
G1 X103.016 Y242.396 E5.02973
G1 X102.57 Y242.297 E.01151
G1 X244.297 Y100.57 E5.0421
G1 X244.198 Y100.123 E.01151
G1 X102.123 Y242.198 E5.05447
G1 X101.676 Y242.099 E.01151
G1 X244.099 Y99.676 E5.06684
G1 X244 Y99.229 E.01151
G1 X101.229 Y242 E5.07921
G1 X100.789 Y241.894 E.01139
G1 X243.894 Y98.789 E5.09112
G1 X243.789 Y98.349 E.01139
G1 X100.349 Y241.788 E5.10301
G1 X99.909 Y241.683 E.01139
G1 X243.683 Y97.909 E5.11491
G1 X243.577 Y97.469 E.01139
G1 X99.469 Y241.577 E5.12681
G3 X99.031 Y241.469 I2.891 J-12.634 E.01134
G1 X243.469 Y97.031 E5.13853
G1 X243.357 Y96.598 E.01127
G1 X98.598 Y241.357 E5.14997
G1 X98.164 Y241.245 E.01127
G1 X243.245 Y96.164 E5.1614
G1 X243.133 Y95.731 E.01127
G1 X97.731 Y241.133 E5.17284
G1 X97.297 Y241.02 E.01127
G1 X243.02 Y95.297 E5.18427
G2 X242.904 Y94.868 I-12.354 J3.137 E.01118
G1 X96.868 Y240.904 E5.19537
G1 X96.441 Y240.785 E.01115
G1 X242.785 Y94.441 E5.20636
G1 X242.667 Y94.014 E.01115
G1 X96.014 Y240.667 E5.21734
G1 X95.586 Y240.548 E.01115
G1 X242.548 Y93.587 E5.22833
M73 P32 R55
G2 X242.429 Y93.16 I-12.273 J3.187 E.01115
G1 X95.16 Y240.429 E5.23928
G1 X94.739 Y240.305 E.01105
G1 X242.305 Y92.739 E5.24982
G1 X242.18 Y92.318 E.01105
G1 X94.318 Y240.18 E5.26037
G1 X93.897 Y240.055 E.01105
G1 X242.055 Y91.897 E5.27091
G1 X241.93 Y91.476 E.01105
G1 X93.476 Y239.93 E5.28145
G3 X93.057 Y239.804 I3.42 J-12.063 E.01101
G1 X241.804 Y91.057 E5.29185
G1 X241.673 Y90.642 E.01094
G1 X92.642 Y239.673 E5.30195
G1 X92.227 Y239.542 E.01094
G1 X241.542 Y90.227 E5.31206
G1 X241.411 Y89.812 E.01094
G1 X91.812 Y239.411 E5.32217
G1 X91.397 Y239.28 E.01094
G1 X241.28 Y89.397 E5.33227
G2 X241.146 Y88.985 I-11.824 J3.626 E.01089
G1 X90.985 Y239.146 E5.34214
G1 X90.576 Y239.009 E.01085
G1 X241.009 Y88.576 E5.35182
G1 X240.873 Y88.168 E.01085
G1 X90.167 Y238.873 E5.3615
G1 X89.759 Y238.736 E.01085
G1 X240.736 Y87.759 E5.37118
G1 X240.599 Y87.35 E.01085
G1 X89.35 Y238.599 E5.38086
M73 P33 R55
G3 X88.945 Y238.458 I3.832 J-11.635 E.01078
G1 X240.458 Y86.945 E5.39024
G1 X240.315 Y86.542 E.01076
G1 X88.542 Y238.315 E5.3995
G1 X88.139 Y238.172 E.01075
G1 X240.172 Y86.139 E5.40876
G1 X240.03 Y85.736 E.01076
G1 X87.736 Y238.03 E5.41802
G1 X87.333 Y237.887 E.01076
G1 X239.887 Y85.333 E5.42728
G2 X239.739 Y84.935 I-11.376 J3.999 E.01068
G1 X86.935 Y237.739 E5.43618
G1 X86.538 Y237.591 E.01067
G1 X239.591 Y84.538 E5.44502
G1 X239.442 Y84.141 E.01067
G1 X86.141 Y237.442 E5.45387
G1 X85.743 Y237.294 E.01067
G1 X239.294 Y83.743 E5.46272
G1 X239.145 Y83.346 E.01067
G1 X85.346 Y237.145 E5.47157
G1 X84.955 Y236.991 E.01059
G1 X238.991 Y82.955 E5.48002
G1 X238.837 Y82.563 E.01059
G1 X84.563 Y236.837 E5.48846
G1 X84.172 Y236.683 E.01059
G1 X238.683 Y82.172 E5.4969
G1 X238.528 Y81.78 E.01059
G1 X83.78 Y236.528 E5.50535
G3 X83.389 Y236.374 I4.185 J-11.177 E.01058
G1 X238.374 Y81.389 E5.51377
G1 X238.214 Y81.003 E.01051
G1 X83.003 Y236.214 E5.52181
G1 X82.617 Y236.054 E.01051
G1 X238.054 Y80.617 E5.52986
G1 X237.894 Y80.231 E.01051
G1 X82.231 Y235.894 E5.5379
G1 X81.845 Y235.735 E.01051
G1 X237.735 Y79.845 E5.54594
G2 X237.574 Y79.46 I-10.807 J4.265 E.0105
G1 X81.46 Y235.574 E5.55396
G1 X81.079 Y235.409 E.01043
G1 X237.409 Y79.079 E5.5616
G1 X237.244 Y78.699 E.01043
G1 X80.699 Y235.244 E5.56925
G1 X80.319 Y235.078 E.01043
G1 X237.078 Y78.319 E5.5769
G1 X236.913 Y77.938 E.01043
G1 X79.938 Y234.913 E5.58455
G3 X79.558 Y234.747 I4.499 J-10.839 E.01043
G1 X236.747 Y77.558 E5.59217
G1 X236.576 Y77.183 E.01036
G1 X79.183 Y234.576 E5.59943
G1 X78.808 Y234.405 E.01036
G1 X236.405 Y76.808 E5.60669
G1 X236.235 Y76.434 E.01036
G1 X78.434 Y234.235 E5.61395
G1 X78.059 Y234.064 E.01036
G1 X236.064 Y76.059 E5.62121
G1 X235.893 Y75.684 E.01036
G1 X77.684 Y233.893 E5.62846
G1 X77.314 Y233.717 E.0103
G1 X235.717 Y75.314 E5.63534
G1 X235.54 Y74.945 E.0103
G1 X76.945 Y233.54 E5.64222
G1 X76.575 Y233.364 E.0103
G1 X235.364 Y74.575 E5.64909
G1 X235.188 Y74.206 E.0103
G1 X76.206 Y233.188 E5.65597
G1 X75.836 Y233.012 E.0103
G1 X235.012 Y73.836 E5.66284
G2 X234.83 Y73.472 I-10.386 J4.936 E.01024
G1 X75.472 Y232.83 E5.66936
G1 X75.108 Y232.649 E.01024
G1 X234.649 Y73.108 E5.67586
G1 X234.467 Y72.744 E.01024
G1 X74.744 Y232.467 E5.68235
M73 P33 R54
G1 X74.379 Y232.286 E.01024
G1 X234.286 Y72.379 E5.68885
G1 X234.104 Y72.015 E.01024
G1 X74.015 Y232.104 E5.69535
G3 X73.655 Y231.918 I5.136 J-10.38 E.01019
G1 X233.918 Y71.655 E5.70153
G1 X233.731 Y71.297 E.01018
G1 X73.296 Y231.731 E5.70765
G1 X72.938 Y231.545 E.01018
G1 X233.545 Y70.938 E5.71377
M73 P34 R54
G1 X233.358 Y70.579 E.01018
G1 X72.579 Y231.358 E5.7199
G1 X72.22 Y231.171 E.01018
G1 X233.171 Y70.22 E5.72602
G2 X232.981 Y69.865 I-10.33 J5.308 E.01014
G1 X71.865 Y230.981 E5.73188
G1 X71.511 Y230.788 E.01012
G1 X232.788 Y69.511 E5.73763
G1 X232.596 Y69.157 E.01012
G1 X71.157 Y230.596 E5.74338
G1 X70.803 Y230.404 E.01012
G1 X232.404 Y68.803 E5.74914
G1 X232.212 Y68.45 E.01012
G1 X70.45 Y230.212 E5.75489
G3 X70.099 Y230.018 I5.39 J-10.125 E.0101
G1 X232.018 Y68.099 E5.76044
G1 X231.82 Y67.75 E.01007
G1 X69.75 Y229.82 E5.76583
G1 X69.402 Y229.623 E.01007
G1 X231.623 Y67.402 E5.77121
G1 X231.426 Y67.053 E.01007
G1 X69.053 Y229.426 E5.77659
G1 X68.705 Y229.229 E.01007
G1 X231.229 Y66.705 E5.78198
G2 X231.03 Y66.358 I-10.037 J5.527 E.01006
G1 X68.358 Y229.03 E5.78724
G1 X68.014 Y228.828 E.01003
G1 X230.828 Y66.014 E5.79226
G1 X230.625 Y65.671 E.01003
G1 X67.671 Y228.625 E5.79728
G1 X67.328 Y228.423 E.01003
G1 X230.423 Y65.328 E5.8023
G1 X230.221 Y64.984 E.01003
G1 X66.984 Y228.221 E5.80732
G3 X66.641 Y228.018 I5.648 J-9.931 E.01002
G1 X230.018 Y64.641 E5.8123
G1 X229.81 Y64.303 E.00998
G1 X66.303 Y227.81 E5.81696
G1 X65.965 Y227.603 E.00998
G1 X229.603 Y63.965 E5.82162
G1 X229.396 Y63.626 E.00998
G1 X65.626 Y227.396 E5.82628
G1 X65.288 Y227.188 E.00998
G1 X229.188 Y63.288 E5.83094
G1 X228.981 Y62.949 E.00998
G1 X64.949 Y226.981 E5.8356
G3 X64.616 Y226.769 I5.92 J-9.698 E.00995
G1 X228.769 Y62.616 E5.83994
G1 X228.557 Y62.282 E.00994
G1 X64.282 Y226.557 E5.84425
G1 X63.949 Y226.344 E.00994
G1 X228.344 Y61.949 E5.84855
G1 X228.132 Y61.616 E.00994
G1 X63.616 Y226.132 E5.85286
G1 X63.282 Y225.92 E.00994
G1 X227.92 Y61.282 E5.85716
G2 X227.704 Y60.952 I-9.594 J6.028 E.00992
G1 X62.952 Y225.704 E5.86124
G1 X62.624 Y225.487 E.00991
G1 X227.487 Y60.624 E5.86519
G1 X227.269 Y60.295 E.00991
G1 X62.295 Y225.269 E5.86914
G1 X61.967 Y225.052 E.00991
G1 X227.052 Y59.967 E5.87309
G1 X226.835 Y59.638 E.00991
G1 X61.638 Y224.835 E5.87704
G3 X61.312 Y224.616 I6.123 J-9.48 E.00989
G1 X226.616 Y59.312 E5.88086
G1 X226.393 Y58.988 E.00987
G1 X60.988 Y224.393 E5.88446
G1 X60.665 Y224.171 E.00987
G1 X226.171 Y58.665 E5.88806
G1 X225.949 Y58.342 E.00987
G1 X60.342 Y223.949 E5.89166
G1 X60.018 Y223.726 E.00987
G1 X225.726 Y58.018 E5.89526
G2 X225.504 Y57.695 I-9.174 J6.083 E.00987
G1 X59.695 Y223.504 E5.89883
G1 X59.376 Y223.277 E.00984
G1 X225.277 Y57.377 E5.90208
G1 X225.049 Y57.058 E.00984
G1 X59.058 Y223.049 E5.90533
M73 P35 R54
G1 X58.739 Y222.822 E.00984
G1 X224.822 Y56.739 E5.90858
G1 X224.595 Y56.421 E.00984
G1 X58.421 Y222.595 E5.91183
G1 X58.102 Y222.368 E.00984
G1 X224.368 Y56.102 E5.91508
M73 P35 R53
G2 X224.137 Y55.788 I-9.156 J6.473 E.00982
G1 X57.788 Y222.137 E5.91806
G1 X57.474 Y221.905 E.00982
G1 X223.905 Y55.474 E5.92096
G1 X223.673 Y55.16 E.00982
G1 X57.16 Y221.673 E5.92386
G1 X56.847 Y221.441 E.00982
G1 X223.441 Y54.847 E5.92677
G1 X223.208 Y54.533 E.00982
G1 X56.533 Y221.208 E5.92967
G3 X56.222 Y220.974 I5.378 J-7.454 E.0098
G1 X222.974 Y54.221 E5.9324
G1 X222.737 Y53.913 E.00979
G1 X55.914 Y220.736 E5.93492
G1 X55.606 Y220.498 E.00979
G1 X222.5 Y53.604 E5.93744
G1 X222.263 Y53.295 E.00979
G1 X55.299 Y220.26 E5.93996
G1 X54.991 Y220.022 E.00979
G1 X222.027 Y52.986 E5.94248
G2 X221.789 Y52.678 I-8.969 J6.659 E.00979
G1 X54.683 Y219.784 E5.94498
G1 X54.375 Y219.546 E.00979
G1 X221.547 Y52.374 E5.94733
G1 X221.306 Y52.07 E.00977
G1 X54.07 Y219.306 E5.94959
G1 X53.766 Y219.064 E.00977
G1 X221.064 Y51.766 E5.95181
G1 X220.822 Y51.462 E.00977
G1 X53.462 Y218.822 E5.95402
G1 X53.158 Y218.58 E.00977
G1 X220.58 Y51.158 E5.95623
G2 X220.335 Y50.858 I-8.709 J6.864 E.00976
G1 X52.858 Y218.335 E5.95819
G1 X52.559 Y218.088 E.00975
G1 X220.088 Y50.559 E5.96006
G1 X219.842 Y50.259 E.00975
G1 X52.259 Y217.842 E5.96193
G1 X51.96 Y217.595 E.00975
G1 X219.595 Y49.96 E5.9638
G1 X219.349 Y49.661 E.00975
G1 X51.661 Y217.349 E5.96566
G3 X51.364 Y217.1 I6.963 J-8.634 E.00975
G1 X219.1 Y49.364 E5.9674
G1 X218.849 Y49.07 E.00974
G1 X51.07 Y216.849 E5.96893
G1 X50.775 Y216.597 E.00974
G1 X218.597 Y48.775 E5.97046
G1 X218.346 Y48.481 E.00974
G1 X50.481 Y216.346 E5.97199
G1 X50.187 Y216.095 E.00974
G1 X218.095 Y48.187 E5.97351
G1 X217.843 Y47.892 E.00974
G1 X49.892 Y215.843 E5.97504
G1 X49.603 Y215.587 E.00973
G1 X217.587 Y47.603 E5.97622
G1 X217.331 Y47.313 E.00973
G1 X49.313 Y215.331 E5.97741
G1 X49.024 Y215.075 E.00973
G1 X217.075 Y47.024 E5.9786
G1 X216.818 Y46.734 E.00973
G1 X48.734 Y214.818 E5.97979
G1 X48.445 Y214.562 E.00973
G1 X216.562 Y46.445 E5.98097
G2 X216.303 Y46.158 I-8.308 J7.257 E.00972
G1 X48.158 Y214.303 E5.98194
G1 X47.873 Y214.042 E.00972
G1 X216.042 Y45.873 E5.98279
G1 X215.781 Y45.588 E.00972
G1 X47.588 Y213.781 E5.98364
G1 X47.304 Y213.52 E.00972
G1 X215.52 Y45.304 E5.98449
M73 P36 R53
G1 X215.259 Y45.019 E.00972
G1 X47.019 Y213.259 E5.98533
G3 X46.735 Y212.997 I7.354 J-8.237 E.00972
G1 X214.997 Y44.735 E5.98609
G1 X214.731 Y44.455 E.00971
G1 X46.455 Y212.731 E5.9866
G1 X46.175 Y212.465 E.00971
G1 X214.466 Y44.175 E5.98711
G1 X214.2 Y43.895 E.00971
G1 X45.895 Y212.2 E5.98762
G1 X45.615 Y211.934 E.00971
G1 X213.934 Y43.615 E5.98813
G1 X213.668 Y43.335 E.00971
G1 X45.335 Y211.668 E5.98864
G3 X45.059 Y211.398 I7.663 J-8.106 E.00971
G1 X213.398 Y43.06 E5.98885
G1 X213.128 Y42.784 E.00971
G1 X44.784 Y211.128 E5.98901
G1 X44.509 Y210.857 E.00971
G1 X212.857 Y42.509 E5.98918
G1 X212.587 Y42.234 E.00971
G1 X44.234 Y210.587 E5.98935
M73 P36 R52
G1 X43.959 Y210.316 E.00971
G1 X212.316 Y41.959 E5.98952
G2 X212.044 Y41.686 I-7.974 J7.7 E.00971
G1 X43.686 Y210.044 E5.98952
G1 X43.415 Y209.768 E.00971
G1 X211.768 Y41.415 E5.98935
G1 X211.493 Y41.145 E.00971
G1 X43.145 Y209.493 E5.98919
G1 X42.874 Y209.218 E.00971
G1 X211.218 Y40.874 E5.98902
G1 X210.943 Y40.604 E.00971
G1 X42.604 Y208.943 E5.98885
G3 X42.334 Y208.667 I7.826 J-7.931 E.00971
G1 X210.667 Y40.334 E5.98864
G1 X210.387 Y40.068 E.00971
G1 X42.068 Y208.387 E5.98813
G1 X41.802 Y208.107 E.00971
G1 X210.107 Y39.802 E5.98762
G1 X209.827 Y39.537 E.00971
G1 X41.537 Y207.827 E5.98711
G1 X41.271 Y207.547 E.00971
G1 X209.547 Y39.271 E5.98661
G1 X209.267 Y39.005 E.00971
G1 X41.005 Y207.267 E5.9861
G3 X40.743 Y206.983 I7.956 J-7.623 E.00972
G1 X208.983 Y38.743 E5.98534
G1 X208.699 Y38.482 E.00972
G1 X40.482 Y206.699 E5.98449
G1 X40.221 Y206.414 E.00972
G1 X208.414 Y38.221 E5.98365
G1 X208.129 Y37.96 E.00972
G1 X39.96 Y206.129 E5.9828
G1 X39.699 Y205.844 E.00972
G1 X207.844 Y37.699 E5.98195
G2 X207.558 Y37.44 I-7.551 J8.056 E.00972
G1 X39.44 Y205.558 E5.98098
G1 X39.184 Y205.268 E.00973
G1 X207.268 Y37.184 E5.9798
G1 X206.979 Y36.927 E.00973
G1 X38.927 Y204.979 E5.97861
G1 X38.671 Y204.689 E.00973
G1 X206.689 Y36.671 E5.97742
G1 X206.4 Y36.415 E.00973
G1 X38.415 Y204.4 E5.97623
G1 X38.159 Y204.11 E.00973
G1 X206.11 Y36.159 E5.97505
G1 X205.816 Y35.907 E.00974
G1 X37.907 Y203.816 E5.97353
G1 X37.656 Y203.521 E.00974
G1 X205.521 Y35.656 E5.972
G1 X205.227 Y35.405 E.00974
G1 X37.405 Y203.227 E5.97047
G1 X37.153 Y202.933 E.00974
G1 X204.933 Y35.153 E5.96894
G1 X204.638 Y34.902 E.00974
G1 X36.902 Y202.638 E5.96741
M73 P37 R52
G3 X36.654 Y202.34 I6.881 J-5.976 E.00975
G1 X204.341 Y34.653 E5.96566
G1 X204.042 Y34.407 E.00975
G1 X36.408 Y202.04 E5.96375
G1 X36.163 Y201.74 E.00976
G1 X203.743 Y34.16 E5.96184
G1 X203.444 Y33.914 E.00975
G1 X35.917 Y201.44 E5.95994
G1 X35.672 Y201.14 E.00976
G1 X203.145 Y33.667 E5.95803
G2 X202.844 Y33.422 I-7.191 J8.495 E.00976
G1 X35.426 Y200.84 E5.95608
G1 X35.181 Y200.539 E.00976
G1 X202.54 Y33.18 E5.954
G1 X202.236 Y32.938 E.00977
G1 X34.938 Y200.236 E5.95182
G1 X34.696 Y199.932 E.00977
G1 X201.932 Y32.696 E5.94961
G1 X201.628 Y32.455 E.00977
G1 X34.455 Y199.628 E5.9474
G1 X34.213 Y199.324 E.00977
G1 X201.324 Y32.213 E5.94519
G2 X201.016 Y31.975 I-7.043 J8.827 E.00979
G1 X33.975 Y199.016 E5.94266
G1 X33.738 Y198.707 E.00979
G1 X200.707 Y31.738 E5.94011
G1 X200.399 Y31.501 E.00979
G1 X33.501 Y198.399 E5.93755
G1 X33.265 Y198.09 E.00979
G1 X200.09 Y31.265 E5.935
G1 X199.781 Y31.028 E.00979
G1 X33.028 Y197.781 E5.93244
G3 X32.794 Y197.469 I7.24 J-5.662 E.00981
G1 X199.47 Y30.793 E5.92967
G1 X199.156 Y30.561 E.00982
G1 X32.563 Y197.154 E5.92673
G1 X32.332 Y196.839 E.00982
G1 X198.842 Y30.329 E5.92379
M73 P37 R51
G1 X198.529 Y30.097 E.00982
G1 X32.101 Y196.525 E5.92085
G1 X31.87 Y196.21 E.00982
G1 X198.215 Y29.865 E5.91791
G2 X197.9 Y29.634 I-6.75 J8.871 E.00982
G1 X31.639 Y195.895 E5.91493
G1 X31.408 Y195.581 E.00982
G1 X197.582 Y29.407 E5.91182
G1 X197.263 Y29.18 E.00984
G1 X31.18 Y195.263 E5.9086
G1 X30.952 Y194.945 E.00984
G1 X196.945 Y28.952 E5.90535
G1 X196.626 Y28.725 E.00984
G1 X30.725 Y194.626 E5.90211
G1 X30.498 Y194.307 E.00984
G1 X196.308 Y28.498 E5.89886
G2 X195.984 Y28.275 I-6.533 J9.133 E.00987
G1 X30.275 Y193.984 E5.89529
G1 X30.053 Y193.661 E.00987
G1 X195.661 Y28.053 E5.89169
G1 X195.338 Y27.831 E.00987
G1 X29.831 Y193.338 E5.88809
G1 X29.608 Y193.014 E.00987
G1 X195.014 Y27.609 E5.88449
G1 X194.691 Y27.386 E.00987
G1 X29.386 Y192.691 E5.88089
G3 X29.167 Y192.364 I9.212 J-6.419 E.00989
G1 X194.364 Y27.167 E5.87707
G1 X194.036 Y26.95 E.00991
G1 X28.95 Y192.036 E5.87312
G1 X28.732 Y191.707 E.00991
G1 X193.707 Y26.732 E5.86917
G1 X193.379 Y26.515 E.00991
G1 X28.515 Y191.379 E5.86522
G1 X28.298 Y191.051 E.00991
G1 X193.051 Y26.298 E5.86127
G2 X192.72 Y26.082 I-6.319 J9.317 E.00992
G1 X28.082 Y190.72 E5.85719
G1 X27.87 Y190.387 E.00994
G1 X192.387 Y25.87 E5.85289
M73 P38 R51
G1 X192.054 Y25.657 E.00994
G1 X27.657 Y190.054 E5.84859
G1 X27.445 Y189.72 E.00994
G1 X191.72 Y25.445 E5.84428
G1 X191.387 Y25.233 E.00994
G1 X27.233 Y189.387 E5.83998
G3 X27.021 Y189.053 I9.408 J-6.205 E.00995
G1 X191.053 Y25.021 E5.83564
G1 X190.715 Y24.813 E.00998
G1 X26.813 Y188.715 E5.83098
G1 X26.606 Y188.376 E.00998
G1 X190.376 Y24.606 E5.82632
G1 X190.038 Y24.399 E.00998
G1 X26.399 Y188.038 E5.82166
G1 X26.191 Y187.7 E.00998
G1 X189.7 Y24.191 E5.817
G1 X189.361 Y23.984 E.00998
G1 X25.984 Y187.361 E5.81233
G3 X25.781 Y187.019 I9.713 J-5.984 E.01002
G1 X189.019 Y23.781 E5.80736
G1 X188.675 Y23.579 E.01003
G1 X25.579 Y186.675 E5.80234
G1 X25.376 Y186.332 E.01003
G1 X188.332 Y23.376 E5.79732
G1 X187.988 Y23.174 E.01003
G1 X25.174 Y185.988 E5.7923
G1 X24.972 Y185.645 E.01003
G1 X187.645 Y22.972 E5.78728
G2 X187.298 Y22.773 I-5.87 J9.828 E.01006
G1 X24.773 Y185.298 E5.78202
G1 X24.576 Y184.95 E.01007
G1 X186.95 Y22.576 E5.77664
G1 X186.601 Y22.378 E.01007
G1 X24.378 Y184.601 E5.77125
G1 X24.181 Y184.252 E.01007
G1 X186.252 Y22.181 E5.76587
G1 X185.904 Y21.984 E.01007
G1 X23.984 Y183.904 E5.76048
G3 X23.789 Y183.553 I9.962 J-5.761 E.0101
G1 X185.553 Y21.789 E5.75493
G1 X185.199 Y21.597 E.01012
G1 X23.597 Y183.199 E5.74918
G1 X23.405 Y182.846 E.01012
G1 X184.846 Y21.405 E5.74343
G1 X184.492 Y21.213 E.01012
G1 X23.213 Y182.492 E5.73768
G1 X23.021 Y182.138 E.01012
G1 X184.138 Y21.021 E5.73193
G2 X183.783 Y20.83 I-5.666 J10.14 E.01014
G1 X22.83 Y181.783 E5.72607
G1 X22.644 Y181.424 E.01018
G1 X183.424 Y20.644 E5.71994
G1 X183.065 Y20.457 E.01018
G1 X22.457 Y181.065 E5.71382
M73 P38 R50
G1 X22.27 Y180.706 E.01018
G1 X182.706 Y20.27 E5.7077
G1 X182.347 Y20.083 E.01018
G1 X22.083 Y180.347 E5.70158
G3 X21.897 Y179.988 I10.156 J-5.479 E.01019
G1 X181.988 Y19.897 E5.6954
G1 X181.624 Y19.716 E.01024
G1 X21.716 Y179.623 E5.6889
G1 X21.534 Y179.259 E.01024
G1 X181.259 Y19.534 E5.68241
G1 X180.895 Y19.352 E.01024
G1 X21.352 Y178.895 E5.67591
G1 X21.171 Y178.531 E.01024
G1 X180.531 Y19.171 E5.66941
G2 X180.167 Y18.99 I-5.331 J10.264 E.01024
G1 X20.99 Y178.166 E5.66289
G1 X20.815 Y177.796 E.01031
G1 X179.797 Y18.813 E5.65598
G1 X179.428 Y18.637 E.0103
G1 X20.64 Y177.425 E5.64906
G1 X20.465 Y177.054 E.01031
G1 X179.058 Y18.461 E5.64214
G1 X178.689 Y18.285 E.0103
G1 X20.289 Y176.684 E5.63523
G1 X20.114 Y176.313 E.01031
G1 X178.319 Y18.108 E5.62831
M73 P39 R50
G1 X177.944 Y17.938 E.01036
G1 X19.939 Y175.942 E5.6212
G3 X19.767 Y175.569 I13.545 J-6.495 E.01034
G1 X177.569 Y17.767 E5.61401
G1 X177.195 Y17.596 E.01036
G1 X19.596 Y175.194 E5.60675
G1 X19.425 Y174.82 E.01036
G1 X176.82 Y17.425 E5.59949
G1 X176.445 Y17.254 E.01036
G1 X19.254 Y174.445 E5.59223
G3 X19.088 Y174.065 I10.851 J-4.958 E.01043
G1 X176.065 Y17.088 E5.58461
G1 X175.684 Y16.923 E.01043
G1 X18.923 Y173.684 E5.57696
G1 X18.758 Y173.304 E.01043
G1 X175.304 Y16.758 E5.56931
G1 X174.924 Y16.592 E.01043
G1 X18.592 Y172.924 E5.56166
G1 X18.427 Y172.543 E.01043
G1 X174.543 Y16.427 E5.55402
G2 X174.158 Y16.267 I-4.782 J10.96 E.0105
G1 X18.267 Y172.158 E5.546
G1 X18.107 Y171.772 E.01051
G1 X173.772 Y16.107 E5.53796
G1 X173.386 Y15.947 E.01051
G1 X17.947 Y171.386 E5.52992
G1 X17.787 Y171 E.01051
G1 X173 Y15.787 E5.52188
G1 X172.614 Y15.627 E.01051
G1 X17.627 Y170.614 E5.51383
G3 X17.473 Y170.223 I11.145 J-4.627 E.01058
G1 X172.223 Y15.473 E5.50541
G1 X171.832 Y15.319 E.01059
G1 X17.319 Y169.831 E5.49697
G1 X17.164 Y169.44 E.01059
G1 X171.44 Y15.164 E5.48853
G1 X171.049 Y15.01 E.01059
G1 X17.01 Y169.048 E5.48009
G1 X16.856 Y168.657 E.01059
G1 X170.657 Y14.856 E5.47164
G1 X170.26 Y14.708 E.01067
G1 X16.708 Y168.26 E5.46279
G1 X16.559 Y167.862 E.01067
G1 X169.862 Y14.559 E5.45394
G1 X169.465 Y14.41 E.01067
G1 X16.41 Y167.465 E5.44509
G1 X16.262 Y167.068 E.01067
G1 X169.068 Y14.262 E5.43625
G2 X168.67 Y14.114 I-4.432 J11.318 E.01068
G1 X16.114 Y166.67 E5.42735
G1 X15.971 Y166.267 E.01076
G1 X168.267 Y13.971 E5.41809
G1 X167.864 Y13.829 E.01076
G1 X15.829 Y165.864 E5.40883
G1 X15.686 Y165.461 E.01076
G1 X167.461 Y13.686 E5.39957
G1 X167.058 Y13.543 E.01076
G1 X15.543 Y165.058 E5.39031
G3 X15.402 Y164.654 I11.516 J-4.247 E.01078
G1 X166.654 Y13.402 E5.38094
G1 X166.245 Y13.265 E.01085
G1 X15.265 Y164.245 E5.37126
G1 X15.128 Y163.836 E.01085
G1 X165.836 Y13.128 E5.36158
G1 X165.427 Y12.992 E.01085
G1 X14.992 Y163.427 E5.3519
G1 X14.855 Y163.018 E.01085
G1 X165.018 Y12.855 E5.34222
G2 X164.606 Y12.721 I-4.052 J11.731 E.01089
G1 X14.721 Y162.606 E5.33235
G1 X14.59 Y162.191 E.01094
G1 X164.191 Y12.59 E5.32225
M73 P39 R49
G1 X163.777 Y12.459 E.01094
G1 X14.459 Y161.777 E5.31214
G1 X14.328 Y161.362 E.01094
G1 X163.362 Y12.328 E5.30203
G1 X162.947 Y12.197 E.01094
G1 X14.197 Y160.947 E5.29193
G3 X14.071 Y160.527 I9.809 J-3.169 E.01103
G1 X162.528 Y12.071 E5.2815
G1 X162.107 Y11.946 E.01105
G1 X13.948 Y160.104 E5.27091
M73 P40 R49
G1 X13.825 Y159.682 E.01107
G1 X161.686 Y11.821 E5.26032
G1 X161.265 Y11.696 E.01105
G1 X13.701 Y159.26 E5.24973
G1 X13.578 Y158.837 E.01107
G1 X160.844 Y11.572 E5.23914
G2 X160.417 Y11.453 I-3.575 J12.003 E.01115
G1 X13.455 Y158.415 E5.22835
G3 X13.334 Y157.99 I15.561 J-4.632 E.01112
G1 X159.99 Y11.334 E5.21743
G1 X159.562 Y11.216 E.01115
G1 X13.216 Y157.562 E5.20644
G1 X13.097 Y157.135 E.01115
G1 X159.135 Y11.097 E5.19546
G2 X158.706 Y10.98 I-3.568 J12.24 E.01118
G1 X12.98 Y156.706 E5.18436
G1 X12.868 Y156.273 E.01127
G1 X158.273 Y10.868 E5.17293
G1 X157.839 Y10.756 E.01127
G1 X12.756 Y155.839 E5.16149
G1 X12.644 Y155.406 E.01127
G1 X157.406 Y10.644 E5.15005
G1 X156.972 Y10.532 E.01127
G1 X12.532 Y154.972 E5.13862
G3 X12.424 Y154.534 I12.468 J-3.316 E.01134
G1 X156.534 Y10.424 E5.1269
G1 X156.094 Y10.318 E.01139
G1 X12.318 Y154.094 E5.11501
G1 X12.212 Y153.654 E.01139
G1 X155.654 Y10.212 E5.10311
G1 X155.214 Y10.107 E.01139
G1 X12.107 Y153.214 E5.09121
G1 X12.001 Y152.774 E.01139
G1 X154.774 Y10.001 E5.07931
G1 X154.327 Y9.902 E.01151
G1 X11.904 Y152.326 E5.06689
G1 X11.806 Y151.878 E.01154
G1 X153.881 Y9.803 E5.05446
G1 X153.434 Y9.704 E.01151
G1 X11.708 Y151.429 E5.04204
G1 X11.611 Y150.981 E.01154
G1 X152.987 Y9.605 E5.02962
G2 X152.537 Y9.509 I-2.964 J12.812 E.01157
G1 X11.513 Y150.533 E5.01709
G3 X11.417 Y150.084 I16.362 J-3.746 E.01156
G1 X152.084 Y9.417 E5.00438
G1 X151.63 Y9.325 E.01164
G1 X11.325 Y149.63 E4.99153
G1 X11.232 Y149.177 E.01164
G1 X151.177 Y9.232 E4.97868
G1 X150.723 Y9.14 E.01164
G1 X11.14 Y148.723 E4.96583
G1 X11.055 Y148.263 E.01178
G1 X150.263 Y9.055 E4.9525
G1 X149.803 Y8.969 E.01178
G1 X10.969 Y147.803 E4.93915
G1 X10.884 Y147.342 E.01178
G1 X149.342 Y8.884 E4.92581
G1 X148.882 Y8.799 E.01178
G1 X10.799 Y146.882 E4.91247
G3 X10.717 Y146.418 I13.235 J-2.561 E.01186
G1 X148.418 Y8.717 E4.89885
G1 X147.95 Y8.639 E.01192
G1 X10.639 Y145.95 E4.885
G1 X10.561 Y145.483 E.01192
G1 X147.483 Y8.561 E4.87115
G1 X147.015 Y8.483 E.01192
G1 X10.483 Y145.015 E4.8573
G3 X10.405 Y144.546 I13.317 J-2.43 E.01195
G1 X146.547 Y8.405 E4.84337
G1 X146.072 Y8.335 E.01208
G1 X10.335 Y144.072 E4.829
G1 X10.264 Y143.597 E.01208
G1 X145.597 Y8.264 E4.81464
G1 X145.122 Y8.193 E.01208
G1 X10.193 Y143.122 E4.80027
G1 X10.122 Y142.647 E.01208
G1 X144.647 Y8.122 E4.7859
G2 X144.166 Y8.057 I-2.095 J13.75 E.01221
G1 X10.057 Y142.166 E4.7711
G1 X9.993 Y141.684 E.01224
G1 X143.684 Y7.993 E4.7562
G1 X143.202 Y7.93 E.01224
G1 X9.93 Y141.202 E4.7413
G1 X9.866 Y140.72 E.01224
G1 X142.72 Y7.866 E4.7264
G2 X142.233 Y7.807 I-1.941 J13.925 E.01233
M73 P41 R49
G1 X9.807 Y140.233 E4.7112
G1 X9.751 Y139.743 E.0124
G1 X141.743 Y7.751 E4.69576
G1 X141.253 Y7.696 E.0124
G1 X9.696 Y139.253 E4.68031
G1 X9.64 Y138.763 E.0124
G1 X140.763 Y7.64 E4.66487
M73 P41 R48
G2 X140.271 Y7.587 I-1.769 J14.105 E.01247
G1 X9.587 Y138.271 E4.64923
G1 X9.539 Y137.773 E.01258
G1 X139.773 Y7.539 E4.63323
G1 X139.275 Y7.491 E.01258
G1 X9.491 Y137.275 E4.61722
G1 X9.443 Y136.777 E.01258
G1 X138.777 Y7.443 E4.60122
G2 X138.278 Y7.397 I-1.582 J14.328 E.01262
G1 X9.397 Y136.278 E4.5851
G1 X9.357 Y135.772 E.01277
G1 X137.772 Y7.357 E4.56852
G1 X137.266 Y7.317 E.01277
G1 X9.317 Y135.266 E4.55194
G1 X9.277 Y134.76 E.01277
G1 X136.76 Y7.277 E4.53535
G2 X136.254 Y7.238 I-1.369 J14.482 E.01279
G1 X9.238 Y134.253 E4.51871
G1 X9.207 Y133.739 E.01296
G1 X135.739 Y7.207 E4.50154
G1 X135.225 Y7.175 E.01296
G1 X9.175 Y133.225 E4.48436
G1 X9.144 Y132.711 E.01296
G1 X134.711 Y7.144 E4.46718
G2 X134.196 Y7.113 I-1.153 J14.91 E.01298
G1 X9.113 Y132.196 E4.44997
G1 X9.09 Y131.673 E.01317
G1 X133.673 Y7.09 E4.43218
G1 X133.15 Y7.067 E.01317
G1 X9.067 Y131.15 E4.41438
G1 X9.044 Y130.627 E.01317
G1 X132.627 Y7.044 E4.39659
G2 X132.103 Y7.022 I-.89 J14.973 E.01319
G1 X9.022 Y130.103 E4.37874
G1 X9.008 Y129.572 E.01338
G1 X131.572 Y7.008 E4.36032
G1 X131.04 Y6.995 E.01338
G1 X8.995 Y129.04 E4.34189
G1 X8.981 Y128.508 E.01338
G1 X130.508 Y6.981 E4.32347
G2 X129.974 Y6.969 I-.614 J15.243 E.01343
G1 X8.968 Y127.974 E4.30492
G1 X8.964 Y127.433 E.01361
G1 X129.433 Y6.964 E4.28584
G1 X128.892 Y6.959 E.01361
G1 X8.959 Y126.892 E4.26676
G1 X8.954 Y126.351 E.01361
G1 X128.348 Y6.957 E4.24757
G1 X127.8 Y6.96 E.0138
G1 X8.953 Y125.807 E4.22811
G1 X8.958 Y125.256 E.01385
G1 X127.251 Y6.963 E4.20843
G1 X126.703 Y6.966 E.0138
G1 X8.963 Y124.706 E4.18875
G1 X8.967 Y124.155 E.01385
G1 X126.155 Y6.968 E4.16906
G2 X125.599 Y6.978 I-.053 J13.044 E.01397
G1 X8.978 Y123.599 E4.14893
G1 X8.993 Y123.039 E.0141
G1 X125.039 Y6.993 E4.12848
G1 X124.478 Y7.007 E.0141
G1 X9.007 Y122.478 E4.10802
G1 X9.022 Y121.918 E.0141
G1 X123.918 Y7.022 E4.08756
G2 X123.349 Y7.045 I.391 J16.309 E.01433
G1 X9.045 Y121.349 E4.06646
G1 X9.07 Y120.778 E.01437
G1 X122.778 Y7.07 E4.04528
G1 X122.207 Y7.095 E.01437
G1 X9.095 Y120.207 E4.02409
G3 X9.123 Y119.634 I16.447 J.499 E.01444
G1 X121.634 Y7.123 E4.00272
G1 X121.053 Y7.158 E.01465
G1 X9.158 Y119.053 E3.98078
G1 X9.194 Y118.472 E.01465
G1 X120.472 Y7.194 E3.95883
G2 X119.885 Y7.235 I1.211 J21.425 E.0148
G1 X9.229 Y117.89 E3.93669
G3 X9.272 Y117.302 I16.89 J.935 E.01485
G1 X119.295 Y7.279 E3.91417
G1 X118.705 Y7.323 E.01488
G1 X9.319 Y116.709 E3.89153
G1 X9.365 Y116.117 E.01495
G1 X118.115 Y7.368 E3.86888
G2 X117.523 Y7.414 I.797 J13.949 E.01495
G1 X9.414 Y115.523 E3.84609
G1 X9.472 Y114.919 E.01526
G1 X116.919 Y7.472 E3.82254
G1 X116.315 Y7.53 E.01526
G1 X9.53 Y114.315 E3.79898
M73 P42 R48
G1 X9.588 Y113.711 E.01526
G1 X115.711 Y7.588 E3.77543
G2 X115.098 Y7.656 I1.614 J17.576 E.01551
G1 X9.656 Y113.098 E3.75124
G1 X9.726 Y112.482 E.01559
G1 X114.482 Y7.726 E3.72683
G1 X113.867 Y7.796 E.01559
G1 X9.796 Y111.866 E3.70243
G3 X9.871 Y111.246 I17.768 J1.834 E.01573
G1 X113.246 Y7.871 E3.67767
G1 X112.617 Y7.954 E.01595
G1 X9.954 Y110.617 E3.65237
G1 X10.036 Y109.989 E.01595
G1 X111.989 Y8.036 E3.62706
G2 X111.359 Y8.121 I2.084 J17.981 E.01599
G1 X10.121 Y109.359 E3.60166
G1 X10.217 Y108.717 E.01632
G1 X110.717 Y8.217 E3.57542
G1 X110.076 Y8.313 E.01632
G1 X10.313 Y108.075 E3.54918
G1 X10.408 Y107.434 E.01632
G1 X109.434 Y8.408 E3.52294
G2 X108.78 Y8.517 I2.76 J18.675 E.01668
G1 X10.517 Y106.78 E3.49581
G1 X10.627 Y106.124 E.01672
G1 X108.124 Y8.627 E3.46859
G1 X107.469 Y8.736 E.01672
G1 X10.736 Y105.469 E3.44137
G3 X10.857 Y104.802 I19.164 J3.135 E.01705
G1 X106.802 Y8.857 E3.41335
G1 X106.132 Y8.981 E.01714
G1 X10.981 Y104.132 E3.3851
M73 P42 R47
G1 X11.106 Y103.462 E.01714
G1 X105.462 Y9.106 E3.35685
G2 X104.781 Y9.241 I3.547 J19.63 E.01747
G1 X11.241 Y102.781 E3.3278
G1 X11.38 Y102.096 E.01759
G1 X104.096 Y9.38 E3.29847
G1 X103.411 Y9.52 E.01759
G1 X11.52 Y101.411 E3.26914
G3 X11.671 Y100.714 I20.053 J3.995 E.01795
G1 X102.714 Y9.671 E3.23894
G1 X102.013 Y9.827 E.01807
G1 X11.827 Y100.012 E3.20846
G1 X11.982 Y99.311 E.01807
G1 X101.311 Y9.982 E3.17798
G2 X100.595 Y10.152 I4.503 J20.532 E.01851
G1 X12.152 Y98.595 E3.14646
G1 X12.325 Y97.877 E.01858
G1 X99.877 Y10.325 E3.11478
G2 X99.158 Y10.498 I4.671 J20.948 E.01861
G1 X12.498 Y97.158 E3.08302
G1 X12.689 Y96.422 E.01913
G1 X98.422 Y10.689 E3.05006
G1 X97.686 Y10.879 E.01913
G1 X12.879 Y95.686 E3.0171
G3 X13.075 Y94.944 I21.349 J5.256 E.01932
G1 X96.944 Y11.075 E2.9837
G1 X96.189 Y11.285 E.01971
G1 X13.285 Y94.188 E2.94939
G1 X13.494 Y93.433 E.01971
G1 X95.433 Y11.494 E2.91507
G2 X94.665 Y11.717 I6.007 J22.142 E.02014
G1 X13.717 Y92.665 E2.87979
G1 X13.947 Y91.889 E.02034
G1 X93.889 Y11.947 E2.84403
G2 X93.112 Y12.179 I6.227 J22.301 E.02041
G1 X14.179 Y91.111 E2.80811
G1 X14.43 Y90.314 E.02102
G1 X92.314 Y12.43 E2.77082
G1 X91.517 Y12.682 E.02102
G1 X14.682 Y89.517 E2.73352
G3 X14.947 Y88.706 I23.373 J7.201 E.02148
G1 X90.706 Y12.947 E2.69521
G1 X89.886 Y13.222 E.02176
G1 X15.222 Y87.886 E2.65627
G3 X15.501 Y87.061 I23.766 J7.594 E.02193
G1 X89.061 Y13.501 E2.61695
G1 X88.216 Y13.8 E.02255
G1 X15.8 Y86.216 E2.57625
G1 X16.1 Y85.371 E.02255
G1 X87.371 Y14.1 E2.53554
G2 X86.502 Y14.423 I8.831 J25.076 E.02332
G1 X16.423 Y84.502 E2.49314
G1 X16.749 Y83.63 E.02341
G1 X85.624 Y14.755 E2.45031
G1 X84.73 Y15.103 E.02413
G1 X17.094 Y82.739 E2.40623
G1 X17.448 Y81.839 E.02435
G1 X83.836 Y15.452 E2.36181
G2 X82.923 Y15.819 I8.187 J21.658 E.02477
G1 X17.819 Y80.923 E2.31613
G1 X18.205 Y79.991 E.02537
G1 X81.991 Y16.205 E2.26925
G2 X81.044 Y16.606 I11.029 J27.342 E.02588
G1 X18.606 Y79.044 E2.22128
G1 X19.026 Y78.078 E.02649
G1 X80.078 Y17.026 E2.17199
G2 X79.095 Y17.464 I12.042 J28.378 E.02708
G1 X19.464 Y77.095 E2.12143
G1 X19.921 Y76.092 E.02772
G1 X78.088 Y17.925 E2.06937
G1 X77.054 Y18.413 E.02877
G1 X20.402 Y75.065 E2.01545
G1 X20.9 Y74.022 E.02908
G1 X76.02 Y18.902 E1.96095
G2 X74.942 Y19.433 I11.966 J25.605 E.03023
G1 X21.434 Y72.942 E1.90364
G3 X21.981 Y71.849 I31.51 J15.092 E.03075
G1 X73.849 Y19.981 E1.84529
G1 X72.711 Y20.573 E.03228
G1 X22.573 Y70.711 E1.78371
G3 X23.192 Y69.547 I33.703 J17.163 E.03318
G1 X71.547 Y21.192 E1.72026
G1 X70.353 Y21.84 E.03418
G1 X23.84 Y68.352 E1.65472
G3 X24.548 Y67.099 I36.172 J19.594 E.0362
G1 X69.099 Y22.548 E1.58497
G2 X67.807 Y23.295 I20.744 J37.393 E.03756
G1 X25.295 Y65.807 E1.51241
G3 X26.09 Y64.466 I38.876 J22.145 E.03921
G1 X66.466 Y24.09 E1.43643
G1 X65.057 Y24.953 E.04158
G1 X26.953 Y63.057 E1.35556
G3 X27.902 Y61.562 I43.346 J26.466 E.04452
G1 X63.562 Y25.902 E1.26866
M73 P43 R47
G2 X61.978 Y26.941 I28.977 J45.926 E.04767
G1 X28.941 Y59.978 E1.17533
G3 X30.095 Y58.277 I49.321 J32.25 E.05171
G1 X60.277 Y28.095 E1.07375
G2 X58.425 Y29.402 I36.492 J53.697 E.05704
G1 X31.402 Y56.425 E.96135
G3 X32.914 Y54.367 I59.744 J42.314 E.06423
G1 X56.367 Y30.914 E.83436
G2 X53.929 Y32.806 I106.513 J139.751 E.07763
G1 X34.806 Y51.929 E.68032
G3 X37.332 Y48.857 I93.819 J74.578 E.10006
G1 X50.857 Y35.333 E.48116
G2 X44.081 Y41.563 I78.057 J91.694 E.23161
G1 X39.256 Y46.389 E.17169
; CHANGE_LAYER
; Z_HEIGHT: 0.52
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11661.354
G1 X40.67 Y44.974 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/6
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
M204 S10000
G17
G3 Z.76 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 53
G1 X132.167 Y245.316
G1 Z.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M204 S4000
G3 X73.799 Y19.623 I-4.176 J-119.314 E8.75213
G3 X128.916 Y6.619 I54.202 J106.422 E1.54928
G3 X132.227 Y245.314 I-.925 J119.383 E10.02328
M204 S10000
G1 X132.18 Y245.717 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X130.091 Y245.771 E.05253
G3 X73.617 Y19.266 I-2.101 J-119.769 E8.09515
G3 X128.92 Y6.218 I54.384 J106.78 E1.4423
G3 X132.239 Y245.714 I-.929 J119.784 E9.3311
; WIPE_START
M204 S4000
G1 X130.24 Y245.767 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.103 Y243.062 Z.92 F30000
G1 X48.389 Y214.744 Z.92
G1 Z.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420226
G1 F11661.354
M204 S4000
G1 X43.563 Y209.919 E.17168
G3 X37.332 Y203.143 I85.472 J-84.84 E.23162
G1 X50.815 Y216.625 E.47966
G2 X53.929 Y219.194 I67.97 J-79.239 E.10155
G1 X34.806 Y200.071 E.68032
G3 X32.914 Y197.633 I138.147 J-109.175 E.07763
G1 X56.367 Y221.086 E.83436
G2 X58.425 Y222.598 I44.312 J-58.15 E.06424
G1 X31.402 Y195.575 E.96135
G3 X30.095 Y193.723 I52.405 J-38.355 E.05704
G1 X60.277 Y223.905 E1.07376
G2 X61.978 Y225.059 I33.953 J-48.171 E.05171
G1 X28.941 Y192.022 E1.17533
G3 X27.902 Y190.438 I44.844 J-30.533 E.04767
G1 X63.562 Y226.098 E1.26866
G2 X65.057 Y227.047 I28.021 J-42.492 E.04452
G1 X26.953 Y188.943 E1.35557
G1 X26.09 Y187.534 E.04158
G1 X66.466 Y227.91 E1.43643
G2 X67.807 Y228.705 I23.456 J-38.032 E.03921
G1 X25.295 Y186.193 E1.51241
G3 X24.548 Y184.901 I36.648 J-22.039 E.03756
G1 X69.099 Y229.452 E1.58497
G2 X70.352 Y230.16 I20.908 J-35.572 E.0362
G1 X23.84 Y183.647 E1.65472
G1 X23.192 Y182.453 E.03418
G1 X71.547 Y230.808 E1.72026
G2 X72.711 Y231.427 I18.338 J-33.105 E.03318
G1 X22.573 Y181.289 E1.78371
G1 X21.981 Y180.151 E.03228
G1 X73.849 Y232.019 E1.84529
G2 X74.942 Y232.566 I16.189 J-30.97 E.03075
G1 X21.434 Y179.058 E1.90364
G3 X20.9 Y177.978 I30.751 J-15.874 E.03029
G1 X76.022 Y233.1 E1.96102
G1 X77.065 Y233.598 E.02908
G1 X20.402 Y176.935 E2.01585
G3 X19.921 Y175.908 I29.093 J-14.26 E.02853
G1 X78.092 Y234.079 E2.0695
G1 X79.095 Y234.536 E.02772
G1 X19.464 Y174.905 E2.12143
M73 P43 R46
G3 X19.026 Y173.922 I27.966 J-13.037 E.02708
G1 X80.078 Y234.974 E2.17199
G1 X81.044 Y235.394 E.02649
G1 X18.606 Y172.956 E2.22128
G3 X18.205 Y172.009 I26.915 J-11.965 E.02588
G1 X81.991 Y235.795 E2.26925
G1 X82.923 Y236.181 E.02537
G1 X17.819 Y171.077 E2.31612
G3 X17.448 Y170.161 I26.111 J-11.097 E.02487
G1 X83.839 Y236.552 E2.36192
G1 X84.739 Y236.906 E.02434
G1 X17.094 Y169.261 E2.40657
G3 X16.749 Y168.37 I25.328 J-10.322 E.02403
G1 X85.63 Y237.251 E2.45054
G1 X86.502 Y237.577 E.02341
G1 X16.423 Y167.498 E2.49314
G3 X16.1 Y166.629 I24.805 J-9.72 E.02332
G1 X87.371 Y237.9 E2.53554
G1 X88.216 Y238.2 E.02255
G1 X15.8 Y165.784 E2.57625
G1 X15.501 Y164.939 E.02255
G1 X89.061 Y238.499 E2.61695
G2 X89.886 Y238.778 I8.411 J-23.464 E.02193
G1 X15.222 Y164.114 E2.65627
G1 X14.947 Y163.294 E.02176
G1 X90.706 Y239.053 E2.69521
G2 X91.517 Y239.318 I8.009 J-23.095 E.02147
G1 X14.682 Y162.483 E2.73352
G1 X14.43 Y161.686 E.02102
G1 X92.314 Y239.57 E2.77082
G1 X93.111 Y239.821 E.02102
G1 X14.179 Y160.889 E2.80811
G3 X13.953 Y160.117 I16.789 J-5.339 E.02024
G1 X93.889 Y240.053 E2.84383
G1 X94.665 Y240.283 E.02034
G1 X13.729 Y159.347 E2.87936
G1 X13.506 Y158.578 E.02015
G1 X95.433 Y240.506 E2.91466
G1 X96.188 Y240.715 E.01971
G1 X13.285 Y157.812 E2.94939
G1 X13.075 Y157.056 E.01971
G1 X96.944 Y240.925 E2.9837
G2 X97.686 Y241.121 I6.001 J-21.166 E.01932
G1 X12.879 Y156.314 E3.0171
G1 X12.689 Y155.578 E.01913
G1 X98.422 Y241.311 E3.05006
G1 X99.158 Y241.502 E.01913
G1 X12.498 Y154.842 E3.08302
G3 X12.325 Y154.123 I20.508 J-5.326 E.01861
G1 X99.877 Y241.675 E3.11478
G1 X100.595 Y241.848 E.01858
G1 X12.152 Y153.405 E3.14646
G3 X11.983 Y152.689 I15.584 J-4.071 E.01849
G1 X101.311 Y242.018 E3.17796
G1 X102.012 Y242.173 E.01807
G1 X11.832 Y151.993 E3.20826
G1 X11.682 Y151.297 E.01792
G1 X102.714 Y242.329 E3.23856
G2 X103.411 Y242.48 I4.688 J-19.882 E.01795
G1 X11.532 Y150.601 E3.26872
G1 X11.381 Y149.905 E.01792
G1 X104.096 Y242.62 E3.29844
G1 X104.781 Y242.759 E.01759
G1 X11.241 Y149.219 E3.3278
G3 X11.106 Y148.538 I19.477 J-4.225 E.01747
G1 X105.462 Y242.894 E3.35685
G1 X106.132 Y243.019 E.01714
G1 X10.981 Y147.868 E3.3851
G1 X10.857 Y147.198 E.01714
G1 X106.802 Y243.143 E3.41335
G2 X107.469 Y243.264 I3.801 J-19.043 E.01705
G1 X10.736 Y146.531 E3.44137
G1 X10.627 Y145.876 E.01672
G1 X108.124 Y243.373 E3.46859
G1 X108.78 Y243.483 E.01672
G1 X10.517 Y145.22 E3.49581
G3 X10.408 Y144.566 I18.73 J-3.441 E.01668
G1 X109.434 Y243.592 E3.52294
G1 X110.076 Y243.687 E.01632
G1 X10.313 Y143.924 E3.54918
G1 X10.217 Y143.283 E.01632
G1 X110.717 Y243.783 E3.57542
G1 X111.359 Y243.879 E.01632
G1 X10.121 Y142.641 E3.60166
M73 P44 R46
G3 X10.036 Y142.011 I17.914 J-2.716 E.01599
G1 X111.989 Y243.963 E3.62706
G1 X112.617 Y244.046 E.01595
G1 X9.954 Y141.383 E3.65237
G1 X9.871 Y140.754 E.01595
G1 X113.246 Y244.129 E3.67767
G2 X113.866 Y244.204 I2.46 J-17.736 E.01573
G1 X9.796 Y140.134 E3.70243
G1 X9.726 Y139.518 E.01559
G1 X114.482 Y244.274 E3.72683
G1 X115.098 Y244.344 E.01559
G1 X9.656 Y138.902 E3.75124
G3 X9.588 Y138.289 I17.55 J-2.231 E.01551
G1 X115.711 Y244.412 E3.77543
G1 X116.315 Y244.47 E.01526
G1 X9.53 Y137.685 E3.79898
G1 X9.472 Y137.081 E.01526
G1 X116.919 Y244.528 E3.82254
G1 X117.523 Y244.586 E.01526
G1 X9.414 Y136.477 E3.84609
G3 X9.365 Y135.883 I17.004 J-1.688 E.015
G1 X118.117 Y244.635 E3.86896
G1 X118.709 Y244.681 E.01495
G1 X9.319 Y135.291 E3.89169
G1 X9.272 Y134.698 E.01495
G1 X119.302 Y244.728 E3.91442
G2 X119.89 Y244.771 I1.525 J-16.863 E.01485
G1 X9.229 Y134.11 E3.93689
G1 X9.194 Y133.528 E.01465
G1 X120.472 Y244.806 E3.95883
G1 X121.053 Y244.842 E.01465
G1 X9.158 Y132.947 E3.98078
G1 X9.123 Y132.366 E.01465
G1 X121.634 Y244.877 E4.00272
G2 X122.207 Y244.905 I1.072 J-16.408 E.01443
G1 X9.095 Y131.793 E4.02409
G1 X9.07 Y131.222 E.01437
G1 X122.778 Y244.93 E4.04528
G1 X123.349 Y244.955 E.01437
G1 X9.045 Y130.651 E4.06646
G3 X9.022 Y130.082 I16.26 J-.959 E.01433
G1 X123.918 Y244.978 E4.08756
G1 X124.478 Y244.993 E.0141
G1 X9.007 Y129.522 E4.10802
G1 X8.993 Y128.961 E.0141
G1 X125.039 Y245.007 E4.12848
G1 X125.599 Y245.022 E.0141
G1 X8.978 Y128.401 E4.14893
G3 X8.967 Y127.845 I15.921 J-.579 E.014
G1 X126.155 Y245.033 E4.1691
G1 X126.706 Y245.037 E.01385
G1 X8.963 Y127.294 E4.18885
G1 X8.958 Y126.744 E.01385
G1 X127.256 Y245.042 E4.20861
G1 X127.807 Y245.047 E.01385
G1 X8.953 Y126.193 E4.22837
G3 X8.954 Y125.649 I15.6 J-.232 E.01369
G1 X128.351 Y245.046 E4.24768
G1 X128.892 Y245.041 E.01361
G1 X8.959 Y125.108 E4.26676
G1 X8.964 Y124.567 E.01361
G1 X129.433 Y245.036 E4.28584
G1 X129.974 Y245.032 E.01361
G1 X8.968 Y124.026 E4.30492
G3 X8.981 Y123.492 I15.296 J.082 E.01343
G1 X130.508 Y245.019 E4.32347
G1 X131.04 Y245.005 E.01338
G1 X8.995 Y122.96 E4.34189
G1 X9.008 Y122.428 E.01338
G1 X131.572 Y244.991 E4.36032
G1 X132.103 Y244.978 E.01338
G1 X9.022 Y121.897 E4.37874
G3 X9.044 Y121.373 I14.984 J.366 E.01319
G1 X132.627 Y244.956 E4.39659
G1 X133.15 Y244.933 E.01317
G1 X9.067 Y120.85 E4.41439
G1 X9.09 Y120.327 E.01317
G1 X133.673 Y244.91 E4.43218
G1 X134.196 Y244.887 E.01317
G1 X9.113 Y119.804 E4.44997
G3 X9.144 Y119.289 I14.847 J.633 E.01298
G1 X134.711 Y244.856 E4.46718
G1 X135.225 Y244.825 E.01296
G1 X9.175 Y118.775 E4.48436
G1 X9.207 Y118.261 E.01296
G1 X135.735 Y244.789 E4.5014
G1 X136.244 Y244.752 E.01282
G1 X9.238 Y117.747 E4.51837
G3 X9.277 Y117.24 I14.506 J.861 E.01279
G1 X136.752 Y244.715 E4.53507
M73 P44 R45
G1 X137.261 Y244.677 E.01282
G1 X9.317 Y116.734 E4.55174
G1 X9.357 Y116.228 E.01277
G1 X137.769 Y244.64 E4.56841
G1 X138.277 Y244.603 E.01282
G1 X9.397 Y115.722 E4.58508
G3 X9.443 Y115.223 I14.355 J1.081 E.01262
G1 X138.777 Y244.557 E4.60122
G1 X139.275 Y244.509 E.01258
G1 X9.491 Y114.725 E4.61722
G1 X9.539 Y114.227 E.01258
G1 X139.773 Y244.461 E4.63323
G1 X140.271 Y244.413 E.01258
G1 X9.587 Y113.729 E4.64923
G3 X9.64 Y113.237 I14.154 J1.276 E.01247
G1 X140.763 Y244.36 E4.66487
G1 X141.253 Y244.304 E.0124
G1 X9.696 Y112.747 E4.68031
G1 X9.751 Y112.257 E.0124
G1 X141.743 Y244.249 E4.69576
G1 X142.233 Y244.193 E.0124
G1 X9.807 Y111.767 E4.7112
G3 X9.866 Y111.28 I13.968 J1.452 E.01233
G1 X142.72 Y244.134 E4.7264
G1 X143.202 Y244.07 E.01224
G1 X9.93 Y110.798 E4.7413
G1 X9.993 Y110.316 E.01224
G1 X143.684 Y244.007 E4.7562
G1 X144.166 Y243.943 E.01224
G1 X10.057 Y109.834 E4.7711
G3 X10.122 Y109.353 I13.817 J1.615 E.01221
G1 X144.647 Y243.878 E4.7859
M73 P45 R45
G1 X145.122 Y243.807 E.01208
G1 X10.193 Y108.878 E4.80027
G1 X10.264 Y108.403 E.01208
G1 X145.597 Y243.736 E4.81464
G1 X146.072 Y243.665 E.01208
G1 X10.335 Y107.928 E4.829
G1 X10.405 Y107.453 E.01208
G1 X146.547 Y243.595 E4.84337
G2 X147.015 Y243.517 I-1.984 J-13.528 E.01195
G1 X10.483 Y106.985 E4.8573
G1 X10.561 Y106.517 E.01192
G1 X147.483 Y243.439 E4.87115
G1 X147.95 Y243.361 E.01192
G1 X10.639 Y106.05 E4.885
G1 X10.717 Y105.582 E.01192
G1 X148.418 Y243.283 E4.89885
G2 X148.882 Y243.201 I-2.099 J-13.329 E.01186
G1 X10.799 Y105.118 E4.91247
G1 X10.884 Y104.658 E.01178
G1 X149.342 Y243.116 E4.92581
G1 X149.803 Y243.031 E.01178
G1 X10.969 Y104.197 E4.93916
G1 X11.055 Y103.737 E.01178
G1 X150.263 Y242.945 E4.9525
G1 X150.723 Y242.86 E.01178
G1 X11.14 Y103.277 E4.96583
G1 X11.235 Y102.825 E.0116
G1 X151.177 Y242.768 E4.97861
G1 X151.63 Y242.675 E.01164
G1 X11.329 Y102.374 E4.99138
G1 X11.423 Y101.922 E.0116
G1 X152.084 Y242.583 E5.00416
G1 X152.537 Y242.491 E.01164
G1 X11.518 Y101.471 E5.01694
G1 X11.612 Y101.02 E.0116
G1 X152.987 Y242.395 E5.02959
G1 X153.434 Y242.296 E.01151
G1 X11.706 Y100.568 E5.04212
G3 X11.803 Y100.119 I18.697 J3.798 E.01155
G1 X153.881 Y242.197 E5.05457
G1 X154.327 Y242.098 E.01151
G1 X11.902 Y99.673 E5.06694
G1 X12.001 Y99.226 E.01151
G1 X154.774 Y241.999 E5.07931
G1 X155.214 Y241.893 E.01139
G1 X12.107 Y98.786 E5.09121
G1 X12.212 Y98.346 E.01139
G1 X155.654 Y241.788 E5.10311
G1 X156.094 Y241.682 E.01139
G1 X12.318 Y97.906 E5.11501
G1 X12.424 Y97.466 E.01139
G1 X156.534 Y241.576 E5.1269
G2 X156.972 Y241.468 I-2.88 J-12.581 E.01134
G1 X12.532 Y97.028 E5.13862
G1 X12.644 Y96.594 E.01127
G1 X157.406 Y241.356 E5.15005
G1 X157.839 Y241.244 E.01127
G1 X12.756 Y96.161 E5.16149
G1 X12.868 Y95.727 E.01127
G1 X158.273 Y241.132 E5.17293
G1 X158.706 Y241.02 E.01127
G1 X12.98 Y95.294 E5.18436
G3 X13.097 Y94.865 I12.267 J3.115 E.01118
G1 X159.135 Y240.903 E5.19546
G1 X159.562 Y240.784 E.01115
G1 X13.216 Y94.438 E5.20644
G1 X13.334 Y94.01 E.01115
G1 X159.99 Y240.666 E5.21743
G1 X160.417 Y240.547 E.01115
G1 X13.453 Y93.583 E5.22841
G3 X13.572 Y93.156 I12.23 J3.178 E.01115
G1 X160.844 Y240.428 E5.23936
G1 X161.265 Y240.304 E.01105
G1 X13.696 Y92.735 E5.24991
G1 X13.821 Y92.314 E.01105
G1 X161.686 Y240.179 E5.26045
G1 X162.107 Y240.054 E.01105
G1 X13.946 Y91.893 E5.27099
G1 X14.071 Y91.472 E.01105
G1 X162.528 Y239.929 E5.28153
G2 X162.947 Y239.803 I-3.416 J-12.045 E.01101
G1 X14.197 Y91.053 E5.29193
G1 X14.328 Y90.638 E.01094
G1 X163.362 Y239.672 E5.30203
G1 X163.777 Y239.541 E.01094
G1 X14.459 Y90.223 E5.31214
G1 X14.59 Y89.809 E.01094
G1 X164.191 Y239.41 E5.32225
M73 P45 R44
G1 X164.606 Y239.279 E.01094
G1 X14.721 Y89.394 E5.33235
G3 X14.855 Y88.982 I11.858 J3.639 E.01089
G1 X165.018 Y239.145 E5.34222
G1 X165.427 Y239.008 E.01085
G1 X14.992 Y88.573 E5.3519
G1 X15.128 Y88.164 E.01085
G1 X165.836 Y238.872 E5.36158
M73 P46 R44
G1 X166.245 Y238.735 E.01085
G1 X15.265 Y87.755 E5.37126
G1 X15.402 Y87.346 E.01085
G1 X166.654 Y238.598 E5.38094
G2 X167.058 Y238.457 I-3.849 J-11.678 E.01078
G1 X15.543 Y86.942 E5.39031
G1 X15.686 Y86.539 E.01076
G1 X167.461 Y238.314 E5.39957
G1 X167.864 Y238.171 E.01076
G1 X15.829 Y86.136 E5.40883
G1 X15.971 Y85.733 E.01076
G1 X168.267 Y238.029 E5.41809
G1 X168.67 Y237.886 E.01076
G1 X16.114 Y85.33 E5.42735
G3 X16.262 Y84.932 I11.415 J4.015 E.01068
G1 X169.068 Y237.738 E5.43624
G1 X169.465 Y237.589 E.01067
G1 X16.411 Y84.535 E5.44509
G1 X16.559 Y84.138 E.01067
G1 X169.862 Y237.441 E5.45394
G1 X170.26 Y237.292 E.01067
G1 X16.708 Y83.74 E5.46279
G1 X16.856 Y83.343 E.01067
G1 X170.657 Y237.144 E5.47164
G1 X171.048 Y236.99 E.01059
G1 X17.01 Y82.952 E5.48009
G1 X17.164 Y82.56 E.01059
G1 X171.44 Y236.836 E5.48853
G1 X171.831 Y236.681 E.01059
G1 X17.319 Y82.168 E5.49697
G1 X17.473 Y81.777 E.01059
G1 X172.223 Y236.527 E5.50541
G2 X172.614 Y236.373 I-4.311 J-11.491 E.01058
G1 X17.627 Y81.386 E5.51383
G1 X17.787 Y81 E.01051
G1 X173 Y236.213 E5.52188
G1 X173.386 Y236.053 E.01051
G1 X17.947 Y80.614 E5.52992
G1 X18.107 Y80.228 E.01051
G1 X173.772 Y235.893 E5.53796
G1 X174.158 Y235.733 E.01051
G1 X18.267 Y79.842 E5.546
G3 X18.427 Y79.457 I10.958 J4.329 E.0105
G1 X174.543 Y235.573 E5.55402
G1 X174.924 Y235.408 E.01043
G1 X18.592 Y79.076 E5.56166
G1 X18.758 Y78.696 E.01043
G1 X175.304 Y235.242 E5.56931
G1 X175.684 Y235.077 E.01043
G1 X18.923 Y78.316 E5.57696
G1 X19.088 Y77.935 E.01043
G1 X176.065 Y234.912 E5.58461
G2 X176.445 Y234.746 I-4.646 J-11.174 E.01043
G1 X19.254 Y77.555 E5.59223
G1 X19.425 Y77.18 E.01036
G1 X176.82 Y234.575 E5.59949
G1 X177.194 Y234.404 E.01036
G1 X19.596 Y76.805 E5.60675
G1 X19.767 Y76.431 E.01036
G1 X177.569 Y234.233 E5.61401
G1 X177.944 Y234.062 E.01036
G1 X19.938 Y76.056 E5.62127
G1 X20.108 Y75.681 E.01036
G1 X178.319 Y233.892 E5.62852
G1 X178.689 Y233.715 E.0103
G1 X20.285 Y75.311 E5.63539
G1 X20.461 Y74.942 E.0103
G1 X179.058 Y233.539 E5.64227
G1 X179.428 Y233.363 E.0103
G1 X20.637 Y74.572 E5.64914
G1 X20.813 Y74.203 E.0103
G1 X179.797 Y233.187 E5.65602
G1 X180.167 Y233.01 E.0103
G1 X20.99 Y73.833 E5.66289
G3 X21.171 Y73.469 I10.771 J5.129 E.01024
G1 X180.531 Y232.829 E5.66941
G1 X180.895 Y232.648 E.01024
G1 X21.352 Y73.105 E5.67591
G1 X21.534 Y72.741 E.01024
G1 X181.259 Y232.466 E5.68241
G1 X181.623 Y232.284 E.01024
G1 X21.716 Y72.377 E5.6889
G1 X21.897 Y72.012 E.01024
G1 X181.988 Y232.103 E5.6954
G2 X182.347 Y231.917 I-5.107 J-10.319 E.01019
G1 X22.083 Y71.653 E5.70158
G1 X22.27 Y71.294 E.01018
G1 X182.706 Y231.73 E5.7077
M73 P47 R44
G1 X183.065 Y231.543 E.01018
G1 X22.457 Y70.935 E5.71382
G1 X22.644 Y70.576 E.01018
G1 X183.424 Y231.356 E5.71994
G1 X183.783 Y231.169 E.01018
G1 X22.831 Y70.217 E5.72606
G3 X23.021 Y69.862 I10.273 J5.279 E.01014
G1 X184.138 Y230.979 E5.73193
M73 P47 R43
G1 X184.492 Y230.787 E.01012
G1 X23.213 Y69.508 E5.73768
G1 X23.405 Y69.154 E.01012
G1 X184.846 Y230.595 E5.74343
G1 X185.199 Y230.403 E.01012
G1 X23.597 Y68.801 E5.74918
G1 X23.789 Y68.447 E.01012
G1 X185.553 Y230.211 E5.75493
G2 X185.904 Y230.016 I-5.406 J-10.15 E.0101
G1 X23.984 Y68.096 E5.76048
G1 X24.181 Y67.748 E.01007
G1 X186.252 Y229.819 E5.76587
G1 X186.601 Y229.622 E.01007
G1 X24.378 Y67.399 E5.77125
G1 X24.576 Y67.05 E.01007
G1 X186.95 Y229.424 E5.77664
G1 X187.298 Y229.227 E.01007
G1 X24.773 Y66.702 E5.78202
G3 X24.972 Y66.355 I10.034 J5.527 E.01006
G1 X187.645 Y229.028 E5.78728
G1 X187.988 Y228.826 E.01003
G1 X25.174 Y66.012 E5.7923
G1 X25.376 Y65.668 E.01003
G1 X188.332 Y228.624 E5.79732
G1 X188.675 Y228.421 E.01003
G1 X25.579 Y65.325 E5.80234
G1 X25.781 Y64.981 E.01003
G1 X189.019 Y228.219 E5.80736
G2 X189.361 Y228.016 I-5.665 J-9.956 E.01002
G1 X25.984 Y64.639 E5.81233
G1 X26.191 Y64.3 E.00998
G1 X189.7 Y227.809 E5.817
G1 X190.038 Y227.601 E.00998
G1 X26.399 Y63.962 E5.82166
G1 X26.606 Y63.624 E.00998
G1 X190.376 Y227.394 E5.82632
G1 X190.715 Y227.187 E.00998
G1 X26.813 Y63.285 E5.83098
G1 X27.021 Y62.947 E.00998
G1 X191.053 Y226.979 E5.83564
G2 X191.387 Y226.767 I-5.864 J-9.606 E.00995
G1 X27.233 Y62.613 E5.83998
G1 X27.445 Y62.28 E.00994
G1 X191.72 Y226.555 E5.84428
G1 X192.054 Y226.343 E.00994
G1 X27.657 Y61.946 E5.84859
G1 X27.87 Y61.613 E.00994
G1 X192.387 Y226.13 E5.85289
G1 X192.72 Y225.918 E.00994
G1 X28.082 Y61.28 E5.85719
G3 X28.298 Y60.949 I9.55 J6.001 E.00992
G1 X193.051 Y225.702 E5.86127
G1 X193.379 Y225.485 E.00991
G1 X28.515 Y60.621 E5.86522
G1 X28.732 Y60.293 E.00991
G1 X193.707 Y225.268 E5.86917
G1 X194.036 Y225.05 E.00991
G1 X28.95 Y59.964 E5.87312
G1 X29.167 Y59.636 E.00991
G1 X194.364 Y224.833 E5.87707
G2 X194.691 Y224.614 I-6.08 J-9.413 E.00989
G1 X29.386 Y59.309 E5.88089
G1 X29.609 Y58.986 E.00987
G1 X195.014 Y224.391 E5.88449
G1 X195.338 Y224.169 E.00987
G1 X29.831 Y58.662 E5.88809
G1 X30.053 Y58.339 E.00987
G1 X195.661 Y223.947 E5.89169
G1 X195.984 Y223.725 E.00987
G1 X30.275 Y58.016 E5.89529
G3 X30.498 Y57.693 I9.216 J6.114 E.00987
G1 X196.307 Y223.502 E5.89886
G1 X196.626 Y223.275 E.00984
G1 X30.725 Y57.374 E5.90211
M73 P48 R43
G1 X30.952 Y57.055 E.00984
G1 X196.945 Y223.048 E5.90535
G1 X197.263 Y222.82 E.00984
G1 X31.18 Y56.737 E5.9086
G1 X31.407 Y56.418 E.00984
G1 X197.582 Y222.593 E5.91185
G1 X197.9 Y222.366 E.00984
G1 X31.634 Y56.1 E5.9151
G3 X31.865 Y55.785 I9.165 J6.481 E.00982
G1 X198.215 Y222.135 E5.91808
G1 X198.529 Y221.903 E.00982
G1 X32.097 Y55.471 E5.92099
G1 X32.329 Y55.158 E.00982
G1 X198.842 Y221.671 E5.92389
G1 X199.156 Y221.439 E.00982
G1 X32.561 Y54.844 E5.92679
G1 X32.793 Y54.53 E.00982
G1 X199.469 Y221.207 E5.92969
G2 X199.781 Y220.972 I-6.547 J-9.031 E.0098
G1 X33.028 Y54.219 E5.93244
G1 X33.265 Y53.91 E.00979
G1 X200.09 Y220.735 E5.935
G1 X200.399 Y220.499 E.00979
G1 X33.501 Y53.601 E5.93755
M73 P48 R42
G1 X33.738 Y53.293 E.00979
G1 X200.707 Y220.262 E5.94011
G1 X201.016 Y220.025 E.00979
G1 X33.975 Y52.984 E5.94266
G3 X34.213 Y52.676 I8.925 J6.628 E.00979
G1 X201.324 Y219.787 E5.94519
G1 X201.628 Y219.545 E.00977
G1 X34.455 Y52.372 E5.9474
G1 X34.696 Y52.068 E.00977
G1 X201.932 Y219.304 E5.94961
G1 X202.236 Y219.062 E.00977
G1 X34.938 Y51.764 E5.95182
G1 X35.18 Y51.46 E.00977
G1 X202.54 Y218.82 E5.95403
G1 X202.844 Y218.578 E.00977
G1 X35.422 Y51.156 E5.95625
G3 X35.667 Y50.855 I8.73 J6.883 E.00976
G1 X203.145 Y218.333 E5.9582
G1 X203.444 Y218.086 E.00975
G1 X35.914 Y50.556 E5.96007
G1 X36.16 Y50.257 E.00975
G1 X203.743 Y217.84 E5.96194
G1 X204.042 Y217.593 E.00975
G1 X36.407 Y49.958 E5.96381
G1 X36.653 Y49.659 E.00975
G1 X204.341 Y217.347 E5.96568
G2 X204.638 Y217.098 I-6.956 J-8.624 E.00975
G1 X36.902 Y49.362 E5.96741
G1 X37.153 Y49.067 E.00974
G1 X204.933 Y216.847 E5.96894
G1 X205.227 Y216.595 E.00974
G1 X37.405 Y48.773 E5.97047
G1 X37.656 Y48.479 E.00974
G1 X205.521 Y216.344 E5.972
G1 X205.816 Y216.093 E.00974
G1 X37.907 Y48.184 E5.97353
G1 X38.159 Y47.89 E.00974
G1 X206.11 Y215.841 E5.97505
G1 X206.4 Y215.585 E.00973
G1 X38.415 Y47.6 E5.97623
G1 X38.671 Y47.311 E.00973
G1 X206.689 Y215.329 E5.97742
G1 X206.979 Y215.073 E.00973
G1 X38.927 Y47.021 E5.97861
G1 X39.184 Y46.732 E.00973
G1 X207.268 Y214.816 E5.9798
G1 X207.558 Y214.56 E.00973
G1 X39.44 Y46.442 E5.98098
G3 X39.699 Y46.156 I8.332 J7.28 E.00972
G1 X207.844 Y214.301 E5.98195
G1 X208.129 Y214.04 E.00972
G1 X39.96 Y45.871 E5.9828
G1 X40.221 Y45.586 E.00972
G1 X208.414 Y213.779 E5.98365
M73 P49 R42
G1 X208.699 Y213.518 E.00972
G1 X40.482 Y45.301 E5.98449
G1 X40.743 Y45.017 E.00972
G1 X208.983 Y213.257 E5.98534
G2 X209.267 Y212.995 I-7.391 J-8.274 E.00972
G1 X41.005 Y44.733 E5.9861
G1 X41.271 Y44.453 E.00971
G1 X209.547 Y212.729 E5.98661
G1 X209.827 Y212.463 E.00971
G1 X41.537 Y44.173 E5.98711
G1 X41.802 Y43.893 E.00971
G1 X210.107 Y212.198 E5.98762
G1 X210.387 Y211.932 E.00971
G1 X42.068 Y43.613 E5.98813
G1 X42.334 Y43.333 E.00971
G1 X210.667 Y211.666 E5.98864
G2 X210.943 Y211.396 I-7.563 J-8.002 E.00971
G1 X42.604 Y43.057 E5.98885
G1 X42.874 Y42.782 E.00971
G1 X211.218 Y211.126 E5.98902
G1 X211.493 Y210.855 E.00971
G1 X43.145 Y42.507 E5.98919
G1 X43.415 Y42.232 E.00971
G1 X211.768 Y210.585 E5.98935
G1 X212.044 Y210.314 E.00971
G1 X43.686 Y41.956 E5.98952
G3 X43.959 Y41.684 I7.94 J7.668 E.00971
G1 X212.316 Y210.041 E5.98952
G1 X212.587 Y209.766 E.00971
G1 X44.234 Y41.413 E5.98935
G1 X44.509 Y41.143 E.00971
G1 X212.857 Y209.491 E5.98918
G1 X213.128 Y209.216 E.00971
G1 X44.784 Y40.872 E5.98901
G1 X45.06 Y40.602 E.00971
G1 X213.398 Y208.94 E5.98885
G2 X213.668 Y208.665 I-7.706 J-7.81 E.00971
G1 X45.335 Y40.332 E5.98864
G1 X45.615 Y40.066 E.00971
G1 X213.934 Y208.385 E5.98813
M73 P49 R41
G1 X214.2 Y208.105 E.00971
G1 X45.895 Y39.8 E5.98762
G1 X46.175 Y39.534 E.00971
G1 X214.465 Y207.825 E5.98711
G1 X214.731 Y207.545 E.00971
G1 X46.455 Y39.269 E5.9866
G1 X46.735 Y39.003 E.00971
G1 X214.997 Y207.265 E5.98609
G2 X215.259 Y206.981 I-8.008 J-7.669 E.00972
G1 X47.019 Y38.741 E5.98534
G1 X47.304 Y38.48 E.00972
G1 X215.52 Y206.696 E5.98449
G1 X215.781 Y206.412 E.00972
G1 X47.588 Y38.219 E5.98364
G1 X47.873 Y37.958 E.00972
G1 X216.042 Y206.127 E5.98279
G1 X216.303 Y205.842 E.00972
G1 X48.158 Y37.697 E5.98194
G3 X48.445 Y37.438 I7.604 J8.115 E.00972
G1 X216.562 Y205.555 E5.98097
G1 X216.818 Y205.266 E.00973
G1 X48.734 Y37.182 E5.97979
G1 X49.024 Y36.925 E.00973
G1 X217.075 Y204.976 E5.9786
G1 X217.331 Y204.687 E.00973
G1 X49.313 Y36.669 E5.97741
G1 X49.603 Y36.413 E.00973
G1 X217.587 Y204.397 E5.97622
G1 X217.843 Y204.108 E.00973
G1 X49.892 Y36.157 E5.97504
G1 X50.187 Y35.905 E.00974
G1 X218.095 Y203.813 E5.97351
G1 X218.346 Y203.519 E.00974
G1 X50.481 Y35.654 E5.97199
G1 X50.775 Y35.403 E.00974
G1 X218.597 Y203.225 E5.97046
G1 X218.849 Y202.93 E.00974
G1 X51.07 Y35.151 E5.96893
M73 P50 R41
G1 X51.364 Y34.9 E.00974
G1 X219.1 Y202.636 E5.9674
G2 X219.349 Y202.339 I-8.361 J-7.24 E.00975
G1 X51.661 Y34.651 E5.96567
G1 X51.96 Y34.405 E.00975
G1 X219.595 Y202.04 E5.9638
G1 X219.842 Y201.741 E.00975
G1 X52.259 Y34.158 E5.96193
G1 X52.559 Y33.912 E.00975
G1 X220.088 Y201.441 E5.96006
G1 X220.335 Y201.142 E.00975
G1 X52.858 Y33.665 E5.95819
G3 X53.158 Y33.42 I7.143 J8.439 E.00976
G1 X220.58 Y200.842 E5.95623
G1 X220.822 Y200.538 E.00977
G1 X53.462 Y33.178 E5.95402
G1 X53.766 Y32.936 E.00977
G1 X221.064 Y200.234 E5.95181
G1 X221.306 Y199.93 E.00977
G1 X54.07 Y32.694 E5.94959
G1 X54.374 Y32.453 E.00977
G1 X221.547 Y199.626 E5.94738
G1 X221.789 Y199.322 E.00977
G1 X54.678 Y32.211 E5.94517
G3 X54.986 Y31.973 I6.974 J8.74 E.00979
G1 X222.027 Y199.014 E5.94264
G1 X222.263 Y198.705 E.00979
G1 X55.295 Y31.737 E5.94009
G1 X55.604 Y31.5 E.00979
G1 X222.5 Y198.396 E5.93753
G1 X222.737 Y198.087 E.00979
G1 X55.913 Y31.263 E5.93498
G1 X56.221 Y31.026 E.00979
G1 X222.974 Y197.779 E5.93242
G2 X223.208 Y197.467 I-8.824 J-6.876 E.00981
G1 X56.533 Y30.792 E5.92967
G1 X56.847 Y30.559 E.00982
G1 X223.441 Y197.153 E5.92677
G1 X223.673 Y196.84 E.00982
G1 X57.16 Y30.327 E5.92386
G1 X57.474 Y30.095 E.00982
G1 X223.905 Y196.526 E5.92096
G1 X224.137 Y196.212 E.00982
G1 X57.788 Y29.863 E5.91806
G3 X58.102 Y29.632 I6.788 J8.925 E.00982
G1 X224.368 Y195.898 E5.91508
G1 X224.595 Y195.579 E.00984
G1 X58.421 Y29.405 E5.91183
G1 X58.739 Y29.178 E.00984
G1 X224.822 Y195.261 E5.90858
G1 X225.049 Y194.942 E.00984
G1 X59.058 Y28.951 E5.90533
G1 X59.376 Y28.723 E.00984
G1 X225.277 Y194.623 E5.90208
G1 X225.504 Y194.305 E.00984
G1 X59.695 Y28.496 E5.89883
M73 P50 R40
G3 X60.018 Y28.274 I6.463 J9.034 E.00987
G1 X225.726 Y193.982 E5.89526
G1 X225.949 Y193.658 E.00987
G1 X60.342 Y28.051 E5.89166
G1 X60.665 Y27.829 E.00987
G1 X226.171 Y193.335 E5.88806
G1 X226.393 Y193.012 E.00987
G1 X60.988 Y27.607 E5.88446
G1 X61.312 Y27.384 E.00987
G1 X226.616 Y192.688 E5.88086
G2 X226.835 Y192.362 I-9.245 J-6.439 E.00989
G1 X61.638 Y27.165 E5.87704
G1 X61.967 Y26.948 E.00991
G1 X227.052 Y192.033 E5.87309
G1 X227.269 Y191.705 E.00991
G1 X62.295 Y26.731 E5.86914
G1 X62.624 Y26.513 E.00991
G1 X227.487 Y191.376 E5.86519
G1 X227.704 Y191.048 E.00991
G1 X62.952 Y26.296 E5.86124
G3 X63.282 Y26.08 I6.327 J9.331 E.00992
G1 X227.92 Y190.718 E5.85716
M73 P51 R40
G1 X228.132 Y190.384 E.00994
G1 X63.616 Y25.868 E5.85286
G1 X63.949 Y25.656 E.00994
G1 X228.344 Y190.051 E5.84855
G1 X228.557 Y189.718 E.00994
G1 X64.282 Y25.443 E5.84425
G1 X64.616 Y25.231 E.00994
G1 X228.769 Y189.384 E5.83994
G2 X228.981 Y189.051 I-9.498 J-6.261 E.00995
G1 X64.949 Y25.019 E5.8356
G1 X65.288 Y24.812 E.00998
G1 X229.188 Y188.712 E5.83094
G1 X229.396 Y188.374 E.00998
G1 X65.626 Y24.604 E5.82628
G1 X65.965 Y24.397 E.00998
G1 X229.603 Y188.035 E5.82162
G1 X229.81 Y187.697 E.00998
G1 X66.303 Y24.19 E5.81696
G1 X66.641 Y23.982 E.00998
G1 X230.018 Y187.359 E5.8123
G2 X230.221 Y187.016 I-9.669 J-5.956 E.01002
G1 X66.984 Y23.779 E5.80732
G1 X67.328 Y23.577 E.01003
G1 X230.423 Y186.672 E5.8023
G1 X230.625 Y186.329 E.01003
G1 X67.671 Y23.375 E5.79728
G1 X68.014 Y23.172 E.01003
G1 X230.828 Y185.986 E5.79226
G1 X231.03 Y185.642 E.01003
G1 X68.358 Y22.97 E5.78724
G3 X68.705 Y22.771 I5.883 J9.854 E.01006
G1 X231.229 Y185.295 E5.78198
G1 X231.426 Y184.947 E.01007
G1 X69.053 Y22.574 E5.77659
G1 X69.402 Y22.377 E.01007
G1 X231.623 Y184.598 E5.77121
G1 X231.82 Y184.25 E.01007
G1 X69.75 Y22.18 E5.76583
G1 X70.099 Y21.982 E.01007
G1 X232.018 Y183.901 E5.76044
G2 X232.212 Y183.55 I-9.957 J-5.756 E.0101
G1 X70.45 Y21.788 E5.75489
G1 X70.803 Y21.596 E.01012
G1 X232.404 Y183.197 E5.74914
G1 X232.596 Y182.843 E.01012
G1 X71.157 Y21.404 E5.74338
G1 X71.511 Y21.212 E.01012
G1 X232.788 Y182.489 E5.73763
G1 X232.981 Y182.135 E.01012
G1 X71.865 Y21.019 E5.73188
G3 X72.22 Y20.829 I5.638 J10.093 E.01014
G1 X233.171 Y181.78 E5.72602
G1 X233.358 Y181.421 E.01018
G1 X72.579 Y20.642 E5.7199
G1 X72.938 Y20.455 E.01018
G1 X233.545 Y181.062 E5.71377
G1 X233.731 Y180.703 E.01018
G1 X73.297 Y20.269 E5.70765
G1 X73.655 Y20.082 E.01018
G1 X233.918 Y180.345 E5.70153
G2 X234.104 Y179.985 I-10.276 J-5.539 E.01019
G1 X74.015 Y19.896 E5.69535
G1 X74.379 Y19.714 E.01024
G1 X234.286 Y179.621 E5.68885
G1 X234.467 Y179.256 E.01024
G1 X74.744 Y19.533 E5.68235
G1 X75.108 Y19.351 E.01024
G1 X234.649 Y178.892 E5.67586
G1 X234.83 Y178.528 E.01024
G1 X75.472 Y19.17 E5.66936
G3 X75.837 Y18.988 I4.159 J7.916 E.01024
G1 X235.012 Y178.164 E5.66284
M73 P51 R39
G1 X235.188 Y177.794 E.0103
G1 X76.208 Y18.814 E5.6559
G1 X76.579 Y18.639 E.01032
G1 X235.364 Y177.425 E5.64897
G1 X235.54 Y177.055 E.0103
G1 X76.95 Y18.465 E5.64204
G1 X77.321 Y18.29 E.01032
G1 X235.717 Y176.686 E5.6351
M73 P52 R39
G1 X235.893 Y176.316 E.0103
G1 X77.692 Y18.115 E5.62817
G1 X78.063 Y17.941 E.01032
G1 X236.064 Y175.941 E5.62105
G1 X236.235 Y175.566 E.01036
G1 X78.434 Y17.766 E5.61392
G3 X78.808 Y17.594 I7.236 J15.269 E.01035
G1 X236.405 Y175.192 E5.60669
G1 X236.576 Y174.817 E.01036
G1 X79.183 Y17.424 E5.59943
G1 X79.558 Y17.253 E.01036
G1 X236.747 Y174.442 E5.59217
G2 X236.913 Y174.062 I-10.677 J-4.88 E.01043
G1 X79.938 Y17.087 E5.58455
G1 X80.319 Y16.922 E.01043
G1 X237.078 Y173.681 E5.5769
G1 X237.244 Y173.301 E.01043
G1 X80.699 Y16.756 E5.56925
G1 X81.079 Y16.591 E.01043
G1 X237.409 Y172.921 E5.5616
G1 X237.574 Y172.54 E.01043
G1 X81.46 Y16.426 E5.55396
G3 X81.845 Y16.265 I4.69 J10.742 E.0105
G1 X237.735 Y172.155 E5.54594
G1 X237.894 Y171.769 E.01051
G1 X82.231 Y16.106 E5.5379
G1 X82.617 Y15.946 E.01051
G1 X238.054 Y171.383 E5.52986
G1 X238.214 Y170.997 E.01051
G1 X83.003 Y15.786 E5.52181
G1 X83.389 Y15.626 E.01051
G1 X238.374 Y170.611 E5.51377
G2 X238.528 Y170.22 I-11.326 J-4.696 E.01058
G1 X83.78 Y15.472 E5.50534
G1 X84.172 Y15.317 E.01059
G1 X238.683 Y169.828 E5.4969
G1 X238.837 Y169.437 E.01059
G1 X84.563 Y15.163 E5.48846
G1 X84.955 Y15.009 E.01059
G1 X238.991 Y169.045 E5.48002
G1 X239.145 Y168.654 E.01059
G1 X85.346 Y14.855 E5.47157
G1 X85.745 Y14.708 E.01069
G1 X239.294 Y168.257 E5.46265
G1 X239.442 Y167.859 E.01067
G1 X86.144 Y14.561 E5.45374
G1 X86.543 Y14.415 E.01069
G1 X239.591 Y167.462 E5.44483
G1 X239.739 Y167.065 E.01067
G1 X86.942 Y14.268 E5.43592
G1 X87.341 Y14.121 E.01069
G1 X239.887 Y166.667 E5.42699
G1 X240.03 Y166.264 E.01076
G1 X87.74 Y13.974 E5.41787
G1 X88.139 Y13.828 E.01069
G1 X240.172 Y165.861 E5.40875
G1 X240.315 Y165.458 E.01076
G1 X88.542 Y13.685 E5.3995
G1 X88.945 Y13.542 E.01076
G1 X240.458 Y165.055 E5.39024
G2 X240.599 Y164.65 I-11.467 J-4.228 E.01078
G1 X89.35 Y13.401 E5.38086
G1 X89.759 Y13.264 E.01085
G1 X240.736 Y164.241 E5.37118
G1 X240.873 Y163.832 E.01085
G1 X90.167 Y13.127 E5.3615
G1 X90.576 Y12.991 E.01085
G1 X241.009 Y163.424 E5.35182
G1 X241.146 Y163.015 E.01085
G1 X90.985 Y12.854 E5.34214
G3 X91.397 Y12.72 I4.036 J11.683 E.01089
G1 X241.28 Y162.603 E5.33227
G1 X241.411 Y162.188 E.01094
G1 X91.812 Y12.589 E5.32217
G1 X92.227 Y12.458 E.01094
G1 X241.542 Y161.773 E5.31206
G1 X241.673 Y161.358 E.01094
G1 X92.642 Y12.327 E5.30195
G1 X93.057 Y12.196 E.01094
G1 X241.804 Y160.943 E5.29185
G2 X241.93 Y160.524 I-11.938 J-3.839 E.01101
G1 X93.477 Y12.071 E5.2814
M73 P53 R39
G1 X93.9 Y11.948 E.01108
G1 X242.055 Y160.103 E5.27079
G1 X242.18 Y159.682 E.01105
G1 X94.323 Y11.825 E5.26019
G1 X94.746 Y11.702 E.01108
G1 X242.305 Y159.261 E5.24958
G1 X242.429 Y158.84 E.01105
G1 X95.168 Y11.58 E5.23897
M73 P53 R38
G1 X95.591 Y11.457 E.01108
G1 X242.548 Y158.414 E5.22815
G1 X242.667 Y157.986 E.01115
G1 X96.014 Y11.334 E5.21732
G3 X96.441 Y11.215 I5.087 J17.411 E.01114
G1 X242.785 Y157.559 E5.20636
G1 X242.904 Y157.132 E.01115
G1 X96.868 Y11.096 E5.19537
G3 X97.297 Y10.98 I3.57 J12.254 E.01118
G1 X243.02 Y156.703 E5.18427
G1 X243.133 Y156.269 E.01127
G1 X97.731 Y10.867 E5.17284
G1 X98.164 Y10.755 E.01127
G1 X243.245 Y155.836 E5.1614
G1 X243.357 Y155.402 E.01127
G1 X98.598 Y10.643 E5.14996
G1 X99.031 Y10.531 E.01127
G1 X243.469 Y154.969 E5.13853
G2 X243.577 Y154.531 I-12.482 J-3.318 E.01134
G1 X99.469 Y10.423 E5.12681
G1 X99.909 Y10.317 E.01139
G1 X243.683 Y154.091 E5.11491
G1 X243.788 Y153.651 E.01139
G1 X100.349 Y10.211 E5.10301
G1 X100.789 Y10.106 E.01139
G1 X243.894 Y153.211 E5.09112
G1 X244 Y152.771 E.01139
G1 X101.229 Y10 E5.07921
G1 X101.676 Y9.901 E.01151
G1 X244.099 Y152.324 E5.06684
G1 X244.198 Y151.877 E.01151
G1 X102.123 Y9.802 E5.05447
G1 X102.57 Y9.703 E.01151
G1 X244.297 Y151.43 E5.0421
G1 X244.396 Y150.984 E.01151
G1 X103.016 Y9.604 E5.02973
G3 X103.466 Y9.508 I2.964 J12.82 E.01157
G1 X244.492 Y150.534 E5.01713
G1 X244.584 Y150.08 E.01164
G1 X103.92 Y9.416 E5.00428
G1 X104.373 Y9.324 E.01164
G1 X244.676 Y149.627 E4.99143
G1 X244.768 Y149.173 E.01164
G1 X104.827 Y9.232 E4.97858
G1 X105.28 Y9.139 E.01164
G1 X244.861 Y148.72 E4.96573
G1 X244.946 Y148.26 E.01178
G1 X105.74 Y9.054 E4.95239
G1 X106.201 Y8.969 E.01178
G1 X245.031 Y147.799 E4.93905
G1 X245.117 Y147.339 E.01178
G1 X106.661 Y8.883 E4.92571
G1 X107.122 Y8.798 E.01178
G1 X245.202 Y146.878 E4.91236
G2 X245.283 Y146.414 I-13.302 J-2.572 E.01186
G1 X107.586 Y8.717 E4.89874
G1 X108.053 Y8.638 E.01192
G1 X245.362 Y145.947 E4.88489
G1 X245.44 Y145.479 E.01192
G1 X108.521 Y8.56 E4.87104
G1 X108.988 Y8.482 E.01192
G1 X245.518 Y145.012 E4.85719
G2 X245.595 Y144.543 I-13.347 J-2.433 E.01195
G1 X109.457 Y8.405 E4.84326
G1 X109.932 Y8.334 E.01208
G1 X245.666 Y144.068 E4.82889
G1 X245.737 Y143.593 E.01208
G1 X110.407 Y8.263 E4.81453
G1 X110.882 Y8.192 E.01208
G1 X245.808 Y143.118 E4.80016
G1 X245.879 Y142.644 E.01208
G1 X111.356 Y8.121 E4.78579
G3 X111.837 Y8.056 I2.093 J13.744 E.01221
G1 X245.944 Y142.163 E4.77098
G1 X246.007 Y141.68 E.01224
G1 X112.32 Y7.993 E4.75608
G1 X112.802 Y7.929 E.01224
G1 X246.071 Y141.198 E4.74118
M73 P54 R38
G1 X246.134 Y140.716 E.01224
G1 X113.284 Y7.866 E4.72629
G3 X113.771 Y7.807 I1.938 J13.917 E.01233
G1 X246.193 Y140.229 E4.71108
G1 X246.249 Y139.739 E.0124
G1 X114.261 Y7.751 E4.69563
G1 X114.751 Y7.695 E.0124
G1 X246.305 Y139.249 E4.68019
G1 X246.361 Y138.76 E.0124
G1 X115.24 Y7.639 E4.66475
G3 X115.733 Y7.586 I1.765 J14.09 E.01247
G1 X246.414 Y138.267 E4.6491
G1 X246.462 Y137.769 E.01258
G1 X116.231 Y7.538 E4.6331
G1 X116.729 Y7.49 E.01258
G1 X246.51 Y137.271 E4.6171
G1 X246.557 Y136.773 E.01258
G1 X117.227 Y7.443 E4.60109
G3 X117.727 Y7.397 I1.253 J10.938 E.01263
G1 X246.604 Y136.274 E4.58495
G1 X246.644 Y135.768 E.01277
G1 X118.235 Y7.359 E4.56828
G1 X118.743 Y7.322 E.01282
G1 X246.683 Y135.262 E4.55161
G1 X246.723 Y134.756 E.01277
G1 X119.252 Y7.285 E4.53494
G1 X119.76 Y7.248 E.01282
G1 X246.762 Y134.249 E4.51823
M73 P54 R37
G1 X246.794 Y133.735 E.01296
G1 X120.269 Y7.21 E4.50126
G3 X120.779 Y7.175 I1.709 J20.97 E.01287
G1 X246.825 Y133.221 E4.48423
G1 X246.856 Y132.707 E.01296
G1 X121.293 Y7.144 E4.46705
G3 X121.808 Y7.113 I1.145 J14.82 E.01298
G1 X246.887 Y132.192 E4.44983
G1 X246.91 Y131.669 E.01317
G1 X122.331 Y7.09 E4.43204
G1 X122.854 Y7.067 E.01317
G1 X246.933 Y131.146 E4.41424
G1 X246.956 Y130.623 E.01317
G1 X123.377 Y7.044 E4.39645
G3 X123.901 Y7.022 I.888 J14.968 E.01319
G1 X246.978 Y130.099 E4.3786
G1 X246.992 Y129.567 E.01338
G1 X124.433 Y7.008 E4.36017
G1 X124.964 Y6.994 E.01338
G1 X247.006 Y129.036 E4.34175
G1 X247.019 Y128.504 E.01338
G1 X125.496 Y6.981 E4.32333
G3 X126.03 Y6.969 I.518 J11.669 E.01344
G1 X247.032 Y127.97 E4.30475
G1 X247.036 Y127.429 E.01361
G1 X126.574 Y6.967 E4.28557
G1 X127.118 Y6.965 E.01368
G1 X247.041 Y126.888 E4.26639
G1 X247.046 Y126.347 E.01361
G1 X127.662 Y6.963 E4.24721
G1 X128.206 Y6.962 E.01368
G1 X247.047 Y125.803 E4.2279
G1 X247.042 Y125.252 E.01385
G1 X128.75 Y6.96 E4.20838
G3 X129.298 Y6.963 I.158 J22.727 E.0138
G1 X247.037 Y124.702 E4.1887
G1 X247.033 Y124.151 E.01385
G1 X129.849 Y6.967 E4.16894
G3 X130.405 Y6.978 I-.024 J15.956 E.014
G1 X247.022 Y123.595 E4.14877
G1 X247.007 Y123.034 E.0141
G1 X130.966 Y6.993 E4.12831
G1 X131.526 Y7.007 E.0141
G1 X246.993 Y122.474 E4.10786
G1 X246.978 Y121.914 E.0141
G1 X132.086 Y7.022 E4.0874
G3 X132.656 Y7.046 I-.391 J16.255 E.01434
G1 X246.954 Y121.344 E4.0663
G1 X246.929 Y120.774 E.01437
G1 X133.226 Y7.071 E4.04511
G1 X133.797 Y7.095 E.01437
G1 X246.898 Y120.197 E4.0237
G1 X246.866 Y119.619 E.01456
G1 X134.37 Y7.123 E4.00216
G1 X134.952 Y7.159 E.01465
G1 X246.834 Y119.041 E3.98033
G1 X246.802 Y118.463 E.01456
G1 X135.533 Y7.194 E3.95851
G1 X136.114 Y7.23 E.01465
G1 X246.769 Y117.885 E3.93668
G2 X246.727 Y117.297 I-12.962 J.629 E.01482
G1 X136.703 Y7.273 E3.91424
G1 X137.295 Y7.319 E.01495
G1 X246.681 Y116.705 E3.89151
G1 X246.634 Y116.112 E.01495
G1 X137.888 Y7.366 E3.86878
G3 X138.482 Y7.414 I-1.097 J17.063 E.015
G1 X246.586 Y115.518 E3.8459
M73 P55 R37
G1 X246.527 Y114.914 E.01526
G1 X139.086 Y7.473 E3.82235
G1 X139.69 Y7.531 E.01526
G1 X246.469 Y114.31 E3.7988
G1 X246.411 Y113.706 E.01526
G1 X140.294 Y7.589 E3.77525
G3 X140.907 Y7.656 I-1.619 J17.6 E.01551
G1 X246.344 Y113.093 E3.75105
G1 X246.274 Y112.478 E.01559
G1 X141.522 Y7.726 E3.72664
G1 X142.138 Y7.796 E.01559
G1 X246.204 Y111.862 E3.70224
G2 X246.128 Y111.241 I-17.791 J1.839 E.01573
G1 X142.759 Y7.872 E3.67747
G1 X143.388 Y7.954 E.01595
G1 X246.046 Y110.612 E3.65217
G1 X245.963 Y109.984 E.01595
G1 X144.016 Y8.037 E3.62687
G3 X144.646 Y8.121 I-2.105 J18.117 E.01599
G1 X245.879 Y109.354 E3.60145
G1 X245.783 Y108.712 E.01632
G1 X145.288 Y8.217 E3.57521
G1 X145.93 Y8.313 E.01632
G1 X245.687 Y108.07 E3.54898
G1 X245.591 Y107.429 E.01632
G1 X146.571 Y8.409 E3.52274
G3 X147.225 Y8.518 I-2.774 J18.747 E.01668
G1 X245.482 Y106.775 E3.4956
G1 X245.373 Y106.119 E.01672
G1 X147.881 Y8.627 E3.46838
G1 X148.536 Y8.737 E.01672
G1 X245.263 Y105.464 E3.44116
G2 X245.142 Y104.797 I-19.13 J3.131 E.01705
G1 X149.203 Y8.858 E3.41313
G1 X149.873 Y8.982 E.01714
G1 X245.018 Y104.127 E3.38488
G1 X244.893 Y103.457 E.01714
G1 X150.543 Y9.107 E3.35663
G3 X151.224 Y9.242 I-3.538 J19.57 E.01747
G1 X244.758 Y102.776 E3.32757
G1 X244.619 Y102.091 E.01759
G1 X151.909 Y9.381 E3.29824
G1 X152.594 Y9.521 E.01759
G1 X244.479 Y101.406 E3.26891
G2 X244.327 Y100.708 I-20.143 J4.017 E.01796
G1 X153.292 Y9.673 E3.2387
G1 X153.993 Y9.828 E.01807
G1 X244.172 Y100.007 E3.20822
G1 X244.017 Y99.306 E.01807
G1 X154.694 Y9.983 E3.17775
G3 X155.41 Y10.154 I-4.503 J20.523 E.01852
G1 X243.846 Y98.59 E3.14621
G1 X243.674 Y97.872 E.01858
G1 X156.128 Y10.326 E3.11453
G3 X156.848 Y10.5 I-4.591 J20.603 E.01861
G1 X243.5 Y97.152 E3.08276
G1 X243.31 Y96.416 E.01913
G1 X157.584 Y10.69 E3.0498
M73 P55 R36
G1 X158.32 Y10.88 E.01913
G1 X243.12 Y95.68 E3.01684
G2 X242.923 Y94.938 I-21.352 J5.259 E.01932
G1 X159.062 Y11.077 E2.98343
G1 X159.817 Y11.287 E.01971
G1 X242.713 Y94.183 E2.94912
G1 X242.504 Y93.427 E.01971
G1 X160.573 Y11.496 E2.9148
G3 X161.342 Y11.719 I-6.011 J22.144 E.02014
G1 X242.281 Y92.658 E2.87951
G1 X242.051 Y91.883 E.02034
G1 X162.117 Y11.949 E2.84375
G3 X162.895 Y12.181 I-6.29 J22.501 E.02042
G1 X241.819 Y91.105 E2.80782
G1 X241.568 Y90.308 E.02102
G1 X163.692 Y12.432 E2.77052
G1 X164.489 Y12.684 E.02102
G1 X241.316 Y89.511 E2.73323
G2 X241.051 Y88.7 I-23.361 J7.201 E.02148
G1 X165.3 Y12.949 E2.69491
G1 X166.12 Y13.224 E.02176
G1 X240.772 Y87.875 E2.6558
G1 X240.48 Y87.038 E.0223
G1 X166.946 Y13.504 E2.61605
G1 X167.791 Y13.803 E.02255
G1 X240.189 Y86.2 E2.57563
G1 X239.897 Y85.363 E.0223
G1 X168.636 Y14.102 E2.5352
G3 X169.505 Y14.425 I-8.849 J25.115 E.02333
G1 X239.575 Y84.495 E2.4928
G1 X239.249 Y83.623 E.02341
G1 X170.377 Y14.751 E2.4502
G3 X171.268 Y15.096 I-9.439 J25.684 E.02404
G1 X238.904 Y82.732 E2.40622
G1 X238.549 Y81.832 E.02435
G1 X172.168 Y15.451 E2.36157
G3 X173.085 Y15.822 I-10.196 J26.51 E.02488
G1 X238.178 Y80.915 E2.31576
G1 X237.792 Y79.984 E.02537
G1 X174.016 Y16.208 E2.26889
G3 X174.964 Y16.61 I-11.011 J27.291 E.02589
G1 X237.39 Y79.036 E2.22089
G1 X236.97 Y78.071 E.02649
G1 X175.929 Y17.03 E2.17161
G3 X176.913 Y17.468 I-12.057 J28.404 E.02709
G1 X236.532 Y77.087 E2.12102
G1 X236.075 Y76.084 E.02772
G1 X177.916 Y17.925 E2.0691
G3 X178.943 Y18.406 I-13.273 J29.65 E.02854
G1 X235.594 Y75.057 E2.01541
G1 X235.096 Y74.013 E.02908
G1 X179.987 Y18.904 E1.96059
G3 X181.066 Y19.438 I-14.792 J31.268 E.0303
G1 X234.562 Y72.934 E1.90318
G2 X234.015 Y71.841 I-31.639 J15.162 E.03076
G1 X182.159 Y19.985 E1.84481
G1 X183.298 Y20.578 E.03228
G1 X233.422 Y70.702 E1.78323
G2 X232.803 Y69.537 I-33.695 J17.164 E.03319
G1 X184.463 Y21.197 E1.71975
G1 X185.657 Y21.845 E.03418
G1 X232.154 Y68.343 E1.65421
G2 X231.447 Y67.089 I-36.482 J19.775 E.03622
G1 X186.911 Y22.553 E1.58442
G3 X188.204 Y23.301 I-20.762 J37.414 E.03758
G1 X230.699 Y65.796 E1.51182
M73 P56 R36
G2 X229.904 Y64.455 I-38.804 J22.109 E.03923
G1 X189.545 Y24.096 E1.4358
G1 X190.954 Y24.96 E.04158
G1 X229.04 Y63.046 E1.35493
G2 X228.091 Y61.551 I-43.346 J26.474 E.04455
G1 X192.449 Y25.909 E1.26798
G3 X194.035 Y26.949 I-29.028 J45.992 E.0477
G1 X227.051 Y59.965 E1.17458
G2 X225.895 Y58.264 I-49.315 J32.255 E.05175
G1 X195.736 Y28.105 E1.07293
G3 X197.59 Y29.413 I-36.544 J53.758 E.05708
G1 X224.587 Y56.41 E.96044
G2 X223.073 Y54.35 I-186.123 J135.221 E.06431
G1 X199.65 Y30.927 E.83331
G3 X202.092 Y32.823 I-53.154 J70.973 E.07778
G1 X221.177 Y51.908 E.67898
G2 X219.196 Y49.477 I-101.136 J80.353 E.0789
G1 X218.642 Y48.828 E.02146
G1 X205.172 Y35.358 E.47922
G3 X210.698 Y40.364 I-75.106 J88.466 E.18761
G3 X216.711 Y46.351 I-340.363 J347.819 E.21348
; CHANGE_LAYER
; Z_HEIGHT: 0.68
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11661.354
G1 X215.297 Y44.937 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/6
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M204 S10000
G17
G3 Z.92 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 53
G1 X132.167 Y245.316
G1 Z.68
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M204 S4000
G3 X75.662 Y18.694 I-4.176 J-119.314 E8.80857
G3 X129.251 Y6.622 I52.338 J107.353 E1.50193
G3 X132.227 Y245.314 I-1.261 J119.38 E10.01421
M204 S10000
G1 X132.18 Y245.717 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G1 X132.18 Y245.716 E.00002
G3 X75.487 Y18.334 I-4.189 J-119.714 E8.20023
G3 X129.255 Y6.221 I52.514 J107.714 E1.39819
G3 X135.104 Y245.578 I-1.264 J119.781 E9.25058
G1 X132.24 Y245.714 E.07207
; WIPE_START
M204 S4000
G1 X132.18 Y245.716 E-.02289
G1 X130.241 Y245.758 E-.73711
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.325 Y242.917 Z1.08 F30000
G1 X207.649 Y214.712 Z1.08
G1 Z.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420226
G1 F11661.354
M204 S4000
G2 X213.636 Y208.698 I-341.585 J-346.13 E.21348
G2 X218.642 Y203.172 I-83.434 J-80.609 E.18761
G1 X205.172 Y216.642 E.47922
G3 X202.092 Y219.177 I-77.473 J-91.015 E.10035
G1 X221.177 Y200.092 E.67898
G2 X223.073 Y197.65 I-69.081 J-55.6 E.07778
G1 X199.65 Y221.073 E.83331
G3 X197.59 Y222.587 I-137.606 J-185.051 E.0643
G1 X224.587 Y195.59 E.96044
G2 X225.895 Y193.736 I-52.397 J-38.361 E.05708
G1 X195.736 Y223.895 E1.07293
G3 X194.035 Y225.051 I-33.943 J-48.141 E.05175
G1 X227.051 Y192.035 E1.17458
G2 X228.091 Y190.449 I-44.899 J-30.578 E.0477
G1 X192.449 Y226.091 E1.26798
G3 X190.954 Y227.04 I-27.95 J-42.367 E.04455
G1 X229.04 Y188.954 E1.35493
G1 X229.904 Y187.545 E.04158
G1 X189.545 Y227.904 E1.4358
G3 X188.204 Y228.699 I-23.442 J-37.995 E.03923
G1 X230.699 Y186.204 E1.51182
G2 X231.446 Y184.911 I-36.681 J-22.064 E.03758
G1 X186.911 Y229.447 E1.58442
G3 X185.657 Y230.154 I-20.86 J-35.475 E.03622
G1 X232.154 Y183.657 E1.65421
G1 X232.803 Y182.463 E.03418
G1 X184.463 Y230.803 E1.71975
G3 X183.298 Y231.422 I-18.322 J-33.062 E.03319
G1 X233.422 Y181.298 E1.78323
G1 X234.015 Y180.16 E.03228
G1 X182.159 Y232.015 E1.84481
G3 X181.066 Y232.562 I-16.194 J-30.968 E.03076
G1 X234.562 Y179.066 E1.90318
G2 X235.096 Y177.987 I-30.6 J-15.805 E.0303
G1 X179.986 Y233.096 E1.96059
G1 X178.943 Y233.594 E.02908
G1 X235.594 Y176.943 E2.01542
G2 X236.075 Y175.916 I-29.103 J-14.269 E.02854
G1 X177.916 Y234.075 E2.0691
G1 X176.913 Y234.532 E.02772
G1 X236.532 Y174.913 E2.12102
G2 X236.97 Y173.929 I-27.965 J-13.041 E.02709
G1 X175.929 Y234.97 E2.17161
G1 X174.964 Y235.39 E.02649
G1 X237.39 Y172.964 E2.22089
G2 X237.792 Y172.016 I-26.888 J-11.958 E.02589
G1 X174.016 Y235.792 E2.26888
G1 X173.085 Y236.178 E.02537
G1 X238.178 Y171.085 E2.31576
G2 X238.549 Y170.168 I-26.136 J-11.112 E.02488
G1 X172.168 Y236.549 E2.36157
G1 X171.268 Y236.904 E.02435
G1 X238.904 Y169.268 E2.40622
G2 X239.249 Y168.377 I-25.35 J-10.335 E.02404
G1 X170.377 Y237.249 E2.4502
G1 X169.505 Y237.575 E.02341
G1 X239.575 Y167.505 E2.4928
G2 X239.898 Y166.636 I-24.711 J-9.688 E.02333
G1 X168.636 Y237.898 E2.53522
G1 X167.791 Y238.197 E.02255
G1 X240.197 Y165.791 E2.57593
G1 X240.496 Y164.946 E.02255
G1 X166.959 Y238.484 E2.61619
M73 P56 R35
G1 X166.132 Y238.765 E.02198
G1 X240.776 Y164.12 E2.65557
G1 X241.051 Y163.3 E.02176
G1 X165.305 Y239.046 E2.69475
G3 X164.489 Y239.316 I-6.434 J-18.068 E.02162
G1 X241.316 Y162.489 E2.73323
G1 X241.568 Y161.692 E.02102
G1 X163.692 Y239.568 E2.77052
G1 X162.895 Y239.819 E.02102
G1 X241.819 Y160.895 E2.80782
G2 X242.051 Y160.117 I-22.105 J-7.019 E.02042
G1 X162.117 Y240.051 E2.84375
G3 X161.347 Y240.276 I-9.386 J-30.756 E.02019
G1 X242.281 Y159.342 E2.87933
G2 X242.504 Y158.573 I-21.976 J-6.796 E.02014
G1 X160.586 Y240.491 E2.91433
G1 X159.825 Y240.706 E.01989
G1 X242.713 Y157.817 E2.94885
G1 X242.923 Y157.062 E.01971
G1 X159.064 Y240.921 E2.98337
G3 X158.32 Y241.12 I-4.801 J-16.5 E.01938
G1 X243.12 Y156.32 E3.01684
G1 X243.31 Y155.584 E.01913
G1 X157.584 Y241.31 E3.0498
G1 X156.848 Y241.5 E.01913
G1 X243.5 Y154.848 E3.08276
G2 X243.674 Y154.128 I-20.634 J-5.359 E.01861
G1 X156.128 Y241.674 E3.11453
G1 X155.41 Y241.846 E.01858
G1 X243.846 Y153.41 E3.14621
G2 X244.017 Y152.694 I-20.483 J-5.251 E.01852
G1 X154.694 Y242.017 E3.17775
G1 X153.993 Y242.172 E.01807
G1 X244.172 Y151.993 E3.20822
G1 X244.327 Y151.292 E.01807
G1 X153.292 Y242.327 E3.2387
G3 X152.594 Y242.479 I-4.703 J-19.938 E.01796
G1 X244.479 Y150.594 E3.26891
G1 X244.619 Y149.909 E.01759
G1 X151.909 Y242.619 E3.29824
G3 X151.229 Y242.753 I-5.709 J-27.086 E.01744
G1 X244.758 Y149.224 E3.3274
G2 X244.893 Y148.543 I-19.453 J-4.223 E.01747
G1 X150.555 Y242.882 E3.3562
G1 X149.881 Y243.01 E.01726
G1 X245.018 Y147.873 E3.3846
G1 X245.142 Y147.203 E.01714
G1 X149.206 Y243.138 E3.41301
G3 X148.536 Y243.263 I-3.111 J-14.879 E.01715
G1 X245.263 Y146.536 E3.44116
G1 X245.373 Y145.881 E.01672
G1 X147.881 Y243.373 E3.46838
G1 X147.225 Y243.482 E.01672
G1 X245.482 Y145.225 E3.4956
G2 X245.591 Y144.571 I-18.727 J-3.443 E.01669
G1 X146.571 Y243.591 E3.52274
G1 X145.929 Y243.687 E.01632
G1 X245.687 Y143.93 E3.54898
M73 P57 R35
G1 X245.783 Y143.288 E.01632
G1 X145.288 Y243.783 E3.57521
G1 X144.646 Y243.879 E.01632
G1 X245.879 Y142.646 E3.60145
G2 X245.963 Y142.016 I-18.146 J-2.75 E.01599
G1 X144.016 Y243.963 E3.62687
G1 X143.388 Y244.046 E.01595
G1 X246.046 Y141.388 E3.65217
G1 X246.128 Y140.759 E.01595
G1 X142.759 Y244.128 E3.67747
G3 X142.138 Y244.204 I-2.463 J-17.738 E.01573
G1 X246.204 Y140.138 E3.70224
G1 X246.274 Y139.522 E.01559
G1 X141.522 Y244.274 E3.72664
G1 X140.907 Y244.344 E.01559
G1 X246.344 Y138.907 E3.75105
G2 X246.411 Y138.294 I-17.598 J-2.239 E.01551
G1 X140.294 Y244.411 E3.77525
G1 X139.69 Y244.469 E.01526
G1 X246.469 Y137.69 E3.7988
G1 X246.527 Y137.086 E.01526
G1 X139.086 Y244.527 E3.82235
G1 X138.482 Y244.585 E.01526
G1 X246.585 Y136.482 E3.8459
G2 X246.634 Y135.888 I-17.093 J-1.698 E.015
G1 X137.888 Y244.634 E3.86878
G1 X137.295 Y244.681 E.01495
G1 X246.681 Y135.295 E3.89151
G1 X246.727 Y134.703 E.01495
G1 X136.703 Y244.727 E3.91424
G3 X136.114 Y244.77 I-1.53 J-16.891 E.01485
G1 X246.77 Y134.114 E3.93672
G1 X246.806 Y133.533 E.01465
G1 X135.533 Y244.806 E3.95866
G3 X134.953 Y244.84 I-1.653 J-23.146 E.01461
G1 X246.841 Y132.952 E3.98056
G1 X246.877 Y132.37 E.01465
G1 X134.379 Y244.868 E4.00223
G1 X133.806 Y244.896 E.01445
G1 X246.905 Y131.797 E4.02362
G1 X246.929 Y131.226 E.01437
G1 X133.232 Y244.924 E4.04491
G1 X132.658 Y244.952 E.01445
G1 X246.954 Y130.656 E4.0662
G2 X246.978 Y130.086 I-16.225 J-.959 E.01434
G1 X132.087 Y244.978 E4.08738
G1 X131.529 Y244.989 E.01403
G1 X246.993 Y129.526 E4.10774
G1 X247.007 Y128.966 E.0141
G1 X130.972 Y245.001 E4.1281
G1 X130.414 Y245.013 E.01403
G1 X247.022 Y128.405 E4.14846
G2 X247.033 Y127.849 I-15.925 J-.581 E.014
G1 X129.857 Y245.025 E4.16867
G1 X129.299 Y245.037 E.01403
G1 X247.037 Y127.298 E4.18867
G1 X247.042 Y126.748 E.01385
G1 X128.748 Y245.042 E4.20846
G1 X128.197 Y245.047 E.01385
G1 X247.047 Y126.197 E4.22821
G2 X247.046 Y125.653 I-15.633 J-.235 E.0137
G1 X127.653 Y245.046 E4.24753
G1 X127.112 Y245.041 E.01361
G1 X247.041 Y125.112 E4.26661
G1 X247.036 Y124.571 E.01361
G1 X126.571 Y245.036 E4.28569
G1 X126.03 Y245.032 E.01361
G1 X247.032 Y124.03 E4.30477
G2 X247.019 Y123.496 I-15.321 J.08 E.01343
G1 X125.496 Y245.019 E4.32333
G1 X124.964 Y245.006 E.01338
G1 X247.006 Y122.964 E4.34175
G1 X246.992 Y122.433 E.01338
G1 X124.433 Y244.992 E4.36017
G1 X123.901 Y244.978 E.01338
G1 X246.978 Y121.901 E4.3786
G2 X246.954 Y121.379 I-11.685 J.28 E.01314
G1 X123.377 Y244.956 E4.39637
G1 X122.854 Y244.933 E.01317
G1 X246.928 Y120.859 E4.41408
G1 X246.903 Y120.338 E.01311
G1 X122.331 Y244.91 E4.43178
G1 X121.808 Y244.887 E.01317
G1 X246.878 Y119.818 E4.44948
G1 X246.852 Y119.298 E.01311
G1 X121.293 Y244.856 E4.4669
G1 X120.779 Y244.825 E.01296
G1 X246.825 Y118.779 E4.48422
G1 X246.794 Y118.265 E.01296
G1 X120.265 Y244.794 E4.5014
G1 X119.751 Y244.762 E.01296
G1 X246.762 Y117.751 E4.51858
G2 X246.723 Y117.244 I-14.569 J.865 E.01279
G1 X119.244 Y244.723 E4.53522
G1 X118.738 Y244.683 E.01277
G1 X246.683 Y116.738 E4.55181
G1 X246.644 Y116.232 E.01277
G1 X118.232 Y244.644 E4.56839
G1 X117.726 Y244.604 E.01277
G1 X246.604 Y115.726 E4.58497
G2 X246.557 Y115.227 I-14.293 J1.073 E.01262
G1 X117.227 Y244.557 E4.60109
G1 X116.729 Y244.509 E.01258
G1 X246.51 Y114.729 E4.6171
G1 X246.462 Y114.231 E.01258
G1 X116.231 Y244.462 E4.6331
G1 X115.733 Y244.414 E.01258
G1 X246.414 Y113.733 E4.6491
G2 X246.361 Y113.24 I-14.147 J1.273 E.01247
G1 X115.24 Y244.361 E4.66475
G1 X114.751 Y244.305 E.0124
G1 X246.305 Y112.751 E4.68019
G1 X246.249 Y112.261 E.0124
G1 X114.261 Y244.249 E4.69563
M73 P57 R34
G1 X113.771 Y244.193 E.0124
G1 X246.193 Y111.771 E4.71108
G2 X246.134 Y111.284 I-13.954 J1.448 E.01233
G1 X113.284 Y244.134 E4.72629
G1 X112.802 Y244.071 E.01224
G1 X246.071 Y110.802 E4.74118
G1 X246.007 Y110.32 E.01224
G1 X112.32 Y244.007 E4.75608
G1 X111.837 Y243.944 E.01224
G1 X245.944 Y109.837 E4.77098
M73 P58 R34
G2 X245.879 Y109.356 I-13.844 J1.616 E.01221
G1 X111.356 Y243.879 E4.78579
G1 X110.882 Y243.808 E.01208
G1 X245.808 Y108.882 E4.80016
G1 X245.737 Y108.407 E.01208
G1 X110.407 Y243.737 E4.81452
G1 X109.932 Y243.666 E.01208
G1 X245.666 Y107.932 E4.82889
G1 X245.595 Y107.457 E.01208
G1 X109.457 Y243.595 E4.84326
G3 X108.988 Y243.518 I1.975 J-13.487 E.01195
G1 X245.518 Y106.988 E4.85719
G1 X245.44 Y106.521 E.01192
G1 X108.521 Y243.44 E4.87104
G1 X108.053 Y243.362 E.01192
G1 X245.362 Y106.053 E4.88489
G1 X245.283 Y105.586 E.01192
G1 X107.586 Y243.283 E4.89874
G3 X107.122 Y243.202 I2.098 J-13.331 E.01186
G1 X245.201 Y105.123 E4.91233
G1 X245.114 Y104.664 E.01174
G1 X106.661 Y243.117 E4.9256
G1 X106.201 Y243.031 E.01178
G1 X245.026 Y104.206 E4.93888
G1 X244.939 Y103.747 E.01174
G1 X105.74 Y242.946 E4.95215
G1 X105.28 Y242.861 E.01178
G1 X244.852 Y103.289 E4.96542
G1 X244.764 Y102.831 E.01174
G1 X104.827 Y242.768 E4.97844
G1 X104.373 Y242.676 E.01164
G1 X244.676 Y102.373 E4.99143
G1 X244.584 Y101.92 E.01164
G1 X103.92 Y242.584 E5.00428
G1 X103.466 Y242.492 E.01164
G1 X244.492 Y101.466 E5.01713
G2 X244.396 Y101.016 I-12.926 J2.516 E.01157
G1 X103.016 Y242.396 E5.02973
G1 X102.57 Y242.297 E.01151
G1 X244.297 Y100.57 E5.0421
G1 X244.198 Y100.123 E.01151
G1 X102.123 Y242.198 E5.05447
G1 X101.676 Y242.099 E.01151
G1 X244.099 Y99.676 E5.06684
G1 X244 Y99.23 E.01151
G1 X101.229 Y242 E5.07921
G1 X100.789 Y241.894 E.01139
G1 X243.894 Y98.789 E5.09112
G1 X243.789 Y98.349 E.01139
G1 X100.349 Y241.788 E5.10301
G1 X99.909 Y241.683 E.01139
G1 X243.683 Y97.909 E5.11491
G1 X243.577 Y97.469 E.01139
G1 X99.469 Y241.577 E5.12681
G3 X99.031 Y241.469 I2.876 J-12.574 E.01134
G1 X243.468 Y97.032 E5.1385
G1 X243.354 Y96.6 E.01123
G1 X98.598 Y241.357 E5.14987
G1 X98.164 Y241.245 E.01127
G1 X243.24 Y96.169 E5.16125
G1 X243.126 Y95.737 E.01123
G1 X97.731 Y241.133 E5.17262
G1 X97.297 Y241.02 E.01127
G1 X243.012 Y95.305 E5.18399
G1 X242.899 Y94.873 E.01123
G1 X96.868 Y240.904 E5.19519
G1 X96.441 Y240.785 E.01115
G1 X242.785 Y94.442 E5.20634
G2 X242.667 Y94.014 I-17.423 J4.572 E.01116
G1 X96.014 Y240.667 E5.21734
G1 X95.586 Y240.548 E.01115
G1 X242.548 Y93.587 E5.22833
G2 X242.429 Y93.16 I-12.293 J3.193 E.01115
G1 X95.16 Y240.429 E5.23928
G1 X94.739 Y240.305 E.01105
G1 X242.305 Y92.739 E5.24982
G1 X242.18 Y92.318 E.01105
G1 X94.318 Y240.18 E5.26037
G3 X93.898 Y240.054 I4.78 J-16.739 E.01103
G1 X242.055 Y91.897 E5.27087
G1 X241.93 Y91.476 E.01105
G1 X93.481 Y239.925 E5.28126
G1 X93.064 Y239.796 E.01097
G1 X241.804 Y91.057 E5.29157
G1 X241.673 Y90.642 E.01094
G1 X92.648 Y239.667 E5.30174
G1 X92.231 Y239.538 E.01097
G1 X241.542 Y90.227 E5.31191
G1 X241.411 Y89.812 E.01094
G1 X91.814 Y239.409 E5.32208
G1 X91.398 Y239.28 E.01097
G1 X241.28 Y89.397 E5.33225
G2 X241.146 Y88.985 I-11.824 J3.626 E.01089
G1 X90.985 Y239.146 E5.34214
G1 X90.576 Y239.009 E.01085
G1 X241.009 Y88.576 E5.35182
M73 P59 R34
G1 X240.873 Y88.168 E.01085
G1 X90.167 Y238.873 E5.3615
G1 X89.759 Y238.736 E.01085
G1 X240.736 Y87.759 E5.37118
G1 X240.599 Y87.35 E.01085
G1 X89.35 Y238.599 E5.38086
G3 X88.945 Y238.458 I3.823 J-11.61 E.01078
G1 X240.458 Y86.945 E5.39024
G1 X240.315 Y86.542 E.01076
G1 X88.542 Y238.315 E5.3995
G1 X88.139 Y238.172 E.01075
M73 P59 R33
G1 X240.172 Y86.139 E5.40876
G1 X240.03 Y85.736 E.01076
G1 X87.736 Y238.03 E5.41802
G1 X87.333 Y237.887 E.01076
G1 X239.887 Y85.333 E5.42728
G2 X239.739 Y84.935 I-11.478 J4.037 E.01068
G1 X86.935 Y237.739 E5.43618
G1 X86.538 Y237.591 E.01067
G1 X239.591 Y84.538 E5.44502
G1 X239.442 Y84.141 E.01067
G1 X86.141 Y237.442 E5.45387
G1 X85.743 Y237.294 E.01067
G1 X239.294 Y83.743 E5.46272
G1 X239.145 Y83.346 E.01067
G1 X85.346 Y237.145 E5.47157
G1 X84.955 Y236.991 E.01059
G1 X238.991 Y82.955 E5.48002
G1 X238.837 Y82.563 E.01059
G1 X84.563 Y236.837 E5.48846
G1 X84.172 Y236.683 E.01059
G1 X238.683 Y82.172 E5.4969
G1 X238.528 Y81.78 E.01059
G1 X83.78 Y236.528 E5.50535
G3 X83.389 Y236.374 I4.226 J-11.279 E.01058
G1 X238.374 Y81.389 E5.51377
G1 X238.214 Y81.003 E.01051
G1 X83.003 Y236.214 E5.52181
G1 X82.617 Y236.054 E.01051
G1 X238.054 Y80.617 E5.52986
G1 X237.894 Y80.231 E.01051
G1 X82.231 Y235.894 E5.5379
G1 X81.845 Y235.735 E.01051
G1 X237.735 Y79.845 E5.54594
G2 X237.574 Y79.46 I-10.807 J4.265 E.0105
G1 X81.46 Y235.574 E5.55396
G1 X81.079 Y235.409 E.01043
G1 X237.409 Y79.079 E5.5616
G1 X237.244 Y78.699 E.01043
G1 X80.699 Y235.244 E5.56925
G1 X80.319 Y235.078 E.01043
G1 X237.078 Y78.319 E5.5769
G1 X236.913 Y77.938 E.01043
G1 X79.938 Y234.913 E5.58455
G3 X79.558 Y234.747 I4.499 J-10.839 E.01043
G1 X236.747 Y77.558 E5.59217
G1 X236.576 Y77.183 E.01036
G1 X79.183 Y234.576 E5.59943
G1 X78.808 Y234.405 E.01036
G1 X236.406 Y76.808 E5.60669
G1 X236.235 Y76.434 E.01036
G1 X78.434 Y234.235 E5.61395
G1 X78.059 Y234.064 E.01036
G1 X236.064 Y76.059 E5.62121
G1 X235.893 Y75.684 E.01036
G1 X77.684 Y233.893 E5.62846
G1 X77.314 Y233.717 E.0103
G1 X235.717 Y75.314 E5.63534
G1 X235.54 Y74.945 E.0103
G1 X76.945 Y233.54 E5.64222
G1 X76.575 Y233.364 E.0103
G1 X235.364 Y74.575 E5.64909
G1 X235.188 Y74.206 E.0103
G1 X76.206 Y233.188 E5.65596
G1 X75.836 Y233.012 E.0103
G1 X235.012 Y73.836 E5.66284
G2 X234.83 Y73.472 I-10.691 J5.087 E.01024
G1 X75.472 Y232.83 E5.66936
G1 X75.108 Y232.649 E.01024
G1 X234.649 Y73.108 E5.67586
G1 X234.467 Y72.744 E.01024
G1 X74.744 Y232.467 E5.68235
G1 X74.379 Y232.286 E.01024
G1 X234.286 Y72.379 E5.68885
G1 X234.104 Y72.015 E.01024
G1 X74.015 Y232.104 E5.69535
M73 P60 R33
G3 X73.655 Y231.918 I5.136 J-10.38 E.01019
G1 X233.918 Y71.655 E5.70153
G1 X233.731 Y71.297 E.01018
G1 X73.296 Y231.731 E5.70765
G1 X72.938 Y231.545 E.01018
G1 X233.545 Y70.938 E5.71377
G1 X233.358 Y70.579 E.01018
G1 X72.579 Y231.358 E5.7199
G1 X72.22 Y231.171 E.01018
G1 X233.171 Y70.22 E5.72602
G2 X232.981 Y69.865 I-10.283 J5.283 E.01014
G1 X71.865 Y230.981 E5.73188
G1 X71.511 Y230.788 E.01012
G1 X232.788 Y69.511 E5.73763
G1 X232.596 Y69.157 E.01012
G1 X71.157 Y230.596 E5.74338
G1 X70.803 Y230.404 E.01012
G1 X232.404 Y68.803 E5.74914
G1 X232.212 Y68.45 E.01012
G1 X70.45 Y230.212 E5.75489
G3 X70.099 Y230.018 I5.39 J-10.125 E.0101
G1 X232.018 Y68.099 E5.76044
G1 X231.82 Y67.75 E.01007
G1 X69.75 Y229.82 E5.76583
G1 X69.402 Y229.623 E.01007
G1 X231.623 Y67.402 E5.77121
G1 X231.426 Y67.053 E.01007
G1 X69.053 Y229.426 E5.77659
M73 P60 R32
G1 X68.705 Y229.229 E.01007
G1 X231.229 Y66.705 E5.78198
G2 X231.03 Y66.358 I-10.04 J5.529 E.01006
G1 X68.358 Y229.03 E5.78724
G1 X68.014 Y228.828 E.01003
G1 X230.828 Y66.014 E5.79226
G1 X230.625 Y65.671 E.01003
G1 X67.671 Y228.625 E5.79728
G1 X67.328 Y228.423 E.01003
G1 X230.423 Y65.328 E5.8023
G1 X230.221 Y64.984 E.01003
G1 X66.984 Y228.221 E5.80732
G3 X66.641 Y228.018 I5.648 J-9.931 E.01002
G1 X230.018 Y64.642 E5.81229
G1 X229.809 Y64.305 E.00997
G1 X66.303 Y227.81 E5.8169
G1 X65.965 Y227.603 E.00998
G1 X229.6 Y63.968 E5.82151
G1 X229.391 Y63.631 E.00997
G1 X65.626 Y227.396 E5.82612
G1 X65.288 Y227.188 E.00998
G1 X229.182 Y63.294 E5.83073
G1 X228.974 Y62.957 E.00997
G1 X64.949 Y226.981 E5.83534
G3 X64.616 Y226.769 I5.92 J-9.698 E.00995
G1 X228.765 Y62.62 E5.83979
G1 X228.556 Y62.283 E.00997
G1 X64.282 Y226.557 E5.84422
G1 X63.949 Y226.344 E.00994
G1 X228.344 Y61.949 E5.84855
G1 X228.132 Y61.616 E.00994
G1 X63.616 Y226.132 E5.85286
G1 X63.282 Y225.92 E.00994
G1 X227.92 Y61.282 E5.85716
G2 X227.704 Y60.952 I-9.594 J6.028 E.00992
G1 X62.952 Y225.704 E5.86124
G1 X62.624 Y225.487 E.00991
G1 X227.487 Y60.624 E5.86519
G1 X227.269 Y60.295 E.00991
G1 X62.295 Y225.269 E5.86914
G1 X61.967 Y225.052 E.00991
G1 X227.052 Y59.967 E5.87309
G1 X226.835 Y59.638 E.00991
G1 X61.638 Y224.835 E5.87704
G3 X61.312 Y224.616 I6.123 J-9.48 E.00989
G1 X226.616 Y59.312 E5.88086
G1 X226.393 Y58.988 E.00987
G1 X60.988 Y224.393 E5.88446
G1 X60.665 Y224.171 E.00987
G1 X226.171 Y58.665 E5.88806
G1 X225.949 Y58.342 E.00987
G1 X60.342 Y223.949 E5.89166
G1 X60.018 Y223.726 E.00987
G1 X225.726 Y58.018 E5.89526
M73 P61 R32
G2 X225.504 Y57.695 I-9.174 J6.083 E.00987
G1 X59.695 Y223.504 E5.89883
G1 X59.376 Y223.277 E.00984
G1 X225.277 Y57.377 E5.90208
G1 X225.049 Y57.058 E.00984
G1 X59.058 Y223.049 E5.90533
G1 X58.739 Y222.822 E.00984
G1 X224.822 Y56.739 E5.90858
G1 X224.595 Y56.421 E.00984
G1 X58.421 Y222.595 E5.91183
G1 X58.102 Y222.368 E.00984
G1 X224.368 Y56.102 E5.91508
G2 X224.137 Y55.788 I-9.156 J6.473 E.00982
G1 X57.788 Y222.137 E5.91806
G1 X57.474 Y221.905 E.00982
G1 X223.905 Y55.474 E5.92096
G1 X223.673 Y55.16 E.00982
G1 X57.16 Y221.673 E5.92387
G1 X56.847 Y221.441 E.00982
G1 X223.441 Y54.847 E5.92677
G1 X223.208 Y54.533 E.00982
G1 X56.533 Y221.208 E5.92967
G3 X56.221 Y220.974 I6.542 J-9.028 E.00981
G1 X222.974 Y54.221 E5.93242
G1 X222.737 Y53.913 E.00979
G1 X55.913 Y220.737 E5.93498
G1 X55.604 Y220.5 E.00979
G1 X222.5 Y53.604 E5.93753
G1 X222.263 Y53.295 E.00979
G1 X55.295 Y220.263 E5.94009
G1 X54.986 Y220.027 E.00979
G1 X222.027 Y52.986 E5.94264
G2 X221.789 Y52.678 I-8.969 J6.659 E.00979
G1 X54.678 Y219.789 E5.94517
G1 X54.374 Y219.547 E.00977
G1 X221.547 Y52.374 E5.94738
G1 X221.306 Y52.07 E.00977
G1 X54.07 Y219.306 E5.94959
G1 X53.766 Y219.064 E.00977
G1 X221.064 Y51.766 E5.9518
G1 X220.822 Y51.462 E.00977
G1 X53.462 Y218.822 E5.95402
M73 P61 R31
G1 X53.158 Y218.58 E.00977
G1 X220.58 Y51.158 E5.95623
G2 X220.335 Y50.858 I-8.709 J6.864 E.00976
G1 X52.858 Y218.335 E5.95819
G1 X52.559 Y218.088 E.00975
G1 X220.088 Y50.559 E5.96006
G1 X219.842 Y50.259 E.00975
G1 X52.259 Y217.842 E5.96193
G1 X51.96 Y217.595 E.00975
G1 X219.595 Y49.96 E5.9638
G1 X219.349 Y49.661 E.00975
G1 X51.661 Y217.349 E5.96566
G3 X51.364 Y217.1 I6.963 J-8.634 E.00975
G1 X219.1 Y49.364 E5.9674
G1 X218.849 Y49.07 E.00974
G1 X51.07 Y216.849 E5.96893
G1 X50.775 Y216.597 E.00974
G1 X218.597 Y48.775 E5.97046
G1 X218.346 Y48.481 E.00974
G1 X50.481 Y216.346 E5.97199
G1 X50.187 Y216.095 E.00974
G1 X218.095 Y48.187 E5.97351
G1 X217.843 Y47.892 E.00974
G1 X49.892 Y215.843 E5.97504
G1 X49.603 Y215.587 E.00973
G1 X217.587 Y47.603 E5.97622
G1 X217.331 Y47.313 E.00973
G1 X49.313 Y215.331 E5.97741
G1 X49.024 Y215.075 E.00973
G1 X217.075 Y47.024 E5.9786
G1 X216.818 Y46.734 E.00973
G1 X48.734 Y214.818 E5.97979
G1 X48.445 Y214.562 E.00973
G1 X216.562 Y46.445 E5.98097
G2 X216.303 Y46.158 I-8.308 J7.257 E.00972
G1 X48.158 Y214.303 E5.98194
G1 X47.873 Y214.042 E.00972
G1 X216.042 Y45.873 E5.98279
M73 P62 R31
G1 X215.781 Y45.588 E.00972
G1 X47.588 Y213.781 E5.98364
G1 X47.304 Y213.52 E.00972
G1 X215.52 Y45.304 E5.98449
G1 X215.259 Y45.019 E.00972
G1 X47.019 Y213.259 E5.98533
G3 X46.735 Y212.997 I7.354 J-8.237 E.00972
G1 X214.997 Y44.735 E5.98609
G1 X214.731 Y44.455 E.00971
G1 X46.455 Y212.731 E5.9866
G1 X46.175 Y212.465 E.00971
G1 X214.466 Y44.175 E5.98711
G1 X214.2 Y43.895 E.00971
G1 X45.895 Y212.2 E5.98762
G1 X45.615 Y211.934 E.00971
G1 X213.934 Y43.615 E5.98813
G1 X213.668 Y43.335 E.00971
G1 X45.335 Y211.668 E5.98864
G3 X45.059 Y211.398 I7.663 J-8.106 E.00971
G1 X213.398 Y43.06 E5.98885
G1 X213.128 Y42.784 E.00971
G1 X44.784 Y211.128 E5.98901
G1 X44.509 Y210.857 E.00971
G1 X212.857 Y42.509 E5.98918
G1 X212.587 Y42.234 E.00971
G1 X44.234 Y210.587 E5.98935
G1 X43.959 Y210.316 E.00971
G1 X212.316 Y41.959 E5.98952
G2 X212.044 Y41.686 I-7.958 J7.684 E.00971
G1 X43.686 Y210.044 E5.98952
G1 X43.415 Y209.768 E.00971
G1 X211.768 Y41.415 E5.98935
G1 X211.493 Y41.145 E.00971
G1 X43.145 Y209.493 E5.98919
G1 X42.874 Y209.218 E.00971
G1 X211.218 Y40.874 E5.98902
G1 X210.943 Y40.604 E.00971
G1 X42.604 Y208.943 E5.98885
G3 X42.334 Y208.667 I7.826 J-7.931 E.00971
G1 X210.667 Y40.334 E5.98864
G1 X210.387 Y40.068 E.00971
G1 X42.068 Y208.387 E5.98813
G1 X41.802 Y208.107 E.00971
G1 X210.107 Y39.802 E5.98762
G1 X209.827 Y39.537 E.00971
G1 X41.537 Y207.827 E5.98711
G1 X41.271 Y207.547 E.00971
G1 X209.547 Y39.271 E5.98661
G1 X209.267 Y39.005 E.00971
G1 X41.005 Y207.267 E5.9861
G3 X40.743 Y206.983 I7.956 J-7.623 E.00972
G1 X208.983 Y38.743 E5.98534
G1 X208.699 Y38.482 E.00972
G1 X40.482 Y206.699 E5.98449
G1 X40.221 Y206.414 E.00972
G1 X208.414 Y38.221 E5.98365
M73 P62 R30
G1 X208.129 Y37.96 E.00972
G1 X39.96 Y206.129 E5.9828
G1 X39.699 Y205.844 E.00972
G1 X207.844 Y37.699 E5.98195
G2 X207.558 Y37.44 I-7.551 J8.056 E.00972
G1 X39.44 Y205.558 E5.98098
G1 X39.184 Y205.268 E.00973
G1 X207.268 Y37.184 E5.9798
G1 X206.979 Y36.927 E.00973
G1 X38.927 Y204.979 E5.97861
G1 X38.671 Y204.689 E.00973
G1 X206.689 Y36.671 E5.97742
G1 X206.4 Y36.415 E.00973
G1 X38.415 Y204.4 E5.97623
G1 X38.159 Y204.11 E.00973
G1 X206.11 Y36.159 E5.97505
G1 X205.816 Y35.907 E.00974
G1 X37.907 Y203.816 E5.97353
G1 X37.656 Y203.521 E.00974
G1 X205.521 Y35.656 E5.972
G1 X205.227 Y35.405 E.00974
G1 X37.405 Y203.227 E5.97047
M73 P63 R30
G1 X37.153 Y202.933 E.00974
G1 X204.933 Y35.153 E5.96894
G1 X204.638 Y34.902 E.00974
G1 X36.902 Y202.638 E5.96741
G3 X36.653 Y202.341 I8.346 J-7.229 E.00975
G1 X204.341 Y34.653 E5.96568
G1 X204.042 Y34.407 E.00975
G1 X36.407 Y202.042 E5.96381
G1 X36.16 Y201.743 E.00975
G1 X203.743 Y34.16 E5.96194
G1 X203.444 Y33.914 E.00975
G1 X35.914 Y201.444 E5.96007
G1 X35.667 Y201.145 E.00975
G1 X203.145 Y33.667 E5.9582
G2 X202.844 Y33.422 I-7.191 J8.495 E.00976
G1 X35.422 Y200.844 E5.95625
G1 X35.18 Y200.54 E.00977
G1 X202.54 Y33.18 E5.95403
G1 X202.236 Y32.938 E.00977
G1 X34.938 Y200.236 E5.95182
G1 X34.696 Y199.932 E.00977
G1 X201.932 Y32.696 E5.94961
G1 X201.628 Y32.455 E.00977
G1 X34.455 Y199.628 E5.9474
G1 X34.213 Y199.324 E.00977
G1 X201.324 Y32.213 E5.94519
G2 X201.016 Y31.975 I-7.043 J8.827 E.00979
G1 X33.975 Y199.016 E5.94266
G1 X33.738 Y198.707 E.00979
G1 X200.707 Y31.738 E5.94011
G1 X200.399 Y31.501 E.00979
G1 X33.501 Y198.399 E5.93755
G1 X33.264 Y198.09 E.00979
G1 X200.09 Y31.265 E5.935
G1 X199.781 Y31.028 E.00979
G1 X33.028 Y197.781 E5.93244
G3 X32.793 Y197.469 I8.816 J-6.873 E.0098
G1 X199.47 Y30.793 E5.92969
G1 X199.156 Y30.561 E.00982
G1 X32.561 Y197.156 E5.92679
G1 X32.329 Y196.842 E.00982
G1 X198.842 Y30.329 E5.92389
G1 X198.529 Y30.097 E.00982
G1 X32.097 Y196.529 E5.92099
G1 X31.865 Y196.215 E.00982
G1 X198.215 Y29.865 E5.91809
G2 X197.9 Y29.634 I-6.75 J8.871 E.00982
G1 X31.634 Y195.9 E5.9151
G1 X31.407 Y195.582 E.00984
G1 X197.582 Y29.407 E5.91185
G1 X197.263 Y29.18 E.00984
G1 X31.18 Y195.263 E5.9086
G1 X30.952 Y194.945 E.00984
G1 X196.945 Y28.952 E5.90535
G1 X196.626 Y28.725 E.00984
G1 X30.725 Y194.626 E5.90211
G1 X30.498 Y194.307 E.00984
G1 X196.308 Y28.498 E5.89886
G2 X195.984 Y28.275 I-6.533 J9.133 E.00987
G1 X30.275 Y193.984 E5.89529
G1 X30.053 Y193.661 E.00987
G1 X195.661 Y28.053 E5.89169
G1 X195.338 Y27.831 E.00987
G1 X29.831 Y193.338 E5.88809
G1 X29.608 Y193.014 E.00987
G1 X195.014 Y27.609 E5.88449
G1 X194.691 Y27.386 E.00987
G1 X29.386 Y192.691 E5.88089
G3 X29.167 Y192.364 I9.212 J-6.419 E.00989
G1 X194.364 Y27.167 E5.87707
G1 X194.036 Y26.95 E.00991
G1 X28.95 Y192.036 E5.87312
M73 P63 R29
G1 X28.732 Y191.707 E.00991
G1 X193.707 Y26.732 E5.86917
G1 X193.379 Y26.515 E.00991
G1 X28.515 Y191.379 E5.86522
G1 X28.298 Y191.051 E.00991
G1 X193.051 Y26.298 E5.86127
M73 P64 R29
G2 X192.72 Y26.082 I-6.319 J9.317 E.00992
G1 X28.082 Y190.72 E5.85719
G1 X27.87 Y190.387 E.00994
G1 X192.387 Y25.87 E5.85289
G1 X192.054 Y25.657 E.00994
G1 X27.657 Y190.054 E5.84859
G1 X27.445 Y189.72 E.00994
G1 X191.72 Y25.445 E5.84428
G1 X191.387 Y25.233 E.00994
G1 X27.233 Y189.387 E5.83998
G3 X27.021 Y189.053 I9.408 J-6.205 E.00995
G1 X191.053 Y25.021 E5.83564
G1 X190.715 Y24.813 E.00998
G1 X26.813 Y188.715 E5.83098
G1 X26.606 Y188.376 E.00998
G1 X190.376 Y24.606 E5.82632
G1 X190.038 Y24.399 E.00998
G1 X26.399 Y188.038 E5.82166
G1 X26.191 Y187.7 E.00998
G1 X189.7 Y24.191 E5.817
G1 X189.361 Y23.984 E.00998
G1 X25.984 Y187.361 E5.81233
G3 X25.781 Y187.019 I9.713 J-5.984 E.01002
G1 X189.019 Y23.781 E5.80736
G1 X188.675 Y23.579 E.01003
G1 X25.579 Y186.675 E5.80234
G1 X25.376 Y186.332 E.01003
G1 X188.332 Y23.376 E5.79732
G1 X187.988 Y23.174 E.01003
G1 X25.174 Y185.988 E5.7923
G1 X24.972 Y185.645 E.01003
G1 X187.645 Y22.972 E5.78728
G2 X187.298 Y22.773 I-5.87 J9.828 E.01006
G1 X24.773 Y185.298 E5.78202
G1 X24.576 Y184.95 E.01007
G1 X186.95 Y22.576 E5.77664
G1 X186.601 Y22.378 E.01007
G1 X24.378 Y184.601 E5.77125
G1 X24.181 Y184.252 E.01007
G1 X186.252 Y22.181 E5.76587
G1 X185.904 Y21.984 E.01007
G1 X23.984 Y183.904 E5.76048
G3 X23.789 Y183.553 I9.962 J-5.761 E.0101
G1 X185.553 Y21.789 E5.75493
G1 X185.199 Y21.597 E.01012
G1 X23.597 Y183.199 E5.74918
G1 X23.405 Y182.846 E.01012
G1 X184.846 Y21.405 E5.74343
G1 X184.492 Y21.213 E.01012
G1 X23.213 Y182.492 E5.73768
G1 X23.021 Y182.138 E.01012
G1 X184.138 Y21.021 E5.73193
G2 X183.783 Y20.831 I-5.633 J10.079 E.01014
G1 X22.83 Y181.783 E5.72606
G1 X22.644 Y181.424 E.01018
G1 X183.424 Y20.644 E5.71994
G1 X183.065 Y20.457 E.01018
G1 X22.457 Y181.065 E5.71382
G1 X22.27 Y180.706 E.01018
G1 X182.706 Y20.27 E5.7077
G1 X182.347 Y20.083 E.01018
G1 X22.083 Y180.347 E5.70158
G3 X21.897 Y179.988 I10.09 J-5.445 E.01019
G1 X181.988 Y19.897 E5.6954
G1 X181.624 Y19.716 E.01024
G1 X21.716 Y179.623 E5.6889
G1 X21.534 Y179.259 E.01024
G1 X181.259 Y19.534 E5.68241
G1 X180.895 Y19.352 E.01024
G1 X21.352 Y178.895 E5.67591
G1 X21.171 Y178.531 E.01024
G1 X180.531 Y19.171 E5.66941
G2 X180.167 Y18.99 I-5.331 J10.264 E.01024
G1 X20.99 Y178.166 E5.66289
G1 X20.813 Y177.797 E.0103
G1 X179.797 Y18.813 E5.65602
G1 X179.428 Y18.637 E.0103
G1 X20.637 Y177.427 E5.64914
M73 P65 R29
G1 X20.461 Y177.058 E.0103
G1 X179.058 Y18.461 E5.64227
G1 X178.689 Y18.285 E.0103
G1 X20.285 Y176.689 E5.63539
G1 X20.108 Y176.319 E.0103
G1 X178.319 Y18.108 E5.62852
G1 X177.944 Y17.938 E.01036
G1 X19.938 Y175.944 E5.62127
G1 X19.767 Y175.569 E.01036
G1 X177.569 Y17.767 E5.61401
G1 X177.195 Y17.596 E.01036
G1 X19.596 Y175.194 E5.60675
M73 P65 R28
G1 X19.425 Y174.82 E.01036
G1 X176.82 Y17.425 E5.59949
G1 X176.445 Y17.254 E.01036
G1 X19.254 Y174.445 E5.59223
G3 X19.088 Y174.065 I10.595 J-4.847 E.01043
G1 X176.065 Y17.088 E5.58461
G1 X175.684 Y16.923 E.01043
G1 X18.923 Y173.684 E5.57696
G1 X18.758 Y173.304 E.01043
G1 X175.304 Y16.758 E5.56931
G1 X174.924 Y16.592 E.01043
G1 X18.592 Y172.924 E5.56166
G1 X18.427 Y172.543 E.01043
G1 X174.543 Y16.427 E5.55402
G2 X174.158 Y16.267 I-4.782 J10.96 E.0105
G1 X18.267 Y172.158 E5.546
G1 X18.107 Y171.772 E.01051
G1 X173.772 Y16.107 E5.53796
G1 X173.386 Y15.947 E.01051
G1 X17.947 Y171.386 E5.52992
G1 X17.787 Y171 E.01051
G1 X173 Y15.787 E5.52188
G1 X172.614 Y15.627 E.01051
G1 X17.627 Y170.614 E5.51383
G3 X17.473 Y170.223 I11.051 J-4.59 E.01058
G1 X172.223 Y15.473 E5.50541
G1 X171.832 Y15.319 E.01059
G1 X17.319 Y169.831 E5.49697
G1 X17.164 Y169.44 E.01059
G1 X171.44 Y15.164 E5.48853
G1 X171.049 Y15.01 E.01059
G1 X17.01 Y169.048 E5.48009
G1 X16.856 Y168.657 E.01059
G1 X170.657 Y14.856 E5.47164
G1 X170.26 Y14.708 E.01067
G1 X16.708 Y168.26 E5.46279
G1 X16.559 Y167.862 E.01067
G1 X169.862 Y14.559 E5.45394
G1 X169.465 Y14.41 E.01067
G1 X16.41 Y167.465 E5.44509
G1 X16.262 Y167.068 E.01067
G1 X169.068 Y14.262 E5.43625
G2 X168.67 Y14.114 I-4.432 J11.318 E.01068
G1 X16.114 Y166.67 E5.42735
G1 X15.971 Y166.267 E.01076
G1 X168.267 Y13.971 E5.41809
G1 X167.864 Y13.829 E.01076
G1 X15.829 Y165.864 E5.40883
G1 X15.686 Y165.461 E.01076
G1 X167.461 Y13.686 E5.39957
G1 X167.058 Y13.543 E.01076
G1 X15.543 Y165.058 E5.39031
G3 X15.402 Y164.654 I11.516 J-4.247 E.01078
G1 X166.654 Y13.402 E5.38094
G1 X166.245 Y13.265 E.01085
G1 X15.265 Y164.245 E5.37126
G1 X15.128 Y163.836 E.01085
G1 X165.836 Y13.128 E5.36158
G1 X165.427 Y12.992 E.01085
G1 X14.992 Y163.427 E5.3519
G1 X14.855 Y163.018 E.01085
G1 X165.018 Y12.855 E5.34222
G2 X164.606 Y12.721 I-4.055 J11.737 E.01089
G1 X14.721 Y162.606 E5.33235
G1 X14.59 Y162.191 E.01094
G1 X164.191 Y12.59 E5.32225
G1 X163.777 Y12.459 E.01094
G1 X14.459 Y161.777 E5.31214
G1 X14.328 Y161.362 E.01094
G1 X163.362 Y12.328 E5.30203
M73 P66 R28
G1 X162.947 Y12.197 E.01094
G1 X14.197 Y160.947 E5.29193
G3 X14.071 Y160.528 I11.939 J-3.841 E.01101
G1 X162.528 Y12.071 E5.28153
G1 X162.107 Y11.946 E.01105
G1 X13.946 Y160.107 E5.27099
G1 X13.821 Y159.686 E.01105
G1 X161.686 Y11.821 E5.26045
G1 X161.265 Y11.696 E.01105
G1 X13.696 Y159.265 E5.24991
G1 X13.572 Y158.844 E.01105
G1 X160.844 Y11.572 E5.23937
G2 X160.417 Y11.453 I-3.575 J12.003 E.01115
G1 X13.453 Y158.417 E5.22841
G1 X13.334 Y157.99 E.01115
G1 X159.99 Y11.334 E5.21743
G1 X159.562 Y11.216 E.01115
G1 X13.216 Y157.562 E5.20644
G1 X13.097 Y157.135 E.01115
G1 X159.135 Y11.097 E5.19546
G2 X158.706 Y10.98 I-3.568 J12.24 E.01118
G1 X12.98 Y156.706 E5.18436
G1 X12.868 Y156.273 E.01127
G1 X158.273 Y10.868 E5.17293
G1 X157.839 Y10.756 E.01127
G1 X12.756 Y155.839 E5.16149
G1 X12.644 Y155.406 E.01127
G1 X157.406 Y10.644 E5.15005
G1 X156.972 Y10.532 E.01127
G1 X12.532 Y154.972 E5.13862
M73 P66 R27
G3 X12.424 Y154.534 I12.418 J-3.304 E.01134
G1 X156.534 Y10.424 E5.1269
G1 X156.094 Y10.318 E.01139
G1 X12.318 Y154.094 E5.11501
G1 X12.212 Y153.654 E.01139
G1 X155.654 Y10.212 E5.10311
G1 X155.214 Y10.107 E.01139
G1 X12.107 Y153.214 E5.09121
G1 X12.001 Y152.774 E.01139
G1 X154.774 Y10.001 E5.07931
G1 X154.327 Y9.902 E.01151
G1 X11.902 Y152.327 E5.06694
G1 X11.803 Y151.881 E.01151
G1 X153.881 Y9.803 E5.05457
G1 X153.434 Y9.704 E.01151
G1 X11.704 Y151.434 E5.0422
G1 X11.605 Y150.987 E.01151
G1 X152.987 Y9.605 E5.02983
G2 X152.537 Y9.509 I-2.967 J12.825 E.01157
G1 X11.509 Y150.537 E5.01724
G1 X11.417 Y150.084 E.01164
G1 X152.084 Y9.417 E5.00438
G1 X151.63 Y9.325 E.01164
G1 X11.325 Y149.63 E4.99153
G1 X11.232 Y149.177 E.01164
G1 X151.177 Y9.232 E4.97868
G1 X150.723 Y9.14 E.01164
G1 X11.14 Y148.723 E4.96583
G1 X11.055 Y148.263 E.01178
G1 X150.263 Y9.055 E4.9525
G1 X149.803 Y8.969 E.01178
G1 X10.969 Y147.803 E4.93915
G1 X10.884 Y147.342 E.01178
G1 X149.342 Y8.884 E4.92581
G1 X148.882 Y8.799 E.01178
G1 X10.799 Y146.882 E4.91247
G3 X10.717 Y146.418 I13.276 J-2.568 E.01186
G1 X148.418 Y8.717 E4.89885
G1 X147.95 Y8.639 E.01192
G1 X10.639 Y145.95 E4.885
G1 X10.561 Y145.483 E.01192
G1 X147.483 Y8.561 E4.87115
G1 X147.015 Y8.483 E.01192
G1 X10.483 Y145.015 E4.8573
G3 X10.405 Y144.546 I13.317 J-2.43 E.01195
G1 X146.547 Y8.405 E4.84337
G1 X146.072 Y8.335 E.01208
G1 X10.335 Y144.072 E4.829
G1 X10.264 Y143.597 E.01208
G1 X145.597 Y8.264 E4.81464
G1 X145.122 Y8.193 E.01208
G1 X10.193 Y143.122 E4.80027
G1 X10.122 Y142.647 E.01208
G1 X144.647 Y8.122 E4.7859
G2 X144.166 Y8.057 I-2.095 J13.75 E.01221
G1 X10.057 Y142.166 E4.7711
G1 X9.993 Y141.684 E.01224
G1 X143.684 Y7.993 E4.7562
M73 P67 R27
G1 X143.202 Y7.93 E.01224
G1 X9.93 Y141.202 E4.7413
G1 X9.866 Y140.72 E.01224
G1 X142.72 Y7.866 E4.7264
G2 X142.233 Y7.807 I-1.941 J13.925 E.01233
G1 X9.807 Y140.233 E4.7112
G1 X9.751 Y139.743 E.0124
G1 X141.743 Y7.751 E4.69576
G1 X141.253 Y7.696 E.0124
G1 X9.696 Y139.253 E4.68031
G1 X9.64 Y138.763 E.0124
G1 X140.763 Y7.64 E4.66487
G2 X140.271 Y7.587 I-1.769 J14.105 E.01247
G1 X9.587 Y138.271 E4.64923
G1 X9.539 Y137.773 E.01258
G1 X139.773 Y7.539 E4.63323
G1 X139.275 Y7.491 E.01258
G1 X9.491 Y137.275 E4.61722
G1 X9.443 Y136.777 E.01258
G1 X138.777 Y7.443 E4.60122
G2 X138.278 Y7.397 I-1.582 J14.328 E.01262
G1 X9.397 Y136.278 E4.5851
G1 X9.357 Y135.772 E.01277
G1 X137.772 Y7.357 E4.56852
G1 X137.266 Y7.317 E.01277
G1 X9.317 Y135.266 E4.55194
G1 X9.277 Y134.76 E.01277
G1 X136.76 Y7.277 E4.53535
G2 X136.254 Y7.238 I-1.369 J14.482 E.01279
G1 X9.238 Y134.253 E4.51871
G1 X9.207 Y133.739 E.01296
G1 X135.739 Y7.207 E4.50154
G1 X135.225 Y7.175 E.01296
G1 X9.175 Y133.225 E4.48436
G3 X9.148 Y132.706 I20.708 J-1.35 E.01306
G1 X134.711 Y7.144 E4.46703
G2 X134.196 Y7.113 I-1.136 J14.633 E.01298
G1 X9.123 Y132.186 E4.44962
G1 X9.097 Y131.666 E.01311
G1 X133.673 Y7.09 E4.43192
G1 X133.15 Y7.067 E.01317
G1 X9.072 Y131.145 E4.41422
G1 X9.047 Y130.625 E.01311
G1 X132.627 Y7.044 E4.39651
G2 X132.103 Y7.023 I-.743 J11.621 E.0132
G1 X9.022 Y130.103 E4.37873
G1 X9.008 Y129.572 E.01338
G1 X131.569 Y7.011 E4.36022
G1 X131.034 Y7 E.01345
G1 X8.995 Y129.04 E4.3417
M73 P67 R26
G1 X8.981 Y128.508 E.01338
G1 X130.5 Y6.989 E4.32318
G1 X129.965 Y6.977 E.01345
G1 X8.968 Y127.974 E4.3046
G1 X8.964 Y127.433 E.01361
G1 X129.431 Y6.966 E4.28576
G2 X128.892 Y6.959 I-.552 J21.664 E.01355
G1 X8.959 Y126.892 E4.26676
G1 X8.954 Y126.351 E.01361
G1 X128.351 Y6.954 E4.24768
G2 X127.807 Y6.953 I-.312 J15.634 E.01369
G1 X8.953 Y125.807 E4.22837
G1 X8.958 Y125.256 E.01385
G1 X127.256 Y6.958 E4.20861
G1 X126.706 Y6.963 E.01385
G1 X8.963 Y124.706 E4.18885
G1 X8.967 Y124.155 E.01385
G1 X126.155 Y6.967 E4.1691
G2 X125.599 Y6.978 I.022 J15.914 E.014
G1 X8.978 Y123.599 E4.14893
G1 X8.993 Y123.039 E.0141
G1 X125.039 Y6.993 E4.12848
G1 X124.478 Y7.007 E.0141
G1 X9.007 Y122.478 E4.10802
G1 X9.022 Y121.918 E.0141
G1 X123.918 Y7.022 E4.08756
G2 X123.346 Y7.048 I.296 J12.716 E.0144
G1 X9.045 Y121.349 E4.06637
G1 X9.07 Y120.778 E.01437
G1 X122.772 Y7.076 E4.04508
G1 X122.199 Y7.104 E.01445
G1 X9.095 Y120.207 E4.02378
G3 X9.123 Y119.634 I16.447 J.499 E.01444
G1 X121.625 Y7.132 E4.0024
G1 X121.051 Y7.16 E.01445
G1 X9.158 Y119.053 E3.98073
G1 X9.194 Y118.472 E.01465
G1 X120.472 Y7.194 E3.95883
G1 X119.89 Y7.229 E.01465
G1 X9.229 Y117.89 E3.93689
G3 X9.272 Y117.302 I16.89 J.935 E.01485
G1 X119.302 Y7.272 E3.91442
G1 X118.709 Y7.319 E.01495
G1 X9.319 Y116.709 E3.89169
G1 X9.365 Y116.117 E.01495
G1 X118.117 Y7.365 E3.86896
M73 P68 R26
G2 X117.523 Y7.414 I1.091 J17.015 E.015
G1 X9.414 Y115.523 E3.84609
G1 X9.472 Y114.919 E.01526
G1 X116.919 Y7.472 E3.82254
G1 X116.315 Y7.53 E.01526
G1 X9.53 Y114.315 E3.79898
G1 X9.588 Y113.711 E.01526
G1 X115.711 Y7.588 E3.77543
G2 X115.098 Y7.656 I1.614 J17.576 E.01551
G1 X9.656 Y113.098 E3.75124
G1 X9.726 Y112.482 E.01559
G1 X114.482 Y7.726 E3.72683
G1 X113.867 Y7.796 E.01559
G1 X9.796 Y111.866 E3.70243
G3 X9.871 Y111.246 I17.768 J1.834 E.01573
G1 X113.246 Y7.871 E3.67767
G1 X112.617 Y7.954 E.01595
G1 X9.954 Y110.617 E3.65237
G1 X10.036 Y109.989 E.01595
G1 X111.989 Y8.036 E3.62706
G2 X111.359 Y8.121 I2.084 J17.981 E.01599
G1 X10.121 Y109.359 E3.60166
G1 X10.217 Y108.717 E.01632
G1 X110.717 Y8.217 E3.57542
G1 X110.076 Y8.313 E.01632
G1 X10.313 Y108.075 E3.54918
G1 X10.408 Y107.434 E.01632
G1 X109.434 Y8.408 E3.52294
G2 X108.78 Y8.517 I2.76 J18.675 E.01668
G1 X10.517 Y106.78 E3.49581
G1 X10.627 Y106.124 E.01672
G1 X108.124 Y8.627 E3.46859
G1 X107.469 Y8.736 E.01672
G1 X10.736 Y105.469 E3.44137
G3 X10.857 Y104.802 I19.164 J3.135 E.01705
G1 X106.802 Y8.857 E3.41335
G1 X106.132 Y8.981 E.01714
G1 X10.981 Y104.132 E3.3851
G1 X11.106 Y103.462 E.01714
G1 X105.462 Y9.106 E3.35685
G2 X104.781 Y9.241 I3.547 J19.63 E.01747
G1 X11.241 Y102.781 E3.3278
G1 X11.38 Y102.096 E.01759
G1 X104.096 Y9.38 E3.29847
G1 X103.411 Y9.52 E.01759
G1 X11.52 Y101.411 E3.26914
G3 X11.671 Y100.714 I20.036 J3.991 E.01795
G1 X102.714 Y9.671 E3.23893
G1 X102.013 Y9.827 E.01807
G1 X11.827 Y100.012 E3.20846
G1 X11.982 Y99.311 E.01807
G1 X101.311 Y9.982 E3.17798
G2 X100.595 Y10.152 I4.526 J20.629 E.01851
G1 X12.152 Y98.595 E3.14646
G1 X12.325 Y97.877 E.01858
G1 X99.877 Y10.325 E3.11478
G2 X99.158 Y10.499 I3.513 J16.125 E.01862
G1 X12.498 Y97.158 E3.08301
G1 X12.689 Y96.422 E.01913
G1 X98.416 Y10.694 E3.04986
G1 X97.675 Y10.89 E.01929
G1 X12.879 Y95.686 E3.01671
G3 X13.075 Y94.944 I21.349 J5.256 E.01932
G1 X96.934 Y11.086 E2.98334
G2 X96.189 Y11.285 I7.61 J29.943 E.0194
G1 X13.285 Y94.188 E2.94939
G1 X13.494 Y93.433 E.01971
G1 X95.433 Y11.494 E2.91507
G2 X94.665 Y11.717 I6 J22.117 E.02014
G1 X13.717 Y92.665 E2.87979
G1 X13.947 Y91.889 E.02034
G1 X93.889 Y11.947 E2.84403
G2 X93.112 Y12.179 I6.227 J22.301 E.02041
G1 X14.179 Y91.111 E2.80811
G1 X14.43 Y90.314 E.02102
G1 X92.314 Y12.43 E2.77082
G1 X91.517 Y12.682 E.02102
G1 X14.682 Y89.517 E2.73352
G3 X14.947 Y88.706 I23.365 J7.199 E.02147
G1 X90.702 Y12.951 E2.69506
G1 X89.875 Y13.233 E.02198
G1 X15.222 Y87.886 E2.65587
G3 X15.501 Y87.061 I23.743 J7.586 E.02193
G1 X89.048 Y13.514 E2.6165
M73 P68 R25
G2 X88.216 Y13.8 I11.09 J33.572 E.02214
G1 X15.8 Y86.216 E2.57625
G1 X16.1 Y85.371 E.02255
G1 X87.371 Y14.1 E2.53554
G2 X86.502 Y14.423 I8.819 J25.044 E.02332
G1 X16.423 Y84.502 E2.49314
G1 X16.749 Y83.63 E.02341
G1 X85.63 Y14.749 E2.45054
G2 X84.739 Y15.094 I9.429 J25.667 E.02403
G1 X17.094 Y82.739 E2.40657
G1 X17.448 Y81.839 E.02435
G1 X83.839 Y15.448 E2.36192
G2 X82.923 Y15.819 I10.18 J26.482 E.02487
G1 X17.819 Y80.923 E2.31612
G1 X18.205 Y79.991 E.02537
G1 X81.991 Y16.205 E2.26925
G2 X81.044 Y16.606 I11.026 J27.335 E.02588
G1 X18.606 Y79.044 E2.22128
G1 X19.026 Y78.078 E.02649
G1 X80.078 Y17.026 E2.17199
G2 X79.095 Y17.464 I12.05 J28.397 E.02708
G1 X19.464 Y77.095 E2.12143
G1 X19.921 Y76.092 E.02772
G1 X78.092 Y17.921 E2.0695
G2 X77.065 Y18.402 I13.252 J29.616 E.02853
G1 X20.402 Y75.065 E2.01585
G1 X20.9 Y74.022 E.02908
G1 X76.022 Y18.9 E1.96102
G2 X74.942 Y19.433 I14.799 J31.293 E.03029
G1 X21.434 Y72.942 E1.90364
G3 X21.981 Y71.849 I31.51 J15.092 E.03075
G1 X73.849 Y19.981 E1.84529
G1 X72.711 Y20.573 E.03228
G1 X22.573 Y70.711 E1.78371
G3 X23.192 Y69.547 I33.703 J17.163 E.03318
G1 X71.547 Y21.192 E1.72026
G1 X70.353 Y21.84 E.03418
G1 X23.84 Y68.352 E1.65472
M73 P69 R25
G3 X24.548 Y67.099 I36.172 J19.594 E.0362
G1 X69.099 Y22.548 E1.58497
G2 X67.807 Y23.295 I20.744 J37.393 E.03756
G1 X25.295 Y65.807 E1.51241
G3 X26.09 Y64.466 I38.876 J22.145 E.03921
G1 X66.466 Y24.09 E1.43643
G1 X65.057 Y24.953 E.04158
G1 X26.953 Y63.057 E1.35556
G3 X27.902 Y61.562 I43.346 J26.466 E.04452
G1 X63.562 Y25.902 E1.26866
G2 X61.978 Y26.941 I28.977 J45.926 E.04767
G1 X28.941 Y59.978 E1.17533
G3 X30.095 Y58.277 I49.338 J32.261 E.05171
G1 X60.277 Y28.095 E1.07375
G2 X58.39 Y29.437 I28.938 J42.707 E.05826
G1 X31.402 Y56.425 E.96011
G3 X32.914 Y54.367 I59.771 J42.334 E.06423
G1 X56.367 Y30.914 E.83436
G2 X53.929 Y32.806 I106.717 J140.013 E.07763
G1 X34.806 Y51.929 E.68032
G3 X37.332 Y48.857 I93.79 J74.553 E.10005
G1 X50.857 Y35.333 E.48116
G2 X44.081 Y41.563 I77.453 J91.037 E.23162
G1 X39.256 Y46.389 E.17169
; CHANGE_LAYER
; Z_HEIGHT: 0.84
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11661.354
G1 X40.67 Y44.974 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/6
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M204 S10000
G17
G3 Z1.08 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 53
G1 X132.167 Y245.315
G1 Z.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M204 S4000
G3 X89.131 Y13.115 I-4.176 J-119.314 E9.20385
G3 X129.586 Y6.625 I38.862 J112.903 E1.11576
G3 X132.227 Y245.313 I-1.596 J119.376 E10.00511
M204 S10000
G1 X132.18 Y245.712 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G3 X88.528 Y12.903 I-4.18 J-119.713 E8.55502
G3 X129.59 Y6.224 I39.485 J113.177 E1.05124
G3 X132.24 Y245.71 I-1.59 J119.776 E9.31457
; WIPE_START
M204 S4000
G1 X130.241 Y245.767 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.104 Y243.062 Z1.24 F30000
G1 X48.388 Y214.744 Z1.24
G1 Z.84
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420226
G1 F11661.354
M204 S4000
G1 X43.563 Y209.919 E.17168
G3 X37.332 Y203.143 I85.472 J-84.84 E.23162
G1 X50.857 Y216.667 E.48116
G2 X53.929 Y219.194 I77.629 J-91.269 E.10006
G1 X34.806 Y200.071 E.68032
G3 X32.914 Y197.633 I138.038 J-109.091 E.07763
G1 X56.367 Y221.086 E.83436
G2 X58.425 Y222.598 I44.327 J-58.172 E.06424
G1 X31.402 Y195.575 E.96135
G3 X30.095 Y193.723 I52.405 J-38.355 E.05704
G1 X60.277 Y223.905 E1.07376
G2 X61.978 Y225.059 I33.953 J-48.171 E.05171
G1 X28.941 Y192.022 E1.17533
G3 X27.902 Y190.438 I44.844 J-30.533 E.04767
G1 X63.562 Y226.098 E1.26866
G2 X65.057 Y227.047 I28.021 J-42.492 E.04452
G1 X26.953 Y188.943 E1.35557
G1 X26.09 Y187.534 E.04158
G1 X66.466 Y227.91 E1.43643
G2 X67.807 Y228.705 I23.456 J-38.032 E.03921
G1 X25.295 Y186.193 E1.51241
G3 X24.548 Y184.901 I36.648 J-22.039 E.03756
G1 X69.099 Y229.452 E1.58497
G2 X70.352 Y230.16 I20.847 J-35.465 E.0362
G1 X23.84 Y183.647 E1.65472
G1 X23.192 Y182.453 E.03418
G1 X71.547 Y230.808 E1.72026
G2 X72.711 Y231.427 I18.337 J-33.102 E.03318
G1 X22.573 Y181.289 E1.78371
G1 X21.981 Y180.151 E.03228
G1 X73.849 Y232.019 E1.84529
G2 X74.942 Y232.566 I16.229 J-31.05 E.03075
G1 X21.434 Y179.058 E1.90364
G3 X20.9 Y177.978 I30.648 J-15.823 E.03029
G1 X76.022 Y233.1 E1.96102
G1 X77.065 Y233.598 E.02908
G1 X20.402 Y176.935 E2.01585
G3 X19.921 Y175.908 I29.145 J-14.284 E.02853
G1 X78.092 Y234.079 E2.0695
G1 X79.095 Y234.536 E.02772
G1 X19.464 Y174.905 E2.12143
G3 X19.026 Y173.922 I27.966 J-13.037 E.02708
G1 X80.078 Y234.974 E2.17199
G1 X81.044 Y235.394 E.02649
G1 X18.606 Y172.956 E2.22128
G3 X18.205 Y172.009 I26.915 J-11.965 E.02588
G1 X81.991 Y235.795 E2.26925
G1 X82.923 Y236.181 E.02537
G1 X17.819 Y171.077 E2.31612
G3 X17.448 Y170.161 I26.111 J-11.097 E.02487
G1 X83.839 Y236.552 E2.36192
G1 X84.739 Y236.906 E.02434
G1 X17.094 Y169.261 E2.40657
G3 X16.749 Y168.37 I25.328 J-10.322 E.02403
G1 X85.63 Y237.251 E2.45054
G1 X86.502 Y237.577 E.02341
G1 X16.423 Y167.498 E2.49314
G3 X16.1 Y166.629 I24.805 J-9.72 E.02332
G1 X87.371 Y237.9 E2.53554
G1 X88.216 Y238.2 E.02255
G1 X15.8 Y165.784 E2.57625
G1 X15.501 Y164.939 E.02255
G1 X89.061 Y238.499 E2.61695
G2 X89.886 Y238.778 I8.415 J-23.476 E.02193
G1 X15.222 Y164.114 E2.65627
G1 X14.947 Y163.294 E.02176
G1 X90.706 Y239.053 E2.69521
G2 X91.516 Y239.317 I6.753 J-19.344 E.02142
G1 X14.682 Y162.483 E2.73346
G1 X14.43 Y161.686 E.02102
G1 X92.309 Y239.564 E2.77061
G1 X93.101 Y239.811 E.02089
G1 X14.179 Y160.888 E2.80775
G3 X13.947 Y160.111 I22.114 J-7.018 E.02041
G1 X93.889 Y240.053 E2.84403
G1 X94.665 Y240.283 E.02034
G1 X13.717 Y159.335 E2.87979
G3 X13.494 Y158.567 I21.929 J-6.779 E.02014
G1 X95.433 Y240.506 E2.91507
G1 X96.188 Y240.715 E.01971
G1 X13.285 Y157.811 E2.94939
G1 X13.075 Y157.056 E.01971
G1 X96.944 Y240.925 E2.9837
G2 X97.686 Y241.121 I6.001 J-21.166 E.01932
G1 X12.879 Y156.314 E3.0171
G1 X12.689 Y155.578 E.01913
G1 X98.422 Y241.311 E3.05006
G1 X99.158 Y241.502 E.01913
G1 X12.498 Y154.842 E3.08302
G3 X12.325 Y154.123 I20.459 J-5.314 E.01861
G1 X99.877 Y241.675 E3.11478
G1 X100.595 Y241.848 E.01858
G1 X12.152 Y153.405 E3.14646
G3 X11.982 Y152.689 I20.429 J-5.235 E.01851
G1 X101.311 Y242.018 E3.17798
G1 X102.013 Y242.173 E.01807
G1 X11.827 Y151.987 E3.20846
G1 X11.671 Y151.286 E.01807
G1 X102.714 Y242.329 E3.23894
G2 X103.41 Y242.48 I3.974 J-16.659 E.01793
G1 X11.52 Y150.589 E3.26911
G1 X11.38 Y149.904 E.01759
G1 X104.092 Y242.616 E3.29834
G1 X104.775 Y242.752 E.0175
G1 X11.241 Y149.219 E3.32757
G3 X11.106 Y148.538 I19.42 J-4.213 E.01747
G1 X105.457 Y242.889 E3.35665
M73 P69 R24
G2 X106.132 Y243.019 I4.94 J-23.882 E.01731
G1 X10.981 Y147.868 E3.3851
G1 X10.857 Y147.198 E.01714
G1 X106.802 Y243.143 E3.41335
G2 X107.469 Y243.264 I3.802 J-19.047 E.01705
G1 X10.736 Y146.531 E3.44137
G1 X10.627 Y145.876 E.01672
G1 X108.124 Y243.373 E3.46859
M73 P70 R24
G1 X108.78 Y243.483 E.01672
G1 X10.517 Y145.22 E3.49581
G3 X10.408 Y144.566 I18.73 J-3.441 E.01668
G1 X109.434 Y243.592 E3.52294
G1 X110.076 Y243.687 E.01632
G1 X10.313 Y143.924 E3.54918
G1 X10.217 Y143.283 E.01632
G1 X110.717 Y243.783 E3.57542
G1 X111.359 Y243.879 E.01632
G1 X10.121 Y142.641 E3.60166
G3 X10.036 Y142.011 I17.914 J-2.716 E.01599
G1 X111.989 Y243.963 E3.62706
G1 X112.617 Y244.046 E.01595
G1 X9.954 Y141.383 E3.65237
G1 X9.871 Y140.754 E.01595
G1 X113.246 Y244.129 E3.67767
G2 X113.866 Y244.204 I2.46 J-17.736 E.01573
G1 X9.796 Y140.134 E3.70243
G1 X9.726 Y139.518 E.01559
G1 X114.482 Y244.274 E3.72683
G1 X115.098 Y244.344 E.01559
G1 X9.656 Y138.902 E3.75124
G3 X9.588 Y138.289 I17.55 J-2.231 E.01551
G1 X115.711 Y244.412 E3.77543
G1 X116.315 Y244.47 E.01526
G1 X9.53 Y137.685 E3.79898
G1 X9.472 Y137.081 E.01526
G1 X116.919 Y244.528 E3.82254
G1 X117.523 Y244.586 E.01526
G1 X9.414 Y136.477 E3.84609
G3 X9.365 Y135.883 I17.004 J-1.688 E.015
G1 X118.117 Y244.635 E3.86896
G1 X118.709 Y244.681 E.01495
G1 X9.319 Y135.291 E3.89169
G1 X9.272 Y134.698 E.01495
G1 X119.302 Y244.728 E3.91442
G2 X119.89 Y244.77 I1.308 J-14.102 E.01483
G1 X9.229 Y134.11 E3.93686
G1 X9.194 Y133.528 E.01465
G1 X120.469 Y244.803 E3.95874
G1 X121.048 Y244.837 E.01459
G1 X9.158 Y132.947 E3.98061
G1 X9.123 Y132.366 E.01465
G1 X121.627 Y244.87 E4.00248
G1 X122.206 Y244.904 E.01459
G1 X9.095 Y131.793 E4.02406
G1 X9.07 Y131.222 E.01437
G1 X122.778 Y244.93 E4.04528
G1 X123.349 Y244.955 E.01437
G1 X9.045 Y130.651 E4.06647
G3 X9.022 Y130.082 I16.279 J-.96 E.01433
G1 X123.918 Y244.978 E4.08756
G1 X124.478 Y244.993 E.0141
G1 X9.007 Y129.522 E4.10802
G1 X8.993 Y128.961 E.0141
G1 X125.039 Y245.007 E4.12848
G1 X125.599 Y245.022 E.0141
G1 X8.978 Y128.401 E4.14893
G3 X8.967 Y127.845 I15.905 J-.578 E.014
G1 X126.155 Y245.033 E4.1691
G1 X126.706 Y245.037 E.01385
G1 X8.963 Y127.294 E4.18885
G1 X8.958 Y126.744 E.01385
G1 X127.256 Y245.042 E4.20861
G1 X127.807 Y245.047 E.01385
G1 X8.957 Y126.197 E4.22822
G1 X8.96 Y125.654 E.01366
G1 X128.351 Y245.046 E4.24748
G1 X128.892 Y245.041 E.01361
G1 X8.963 Y125.112 E4.26662
G1 X8.966 Y124.569 E.01366
G1 X129.433 Y245.036 E4.28576
G1 X129.974 Y245.032 E.01361
G1 X8.969 Y124.026 E4.30491
G3 X8.981 Y123.492 I12.818 J.016 E.01344
G1 X130.508 Y245.019 E4.32347
G1 X131.04 Y245.005 E.01338
G1 X8.995 Y122.96 E4.34189
G1 X9.008 Y122.428 E.01338
G1 X131.572 Y244.991 E4.36032
G1 X132.103 Y244.978 E.01338
G1 X9.022 Y121.897 E4.37874
G3 X9.044 Y121.373 I14.983 J.366 E.01319
G1 X132.627 Y244.956 E4.39659
G1 X133.15 Y244.933 E.01317
G1 X9.067 Y120.85 E4.41439
G1 X9.09 Y120.327 E.01317
G1 X133.673 Y244.91 E4.43218
G1 X134.196 Y244.887 E.01317
G1 X9.119 Y119.81 E4.44975
G1 X9.149 Y119.294 E.013
G1 X134.711 Y244.856 E4.467
G1 X135.225 Y244.825 E.01296
G1 X9.179 Y118.778 E4.48424
G1 X9.208 Y118.263 E.013
G1 X135.739 Y244.793 E4.50147
G1 X136.253 Y244.762 E.01296
G1 X9.238 Y117.747 E4.51871
G3 X9.277 Y117.24 I12.299 J.687 E.01279
G1 X136.76 Y244.723 E4.53535
G1 X137.266 Y244.683 E.01277
G1 X9.317 Y116.734 E4.55194
G1 X9.357 Y116.228 E.01277
G1 X137.772 Y244.643 E4.56852
G1 X138.278 Y244.603 E.01277
G1 X9.397 Y115.722 E4.5851
G3 X9.443 Y115.223 I14.355 J1.081 E.01262
G1 X138.777 Y244.557 E4.60122
G1 X139.275 Y244.509 E.01258
G1 X9.491 Y114.725 E4.61722
G1 X9.539 Y114.227 E.01258
G1 X139.773 Y244.461 E4.63323
G1 X140.271 Y244.413 E.01258
G1 X9.587 Y113.729 E4.64923
G3 X9.64 Y113.237 I14.154 J1.276 E.01247
G1 X140.763 Y244.36 E4.66487
G1 X141.253 Y244.304 E.0124
G1 X9.696 Y112.747 E4.68031
G1 X9.751 Y112.257 E.0124
G1 X141.743 Y244.249 E4.69576
G1 X142.233 Y244.193 E.0124
G1 X9.807 Y111.767 E4.7112
G3 X9.866 Y111.28 I13.968 J1.452 E.01233
G1 X142.72 Y244.134 E4.7264
G1 X143.202 Y244.07 E.01224
G1 X9.93 Y110.798 E4.7413
M73 P71 R24
G1 X9.993 Y110.316 E.01224
G1 X143.684 Y244.007 E4.7562
G1 X144.166 Y243.943 E.01224
G1 X10.057 Y109.834 E4.7711
G3 X10.122 Y109.353 I13.817 J1.615 E.01221
G1 X144.647 Y243.878 E4.7859
G1 X145.122 Y243.807 E.01208
G1 X10.193 Y108.878 E4.80027
G1 X10.264 Y108.403 E.01208
G1 X145.597 Y243.736 E4.81464
G1 X146.072 Y243.665 E.01208
G1 X10.335 Y107.928 E4.829
G1 X10.405 Y107.453 E.01208
G1 X146.547 Y243.595 E4.84337
G2 X147.015 Y243.517 I-1.962 J-13.397 E.01195
G1 X10.483 Y106.985 E4.8573
M73 P71 R23
G1 X10.561 Y106.517 E.01192
G1 X147.483 Y243.439 E4.87115
G1 X147.95 Y243.361 E.01192
G1 X10.639 Y106.05 E4.885
G1 X10.717 Y105.582 E.01192
G1 X148.418 Y243.283 E4.89885
G2 X148.881 Y243.201 I-1.741 J-11.184 E.01185
G1 X10.799 Y105.118 E4.91245
G1 X10.884 Y104.658 E.01178
G1 X149.34 Y243.114 E4.92574
G1 X149.799 Y243.027 E.01175
G1 X10.969 Y104.197 E4.93904
G1 X11.055 Y103.737 E.01178
G1 X150.258 Y242.941 E4.95233
G1 X150.718 Y242.854 E.01175
G1 X11.14 Y103.277 E4.96562
G1 X11.232 Y102.823 E.01164
G1 X151.177 Y242.767 E4.97867
G2 X151.63 Y242.675 I-2.962 J-15.785 E.01165
G1 X11.325 Y102.37 E4.99153
G1 X11.417 Y101.916 E.01164
G1 X152.084 Y242.583 E5.00438
G1 X152.537 Y242.491 E.01164
G1 X11.509 Y101.463 E5.01723
G3 X11.605 Y101.013 I12.931 J2.519 E.01157
G1 X152.987 Y242.395 E5.02983
G1 X153.434 Y242.296 E.01151
G1 X11.704 Y100.566 E5.0422
G1 X11.803 Y100.119 E.01151
G1 X153.881 Y242.197 E5.05457
G1 X154.327 Y242.098 E.01151
G1 X11.902 Y99.673 E5.06694
G1 X12.001 Y99.226 E.01151
G1 X154.774 Y241.999 E5.07931
G1 X155.214 Y241.893 E.01139
G1 X12.107 Y98.786 E5.09121
G1 X12.212 Y98.346 E.01139
G1 X155.654 Y241.788 E5.10311
G1 X156.094 Y241.682 E.01139
G1 X12.318 Y97.906 E5.11501
G1 X12.424 Y97.466 E.01139
G1 X156.534 Y241.576 E5.1269
G2 X156.972 Y241.468 I-2.88 J-12.581 E.01134
G1 X12.532 Y97.028 E5.13862
G1 X12.644 Y96.594 E.01127
G1 X157.406 Y241.356 E5.15005
G1 X157.839 Y241.244 E.01127
G1 X12.756 Y96.161 E5.16149
G1 X12.868 Y95.727 E.01127
G1 X158.273 Y241.132 E5.17293
G1 X158.706 Y241.02 E.01127
G1 X12.98 Y95.294 E5.18436
G3 X13.097 Y94.865 I12.267 J3.115 E.01118
G1 X159.135 Y240.903 E5.19546
G1 X159.562 Y240.784 E.01115
G1 X13.216 Y94.438 E5.20644
G1 X13.334 Y94.01 E.01115
G1 X159.99 Y240.666 E5.21743
G1 X160.417 Y240.547 E.01115
G1 X13.453 Y93.583 E5.22841
G3 X13.572 Y93.156 I12.204 J3.17 E.01115
G1 X160.844 Y240.428 E5.23936
G1 X161.265 Y240.304 E.01105
G1 X13.696 Y92.735 E5.24991
G1 X13.821 Y92.314 E.01105
G1 X161.686 Y240.179 E5.26045
G1 X162.107 Y240.054 E.01105
G1 X13.946 Y91.893 E5.27099
G1 X14.071 Y91.472 E.01105
G1 X162.528 Y239.929 E5.28153
G2 X162.947 Y239.803 I-3.416 J-12.045 E.01101
G1 X14.197 Y91.053 E5.29193
G1 X14.328 Y90.638 E.01094
G1 X163.362 Y239.672 E5.30203
G1 X163.777 Y239.541 E.01094
G1 X14.459 Y90.223 E5.31214
G1 X14.59 Y89.809 E.01094
G1 X164.191 Y239.41 E5.32225
G1 X164.606 Y239.279 E.01094
G1 X14.721 Y89.394 E5.33235
M73 P72 R23
G3 X14.855 Y88.982 I11.858 J3.639 E.01089
G1 X165.018 Y239.145 E5.34222
G1 X165.427 Y239.008 E.01085
G1 X14.992 Y88.573 E5.3519
G1 X15.128 Y88.164 E.01085
G1 X165.836 Y238.872 E5.36158
G1 X166.245 Y238.735 E.01085
G1 X15.265 Y87.755 E5.37126
G1 X15.402 Y87.346 E.01085
G1 X166.654 Y238.598 E5.38094
G2 X167.058 Y238.457 I-3.841 J-11.654 E.01078
G1 X15.543 Y86.942 E5.39031
G1 X15.686 Y86.539 E.01076
G1 X167.461 Y238.314 E5.39957
G1 X167.864 Y238.171 E.01076
G1 X15.829 Y86.136 E5.40883
G1 X15.971 Y85.733 E.01076
G1 X168.267 Y238.029 E5.41809
G1 X168.67 Y237.886 E.01076
G1 X16.114 Y85.33 E5.42735
G3 X16.262 Y84.932 I11.415 J4.015 E.01068
G1 X169.068 Y237.738 E5.43624
G1 X169.465 Y237.589 E.01067
G1 X16.411 Y84.535 E5.44509
G1 X16.559 Y84.138 E.01067
G1 X169.862 Y237.441 E5.45394
G1 X170.26 Y237.292 E.01067
G1 X16.708 Y83.74 E5.46279
G1 X16.856 Y83.343 E.01067
G1 X170.657 Y237.144 E5.47164
G1 X171.048 Y236.99 E.01059
G1 X17.01 Y82.952 E5.48009
M73 P72 R22
G1 X17.164 Y82.56 E.01059
G1 X171.44 Y236.836 E5.48853
G1 X171.831 Y236.681 E.01059
G1 X17.319 Y82.168 E5.49697
G1 X17.473 Y81.777 E.01059
G1 X172.223 Y236.527 E5.50541
G2 X172.614 Y236.373 I-4.311 J-11.491 E.01058
G1 X17.627 Y81.386 E5.51383
G1 X17.787 Y81 E.01051
G1 X173 Y236.213 E5.52188
G1 X173.386 Y236.053 E.01051
G1 X17.947 Y80.614 E5.52992
G1 X18.107 Y80.228 E.01051
G1 X173.772 Y235.893 E5.53796
G1 X174.158 Y235.733 E.01051
G1 X18.267 Y79.842 E5.546
G3 X18.427 Y79.457 I11.161 J4.413 E.0105
G1 X174.543 Y235.573 E5.55402
G1 X174.924 Y235.408 E.01043
G1 X18.592 Y79.076 E5.56166
G1 X18.758 Y78.696 E.01043
G1 X175.304 Y235.242 E5.56931
G1 X175.684 Y235.077 E.01043
G1 X18.923 Y78.316 E5.57696
G1 X19.088 Y77.935 E.01043
G1 X176.065 Y234.912 E5.58461
G2 X176.445 Y234.746 I-3.777 J-9.176 E.01043
G1 X19.254 Y77.555 E5.59223
G1 X19.425 Y77.18 E.01036
G1 X176.819 Y234.574 E5.59945
G1 X177.192 Y234.402 E.01035
G1 X19.596 Y76.805 E5.60667
G1 X19.767 Y76.431 E.01036
G1 X177.566 Y234.23 E5.61389
G1 X177.94 Y234.058 E.01035
G1 X19.938 Y76.056 E5.62112
G1 X20.108 Y75.681 E.01036
G1 X178.314 Y233.886 E5.62833
G1 X178.688 Y233.714 E.01035
G1 X20.285 Y75.311 E5.63536
G1 X20.461 Y74.942 E.0103
G1 X179.058 Y233.539 E5.64227
G1 X179.428 Y233.363 E.0103
G1 X20.637 Y74.572 E5.64914
G1 X20.813 Y74.203 E.0103
G1 X179.797 Y233.187 E5.65602
G1 X180.167 Y233.01 E.0103
G1 X20.99 Y73.833 E5.66289
G3 X21.171 Y73.469 I10.436 J4.962 E.01024
G1 X180.531 Y232.829 E5.66941
G1 X180.895 Y232.648 E.01024
G1 X21.352 Y73.105 E5.67591
G1 X21.534 Y72.741 E.01024
G1 X181.259 Y232.466 E5.68241
G1 X181.623 Y232.284 E.01024
G1 X21.716 Y72.377 E5.6889
M73 P73 R22
G1 X21.897 Y72.012 E.01024
G1 X181.988 Y232.103 E5.6954
G2 X182.347 Y231.917 I-5.159 J-10.421 E.01019
G1 X22.083 Y71.653 E5.70158
G1 X22.27 Y71.294 E.01018
G1 X182.706 Y231.73 E5.7077
G1 X183.065 Y231.543 E.01018
G1 X22.457 Y70.935 E5.71382
G1 X22.644 Y70.576 E.01018
G1 X183.424 Y231.356 E5.71994
G1 X183.783 Y231.169 E.01018
G1 X22.831 Y70.217 E5.72606
G3 X23.021 Y69.862 I10.273 J5.279 E.01014
G1 X184.138 Y230.979 E5.73193
G1 X184.492 Y230.787 E.01012
G1 X23.213 Y69.508 E5.73768
G1 X23.405 Y69.154 E.01012
G1 X184.846 Y230.595 E5.74343
G1 X185.199 Y230.403 E.01012
G1 X23.597 Y68.801 E5.74918
G1 X23.789 Y68.447 E.01012
G1 X185.553 Y230.211 E5.75493
G2 X185.904 Y230.016 I-5.406 J-10.15 E.0101
G1 X23.984 Y68.096 E5.76048
G1 X24.181 Y67.748 E.01007
G1 X186.252 Y229.819 E5.76587
G1 X186.601 Y229.622 E.01007
G1 X24.378 Y67.399 E5.77125
G1 X24.576 Y67.05 E.01007
G1 X186.95 Y229.424 E5.77664
G1 X187.298 Y229.227 E.01007
G1 X24.773 Y66.702 E5.78202
G3 X24.972 Y66.355 I10.034 J5.527 E.01006
G1 X187.645 Y229.028 E5.78728
G1 X187.988 Y228.826 E.01003
G1 X25.174 Y66.012 E5.7923
G1 X25.376 Y65.668 E.01003
G1 X188.332 Y228.624 E5.79732
G1 X188.675 Y228.421 E.01003
G1 X25.579 Y65.325 E5.80234
G1 X25.781 Y64.981 E.01003
G1 X189.019 Y228.219 E5.80736
G2 X189.361 Y228.016 I-5.641 J-9.914 E.01002
G1 X25.984 Y64.639 E5.81233
G1 X26.191 Y64.3 E.00998
G1 X189.7 Y227.809 E5.81699
M73 P73 R21
G1 X190.038 Y227.601 E.00998
G1 X26.399 Y63.962 E5.82166
G1 X26.606 Y63.624 E.00998
G1 X190.376 Y227.394 E5.82632
G1 X190.715 Y227.187 E.00998
G1 X26.813 Y63.285 E5.83098
G1 X27.021 Y62.947 E.00998
G1 X191.053 Y226.979 E5.83564
G2 X191.387 Y226.767 I-5.891 J-9.651 E.00995
G1 X27.233 Y62.613 E5.83998
G1 X27.445 Y62.28 E.00994
G1 X191.72 Y226.555 E5.84428
G1 X192.054 Y226.343 E.00994
G1 X27.657 Y61.946 E5.84859
G1 X27.87 Y61.613 E.00994
G1 X192.387 Y226.13 E5.85289
G1 X192.72 Y225.918 E.00994
G1 X28.082 Y61.28 E5.85719
G3 X28.298 Y60.949 I9.55 J6.001 E.00992
G1 X193.051 Y225.702 E5.86127
G1 X193.379 Y225.485 E.00991
G1 X28.515 Y60.621 E5.86522
G1 X28.732 Y60.293 E.00991
G1 X193.707 Y225.268 E5.86917
G1 X194.036 Y225.05 E.00991
G1 X28.95 Y59.964 E5.87312
G1 X29.167 Y59.636 E.00991
G1 X194.364 Y224.833 E5.87707
G2 X194.691 Y224.614 I-6.097 J-9.438 E.00989
G1 X29.386 Y59.309 E5.88089
G1 X29.609 Y58.986 E.00987
G1 X195.014 Y224.391 E5.88449
G1 X195.338 Y224.169 E.00987
G1 X29.831 Y58.662 E5.88809
G1 X30.053 Y58.339 E.00987
G1 X195.661 Y223.947 E5.89169
M73 P74 R21
G1 X195.984 Y223.725 E.00987
G1 X30.275 Y58.016 E5.89529
G3 X30.498 Y57.693 I9.216 J6.114 E.00987
G1 X196.307 Y223.502 E5.89886
G1 X196.626 Y223.275 E.00984
G1 X30.725 Y57.374 E5.90211
G1 X30.952 Y57.055 E.00984
G1 X196.945 Y223.048 E5.90535
G1 X197.263 Y222.82 E.00984
G1 X31.18 Y56.737 E5.9086
G1 X31.407 Y56.418 E.00984
G1 X197.582 Y222.593 E5.91185
G1 X197.9 Y222.366 E.00984
G1 X31.634 Y56.1 E5.9151
G3 X31.865 Y55.785 I9.165 J6.481 E.00982
G1 X198.215 Y222.135 E5.91808
G1 X198.529 Y221.903 E.00982
G1 X32.097 Y55.471 E5.92099
G1 X32.329 Y55.158 E.00982
G1 X198.842 Y221.671 E5.92389
G1 X199.156 Y221.439 E.00982
G1 X32.561 Y54.844 E5.92679
G1 X32.793 Y54.53 E.00982
G1 X199.469 Y221.207 E5.92969
G2 X199.781 Y220.972 I-5.456 J-7.557 E.0098
G1 X33.028 Y54.219 E5.93243
G1 X33.265 Y53.91 E.00979
G1 X200.088 Y220.734 E5.93495
G1 X200.396 Y220.496 E.00979
G1 X33.501 Y53.601 E5.93747
G1 X33.738 Y53.293 E.00979
G1 X200.704 Y220.258 E5.93999
G1 X201.012 Y220.021 E.00979
G1 X33.975 Y52.984 E5.94252
G3 X34.213 Y52.676 I8.925 J6.628 E.00979
G1 X201.32 Y219.783 E5.94502
G1 X201.628 Y219.545 E.00979
G1 X34.455 Y52.372 E5.94737
G1 X34.696 Y52.068 E.00977
G1 X201.932 Y219.304 E5.94961
G1 X202.236 Y219.062 E.00977
G1 X34.938 Y51.764 E5.95182
G1 X35.18 Y51.46 E.00977
G1 X202.54 Y218.82 E5.95403
G1 X202.844 Y218.578 E.00977
G1 X35.422 Y51.156 E5.95625
G3 X35.667 Y50.855 I8.73 J6.883 E.00976
G1 X203.145 Y218.333 E5.9582
G1 X203.444 Y218.086 E.00975
G1 X35.914 Y50.556 E5.96007
G1 X36.16 Y50.257 E.00975
G1 X203.743 Y217.84 E5.96194
G1 X204.042 Y217.593 E.00975
G1 X36.407 Y49.958 E5.96381
G1 X36.653 Y49.659 E.00975
G1 X204.341 Y217.347 E5.96568
G2 X204.638 Y217.098 I-6.956 J-8.624 E.00975
G1 X36.902 Y49.362 E5.96741
G1 X37.153 Y49.067 E.00974
G1 X204.933 Y216.847 E5.96894
M73 P74 R20
G1 X205.227 Y216.595 E.00974
G1 X37.405 Y48.773 E5.97047
G1 X37.656 Y48.479 E.00974
G1 X205.521 Y216.344 E5.972
G1 X205.816 Y216.093 E.00974
G1 X37.907 Y48.184 E5.97353
G1 X38.159 Y47.89 E.00974
G1 X206.11 Y215.841 E5.97505
G1 X206.4 Y215.585 E.00973
G1 X38.415 Y47.6 E5.97623
G1 X38.671 Y47.311 E.00973
G1 X206.689 Y215.329 E5.97742
G1 X206.979 Y215.073 E.00973
G1 X38.927 Y47.021 E5.97861
G1 X39.184 Y46.732 E.00973
G1 X207.268 Y214.816 E5.9798
G1 X207.558 Y214.56 E.00973
G1 X39.44 Y46.442 E5.98098
G3 X39.699 Y46.156 I8.332 J7.28 E.00972
G1 X207.844 Y214.301 E5.98195
M73 P75 R20
G1 X208.129 Y214.04 E.00972
G1 X39.96 Y45.871 E5.9828
G1 X40.221 Y45.586 E.00972
G1 X208.414 Y213.779 E5.98365
G1 X208.699 Y213.518 E.00972
G1 X40.482 Y45.301 E5.98449
G1 X40.743 Y45.017 E.00972
G1 X208.983 Y213.257 E5.98534
G2 X209.267 Y212.995 I-7.391 J-8.274 E.00972
G1 X41.005 Y44.733 E5.9861
G1 X41.271 Y44.453 E.00971
G1 X209.547 Y212.729 E5.98661
G1 X209.827 Y212.463 E.00971
G1 X41.537 Y44.173 E5.98711
G1 X41.802 Y43.893 E.00971
G1 X210.107 Y212.198 E5.98762
G1 X210.387 Y211.932 E.00971
G1 X42.068 Y43.613 E5.98813
G1 X42.334 Y43.333 E.00971
G1 X210.667 Y211.666 E5.98864
G2 X210.943 Y211.396 I-7.563 J-8.002 E.00971
G1 X42.604 Y43.057 E5.98885
G1 X42.874 Y42.782 E.00971
G1 X211.218 Y211.126 E5.98902
G1 X211.493 Y210.855 E.00971
G1 X43.145 Y42.507 E5.98919
G1 X43.415 Y42.232 E.00971
G1 X211.768 Y210.585 E5.98936
G1 X212.044 Y210.314 E.00971
G1 X43.689 Y41.959 E5.98942
G1 X43.963 Y41.688 E.00971
G1 X212.316 Y210.041 E5.98936
G1 X212.587 Y209.766 E.00971
G1 X44.237 Y41.417 E5.98923
G1 X44.512 Y41.145 E.00971
G1 X212.857 Y209.491 E5.98909
G1 X213.128 Y209.216 E.00971
G1 X44.786 Y40.874 E5.98895
G1 X45.06 Y40.602 E.00971
G1 X213.398 Y208.94 E5.98882
G2 X213.668 Y208.665 I-7.785 J-7.889 E.00971
G1 X45.335 Y40.332 E5.98864
G1 X45.615 Y40.066 E.00971
G1 X213.934 Y208.385 E5.98813
G1 X214.2 Y208.105 E.00971
G1 X45.895 Y39.8 E5.98762
G1 X46.175 Y39.535 E.00971
G1 X214.465 Y207.825 E5.98711
G1 X214.731 Y207.545 E.00971
G1 X46.455 Y39.269 E5.9866
G1 X46.735 Y39.003 E.00971
G1 X214.997 Y207.265 E5.98609
G2 X215.259 Y206.981 I-7.984 J-7.647 E.00972
G1 X47.019 Y38.741 E5.98534
G1 X47.304 Y38.48 E.00972
G1 X215.52 Y206.696 E5.98449
G1 X215.781 Y206.412 E.00972
G1 X47.588 Y38.219 E5.98364
G1 X47.873 Y37.958 E.00972
G1 X216.042 Y206.127 E5.98279
G1 X216.303 Y205.842 E.00972
G1 X48.161 Y37.7 E5.98186
G1 X48.449 Y37.442 E.00972
G1 X216.562 Y205.555 E5.98081
G1 X216.818 Y205.266 E.00973
G1 X48.738 Y37.185 E5.97965
G1 X49.026 Y36.928 E.00972
G1 X217.075 Y204.976 E5.9785
G1 X217.331 Y204.687 E.00973
G1 X49.315 Y36.671 E5.97735
G1 X49.604 Y36.414 E.00972
G1 X217.587 Y204.397 E5.97619
G1 X217.843 Y204.108 E.00973
G1 X49.892 Y36.157 E5.97504
M73 P75 R19
G1 X50.187 Y35.905 E.00974
G1 X218.095 Y203.813 E5.97351
G1 X218.346 Y203.519 E.00974
G1 X50.481 Y35.654 E5.97199
M73 P76 R19
G1 X50.775 Y35.403 E.00974
G1 X218.597 Y203.225 E5.97046
G1 X218.849 Y202.93 E.00974
G1 X51.07 Y35.151 E5.96893
G1 X51.364 Y34.9 E.00974
G1 X219.1 Y202.636 E5.9674
G2 X219.349 Y202.339 I-8.361 J-7.24 E.00975
G1 X51.661 Y34.651 E5.96567
G1 X51.96 Y34.405 E.00975
G1 X219.595 Y202.04 E5.9638
G1 X219.842 Y201.741 E.00975
G1 X52.259 Y34.158 E5.96193
G1 X52.559 Y33.912 E.00975
G1 X220.088 Y201.441 E5.96006
G1 X220.335 Y201.142 E.00975
G1 X52.858 Y33.665 E5.95819
G3 X53.158 Y33.42 I7.143 J8.439 E.00976
G1 X220.58 Y200.842 E5.95623
G1 X220.822 Y200.538 E.00977
G1 X53.462 Y33.178 E5.95402
G1 X53.766 Y32.936 E.00977
G1 X221.064 Y200.234 E5.95181
G1 X221.306 Y199.93 E.00977
G1 X54.07 Y32.694 E5.94959
G1 X54.374 Y32.453 E.00977
G1 X221.547 Y199.626 E5.94738
G1 X221.789 Y199.322 E.00977
G1 X54.678 Y32.211 E5.94517
G3 X54.986 Y31.973 I6.974 J8.74 E.00979
G1 X222.027 Y199.014 E5.94264
G1 X222.263 Y198.705 E.00979
G1 X55.295 Y31.737 E5.94009
G1 X55.604 Y31.5 E.00979
G1 X222.5 Y198.396 E5.93753
G1 X222.737 Y198.087 E.00979
G1 X55.913 Y31.263 E5.93498
G1 X56.221 Y31.026 E.00979
G1 X222.974 Y197.779 E5.93242
G2 X223.208 Y197.467 I-8.813 J-6.869 E.00981
G1 X56.533 Y30.792 E5.92967
G1 X56.847 Y30.559 E.00982
G1 X223.441 Y197.153 E5.92677
G1 X223.673 Y196.84 E.00982
G1 X57.16 Y30.327 E5.92387
G1 X57.474 Y30.095 E.00982
G1 X223.905 Y196.526 E5.92096
G1 X224.137 Y196.212 E.00982
G1 X57.788 Y29.863 E5.91806
G3 X58.102 Y29.632 I6.788 J8.925 E.00982
G1 X224.368 Y195.898 E5.91508
G1 X224.595 Y195.579 E.00984
G1 X58.421 Y29.405 E5.91183
G1 X58.739 Y29.178 E.00984
G1 X224.822 Y195.261 E5.90858
G1 X225.049 Y194.942 E.00984
G1 X59.058 Y28.951 E5.90533
G1 X59.376 Y28.723 E.00984
G1 X225.277 Y194.624 E5.90208
G1 X225.504 Y194.305 E.00984
G1 X59.695 Y28.496 E5.89883
G3 X60.018 Y28.274 I6.463 J9.034 E.00987
G1 X225.726 Y193.982 E5.89526
G1 X225.949 Y193.658 E.00987
G1 X60.342 Y28.051 E5.89166
G1 X60.665 Y27.829 E.00987
G1 X226.171 Y193.335 E5.88806
G1 X226.393 Y193.012 E.00987
G1 X60.988 Y27.607 E5.88446
G1 X61.312 Y27.384 E.00987
G1 X226.616 Y192.688 E5.88086
G2 X226.835 Y192.362 I-9.245 J-6.439 E.00989
G1 X61.638 Y27.165 E5.87704
G1 X61.967 Y26.948 E.00991
G1 X227.052 Y192.033 E5.87309
G1 X227.269 Y191.705 E.00991
G1 X62.295 Y26.731 E5.86914
G1 X62.624 Y26.513 E.00991
G1 X227.487 Y191.376 E5.86519
M73 P77 R19
G1 X227.704 Y191.048 E.00991
G1 X62.952 Y26.296 E5.86124
G3 X63.282 Y26.08 I6.327 J9.331 E.00992
G1 X227.92 Y190.718 E5.85716
G1 X228.132 Y190.384 E.00994
G1 X63.616 Y25.868 E5.85286
G1 X63.949 Y25.656 E.00994
G1 X228.344 Y190.051 E5.84855
G1 X228.557 Y189.718 E.00994
G1 X64.282 Y25.443 E5.84425
G1 X64.616 Y25.231 E.00994
G1 X228.769 Y189.384 E5.83994
M73 P77 R18
G2 X228.981 Y189.051 I-9.498 J-6.261 E.00995
G1 X64.949 Y25.019 E5.8356
G1 X65.288 Y24.812 E.00998
G1 X229.188 Y188.712 E5.83094
G1 X229.396 Y188.374 E.00998
G1 X65.626 Y24.604 E5.82628
G1 X65.965 Y24.397 E.00998
G1 X229.603 Y188.035 E5.82162
G1 X229.81 Y187.697 E.00998
G1 X66.303 Y24.19 E5.81696
G1 X66.641 Y23.982 E.00998
G1 X230.018 Y187.359 E5.8123
G2 X230.221 Y187.016 I-9.669 J-5.956 E.01002
G1 X66.984 Y23.779 E5.80732
G1 X67.328 Y23.577 E.01003
G1 X230.423 Y186.672 E5.8023
G1 X230.625 Y186.329 E.01003
G1 X67.671 Y23.375 E5.79728
G1 X68.014 Y23.172 E.01003
G1 X230.828 Y185.986 E5.79226
G1 X231.03 Y185.642 E.01003
G1 X68.358 Y22.97 E5.78724
G3 X68.705 Y22.771 I5.883 J9.854 E.01006
G1 X231.229 Y185.295 E5.78198
G1 X231.426 Y184.947 E.01007
G1 X69.053 Y22.574 E5.77659
G1 X69.402 Y22.377 E.01007
G1 X231.623 Y184.598 E5.77121
G1 X231.82 Y184.25 E.01007
G1 X69.75 Y22.18 E5.76583
G1 X70.099 Y21.982 E.01007
G1 X232.018 Y183.901 E5.76044
G2 X232.212 Y183.55 I-9.957 J-5.756 E.0101
G1 X70.45 Y21.788 E5.75489
G1 X70.803 Y21.596 E.01012
G1 X232.404 Y183.197 E5.74914
G1 X232.596 Y182.843 E.01012
G1 X71.157 Y21.404 E5.74338
G1 X71.511 Y21.212 E.01012
G1 X232.788 Y182.489 E5.73763
G1 X232.981 Y182.135 E.01012
G1 X71.865 Y21.019 E5.73188
G3 X72.22 Y20.829 I5.638 J10.093 E.01014
G1 X233.171 Y181.78 E5.72602
G1 X233.358 Y181.421 E.01018
G1 X72.579 Y20.642 E5.7199
G1 X72.938 Y20.455 E.01018
G1 X233.545 Y181.062 E5.71377
G1 X233.731 Y180.703 E.01018
G1 X73.297 Y20.269 E5.70765
G1 X73.655 Y20.082 E.01018
G1 X233.918 Y180.345 E5.70153
G2 X234.104 Y179.985 I-10.296 J-5.548 E.01019
G1 X74.015 Y19.896 E5.69535
G1 X74.379 Y19.714 E.01024
G1 X234.286 Y179.621 E5.68885
G1 X234.467 Y179.256 E.01024
G1 X74.744 Y19.533 E5.68235
G1 X75.108 Y19.351 E.01024
G1 X234.649 Y178.892 E5.67586
G1 X234.83 Y178.528 E.01024
G1 X75.472 Y19.17 E5.66936
G3 X75.836 Y18.988 I5.452 J10.509 E.01024
G1 X235.012 Y178.164 E5.66284
G1 X235.188 Y177.794 E.0103
G1 X76.206 Y18.812 E5.65597
M73 P78 R18
G1 X76.575 Y18.636 E.0103
G1 X235.364 Y177.425 E5.64909
G1 X235.54 Y177.055 E.0103
G1 X76.945 Y18.46 E5.64222
G1 X77.314 Y18.283 E.0103
G1 X235.717 Y176.686 E5.63534
G1 X235.893 Y176.316 E.0103
G1 X77.684 Y18.107 E5.62847
G1 X78.059 Y17.936 E.01036
G1 X236.063 Y175.94 E5.62117
G1 X236.233 Y175.564 E.01038
G1 X78.434 Y17.765 E5.61388
G1 X78.808 Y17.594 E.01036
G1 X236.402 Y175.188 E5.60658
G1 X236.572 Y174.812 E.01038
G1 X79.184 Y17.424 E5.59926
G1 X79.563 Y17.258 E.01042
G1 X236.742 Y174.437 E5.59181
G1 X236.912 Y174.061 E.01038
G1 X79.943 Y17.091 E5.58435
G1 X80.322 Y16.925 E.01042
G1 X237.078 Y173.681 E5.57678
G1 X237.244 Y173.301 E.01043
G1 X80.701 Y16.759 E5.56917
G1 X81.08 Y16.592 E.01042
G1 X237.409 Y172.921 E5.56156
G1 X237.574 Y172.54 E.01043
G1 X81.46 Y16.426 E5.55395
G3 X81.845 Y16.265 I4.011 J9.101 E.0105
G1 X237.735 Y172.155 E5.54594
M73 P78 R17
G1 X237.894 Y171.769 E.01051
G1 X82.231 Y16.106 E5.5379
G1 X82.617 Y15.946 E.01051
G1 X238.054 Y171.383 E5.52985
G1 X238.214 Y170.997 E.01051
G1 X83.003 Y15.786 E5.52181
G1 X83.389 Y15.626 E.01051
G1 X238.374 Y170.611 E5.51377
G2 X238.528 Y170.22 I-11.326 J-4.696 E.01058
G1 X83.78 Y15.472 E5.50534
G1 X84.172 Y15.317 E.01059
G1 X238.683 Y169.828 E5.4969
G1 X238.837 Y169.437 E.01059
G1 X84.563 Y15.163 E5.48846
G1 X84.955 Y15.009 E.01059
G1 X238.991 Y169.045 E5.48002
G1 X239.145 Y168.654 E.01059
G1 X85.346 Y14.855 E5.47157
G1 X85.743 Y14.706 E.01067
G1 X239.294 Y168.257 E5.46272
G1 X239.442 Y167.859 E.01067
G1 X86.141 Y14.558 E5.45387
G1 X86.538 Y14.409 E.01067
G1 X239.591 Y167.462 E5.44502
G1 X239.739 Y167.065 E.01067
G1 X86.935 Y14.261 E5.43618
G3 X87.333 Y14.113 I4.411 J11.266 E.01068
G1 X239.887 Y166.667 E5.42728
G1 X240.03 Y166.264 E.01076
G1 X87.736 Y13.97 E5.41802
G1 X88.139 Y13.828 E.01076
G1 X240.172 Y165.861 E5.40876
G1 X240.315 Y165.458 E.01076
G1 X88.542 Y13.685 E5.3995
G3 X88.947 Y13.544 I5.179 J14.258 E.01079
G1 X240.458 Y165.055 E5.39016
G2 X240.599 Y164.65 I-11.467 J-4.228 E.01078
G1 X89.355 Y13.406 E5.38068
G1 X89.763 Y13.268 E.01083
G1 X240.736 Y164.241 E5.37104
G1 X240.873 Y163.832 E.01085
G1 X90.17 Y13.13 E5.3614
G1 X90.578 Y12.992 E.01083
G1 X241.009 Y163.424 E5.35176
G1 X241.146 Y163.015 E.01085
G1 X90.986 Y12.854 E5.34212
G3 X91.397 Y12.72 I3.446 J9.813 E.01088
G1 X241.28 Y162.603 E5.33227
G1 X241.411 Y162.188 E.01094
G1 X91.812 Y12.589 E5.32217
G1 X92.227 Y12.458 E.01094
G1 X241.542 Y161.773 E5.31206
M73 P79 R17
G1 X241.673 Y161.358 E.01094
G1 X92.642 Y12.327 E5.30195
G1 X93.057 Y12.196 E.01094
G1 X241.804 Y160.943 E5.29185
G2 X241.93 Y160.524 I-11.938 J-3.839 E.01101
G1 X93.476 Y12.07 E5.28145
G1 X93.897 Y11.945 E.01105
G1 X242.055 Y160.103 E5.27091
G1 X242.18 Y159.682 E.01105
G1 X94.318 Y11.82 E5.26036
G1 X94.739 Y11.695 E.01105
G1 X242.305 Y159.261 E5.24982
G1 X242.429 Y158.84 E.01105
G1 X95.16 Y11.571 E5.23928
G3 X95.586 Y11.452 I3.675 J12.371 E.01115
G1 X242.548 Y158.414 E5.22833
G1 X242.667 Y157.986 E.01115
G1 X96.014 Y11.333 E5.21734
G1 X96.441 Y11.215 E.01115
G1 X242.785 Y157.559 E5.20636
G1 X242.904 Y157.132 E.01115
G1 X96.868 Y11.096 E5.19537
G3 X97.297 Y10.98 I3.585 J12.307 E.01118
G1 X243.02 Y156.703 E5.18427
G1 X243.133 Y156.269 E.01127
G1 X97.731 Y10.867 E5.17284
G1 X98.164 Y10.755 E.01127
G1 X243.245 Y155.836 E5.1614
G1 X243.357 Y155.402 E.01127
G1 X98.598 Y10.643 E5.14996
G1 X99.031 Y10.531 E.01127
G1 X243.469 Y154.969 E5.13853
G2 X243.577 Y154.531 I-12.476 J-3.316 E.01134
G1 X99.469 Y10.423 E5.12681
G1 X99.909 Y10.317 E.01139
G1 X243.683 Y154.091 E5.11491
G1 X243.788 Y153.651 E.01139
G1 X100.349 Y10.211 E5.10301
G1 X100.789 Y10.106 E.01139
G1 X243.894 Y153.211 E5.09112
G1 X244 Y152.771 E.01139
G1 X101.229 Y10 E5.07921
G1 X101.676 Y9.901 E.01151
G1 X244.099 Y152.324 E5.06684
G1 X244.198 Y151.877 E.01151
G1 X102.123 Y9.802 E5.05447
G1 X102.57 Y9.703 E.01151
G1 X244.297 Y151.43 E5.0421
M73 P79 R16
G1 X244.396 Y150.984 E.01151
G1 X103.016 Y9.604 E5.02973
G3 X103.466 Y9.508 I2.964 J12.821 E.01157
G1 X244.492 Y150.534 E5.01713
G1 X244.584 Y150.08 E.01164
G1 X103.92 Y9.416 E5.00428
G1 X104.373 Y9.324 E.01164
G1 X244.676 Y149.627 E4.99143
G1 X244.768 Y149.173 E.01164
G1 X104.827 Y9.232 E4.97858
G1 X105.28 Y9.139 E.01164
G1 X244.861 Y148.72 E4.96573
G1 X244.946 Y148.26 E.01178
G1 X105.74 Y9.054 E4.95239
G1 X106.201 Y8.969 E.01178
G1 X245.031 Y147.799 E4.93905
G1 X245.117 Y147.339 E.01178
G1 X106.661 Y8.883 E4.92571
G1 X107.122 Y8.798 E.01178
G1 X245.202 Y146.878 E4.91236
G2 X245.283 Y146.414 I-13.302 J-2.572 E.01186
G1 X107.586 Y8.717 E4.89874
G1 X108.053 Y8.638 E.01192
G1 X245.362 Y145.947 E4.88489
G1 X245.44 Y145.479 E.01192
G1 X108.521 Y8.56 E4.87104
G1 X108.988 Y8.482 E.01192
G1 X245.518 Y145.012 E4.85719
G2 X245.595 Y144.543 I-13.347 J-2.433 E.01195
G1 X109.457 Y8.405 E4.84326
G1 X109.932 Y8.334 E.01208
G1 X245.666 Y144.068 E4.82889
G1 X245.737 Y143.593 E.01208
G1 X110.407 Y8.263 E4.81453
G1 X110.882 Y8.192 E.01208
G1 X245.808 Y143.118 E4.80016
G1 X245.879 Y142.644 E.01208
G1 X111.356 Y8.121 E4.78579
M73 P80 R16
G3 X111.837 Y8.056 I2.093 J13.744 E.01221
G1 X245.944 Y142.163 E4.77098
G1 X246.007 Y141.68 E.01224
G1 X112.32 Y7.993 E4.75608
G1 X112.802 Y7.929 E.01224
G1 X246.071 Y141.198 E4.74118
G1 X246.134 Y140.716 E.01224
G1 X113.284 Y7.866 E4.72629
G3 X113.771 Y7.807 I1.939 J13.928 E.01233
G1 X246.193 Y140.229 E4.71108
G1 X246.249 Y139.739 E.0124
G1 X114.261 Y7.751 E4.69563
G1 X114.751 Y7.695 E.0124
G1 X246.305 Y139.249 E4.68019
G1 X246.361 Y138.76 E.0124
G1 X115.24 Y7.639 E4.66475
G3 X115.733 Y7.586 I1.769 J14.127 E.01247
G1 X246.414 Y138.267 E4.6491
G1 X246.462 Y137.769 E.01258
G1 X116.231 Y7.538 E4.6331
G1 X116.729 Y7.49 E.01258
G1 X246.509 Y137.271 E4.61709
G1 X246.557 Y136.773 E.01258
G1 X117.227 Y7.443 E4.60109
G3 X117.726 Y7.396 I1.569 J14.206 E.01262
G1 X246.604 Y136.274 E4.58497
G1 X246.644 Y135.768 E.01277
G1 X118.232 Y7.356 E4.56839
G1 X118.738 Y7.317 E.01277
G1 X246.683 Y135.262 E4.55181
G1 X246.723 Y134.756 E.01277
G1 X119.244 Y7.277 E4.53522
G3 X119.751 Y7.238 I1.371 J14.522 E.01279
G1 X246.762 Y134.249 E4.51857
G1 X246.792 Y133.733 E.013
G1 X120.265 Y7.206 E4.50134
G1 X120.779 Y7.175 E.01296
G1 X246.822 Y133.217 E4.4841
G1 X246.851 Y132.702 E.013
G1 X121.293 Y7.144 E4.46687
G3 X121.808 Y7.113 I1.141 J14.745 E.01298
G1 X246.881 Y132.186 E4.44961
G2 X246.91 Y131.669 I-18.182 J-1.278 E.01302
G1 X122.331 Y7.09 E4.43204
G1 X122.854 Y7.067 E.01317
G1 X246.933 Y131.146 E4.41425
G1 X246.956 Y130.623 E.01317
G1 X123.377 Y7.044 E4.39645
G3 X123.901 Y7.022 I.887 J14.952 E.01319
G1 X246.978 Y130.099 E4.3786
G1 X246.992 Y129.567 E.01338
G1 X124.433 Y7.008 E4.36017
G1 X124.964 Y6.994 E.01338
G1 X247.006 Y129.036 E4.34175
G1 X247.019 Y128.504 E.01338
G1 X125.496 Y6.981 E4.32333
G3 X126.03 Y6.968 I.614 J15.325 E.01343
G1 X247.031 Y127.97 E4.30476
G1 X247.034 Y127.427 E.01366
G1 X126.571 Y6.964 E4.28561
G1 X127.112 Y6.959 E.01361
G1 X247.037 Y126.884 E4.26647
G1 X247.04 Y126.341 E.01366
G1 X127.653 Y6.954 E4.24733
G3 X128.197 Y6.953 I.309 J15.596 E.0137
G1 X247.043 Y125.798 E4.22806
G2 X247.042 Y125.252 I-19.404 J-.252 E.01374
G1 X128.748 Y6.958 E4.20845
G1 X129.298 Y6.963 E.01385
G1 X247.037 Y124.702 E4.1887
G1 X247.033 Y124.151 E.01385
G1 X129.853 Y6.971 E4.1688
M73 P80 R15
G1 X130.411 Y6.984 E.01405
G1 X247.022 Y123.595 E4.14856
G1 X247.007 Y123.034 E.0141
G1 X130.97 Y6.997 E4.12817
G1 X131.528 Y7.01 E.01405
G1 X246.993 Y122.474 E4.10778
G1 X246.978 Y121.914 E.0141
G1 X132.087 Y7.022 E4.08739
G3 X132.656 Y7.046 I-.276 J13.652 E.01433
G1 X246.954 Y121.344 E4.0663
G1 X246.929 Y120.774 E.01437
G1 X133.226 Y7.071 E4.04511
G1 X133.797 Y7.095 E.01437
G1 X246.905 Y120.203 E4.02392
G2 X246.877 Y119.63 I-16.429 J.501 E.01444
G1 X134.37 Y7.123 E4.00255
G1 X134.952 Y7.159 E.01465
G1 X246.841 Y119.048 E3.98061
G1 X246.806 Y118.467 E.01465
G1 X135.533 Y7.194 E3.95866
G1 X136.114 Y7.23 E.01465
G1 X246.77 Y117.886 E3.93672
G2 X246.727 Y117.297 I-16.885 J.937 E.01485
G1 X136.703 Y7.273 E3.91424
M73 P81 R15
G1 X137.295 Y7.319 E.01495
G1 X246.681 Y116.705 E3.89151
G1 X246.634 Y116.112 E.01495
G1 X137.888 Y7.366 E3.86878
G3 X138.482 Y7.414 I-1.097 J17.063 E.015
G1 X246.586 Y115.518 E3.8459
G1 X246.527 Y114.914 E.01526
G1 X139.086 Y7.473 E3.82235
G1 X139.69 Y7.531 E.01526
G1 X246.469 Y114.31 E3.7988
G1 X246.411 Y113.706 E.01526
G1 X140.294 Y7.589 E3.77525
G3 X140.907 Y7.656 I-1.619 J17.6 E.01551
G1 X246.344 Y113.093 E3.75105
G1 X246.274 Y112.478 E.01559
G1 X141.522 Y7.726 E3.72664
G1 X142.138 Y7.796 E.01559
G1 X246.204 Y111.862 E3.70224
G2 X246.128 Y111.241 I-17.808 J1.841 E.01573
G1 X142.759 Y7.872 E3.67747
G1 X143.388 Y7.954 E.01595
G1 X246.046 Y110.612 E3.65217
G1 X245.963 Y109.984 E.01595
G1 X144.016 Y8.037 E3.62687
G3 X144.646 Y8.121 I-2.105 J18.117 E.01599
G1 X245.879 Y109.354 E3.60145
G1 X245.783 Y108.712 E.01632
G1 X145.288 Y8.217 E3.57521
G1 X145.93 Y8.313 E.01632
G1 X245.687 Y108.07 E3.54898
G1 X245.591 Y107.429 E.01632
G1 X146.571 Y8.409 E3.52274
G3 X147.225 Y8.518 I-2.774 J18.747 E.01668
G1 X245.482 Y106.775 E3.4956
G1 X245.373 Y106.119 E.01672
G1 X147.881 Y8.627 E3.46838
G1 X148.536 Y8.737 E.01672
G1 X245.263 Y105.464 E3.44116
G2 X245.142 Y104.797 I-19.13 J3.131 E.01705
G1 X149.203 Y8.858 E3.41313
G1 X149.873 Y8.982 E.01714
G1 X245.018 Y104.127 E3.38488
G1 X244.893 Y103.457 E.01714
G1 X150.549 Y9.112 E3.35642
G1 X151.231 Y9.249 E.0175
G1 X244.758 Y102.776 E3.32734
G1 X244.619 Y102.091 E.01759
G1 X151.913 Y9.385 E3.29811
G1 X152.595 Y9.521 E.0175
G1 X244.479 Y101.406 E3.26888
G2 X244.327 Y100.708 I-20.143 J4.017 E.01796
G1 X153.292 Y9.673 E3.2387
G1 X153.993 Y9.828 E.01807
G1 X244.172 Y100.007 E3.20822
G1 X244.017 Y99.306 E.01807
G1 X154.694 Y9.983 E3.17775
G3 X155.41 Y10.154 I-4.503 J20.523 E.01852
G1 X243.846 Y98.59 E3.14621
G1 X243.674 Y97.872 E.01858
G1 X156.128 Y10.326 E3.11453
G3 X156.848 Y10.5 I-4.564 J20.491 E.01861
G1 X243.5 Y97.152 E3.08276
G1 X243.31 Y96.416 E.01913
G1 X157.584 Y10.69 E3.0498
G1 X158.32 Y10.88 E.01913
G1 X243.12 Y95.68 E3.01684
G2 X242.923 Y94.938 I-21.352 J5.259 E.01932
G1 X159.062 Y11.077 E2.98343
G1 X159.817 Y11.287 E.01971
G1 X242.713 Y94.183 E2.94912
G1 X242.504 Y93.427 E.01971
G1 X160.573 Y11.496 E2.9148
G3 X161.342 Y11.719 I-6.011 J22.144 E.02014
G1 X242.281 Y92.658 E2.87951
G1 X242.051 Y91.883 E.02034
G1 X162.117 Y11.949 E2.84375
G3 X162.895 Y12.181 I-6.29 J22.501 E.02042
G1 X241.819 Y91.105 E2.80782
G1 X241.568 Y90.308 E.02102
G1 X163.692 Y12.432 E2.77052
G1 X164.489 Y12.684 E.02102
G1 X241.316 Y89.511 E2.73323
G2 X241.051 Y88.7 I-23.346 J7.196 E.02148
G1 X165.3 Y12.949 E2.69491
G1 X166.12 Y13.224 E.02176
G1 X240.776 Y87.88 E2.65597
G2 X240.496 Y87.054 I-23.784 J7.604 E.02193
G1 X166.946 Y13.504 E2.61663
G1 X167.791 Y13.803 E.02255
G1 X240.197 Y86.209 E2.57593
G1 X239.898 Y85.364 E.02255
G1 X168.636 Y14.102 E2.53522
G3 X169.505 Y14.425 I-8.849 J25.115 E.02333
G1 X239.575 Y84.495 E2.4928
G1 X239.249 Y83.623 E.02341
G1 X170.377 Y14.751 E2.4502
G3 X171.268 Y15.096 I-9.439 J25.684 E.02404
G1 X238.904 Y82.732 E2.40622
G1 X238.549 Y81.832 E.02435
G1 X172.168 Y15.451 E2.36157
G3 X173.085 Y15.822 I-10.196 J26.51 E.02488
G1 X238.178 Y80.915 E2.31576
G1 X237.792 Y79.984 E.02537
G1 X174.016 Y16.208 E2.26889
G3 X174.964 Y16.61 I-11.011 J27.291 E.02589
G1 X237.39 Y79.036 E2.22089
G1 X236.97 Y78.071 E.02649
G1 X175.929 Y17.03 E2.17161
G3 X176.913 Y17.468 I-12.057 J28.404 E.02709
G1 X236.529 Y77.083 E2.12089
G1 X236.064 Y76.073 E.02797
G1 X177.916 Y17.925 E2.0687
G3 X178.943 Y18.406 I-13.273 J29.65 E.02854
G1 X235.594 Y75.057 E2.01542
G1 X235.096 Y74.013 E.02908
G1 X179.987 Y18.904 E1.96059
M73 P81 R14
G3 X181.066 Y19.438 I-14.792 J31.268 E.0303
G1 X234.562 Y72.934 E1.90318
G2 X234.015 Y71.84 I-31.653 J15.169 E.03076
G1 X182.159 Y19.985 E1.84481
M73 P82 R14
G1 X183.298 Y20.578 E.03228
G1 X233.422 Y70.702 E1.78323
G2 X232.803 Y69.537 I-33.766 J17.202 E.03319
G1 X184.463 Y21.197 E1.71975
G1 X185.657 Y21.845 E.03418
G1 X232.154 Y68.343 E1.65421
G2 X231.447 Y67.089 I-36.356 J19.704 E.03622
G1 X186.911 Y22.553 E1.58442
G3 X188.204 Y23.301 I-20.762 J37.414 E.03758
G1 X230.699 Y65.796 E1.51182
G2 X229.904 Y64.455 I-38.804 J22.109 E.03923
G1 X189.545 Y24.096 E1.4358
G1 X190.954 Y24.96 E.04158
G1 X229.04 Y63.046 E1.35493
G2 X228.091 Y61.551 I-43.346 J26.474 E.04455
G1 X192.449 Y25.909 E1.26798
G3 X194.035 Y26.949 I-29.028 J45.992 E.0477
G1 X227.051 Y59.965 E1.17458
G2 X225.895 Y58.264 I-49.315 J32.255 E.05175
G1 X195.736 Y28.105 E1.07293
G3 X197.59 Y29.413 I-36.544 J53.758 E.05708
G1 X224.587 Y56.41 E.96044
G2 X223.073 Y54.35 I-186.123 J135.221 E.06431
G1 X199.65 Y30.927 E.83331
G3 X202.092 Y32.823 I-53.154 J70.973 E.07778
G1 X221.177 Y51.908 E.67898
G2 X218.642 Y48.828 I-93.586 J74.422 E.10035
G1 X205.172 Y35.358 E.47922
G3 X210.698 Y40.364 I-75.106 J88.466 E.18761
G3 X216.711 Y46.351 I-340.363 J347.819 E.21348
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F11661.354
G1 X215.297 Y44.937 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/6
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M204 S10000
G17
G3 Z1.24 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 53
G1 X132.18 Y245.715
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S2000
G3 X113.566 Y244.916 I-4.187 J-119.723 E.46889
G3 X93.136 Y240.603 I14.692 J-120.137 E.52562
G3 X14.126 Y163.174 I34.884 J-114.623 E2.89093
G3 X129.925 Y6.227 I113.881 J-37.17 E5.72929
G3 X246.916 Y140.434 I-1.923 J119.772 E5.04609
G3 X132.24 Y245.712 I-118.923 J-14.443 E4.26021
; WIPE_START
M204 S4000
G1 X130.241 Y245.768 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.166 Y242.559 Z1.4 F30000
G1 X217.431 Y205.372 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F9000
M204 S2000
G1 X207.39 Y215.412 E.357
; WIPE_START
M204 S4000
G1 X208.805 Y213.998 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X203.681 Y218.576 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X220.576 Y201.681 E.6007
; WIPE_START
M204 S4000
G1 X219.162 Y203.096 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X222.677 Y199.035 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X201.035 Y220.677 E.76949
; WIPE_START
M204 S4000
G1 X202.449 Y219.263 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X198.825 Y222.342 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X224.342 Y196.825 E.90726
; WIPE_START
M204 S4000
G1 X222.928 Y198.239 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X225.749 Y194.872 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X196.872 Y223.749 E1.02671
; WIPE_START
M204 S4000
G1 X198.287 Y222.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X195.105 Y224.971 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X226.971 Y193.105 E1.13303
; WIPE_START
M204 S4000
G1 X225.557 Y194.519 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X228.057 Y191.474 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X193.474 Y226.057 E1.22961
; WIPE_START
M204 S4000
G1 X194.888 Y224.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X191.947 Y227.038 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X229.038 Y189.947 E1.31877
; WIPE_START
M204 S4000
G1 X227.624 Y191.361 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X229.938 Y188.502 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X190.502 Y227.938 E1.40213
; WIPE_START
M204 S4000
G1 X191.916 Y226.523 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X189.128 Y228.767 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X230.772 Y187.122 E1.48068
; WIPE_START
M204 S4000
G1 X229.358 Y188.536 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X231.554 Y185.795 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X187.795 Y229.554 E1.55586
; WIPE_START
M204 S4000
G1 X189.209 Y228.14 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X186.539 Y230.265 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X232.265 Y184.539 E1.62581
; WIPE_START
M204 S4000
G1 X230.851 Y185.953 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X232.941 Y183.317 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X185.317 Y230.941 E1.69328
; WIPE_START
M204 S4000
G1 X186.731 Y229.527 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X184.124 Y231.588 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X233.588 Y182.124 E1.7587
; WIPE_START
M204 S4000
G1 X232.174 Y183.539 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X234.18 Y180.987 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X182.987 Y232.181 E1.82021
G1 X181.868 Y232.754
G1 X234.753 Y179.868 E1.88035
G1 X235.296 Y178.781
G1 X180.781 Y233.296 E1.9383
G1 X179.723 Y233.808
G1 X235.808 Y177.723 E1.99412
G1 X236.306 Y176.68
G1 X178.68 Y234.306 E2.04888
G1 X177.672 Y234.768
G1 X236.768 Y175.672 E2.10115
G1 X237.224 Y174.67
G1 X176.67 Y235.224 E2.15302
G1 X175.704 Y235.645
G1 X237.645 Y173.704 E2.20233
G1 X238.065 Y172.739
G1 X174.739 Y236.065 E2.25156
G1 X173.807 Y236.451
G1 X238.451 Y171.807 E2.29842
G1 X238.837 Y170.876
G1 X172.876 Y236.837 E2.34524
G1 X171.974 Y237.194
G1 X239.194 Y169.974 E2.39003
G1 X239.549 Y169.074
G1 X171.074 Y237.549 E2.43463
G1 X170.196 Y237.881
G1 X239.881 Y168.196 E2.47769
G1 X240.207 Y167.325
G1 X169.325 Y238.207 E2.52024
G1 X168.467 Y238.519
G1 X240.519 Y166.467 E2.56182
G1 X240.818 Y165.623
G1 X167.623 Y238.818 E2.60248
G1 X166.783 Y239.113
G1 X241.113 Y164.783 E2.64282
G1 X241.387 Y163.963
G1 X165.963 Y239.387 E2.68171
G1 X165.143 Y239.661
G1 X241.661 Y163.143 E2.72061
G1 X241.918 Y162.341
G1 X164.341 Y239.918 E2.75824
G1 X163.545 Y240.169
G1 X242.169 Y161.545 E2.79549
G1 X242.414 Y160.754
G1 X162.754 Y240.414 E2.83233
G1 X161.979 Y240.644
G1 X242.644 Y159.979 E2.86805
G1 X242.873 Y159.204
G1 X161.204 Y240.873 E2.90377
G1 X160.443 Y241.089
G1 X243.089 Y158.443 E2.93849
G1 X243.298 Y157.688
G1 X159.688 Y241.298 E2.97277
G1 X158.938 Y241.504
G1 X243.507 Y156.934 E3.00689
G1 X243.697 Y156.198
G1 X158.201 Y241.695 E3.03986
G1 X157.464 Y241.887
G1 X243.888 Y155.463 E3.07283
G1 X244.073 Y154.732
G1 X156.732 Y242.073 E3.10543
G1 X156.014 Y242.245
G1 X244.245 Y154.014 E3.13708
G1 X244.418 Y153.297
G1 X155.297 Y242.418 E3.16872
G1 X154.586 Y242.582
G1 X244.582 Y152.586 E3.19983
G1 X244.738 Y151.886
G1 X153.886 Y242.738 E3.23027
G1 X153.185 Y242.893
G1 X244.893 Y151.185 E3.26071
G1 X245.04 Y150.493
G1 X152.493 Y243.04 E3.29053
G1 X151.808 Y243.179
G1 X245.179 Y149.808 E3.31983
G1 X245.318 Y149.123
G1 X151.123 Y243.318 E3.34913
G1 X150.45 Y243.447
G1 X245.449 Y148.447 E3.37773
M73 P83 R14
G1 X245.573 Y147.778
G1 X149.779 Y243.572 E3.40599
G1 X149.109 Y243.697
G1 X245.697 Y147.108 E3.43424
G1 X245.815 Y146.446
G1 X148.446 Y243.815 E3.46197
G1 X147.791 Y243.924
G1 X245.924 Y145.791 E3.48916
G1 X246.034 Y145.136
G1 X147.136 Y244.034 E3.51635
G1 X146.485 Y244.139
G1 X246.139 Y144.485 E3.5432
G1 X246.234 Y143.844
G1 X145.844 Y244.234 E3.56941
G1 X145.203 Y244.33
G1 X246.33 Y143.203 E3.59561
G1 X246.424 Y142.563
G1 X144.563 Y244.424 E3.6217
G1 X143.935 Y244.507
G1 X246.507 Y141.935 E3.64697
G1 X246.59 Y141.307
G1 X143.307 Y244.59 E3.67225
M73 P83 R13
G1 X142.679 Y244.673
G1 X246.673 Y140.679 E3.69752
G1 X246.745 Y140.061
G1 X142.061 Y244.745 E3.72205
G1 X141.446 Y244.815
G1 X246.815 Y139.446 E3.74643
G1 X246.885 Y138.83
G1 X140.83 Y244.885 E3.77081
G1 X140.22 Y244.95
G1 X246.95 Y138.22 E3.79479
G1 X247.008 Y137.617
G1 X139.617 Y245.008 E3.81832
G1 X139.013 Y245.066
G1 X247.066 Y137.013 E3.84184
G1 X247.124 Y136.41
G1 X138.41 Y245.124 E3.86535
G1 X137.818 Y245.17
G1 X247.17 Y135.818 E3.88805
G1 X247.217 Y135.226
G1 X137.226 Y245.217 E3.91076
G1 X136.634 Y245.264
G1 X247.264 Y134.634 E3.93346
G1 X247.305 Y134.048
G1 X136.048 Y245.305 E3.95577
G1 X135.467 Y245.34
G1 X247.34 Y133.467 E3.97769
G1 X247.376 Y132.886
G1 X134.886 Y245.376 E3.99961
G1 X134.307 Y245.409
G1 X247.411 Y132.305 E4.02145
G1 X247.437 Y131.734
G1 X133.736 Y245.435 E4.04268
G1 X133.165 Y245.46
G1 X247.462 Y131.163 E4.06387
G1 X247.487 Y130.593
G1 X132.594 Y245.486 E4.08506
G1 X132.025 Y245.509
G1 X247.509 Y130.025 E4.10605
G1 X247.524 Y129.465
G1 X131.465 Y245.524 E4.12648
G1 X130.905 Y245.538
G1 X247.538 Y128.905 E4.14692
G1 X247.553 Y128.345
G1 X130.345 Y245.553 E4.16735
G1 X129.79 Y245.562
G1 X247.562 Y127.791 E4.18739
G1 X247.566 Y127.241
G1 X129.24 Y245.567 E4.2071
G1 X128.69 Y245.572
G1 X247.57 Y126.692 E4.22681
G1 X247.574 Y126.142
G1 X128.14 Y245.577 E4.24652
G1 X127.597 Y245.574
G1 X247.574 Y125.597 E4.26584
G1 X247.57 Y125.056
G1 X127.056 Y245.57 E4.28489
G1 X126.515 Y245.565
G1 X247.565 Y124.515 E4.30395
G1 X247.56 Y123.975
G1 X125.975 Y245.56 E4.32301
G1 X125.442 Y245.547
G1 X247.547 Y123.442 E4.34148
G1 X247.533 Y122.911
G1 X124.911 Y245.533 E4.35989
G1 X124.379 Y245.519
G1 X247.52 Y122.379 E4.37829
G1 X247.506 Y121.848
G1 X123.848 Y245.506 E4.39669
G1 X123.325 Y245.483
G1 X247.483 Y121.325 E4.41446
G1 X247.459 Y120.803
G1 X122.802 Y245.46 E4.43221
G1 X122.279 Y245.437
G1 X247.436 Y120.281 E4.44996
G1 X247.412 Y119.759
G1 X121.759 Y245.412 E4.46762
G1 X121.245 Y245.382
G1 X247.383 Y119.243 E4.4849
G1 X247.352 Y118.729
G1 X120.73 Y245.351 E4.50208
M73 P84 R13
G1 X120.215 Y245.32
G1 X247.321 Y118.215 E4.51926
G1 X247.289 Y117.701
G1 X119.701 Y245.289 E4.53643
G1 X119.194 Y245.25
G1 X247.25 Y117.195 E4.55305
G1 X247.21 Y116.689
G1 X118.689 Y245.21 E4.56961
G1 X118.183 Y245.17
G1 X247.17 Y116.183 E4.58617
G1 X247.131 Y115.678
G1 X117.678 Y245.131 E4.60274
G1 X117.179 Y245.084
G1 X247.084 Y115.179 E4.61883
G1 X247.036 Y114.681
G1 X116.681 Y245.036 E4.63482
G1 X116.184 Y244.989
G1 X246.989 Y114.184 E4.65081
G1 X246.941 Y113.686
G1 X115.686 Y244.941 E4.66679
G1 X115.193 Y244.888
G1 X246.888 Y113.194 E4.68243
G1 X246.832 Y112.704
G1 X114.704 Y244.832 E4.69785
G1 X114.214 Y244.776
G1 X246.776 Y112.214 E4.71328
G1 X246.72 Y111.725
G1 X113.725 Y244.72 E4.7287
G1 X113.24 Y244.659
G1 X246.662 Y111.238 E4.74384
G1 X246.598 Y110.756
G1 X112.758 Y244.597 E4.75873
M73 P84 R12
G1 X112.275 Y244.534
G1 X246.535 Y110.274 E4.77363
G1 X246.471 Y109.792
G1 X111.793 Y244.471 E4.78853
G1 X111.311 Y244.407
G1 X246.407 Y109.311 E4.80338
G1 X246.336 Y108.836
G1 X110.836 Y244.336 E4.81773
G1 X110.362 Y244.265
G1 X246.265 Y108.362 E4.83208
G1 X246.194 Y107.887
G1 X109.887 Y244.194 E4.84643
G1 X109.413 Y244.123
G1 X246.123 Y107.413 E4.86078
G1 X246.047 Y106.944
G1 X108.944 Y244.047 E4.87474
G1 X108.477 Y243.969
G1 X245.969 Y106.477 E4.88857
G1 X245.891 Y106.01
G1 X108.009 Y243.891 E4.9024
G1 X107.542 Y243.813
G1 X245.813 Y105.542 E4.91623
G1 X245.732 Y105.078
G1 X107.077 Y243.732 E4.92989
G1 X106.617 Y243.647
G1 X245.647 Y104.617 E4.94322
G1 X245.561 Y104.157
G1 X106.157 Y243.561 E4.95655
G1 X105.697 Y243.476
G1 X245.476 Y103.697 E4.96988
G1 X245.391 Y103.237
G1 X105.238 Y243.389 E4.98315
G1 X104.785 Y243.298
G1 X245.299 Y102.783 E4.99602
G1 X245.206 Y102.331
G1 X104.331 Y243.206 E5.00885
G1 X103.877 Y243.114
G1 X245.114 Y101.878 E5.02169
G1 X245.021 Y101.425
G1 X103.424 Y243.022 E5.03452
G1 X102.973 Y242.928
G1 X244.928 Y100.973 E5.04726
G1 X244.829 Y100.526
G1 X102.526 Y242.829 E5.05962
G1 X102.08 Y242.73
G1 X244.73 Y100.08 E5.07197
G1 X244.631 Y99.633
G1 X101.633 Y242.631 E5.08432
M73 P85 R12
G1 X101.187 Y242.532
G1 X244.532 Y99.187 E5.09668
G1 X244.428 Y98.746
G1 X100.746 Y242.428 E5.10865
G1 X100.306 Y242.322
G1 X244.322 Y98.306 E5.12053
G1 X244.217 Y97.866
G1 X99.866 Y242.217 E5.13242
G1 X99.426 Y242.111
G1 X244.111 Y97.426 E5.1443
G1 X244.004 Y96.988
G1 X98.988 Y242.004 E5.1561
G1 X98.554 Y241.892
G1 X243.892 Y96.555 E5.16752
G1 X243.78 Y96.121
G1 X98.121 Y241.78 E5.17894
G1 X97.688 Y241.668
G1 X243.668 Y95.688 E5.19036
G1 X243.556 Y95.255
G1 X97.254 Y241.556 E5.20179
G1 X96.825 Y241.441
G1 X243.441 Y94.825 E5.21297
G1 X243.322 Y94.398
G1 X96.398 Y241.322 E5.22394
G1 X95.971 Y241.204
G1 X243.204 Y93.971 E5.23491
G1 X243.085 Y93.544
G1 X95.544 Y241.085 E5.24588
G1 X95.117 Y240.967
G1 X242.967 Y93.117 E5.25686
G1 X242.843 Y92.695
G1 X94.695 Y240.843 E5.26747
G1 X94.274 Y240.719
G1 X242.719 Y92.274 E5.27799
G1 X242.594 Y91.853
G1 X93.853 Y240.594 E5.28852
G1 X93.432 Y240.469
G1 X242.469 Y91.432 E5.29905
G1 X242.344 Y91.012
G1 X93.014 Y240.342 E5.30948
G1 X92.599 Y240.212
G1 X242.214 Y90.597 E5.31959
M73 P85 R11
G1 X242.083 Y90.183
G1 X92.184 Y240.082 E5.3297
G1 X91.769 Y239.951
G1 X241.952 Y89.768 E5.33981
G1 X241.821 Y89.353
G1 X91.354 Y239.821 E5.34992
G1 X90.94 Y239.689
G1 X241.689 Y88.94 E5.35991
G1 X241.552 Y88.532
G1 X90.532 Y239.552 E5.36958
G1 X90.123 Y239.416
G1 X241.416 Y88.123 E5.37925
G1 X241.279 Y87.714
G1 X89.714 Y239.279 E5.38892
G1 X89.306 Y239.142
G1 X241.142 Y87.306 E5.39859
G1 X241.003 Y86.899
G1 X88.899 Y239.003 E5.40808
G1 X88.497 Y238.86
G1 X240.86 Y86.497 E5.41733
G1 X240.718 Y86.094
G1 X88.094 Y238.718 E5.42658
G1 X87.691 Y238.575
G1 X240.575 Y85.691 E5.43583
G1 X240.432 Y85.288
G1 X87.288 Y238.432 E5.44508
G1 X86.889 Y238.287
G1 X240.287 Y84.889 E5.45411
M73 P86 R11
G1 X240.138 Y84.492
G1 X86.492 Y238.138 E5.46294
G1 X86.095 Y237.99
G1 X239.99 Y84.095 E5.47178
G1 X239.841 Y83.698
G1 X85.698 Y237.841 E5.48062
G1 X85.301 Y237.693
G1 X239.693 Y83.301 E5.48946
G1 X239.541 Y82.907
G1 X84.907 Y237.541 E5.49805
G1 X84.516 Y237.387
G1 X239.387 Y82.516 E5.50648
G1 X239.233 Y82.125
G1 X84.125 Y237.233 E5.51491
G1 X83.733 Y237.079
G1 X239.079 Y81.733 E5.52334
G1 X238.925 Y81.342
G1 X83.342 Y236.925 E5.53177
G1 X82.954 Y236.767
G1 X238.767 Y80.955 E5.53995
G1 X238.607 Y80.569
G1 X82.569 Y236.607 E5.54798
G1 X82.183 Y236.447
G1 X238.447 Y80.183 E5.55601
G1 X238.288 Y79.798
G1 X81.798 Y236.288 E5.56404
G1 X81.412 Y236.128
G1 X238.128 Y79.412 E5.57208
G1 X237.964 Y79.03
G1 X81.03 Y235.964 E5.57985
G1 X80.65 Y235.799
G1 X237.799 Y78.65 E5.58749
G1 X237.634 Y78.27
G1 X80.27 Y235.634 E5.59513
G1 X79.889 Y235.469
G1 X237.469 Y77.889 E5.60277
G1 X237.303 Y77.509
G1 X79.509 Y235.303 E5.6104
G1 X79.134 Y235.133
G1 X237.134 Y77.133 E5.61773
G1 X236.963 Y76.759
G1 X78.759 Y234.963 E5.62498
G1 X78.384 Y234.792
G1 X236.792 Y76.384 E5.63223
G1 X236.621 Y76.01
G1 X78.009 Y234.622 E5.63948
G1 X77.634 Y234.452
G1 X236.45 Y75.636 E5.64674
G1 X236.278 Y75.262
G1 X77.262 Y234.278 E5.65385
G1 X76.893 Y234.102
G1 X236.102 Y74.893 E5.66072
M73 P86 R10
G1 X235.926 Y74.524
G1 X76.524 Y233.926 E5.66758
G1 X76.154 Y233.75
G1 X235.75 Y74.154 E5.67445
G1 X235.573 Y73.785
G1 X75.785 Y233.573 E5.68132
G1 X75.418 Y233.395
G1 X235.395 Y73.418 E5.68801
G1 X235.214 Y73.054
G1 X75.054 Y233.214 E5.6945
G1 X74.69 Y233.032
G1 X235.032 Y72.69 E5.70099
G1 X234.851 Y72.326
G1 X74.326 Y232.851 E5.70748
M73 P87 R10
G1 X73.962 Y232.669
G1 X234.669 Y71.962 E5.71397
G1 X234.486 Y71.6
G1 X73.6 Y232.486 E5.72034
G1 X73.241 Y232.299
G1 X234.299 Y71.241 E5.72645
G1 X234.113 Y70.883
G1 X72.883 Y232.113 E5.73257
G1 X72.524 Y231.926
G1 X233.926 Y70.524 E5.73868
G1 X233.739 Y70.165
G1 X72.165 Y231.739 E5.7448
G1 X71.807 Y231.552
G1 X233.552 Y69.808 E5.75085
G1 X233.36 Y69.454
G1 X71.454 Y231.36 E5.7566
G1 X71.101 Y231.168
G1 X233.168 Y69.101 E5.76234
G1 X232.976 Y68.747
G1 X70.747 Y230.976 E5.76809
G1 X70.394 Y230.784
G1 X232.784 Y68.394 E5.77383
G1 X232.592 Y68.04
G1 X70.04 Y230.592 E5.77957
G1 X69.692 Y230.395
G1 X232.395 Y67.692 E5.78497
G1 X232.198 Y67.343
G1 X69.343 Y230.198 E5.79034
G1 X68.995 Y230.001
G1 X232.001 Y66.995 E5.79572
G1 X231.804 Y66.647
G1 X68.647 Y229.804 E5.8011
G1 X68.298 Y229.607
G1 X231.607 Y66.298 E5.80648
G1 X231.406 Y65.954
G1 X67.954 Y229.406 E5.81158
G1 X67.611 Y229.204
G1 X231.204 Y65.611 E5.8166
G1 X231.002 Y65.267
G1 X67.267 Y229.002 E5.82161
G1 X66.924 Y228.799
G1 X230.799 Y64.924 E5.82663
G1 X230.597 Y64.581
G1 X66.581 Y228.597 E5.83164
G1 X66.24 Y228.392
G1 X230.392 Y64.24 E5.83647
G1 X230.185 Y63.903
G1 X65.902 Y228.185 E5.84111
G1 X65.564 Y227.978
G1 X229.977 Y63.565 E5.84575
G1 X229.769 Y63.227
G1 X65.226 Y227.771 E5.8504
G1 X64.887 Y227.564
G1 X229.562 Y62.889 E5.85504
G1 X229.354 Y62.551
G1 X64.551 Y227.355 E5.85964
G1 X64.217 Y227.143
G1 X229.143 Y62.217 E5.86396
G1 X228.931 Y61.884
G1 X63.884 Y226.931 E5.86826
G1 X63.551 Y226.718
G1 X228.718 Y61.551 E5.87256
M73 P87 R9
G1 X228.506 Y61.218
G1 X63.218 Y226.506 E5.87686
M73 P88 R9
G1 X62.885 Y226.294
G1 X228.294 Y60.885 E5.88116
G1 X228.077 Y60.556
G1 X62.556 Y226.077 E5.88512
G1 X62.228 Y225.86
G1 X227.86 Y60.228 E5.88906
G1 X227.642 Y59.9
G1 X61.9 Y225.642 E5.89301
G1 X61.572 Y225.425
G1 X227.425 Y59.572 E5.89695
G1 X227.208 Y59.244
G1 X61.244 Y225.208 E5.9009
G1 X60.919 Y224.987
G1 X226.987 Y58.919 E5.90461
G1 X226.765 Y58.596
G1 X60.596 Y224.765 E5.90821
G1 X60.272 Y224.543
G1 X226.543 Y58.272 E5.9118
G1 X226.321 Y57.949
G1 X59.949 Y224.321 E5.91539
G1 X59.626 Y224.099
G1 X226.099 Y57.626 E5.91899
G1 X225.875 Y57.304
G1 X59.304 Y223.875 E5.92246
G1 X58.986 Y223.648
G1 X225.648 Y56.986 E5.92571
G1 X225.421 Y56.668
G1 X58.668 Y223.421 E5.92895
G1 X58.349 Y223.194
G1 X225.194 Y56.349 E5.9322
G1 X224.967 Y56.031
G1 X58.031 Y222.967 E5.93544
G1 X57.713 Y222.74
G1 X224.74 Y55.713 E5.93869
G1 X224.508 Y55.399
G1 X57.399 Y222.508 E5.94159
G1 X57.086 Y222.276
G1 X224.276 Y55.086 E5.94448
G1 X224.044 Y54.772
G1 X56.772 Y222.044 E5.94738
G1 X56.459 Y221.812
G1 X223.812 Y54.459 E5.95028
G1 X223.58 Y54.145
G1 X56.145 Y221.58 E5.95318
G1 X55.835 Y221.345
G1 X223.345 Y53.835 E5.95585
G1 X223.108 Y53.526
G1 X55.526 Y221.108 E5.9584
G1 X55.218 Y220.871
G1 X222.871 Y53.218 E5.96096
G1 X222.634 Y52.909
G1 X54.909 Y220.634 E5.96351
G1 X54.601 Y220.397
G1 X222.397 Y52.601 E5.96606
G1 X222.159 Y52.293
G1 X54.293 Y220.159 E5.96851
G1 X53.99 Y219.918
G1 X221.917 Y51.99 E5.97071
G1 X221.675 Y51.687
G1 X53.686 Y219.676 E5.97291
M73 P89 R9
G1 X53.382 Y219.434
G1 X221.433 Y51.383 E5.9751
G1 X221.191 Y51.08
G1 X53.078 Y219.193 E5.9773
G1 X52.774 Y218.951
G1 X220.949 Y50.776 E5.9795
G1 X220.705 Y50.475
G1 X52.475 Y218.705 E5.98146
G1 X52.176 Y218.459
G1 X220.459 Y50.176 E5.98333
G1 X220.212 Y49.877
G1 X51.877 Y218.212 E5.9852
M73 P89 R8
G1 X51.578 Y217.966
G1 X219.966 Y49.578 E5.98707
G1 X219.719 Y49.279
G1 X51.279 Y217.719 E5.98893
G1 X50.983 Y217.47
G1 X219.47 Y48.983 E5.99062
G1 X219.219 Y48.689
G1 X50.689 Y217.219 E5.99215
G1 X50.394 Y216.968
G1 X218.968 Y48.394 E5.99367
G1 X218.717 Y48.1
G1 X50.1 Y216.717 E5.9952
G1 X49.806 Y216.465
G1 X218.465 Y47.806 E5.99673
G1 X218.214 Y47.513
G1 X49.513 Y216.214 E5.99821
G1 X49.223 Y215.958
G1 X217.958 Y47.223 E5.99939
G1 X217.702 Y46.934
G1 X48.934 Y215.702 E6.00058
G1 X48.644 Y215.445
G1 X217.446 Y46.644 E6.00177
G1 X217.189 Y46.355
G1 X48.355 Y215.189 E6.00295
G1 X48.066 Y214.933
G1 X216.933 Y46.066 E6.00414
G1 X216.674 Y45.78
G1 X47.78 Y214.674 E6.00508
G1 X47.495 Y214.413
G1 X216.413 Y45.495 E6.00592
G1 X216.152 Y45.211
G1 X47.211 Y214.152 E6.00677
G1 X46.926 Y213.892
G1 X215.892 Y44.926 E6.00762
G1 X215.631 Y44.641
G1 X46.641 Y213.631 E6.00846
G1 X46.358 Y213.368
G1 X215.368 Y44.358 E6.0092
G1 X215.103 Y44.078
G1 X46.078 Y213.103 E6.00971
G1 X45.799 Y212.837
G1 X214.837 Y43.799 E6.01022
G1 X214.572 Y43.519
G1 X45.519 Y212.572 E6.01073
G1 X45.239 Y212.306
G1 X214.306 Y43.239 E6.01123
G1 X214.041 Y42.959
G1 X44.959 Y212.041 E6.01174
M73 P90 R8
G1 X44.683 Y211.771
G1 X213.771 Y42.684 E6.01194
G1 X213.5 Y42.408
G1 X44.408 Y211.5 E6.01211
G1 X44.133 Y211.23
G1 X213.23 Y42.133 E6.01228
G1 X212.96 Y41.858
G1 X43.858 Y210.96 E6.01245
G1 X43.583 Y210.689
G1 X212.689 Y41.583 E6.01262
G1 X212.417 Y41.31
G1 X43.312 Y210.415 E6.01256
G1 X43.042 Y210.14
G1 X212.142 Y41.04 E6.0124
G1 X211.867 Y40.77
G1 X42.771 Y209.866 E6.01224
G1 X42.5 Y209.591
G1 X211.592 Y40.5 E6.01209
G1 X211.316 Y40.229
G1 X42.229 Y209.316 E6.01193
G1 X41.959 Y209.041
G1 X211.041 Y39.959 E6.01174
G1 X210.761 Y39.694
G1 X41.694 Y208.761 E6.01123
M73 P90 R7
G1 X41.428 Y208.481
G1 X210.481 Y39.428 E6.01073
G1 X210.201 Y39.163
G1 X41.163 Y208.201 E6.01022
G1 X40.897 Y207.922
G1 X209.922 Y38.897 E6.00971
G1 X209.642 Y38.631
G1 X40.631 Y207.642 E6.0092
G1 X40.369 Y207.359
G1 X209.359 Y38.369 E6.00846
G1 X209.074 Y38.108
G1 X40.108 Y207.074 E6.00762
G1 X39.848 Y206.789
G1 X208.789 Y37.848 E6.00677
G1 X208.505 Y37.587
G1 X39.587 Y206.505 E6.00592
G1 X39.326 Y206.22
G1 X208.22 Y37.326 E6.00508
G1 X207.934 Y37.066
G1 X39.066 Y205.934 E6.00414
G1 X38.81 Y205.645
G1 X207.645 Y36.81 E6.00295
G1 X207.356 Y36.554
G1 X38.554 Y205.355 E6.00177
G1 X38.298 Y205.066
G1 X207.066 Y36.298 E6.00058
G1 X206.777 Y36.042
G1 X38.042 Y204.777 E5.99939
G1 X37.786 Y204.487
G1 X206.487 Y35.786 E5.99821
G1 X206.194 Y35.534
G1 X37.534 Y204.194 E5.99673
G1 X37.283 Y203.9
G1 X205.9 Y35.283 E5.9952
G1 X205.605 Y35.032
G1 X37.032 Y203.605 E5.99367
M73 P91 R7
G1 X36.781 Y203.311
G1 X205.311 Y34.781 E5.99215
G1 X205.017 Y34.53
G1 X36.529 Y203.017 E5.99062
G1 X36.281 Y202.721
G1 X204.721 Y34.281 E5.98893
G1 X204.422 Y34.034
G1 X36.034 Y202.422 E5.98707
G1 X35.788 Y202.123
G1 X204.123 Y33.788 E5.9852
G1 X203.824 Y33.541
G1 X35.541 Y201.824 E5.98333
G1 X35.295 Y201.525
G1 X203.525 Y33.295 E5.98146
G1 X203.225 Y33.049
G1 X35.049 Y201.225 E5.97956
G1 X34.807 Y200.922
G1 X202.922 Y32.807 E5.97736
G1 X202.618 Y32.566
G1 X34.566 Y200.618 E5.97515
G1 X34.324 Y200.314
G1 X202.314 Y32.324 E5.97294
G1 X202.01 Y32.082
G1 X34.082 Y200.01 E5.97073
G1 X33.841 Y199.706
G1 X201.707 Y31.841 E5.9685
G1 X201.399 Y31.602
G1 X33.604 Y199.398 E5.966
G1 X33.367 Y199.089
G1 X201.091 Y31.366 E5.96346
G1 X200.782 Y31.129
G1 X33.13 Y198.781 E5.96092
G1 X32.893 Y198.473
G1 X200.474 Y30.892 E5.95838
G1 X200.165 Y30.655
G1 X32.655 Y198.165 E5.95584
M73 P91 R6
G1 X32.42 Y197.855
G1 X199.855 Y30.42 E5.95318
G1 X199.541 Y30.188
G1 X32.188 Y197.541 E5.95028
G1 X31.956 Y197.228
G1 X199.228 Y29.956 E5.94738
G1 X198.914 Y29.724
G1 X31.724 Y196.914 E5.94448
G1 X31.492 Y196.601
G1 X198.601 Y29.492 E5.94159
G1 X198.287 Y29.26
G1 X31.26 Y196.287 E5.93869
G1 X31.033 Y195.969
G1 X197.969 Y29.033 E5.93544
G1 X197.651 Y28.806
G1 X30.806 Y195.651 E5.9322
G1 X30.579 Y195.332
G1 X197.332 Y28.579 E5.92895
G1 X197.014 Y28.352
G1 X30.352 Y195.014 E5.92571
G1 X30.125 Y194.696
G1 X196.696 Y28.125 E5.92246
G1 X196.374 Y27.901
G1 X29.901 Y194.374 E5.91899
M73 P92 R6
G1 X29.679 Y194.051
G1 X196.051 Y27.679 E5.91539
G1 X195.728 Y27.457
G1 X29.457 Y193.728 E5.9118
G1 X29.235 Y193.404
G1 X195.404 Y27.235 E5.90821
G1 X195.081 Y27.013
G1 X29.013 Y193.081 E5.90461
G1 X28.792 Y192.756
G1 X194.756 Y26.792 E5.9009
G1 X194.428 Y26.575
G1 X28.575 Y192.428 E5.89695
G1 X28.358 Y192.1
G1 X194.1 Y26.358 E5.89301
G1 X193.772 Y26.14
G1 X28.14 Y191.772 E5.88906
G1 X27.923 Y191.443
G1 X193.444 Y25.923 E5.88512
G1 X193.115 Y25.706
G1 X27.706 Y191.115 E5.88116
G1 X27.494 Y190.782
G1 X192.782 Y25.494 E5.87686
G1 X192.449 Y25.282
G1 X27.282 Y190.449 E5.87256
G1 X27.069 Y190.116
G1 X192.116 Y25.069 E5.86826
G1 X191.783 Y24.857
G1 X26.857 Y189.782 E5.86396
G1 X26.645 Y189.449
G1 X191.449 Y24.645 E5.85966
G1 X191.112 Y24.436
G1 X26.436 Y189.112 E5.8551
G1 X26.229 Y188.774
G1 X190.774 Y24.229 E5.85044
G1 X190.436 Y24.022
G1 X26.022 Y188.436 E5.84579
G1 X25.815 Y188.098
G1 X190.098 Y23.815 E5.84113
G1 X189.76 Y23.607
G1 X25.607 Y187.76 E5.83647
G1 X25.403 Y187.419
G1 X189.419 Y23.403 E5.83164
G1 X189.076 Y23.201
G1 X25.201 Y187.076 E5.82663
G1 X24.998 Y186.733
G1 X188.733 Y22.998 E5.82161
G1 X188.389 Y22.796
G1 X24.796 Y186.389 E5.8166
M73 P92 R5
G1 X24.594 Y186.046
G1 X188.046 Y22.594 E5.81158
G1 X187.702 Y22.393
G1 X24.393 Y185.702 E5.80648
G1 X24.196 Y185.353
G1 X187.353 Y22.196 E5.8011
G1 X187.005 Y21.999
G1 X23.999 Y185.005 E5.79572
G1 X23.802 Y184.657
G1 X186.657 Y21.802 E5.79034
G1 X186.308 Y21.605
G1 X23.605 Y184.308 E5.78496
M73 P93 R5
G1 X23.408 Y183.96
G1 X185.96 Y21.408 E5.77957
G1 X185.606 Y21.216
G1 X23.216 Y183.606 E5.77383
G1 X23.024 Y183.253
G1 X185.253 Y21.024 E5.76809
G1 X184.899 Y20.832
G1 X22.832 Y182.899 E5.76234
G1 X22.64 Y182.546
G1 X184.546 Y20.64 E5.7566
G1 X184.192 Y20.448
G1 X22.448 Y182.192 E5.75085
G1 X22.261 Y181.834
G1 X183.835 Y20.261 E5.74479
G1 X183.476 Y20.074
G1 X22.074 Y181.476 E5.73868
G1 X21.887 Y181.117
G1 X183.117 Y19.887 E5.73257
G1 X182.758 Y19.701
G1 X21.701 Y180.758 E5.72645
G1 X21.514 Y180.4
G1 X182.4 Y19.514 E5.72034
G1 X182.038 Y19.331
G1 X21.331 Y180.037 E5.71397
G1 X21.149 Y179.674
G1 X181.674 Y19.149 E5.70748
G1 X181.31 Y18.968
G1 X20.968 Y179.31 E5.70099
G1 X20.786 Y178.946
G1 X180.946 Y18.786 E5.6945
G1 X180.582 Y18.605
G1 X20.605 Y178.582 E5.68801
G1 X20.426 Y178.215
G1 X180.215 Y18.426 E5.68132
G1 X179.846 Y18.25
G1 X20.25 Y177.845 E5.67445
G1 X20.074 Y177.476
G1 X179.476 Y18.074 E5.66758
G1 X179.107 Y17.898
G1 X19.898 Y177.107 E5.66071
G1 X19.722 Y176.738
G1 X178.738 Y17.722 E5.65385
G1 X178.366 Y17.548
G1 X19.548 Y176.366 E5.64681
G1 X19.377 Y175.991
G1 X177.991 Y17.377 E5.63955
G1 X177.617 Y17.207
G1 X19.207 Y175.617 E5.6323
G1 X19.036 Y175.242
G1 X177.242 Y17.036 E5.62505
G1 X176.867 Y16.865
G1 X18.865 Y174.867 E5.6178
G1 X18.697 Y174.491
G1 X176.491 Y16.697 E5.6104
G1 X176.11 Y16.531
G1 X18.531 Y174.11 E5.60276
G1 X18.366 Y173.73
G1 X175.73 Y16.366 E5.59513
G1 X175.35 Y16.201
G1 X18.201 Y173.35 E5.58749
M73 P94 R4
G1 X18.035 Y172.97
G1 X174.97 Y16.035 E5.57985
G1 X174.588 Y15.872
G1 X17.872 Y172.588 E5.57207
G1 X17.712 Y172.202
G1 X174.202 Y15.712 E5.56404
G1 X173.817 Y15.553
G1 X17.553 Y171.817 E5.55601
G1 X17.393 Y171.431
G1 X173.431 Y15.393 E5.54798
G1 X173.045 Y15.233
G1 X17.233 Y171.045 E5.53994
G1 X17.075 Y170.658
G1 X172.658 Y15.075 E5.53177
G1 X172.267 Y14.921
G1 X16.921 Y170.266 E5.52334
G1 X16.767 Y169.875
G1 X171.875 Y14.767 E5.51491
G1 X171.484 Y14.613
G1 X16.613 Y169.484 E5.50648
G1 X16.459 Y169.093
G1 X171.093 Y14.459 E5.49804
G1 X170.699 Y14.307
G1 X16.307 Y168.699 E5.48946
G1 X16.159 Y168.302
G1 X170.302 Y14.159 E5.48062
G1 X169.905 Y14.01
G1 X16.01 Y167.905 E5.47178
G1 X15.862 Y167.508
G1 X169.508 Y13.862 E5.46294
G1 X169.111 Y13.713
G1 X15.713 Y167.111 E5.4541
G1 X15.568 Y166.712
G1 X168.712 Y13.568 E5.44508
G1 X168.309 Y13.425
G1 X15.425 Y166.309 E5.43583
G1 X15.282 Y165.906
G1 X167.906 Y13.282 E5.42658
G1 X167.503 Y13.14
G1 X15.14 Y165.503 E5.41733
G1 X14.997 Y165.1
G1 X167.1 Y12.997 E5.40808
G1 X166.694 Y12.858
G1 X14.858 Y164.694 E5.39859
G1 X14.721 Y164.286
G1 X166.286 Y12.721 E5.38892
G1 X165.877 Y12.584
G1 X14.584 Y163.877 E5.37925
G1 X14.448 Y163.468
G1 X165.468 Y12.448 E5.36958
G1 X165.06 Y12.311
G1 X14.311 Y163.059 E5.35989
G1 X14.18 Y162.645
G1 X164.647 Y12.178 E5.34987
G1 X164.232 Y12.048
G1 X14.049 Y162.23 E5.33979
G1 X13.918 Y161.816
G1 X163.817 Y11.917 E5.32971
G1 X163.403 Y11.786
G1 X13.787 Y161.402 E5.31963
G1 X13.656 Y160.988
G1 X162.988 Y11.656 E5.30955
G1 X162.568 Y11.531
G1 X13.53 Y160.567 E5.29905
M73 P95 R4
G1 X13.406 Y160.147
G1 X162.147 Y11.406 E5.28852
G1 X161.726 Y11.281
G1 X13.281 Y159.726 E5.27799
G1 X13.157 Y159.305
G1 X161.305 Y11.157 E5.26746
G1 X160.883 Y11.033
G1 X13.033 Y158.883 E5.25685
G1 X12.915 Y158.456
G1 X160.456 Y10.915 E5.24588
G1 X160.029 Y10.796
G1 X12.796 Y158.029 E5.23491
M73 P95 R3
G1 X12.678 Y157.602
G1 X159.602 Y10.678 E5.22394
G1 X159.175 Y10.559
G1 X12.559 Y157.175 E5.21297
G1 X12.444 Y156.745
G1 X158.745 Y10.444 E5.20178
G1 X158.312 Y10.332
G1 X12.332 Y156.312 E5.19036
G1 X12.22 Y155.879
G1 X157.879 Y10.22 E5.17894
G1 X157.445 Y10.108
G1 X12.108 Y155.445 E5.16752
G1 X11.996 Y155.012
G1 X157.012 Y9.996 E5.15609
G1 X156.573 Y9.889
G1 X11.889 Y154.573 E5.1443
G1 X11.783 Y154.134
G1 X156.134 Y9.783 E5.13242
G1 X155.694 Y9.678
G1 X11.678 Y153.694 E5.12053
G1 X11.572 Y153.254
G1 X155.254 Y9.572 E5.10865
G1 X154.813 Y9.468
G1 X11.468 Y152.813 E5.09667
G1 X11.369 Y152.366
G1 X154.367 Y9.369 E5.08432
G1 X153.92 Y9.27
G1 X11.27 Y151.92 E5.07197
G1 X11.171 Y151.474
G1 X153.474 Y9.171 E5.05961
G1 X153.027 Y9.072
G1 X11.072 Y151.027 E5.04726
G1 X10.977 Y150.576
G1 X152.577 Y8.977 E5.0346
G1 X152.123 Y8.885
G1 X10.885 Y150.123 E5.02177
G1 X10.793 Y149.67
G1 X151.67 Y8.793 E5.00893
G1 X151.217 Y8.701
G1 X10.701 Y149.217 E4.99609
G1 X10.609 Y148.763
G1 X150.763 Y8.609 E4.9832
G1 X150.303 Y8.524
G1 X10.524 Y148.303 E4.96987
G1 X10.439 Y147.843
G1 X149.843 Y8.439 E4.95655
G1 X149.383 Y8.353
G1 X10.353 Y147.382 E4.94322
G1 X10.268 Y146.922
G1 X148.922 Y8.268 E4.92989
G1 X148.458 Y8.187
G1 X10.187 Y146.458 E4.91623
G1 X10.109 Y145.99
G1 X147.99 Y8.109 E4.9024
M73 P96 R3
G1 X147.523 Y8.031
G1 X10.031 Y145.523 E4.88857
G1 X9.953 Y145.056
G1 X147.056 Y7.953 E4.87474
G1 X146.587 Y7.877
G1 X9.876 Y144.587 E4.86077
G1 X9.806 Y144.112
G1 X146.112 Y7.806 E4.84642
G1 X145.638 Y7.735
G1 X9.735 Y143.638 E4.83207
G1 X9.664 Y143.163
G1 X145.163 Y7.664 E4.81772
G1 X144.689 Y7.593
G1 X9.593 Y142.689 E4.80337
G1 X9.529 Y142.208
G1 X144.208 Y7.529 E4.78855
G1 X143.726 Y7.465
G1 X9.465 Y141.726 E4.77367
G1 X9.402 Y141.244
G1 X143.244 Y7.402 E4.75879
G1 X142.762 Y7.338
G1 X9.338 Y140.762 E4.74391
G1 X9.28 Y140.275
G1 X142.275 Y7.28 E4.7287
G1 X141.786 Y7.224
G1 X9.224 Y139.786 E4.71327
G1 X9.168 Y139.296
G1 X141.296 Y7.168 E4.69785
M73 P96 R2
G1 X140.806 Y7.112
G1 X9.112 Y138.806 E4.68242
G1 X9.059 Y138.314
G1 X140.314 Y7.059 E4.66679
G1 X139.816 Y7.011
G1 X9.011 Y137.816 E4.6508
G1 X8.963 Y137.319
G1 X139.319 Y6.963 E4.63482
G1 X138.821 Y6.916
G1 X8.916 Y136.821 E4.61883
G1 X8.869 Y136.322
G1 X138.322 Y6.869 E4.60273
G1 X137.817 Y6.829
G1 X8.829 Y135.817 E4.58617
G1 X8.79 Y135.311
G1 X137.311 Y6.79 E4.56961
G1 X136.805 Y6.75
G1 X8.75 Y134.805 E4.55304
G1 X8.711 Y134.299
G1 X136.299 Y6.711 E4.53643
G1 X135.785 Y6.679
G1 X8.679 Y133.785 E4.51928
G1 X8.648 Y133.271
G1 X135.271 Y6.648 E4.50212
G1 X134.757 Y6.617
G1 X8.617 Y132.757 E4.48496
G1 X8.588 Y132.24
G1 X134.243 Y6.585 E4.4677
G1 X133.72 Y6.563
G1 X8.564 Y131.718 E4.44995
G1 X8.541 Y131.196
G1 X133.198 Y6.54 E4.4322
G1 X132.675 Y6.517
G1 X8.517 Y130.675 E4.41446
G1 X8.494 Y130.152
G1 X132.152 Y6.494 E4.39669
G1 X131.62 Y6.481
G1 X8.48 Y129.621 E4.37826
G1 X8.467 Y129.089
G1 X131.088 Y6.468 E4.35983
G1 X130.556 Y6.455
G1 X8.453 Y128.558 E4.34141
M73 P97 R2
G1 X8.44 Y128.025
G1 X130.024 Y6.441 E4.32294
G1 X129.485 Y6.435
G1 X8.435 Y127.485 E4.30394
G1 X8.43 Y126.944
G1 X128.944 Y6.43 E4.28489
G1 X128.403 Y6.426
G1 X8.426 Y126.403 E4.26583
G1 X8.426 Y125.858
G1 X127.86 Y6.423 E4.24651
G1 X127.31 Y6.428
G1 X8.43 Y125.308 E4.2268
G1 X8.434 Y124.759
G1 X126.76 Y6.433 E4.2071
G1 X126.209 Y6.438
G1 X8.438 Y124.209 E4.18739
G1 X8.447 Y123.655
G1 X125.655 Y6.447 E4.16735
G1 X125.095 Y6.462
G1 X8.462 Y123.095 E4.14691
G1 X8.476 Y122.535
G1 X124.535 Y6.476 E4.12648
G1 X123.974 Y6.491
G1 X8.491 Y121.974 E4.10604
G1 X8.513 Y121.407
G1 X123.406 Y6.514 E4.08505
G1 X122.835 Y6.54
G1 X8.538 Y120.837 E4.06386
G1 X8.563 Y120.266
G1 X122.264 Y6.565 E4.04267
G1 X121.693 Y6.591
G1 X8.589 Y119.695 E4.02145
G1 X8.624 Y119.114
G1 X121.114 Y6.624 E3.9996
G1 X120.533 Y6.66
G1 X8.66 Y118.533 E3.97768
G1 X8.695 Y117.952
G1 X119.952 Y6.695 E3.95576
G1 X119.366 Y6.736
G1 X8.736 Y117.366 E3.93346
G1 X8.783 Y116.774
G1 X118.774 Y6.783 E3.91075
G1 X118.182 Y6.83
G1 X8.83 Y116.182 E3.88805
G1 X8.876 Y115.59
G1 X117.59 Y6.876 E3.86534
M73 P97 R1
G1 X116.987 Y6.934
G1 X8.934 Y114.987 E3.84183
G1 X8.992 Y114.383
G1 X116.383 Y6.992 E3.81831
G1 X115.78 Y7.05
G1 X9.05 Y113.78 E3.79478
G1 X9.115 Y113.17
G1 X115.17 Y7.115 E3.7708
G1 X114.554 Y7.185
G1 X9.185 Y112.554 E3.74642
G1 X9.255 Y111.938
G1 X113.939 Y7.255 E3.72204
G1 X113.321 Y7.327
G1 X9.33 Y111.318 E3.69741
G1 X9.412 Y110.691
G1 X112.693 Y7.41 E3.67217
G1 X112.065 Y7.493
G1 X9.494 Y110.064 E3.64693
G1 X9.576 Y109.436
G1 X111.437 Y7.576 E3.62169
G1 X110.796 Y7.671
G1 X9.67 Y108.797 E3.59557
G1 X9.766 Y108.156
G1 X110.154 Y7.767 E3.56933
G1 X109.512 Y7.864
G1 X9.861 Y107.514 E3.54309
G1 X9.966 Y106.864
G1 X108.864 Y7.966 E3.51634
G1 X108.209 Y8.076
G1 X10.076 Y106.209 E3.48915
G1 X10.185 Y105.554
G1 X107.554 Y8.185 E3.46197
G1 X106.892 Y8.302
M73 P98 R1
G1 X10.303 Y104.892 E3.43425
G1 X10.427 Y104.222
G1 X106.222 Y8.427 E3.40604
G1 X105.553 Y8.551
G1 X10.551 Y103.553 E3.37782
G1 X10.682 Y102.876
G1 X104.876 Y8.682 E3.34912
G1 X104.192 Y8.821
G1 X10.821 Y102.192 E3.31982
G1 X10.96 Y101.507
G1 X103.507 Y8.96 E3.29053
G1 X102.815 Y9.107
G1 X11.107 Y100.815 E3.2607
G1 X11.262 Y100.114
G1 X102.114 Y9.262 E3.23026
G1 X101.413 Y9.418
G1 X11.418 Y99.413 E3.19982
G1 X11.582 Y98.703
G1 X100.703 Y9.582 E3.16871
G1 X99.986 Y9.755
G1 X11.755 Y97.985 E3.13707
G1 X11.927 Y97.268
G1 X99.268 Y9.927 E3.10542
G1 X98.536 Y10.113
G1 X12.112 Y96.537 E3.07282
G1 X12.303 Y95.801
G1 X97.799 Y10.305 E3.03985
G1 X97.062 Y10.497
G1 X12.493 Y95.066 E3.00688
G1 X12.702 Y94.311
G1 X96.311 Y10.702 E2.97276
G1 X95.557 Y10.911
G1 X12.911 Y93.557 E2.93849
G1 X13.127 Y92.796
G1 X94.796 Y11.127 E2.90376
G1 X94.021 Y11.356
G1 X13.356 Y92.021 E2.86804
G1 X13.586 Y91.246
G1 X93.246 Y11.586 E2.83233
G1 X92.455 Y11.831
G1 X13.834 Y90.452 E2.79538
G1 X14.084 Y89.657
G1 X91.658 Y12.082 E2.75819
G1 X90.856 Y12.339
G1 X14.339 Y88.856 E2.72058
G1 X14.613 Y88.037
G1 X90.035 Y12.615 E2.68162
G1 X89.213 Y12.891
G1 X14.887 Y87.217 E2.64267
G1 X15.182 Y86.377
G1 X88.377 Y13.182 E2.60247
G1 X87.533 Y13.481
G1 X15.481 Y85.533 E2.56181
G1 X15.793 Y84.675
G1 X86.675 Y13.793 E2.52023
G1 X85.804 Y14.119
G1 X16.119 Y83.804 E2.47768
G1 X16.452 Y82.926
G1 X84.926 Y14.452 E2.43462
G1 X84.026 Y14.806
G1 X16.806 Y82.026 E2.39002
G1 X17.163 Y81.123
G1 X83.123 Y15.163 E2.34523
G1 X82.192 Y15.549
G1 X17.549 Y80.192 E2.29841
G1 X17.935 Y79.261
G1 X81.261 Y15.935 E2.25155
G1 X80.296 Y16.355
G1 X18.355 Y78.296 E2.20232
G1 X18.781 Y77.324
G1 X79.329 Y16.776 E2.15282
G1 X78.327 Y17.232
G1 X19.235 Y76.325 E2.10105
G1 X19.695 Y75.32
G1 X77.32 Y17.695 E2.04887
G1 X76.277 Y18.192
G1 X20.192 Y74.277 E1.99411
M73 P98 R0
G1 X20.704 Y73.219
G1 X75.219 Y18.704 E1.93829
G1 X74.131 Y19.247
G1 X21.247 Y72.131 E1.88033
G1 X21.82 Y71.013
G1 X73.013 Y19.82 E1.82019
; WIPE_START
M204 S4000
G1 X71.599 Y21.234 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X71.875 Y20.412 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X22.412 Y69.875 E1.75868
; WIPE_START
M204 S4000
G1 X23.826 Y68.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X23.059 Y68.683 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X70.683 Y21.059 E1.69327
; WIPE_START
M204 S4000
G1 X69.268 Y22.473 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X69.461 Y21.735 Z1.4 F30000
G1 Z1
M73 P99 R0
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X23.735 Y67.461 E1.62579
; WIPE_START
M204 S4000
G1 X25.15 Y66.047 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X24.446 Y66.205 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X68.205 Y22.446 E1.55584
; WIPE_START
M204 S4000
G1 X66.79 Y23.86 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X66.877 Y23.228 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X25.228 Y64.877 E1.48085
; WIPE_START
M204 S4000
G1 X26.642 Y63.463 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X26.063 Y63.497 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X65.497 Y24.063 E1.40211
; WIPE_START
M204 S4000
G1 X64.083 Y25.477 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.052 Y24.962 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X26.962 Y62.052 E1.31875
; WIPE_START
M204 S4000
G1 X28.377 Y60.638 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X27.943 Y60.526 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X62.526 Y25.943 E1.22959
; WIPE_START
M204 S4000
G1 X61.112 Y27.358 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X60.895 Y27.029 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X29.029 Y58.895 E1.133
; WIPE_START
M204 S4000
G1 X30.443 Y57.481 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X30.251 Y57.127 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X59.127 Y28.251 E1.02668
; WIPE_START
M204 S4000
G1 X57.713 Y29.666 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X57.175 Y29.659 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X31.659 Y55.175 E.90723
; WIPE_START
M204 S4000
G1 X33.073 Y53.76 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.323 Y52.964 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X54.955 Y31.333 E.76912
; WIPE_START
M204 S4000
G1 X53.541 Y32.747 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X52.318 Y33.425 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X35.425 Y50.318 E.60064
; WIPE_START
M204 S4000
G1 X36.839 Y48.904 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X38.57 Y46.627 Z1.4 F30000
G1 Z1
G1 E.8 F1800
G1 F9000
M204 S2000
G1 X48.608 Y36.589 E.35691
; WIPE_START
M204 S4000
G1 X47.194 Y38.003 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X51.299 Y44.438 Z1.4 F30000
G1 X173.744 Y236.387 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.184656
G1 F15000
M204 S4000
G1 X173.624 Y236.467 E.00141
; LINE_WIDTH: 0.143037
G1 X173.505 Y236.547 E.00102
; LINE_WIDTH: 0.101418
G1 X173.386 Y236.626 E.00063
; WIPE_START
G1 X173.505 Y236.547 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X175.641 Y235.582 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.186164
G1 F15000
M204 S4000
G1 X175.516 Y235.666 E.00149
; LINE_WIDTH: 0.143942
G1 X175.392 Y235.751 E.00107
; LINE_WIDTH: 0.10172
G1 X175.268 Y235.835 E.00066
; WIPE_START
G1 X175.392 Y235.751 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.609 Y234.704 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.187661
G1 F15000
M204 S4000
G1 X177.48 Y234.794 E.00158
; LINE_WIDTH: 0.144841
G1 X177.35 Y234.884 E.00114
; LINE_WIDTH: 0.10202
G1 X177.221 Y234.974 E.0007
; WIPE_START
G1 X177.35 Y234.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X179.66 Y233.745 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.189166
G1 F15000
M204 S4000
G1 X179.524 Y233.841 E.00167
; LINE_WIDTH: 0.145744
G1 X179.389 Y233.936 E.0012
; LINE_WIDTH: 0.102321
G1 X179.254 Y234.032 E.00073
; WIPE_START
G1 X179.389 Y233.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X181.805 Y232.691 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.190693
G1 F15000
M204 S4000
G1 X181.664 Y232.793 E.00178
; LINE_WIDTH: 0.146665
G1 X181.522 Y232.895 E.00128
; LINE_WIDTH: 0.102637
G1 X181.38 Y232.997 E.00078
; WIPE_START
G1 X181.522 Y232.895 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X184.062 Y231.526 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.19219
G1 F15000
M204 S4000
G1 X183.913 Y231.635 E.0019
; LINE_WIDTH: 0.147563
G1 X183.764 Y231.744 E.00136
; LINE_WIDTH: 0.102936
G1 X183.615 Y231.853 E.00083
; WIPE_START
G1 X183.764 Y231.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.254 Y230.878 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.193693
G1 F15000
M204 S4000
G1 X185.097 Y230.996 E.00204
; LINE_WIDTH: 0.14846
G1 X184.94 Y231.113 E.00146
; LINE_WIDTH: 0.103226
G1 X184.783 Y231.23 E.00088
; WIPE_START
G1 X184.94 Y231.113 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X186.476 Y230.202 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.195208
G1 F15000
M204 S4000
G1 X186.31 Y230.329 E.00219
; LINE_WIDTH: 0.149374
G1 X186.144 Y230.455 E.00156
; LINE_WIDTH: 0.10354
G1 X185.978 Y230.581 E.00094
; WIPE_START
G1 X186.144 Y230.455 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X187.733 Y229.491 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.195304
G1 F15000
M204 S4000
G1 X187.566 Y229.618 E.00219
; LINE_WIDTH: 0.149431
G1 X187.4 Y229.744 E.00157
; LINE_WIDTH: 0.103559
G1 X187.234 Y229.871 E.00094
; WIPE_START
G1 X187.4 Y229.744 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X189.065 Y228.704 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.196822
G1 F15000
M204 S4000
G1 X188.888 Y228.842 E.00237
; LINE_WIDTH: 0.150337
G1 X188.711 Y228.979 E.00169
; LINE_WIDTH: 0.103852
G1 X188.534 Y229.116 E.00102
; WIPE_START
G1 X188.711 Y228.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X190.44 Y227.875 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.198222
G1 F15000
M204 S4000
G1 X190.252 Y228.023 E.00256
; LINE_WIDTH: 0.151177
G1 X190.064 Y228.172 E.00182
; LINE_WIDTH: 0.104132
G1 X189.876 Y228.32 E.00109
; WIPE_START
G1 X190.064 Y228.172 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X191.885 Y226.976 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.202519
G1 F15000
M204 S4000
G1 X191.71 Y227.117 E.00246
; LINE_WIDTH: 0.160492
G1 X191.535 Y227.257 E.00185
; LINE_WIDTH: 0.118464
G1 X191.359 Y227.398 E.00123
; LINE_WIDTH: 0.0890255
G1 X191.285 Y227.457 E.00034
; WIPE_START
G1 X191.359 Y227.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X193.412 Y225.995 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.210166
G1 F15000
M204 S4000
G1 X193.257 Y226.121 E.00229
; LINE_WIDTH: 0.179802
G1 X193.103 Y226.247 E.00189
; LINE_WIDTH: 0.143624
G1 X192.943 Y226.375 E.00146
; LINE_WIDTH: 0.101614
G1 X192.784 Y226.503 E.0009
; WIPE_START
G1 X192.943 Y226.375 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X195.043 Y224.909 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.211
G1 F15000
M204 S4000
G1 X194.833 Y225.084 E.00315
; LINE_WIDTH: 0.175814
G1 X194.679 Y225.209 E.00182
; LINE_WIDTH: 0.137737
G1 X194.526 Y225.335 E.00133
; LINE_WIDTH: 0.099661
G1 X194.373 Y225.46 E.00084
; WIPE_START
G1 X194.526 Y225.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X196.811 Y223.687 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.209151
G1 F15000
M204 S4000
G1 X196.553 Y223.905 E.00384
; LINE_WIDTH: 0.171202
G1 X196.395 Y224.036 E.00184
; LINE_WIDTH: 0.134965
G1 X196.237 Y224.168 E.00135
; LINE_WIDTH: 0.0987279
G1 X196.079 Y224.3 E.00086
; WIPE_START
G1 X196.237 Y224.168 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X198.763 Y222.28 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.210036
G1 F15000
M204 S4000
G1 X198.514 Y222.495 E.00377
; LINE_WIDTH: 0.168526
G1 X198.264 Y222.71 E.00288
; LINE_WIDTH: 0.130985
G1 X198.101 Y222.849 E.00135
; LINE_WIDTH: 0.0974013
G1 X197.937 Y222.987 E.00088
; WIPE_START
G1 X198.101 Y222.849 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X200.973 Y220.615 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.213602
G1 F15000
M204 S4000
G1 X200.732 Y220.827 E.00375
; LINE_WIDTH: 0.175608
G1 X200.491 Y221.039 E.00296
; LINE_WIDTH: 0.137614
G1 X200.249 Y221.251 E.00216
; LINE_WIDTH: 0.0996203
G1 X200.008 Y221.462 E.00137
; WIPE_START
G1 X200.249 Y221.251 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X203.62 Y218.515 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.214785
G1 F15000
M204 S4000
G1 X203.214 Y218.883 E.00645
; LINE_WIDTH: 0.174551
G1 X202.961 Y219.109 E.0031
; LINE_WIDTH: 0.136975
G1 X202.708 Y219.335 E.00227
; LINE_WIDTH: 0.0993978
G1 X202.455 Y219.561 E.00144
; WIPE_START
G1 X202.708 Y219.335 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X207.329 Y215.351 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.222861
G1 F15000
M204 S4000
G1 X206.873 Y215.78 E.0077
; LINE_WIDTH: 0.188489
G1 X206.417 Y216.21 E.00629
; LINE_WIDTH: 0.148627
G1 X205.985 Y216.61 E.00439
; LINE_WIDTH: 0.103282
G1 X205.552 Y217.01 E.00265
; WIPE_START
G1 X205.985 Y216.61 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X211.375 Y211.206 Z1.4 F30000
G1 X219.009 Y203.552 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.103276
G1 F15000
M204 S4000
G1 X218.61 Y203.985 E.00265
; LINE_WIDTH: 0.148613
G1 X218.21 Y204.417 E.00439
; LINE_WIDTH: 0.188442
G1 X217.79 Y204.864 E.00616
; LINE_WIDTH: 0.222742
G1 X217.37 Y205.31 E.00753
; WIPE_START
G1 X217.79 Y204.864 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X221.561 Y200.455 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0993983
G1 F15000
M204 S4000
G1 X221.335 Y200.708 E.00144
; LINE_WIDTH: 0.136973
G1 X221.109 Y200.961 E.00227
; LINE_WIDTH: 0.174549
G1 X220.883 Y201.214 E.0031
; LINE_WIDTH: 0.214798
G1 X220.515 Y201.62 E.00645
; WIPE_START
G1 X220.883 Y201.214 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X223.462 Y198.008 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0996124
G1 F15000
M204 S4000
G1 X223.251 Y198.249 E.00137
; LINE_WIDTH: 0.137616
G1 X223.039 Y198.491 E.00216
; LINE_WIDTH: 0.175619
G1 X222.827 Y198.732 E.00296
; LINE_WIDTH: 0.213623
G1 X222.616 Y198.973 E.00375
; WIPE_START
G1 X222.827 Y198.732 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X224.987 Y195.937 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0973854
G1 F15000
M204 S4000
G1 X224.849 Y196.1 E.00088
; LINE_WIDTH: 0.130909
G1 X224.71 Y196.264 E.00135
; LINE_WIDTH: 0.168442
G1 X224.495 Y196.514 E.00288
; LINE_WIDTH: 0.210004
G1 X224.28 Y196.763 E.00378
; WIPE_START
G1 X224.495 Y196.514 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X226.3 Y194.079 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0987312
G1 F15000
M204 S4000
G1 X226.168 Y194.237 E.00086
; LINE_WIDTH: 0.13495
G1 X226.037 Y194.395 E.00135
; LINE_WIDTH: 0.171168
G1 X225.905 Y194.553 E.00183
; LINE_WIDTH: 0.209134
G1 X225.687 Y194.811 E.00384
; WIPE_START
G1 X225.905 Y194.553 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X227.46 Y192.373 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0996754
G1 F15000
M204 S4000
G1 X227.334 Y192.526 E.00084
; LINE_WIDTH: 0.137785
G1 X227.209 Y192.68 E.00133
; LINE_WIDTH: 0.175894
G1 X227.084 Y192.833 E.00183
; LINE_WIDTH: 0.211058
G1 X226.909 Y193.043 E.00314
; WIPE_START
G1 X227.084 Y192.833 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X228.503 Y190.784 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.101573
G1 F15000
M204 S4000
G1 X228.376 Y190.943 E.00089
; LINE_WIDTH: 0.143487
G1 X228.248 Y191.102 E.00145
; LINE_WIDTH: 0.179689
G1 X228.121 Y191.257 E.00189
; LINE_WIDTH: 0.210133
G1 X227.995 Y191.412 E.00229
; WIPE_START
G1 X228.121 Y191.257 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X229.457 Y189.285 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0890029
G1 F15000
M204 S4000
G1 X229.398 Y189.359 E.00034
; LINE_WIDTH: 0.118419
G1 X229.257 Y189.534 E.00123
; LINE_WIDTH: 0.160464
G1 X229.117 Y189.71 E.00185
; LINE_WIDTH: 0.202508
G1 X228.976 Y189.885 E.00246
; WIPE_START
G1 X229.117 Y189.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X230.32 Y187.876 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.104135
G1 F15000
M204 S4000
G1 X230.172 Y188.064 E.00109
; LINE_WIDTH: 0.15118
G1 X230.023 Y188.252 E.00182
; LINE_WIDTH: 0.198225
G1 X229.875 Y188.44 E.00256
; WIPE_START
G1 X230.023 Y188.252 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X231.119 Y186.531 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.103828
G1 F15000
M204 S4000
G1 X230.983 Y186.707 E.00101
; LINE_WIDTH: 0.150266
G1 X230.846 Y186.884 E.00168
; LINE_WIDTH: 0.196704
G1 X230.71 Y187.06 E.00236
; WIPE_START
G1 X230.846 Y186.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X231.871 Y185.234 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.103554
G1 F15000
M204 S4000
G1 X231.744 Y185.4 E.00094
; LINE_WIDTH: 0.149429
G1 X231.618 Y185.566 E.00157
; LINE_WIDTH: 0.195303
G1 X231.491 Y185.733 E.00219
; WIPE_START
G1 X231.618 Y185.566 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X232.581 Y183.978 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.103539
G1 F15000
M204 S4000
G1 X232.455 Y184.144 E.00094
; LINE_WIDTH: 0.14938
G1 X232.329 Y184.31 E.00156
; LINE_WIDTH: 0.195221
G1 X232.202 Y184.476 E.00219
; WIPE_START
G1 X232.329 Y184.31 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X233.23 Y182.783 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.10323
G1 F15000
M204 S4000
G1 X233.113 Y182.94 E.00088
; LINE_WIDTH: 0.148465
G1 X232.996 Y183.097 E.00146
; LINE_WIDTH: 0.1937
G1 X232.878 Y183.254 E.00204
; WIPE_START
G1 X232.996 Y183.097 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X233.853 Y181.615 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.102934
G1 F15000
M204 S4000
G1 X233.744 Y181.764 E.00083
; LINE_WIDTH: 0.147569
G1 X233.635 Y181.913 E.00136
; LINE_WIDTH: 0.192204
G1 X233.526 Y182.062 E.0019
; WIPE_START
G1 X233.635 Y181.913 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X234.446 Y180.477 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.102932
G1 F15000
M204 S4000
G1 X234.336 Y180.626 E.00083
; LINE_WIDTH: 0.147563
G1 X234.227 Y180.775 E.00136
; LINE_WIDTH: 0.192194
G1 X234.118 Y180.924 E.0019
; WIPE_START
G1 X234.227 Y180.775 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X235.535 Y178.296 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.100072
G1 F15000
M204 S4000
G1 X235.455 Y178.409 E.00059
; LINE_WIDTH: 0.142813
G1 X235.344 Y178.563 E.00134
; LINE_WIDTH: 0.189412
G1 X235.233 Y178.718 E.00192
; WIPE_START
G1 X235.344 Y178.563 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X236.517 Y176.223 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0999839
G1 F15000
M204 S4000
G1 X236.451 Y176.318 E.0005
; LINE_WIDTH: 0.138722
G1 X236.384 Y176.414 E.00079
; LINE_WIDTH: 0.17746
G1 X236.318 Y176.51 E.00109
; LINE_WIDTH: 0.203862
G1 X236.242 Y176.617 E.00145
; WIPE_START
G1 X236.318 Y176.51 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X237.416 Y174.233 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.101696
G1 F15000
M204 S4000
G1 X237.331 Y174.358 E.00066
; LINE_WIDTH: 0.143946
G1 X237.246 Y174.482 E.00108
; LINE_WIDTH: 0.186195
G1 X237.161 Y174.607 E.00149
; WIPE_START
G1 X237.246 Y174.482 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X238.354 Y166.931 Z1.4 F30000
G1 X246.599 Y110.735 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0931468
G1 F15000
M204 S4000
G1 X246.579 Y110.695 E.00017
G1 X246.579 Y110.502 E.00074
; WIPE_START
G1 X246.579 Y110.695 E-.61667
G1 X246.599 Y110.735 E-.14333
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X245.389 Y103.213 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0828396
G1 F15000
M204 S4000
G1 X245.304 Y103.051 E.00058
; WIPE_START
G1 X245.389 Y103.213 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X243.098 Y95.932 Z1.4 F30000
G1 X237.284 Y77.463 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.102242
G1 F15000
M204 S4000
G1 X237.222 Y77.373 E.00048
G1 X237.235 Y77.306 E.0003
; WIPE_START
G1 X237.222 Y77.373 E-.29235
G1 X237.284 Y77.463 E-.46765
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X231.892 Y72.061 Z1.4 F30000
G1 X176.694 Y16.765 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.102259
G1 F15000
M204 S4000
G1 X176.627 Y16.778 E.0003
G1 X176.537 Y16.716 E.00048
; WIPE_START
G1 X176.627 Y16.778 E-.46785
G1 X176.694 Y16.765 E-.29215
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X169.575 Y14.013 Z1.4 F30000
G1 X167.254 Y13.116 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0823812
G1 F15000
M204 S4000
G2 X167.138 Y13.009 I-.294 J.202 E.0005
; WIPE_START
G1 X167.254 Y13.116 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X159.887 Y11.119 Z1.4 F30000
G1 X150.949 Y8.696 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0831898
G1 F15000
M204 S4000
G1 X150.787 Y8.611 E.00058
; WIPE_START
G1 X150.949 Y8.696 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X145.352 Y7.748 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0811924
G1 F15000
M204 S4000
G1 X145.186 Y7.664 E.00057
; WIPE_START
G1 X145.352 Y7.748 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X143.4 Y7.518 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0904377
G1 F15000
M204 S4000
G2 X143.265 Y7.401 I-.239 J.14 E.00067
; WIPE_START
G1 X143.4 Y7.518 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.501 Y6.872 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0813903
G1 F15000
M204 S4000
G1 X137.295 Y6.769 E.00071
; WIPE_START
G1 X137.501 Y6.872 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.975 Y8.138 Z1.4 F30000
G1 X79.767 Y16.584 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.101703
G1 F15000
M204 S4000
G1 X79.642 Y16.669 E.00066
; LINE_WIDTH: 0.143946
G1 X79.518 Y16.754 E.00108
; LINE_WIDTH: 0.186189
G1 X79.393 Y16.839 E.00149
; WIPE_START
G1 X79.518 Y16.754 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.777 Y17.483 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0999403
G1 F15000
M204 S4000
G1 X77.682 Y17.549 E.0005
; LINE_WIDTH: 0.138602
G1 X77.586 Y17.615 E.00079
; LINE_WIDTH: 0.177264
G1 X77.49 Y17.682 E.00108
; LINE_WIDTH: 0.203741
G1 X77.383 Y17.758 E.00145
; WIPE_START
G1 X77.49 Y17.682 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.703 Y18.466 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.100128
G1 F15000
M204 S4000
G1 X75.59 Y18.545 E.00059
; LINE_WIDTH: 0.142907
G1 X75.436 Y18.656 E.00134
; LINE_WIDTH: 0.189437
G1 X75.282 Y18.767 E.00192
; WIPE_START
G1 X75.436 Y18.656 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X73.523 Y19.555 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.102936
G1 F15000
M204 S4000
G1 X73.374 Y19.664 E.00083
; LINE_WIDTH: 0.147563
G1 X73.225 Y19.773 E.00136
; LINE_WIDTH: 0.19219
G1 X73.076 Y19.882 E.0019
M204 S10000
G1 X72.385 Y20.147 F30000
; LINE_WIDTH: 0.102938
G1 F15000
M204 S4000
G1 X72.236 Y20.256 E.00083
; LINE_WIDTH: 0.147568
G1 X72.087 Y20.365 E.00136
; LINE_WIDTH: 0.192199
G1 X71.938 Y20.475 E.0019
M204 S10000
G1 X71.216 Y20.77 F30000
; LINE_WIDTH: 0.103227
G1 F15000
M204 S4000
G1 X71.059 Y20.887 E.00088
; LINE_WIDTH: 0.148464
G1 X70.902 Y21.004 E.00146
; LINE_WIDTH: 0.1937
G1 X70.745 Y21.122 E.00204
M204 S10000
G1 X70.022 Y21.419 F30000
; LINE_WIDTH: 0.10354
G1 F15000
M204 S4000
G1 X69.856 Y21.545 E.00094
; LINE_WIDTH: 0.149374
G1 X69.69 Y21.671 E.00156
; LINE_WIDTH: 0.195208
G1 X69.524 Y21.798 E.00219
M204 S10000
G1 X68.766 Y22.13 F30000
; LINE_WIDTH: 0.103561
G1 F15000
M204 S4000
G1 X68.599 Y22.256 E.00094
; LINE_WIDTH: 0.149437
G1 X68.433 Y22.382 E.00157
; LINE_WIDTH: 0.195313
G1 X68.267 Y22.509 E.00219
M204 S10000
G1 X67.469 Y22.881 F30000
; LINE_WIDTH: 0.10383
G1 F15000
M204 S4000
G1 X67.292 Y23.017 E.00101
; LINE_WIDTH: 0.150271
G1 X67.116 Y23.154 E.00168
; LINE_WIDTH: 0.196711
G1 X66.94 Y23.29 E.00236
M204 S10000
G1 X66.123 Y23.681 F30000
; LINE_WIDTH: 0.104132
G1 F15000
M204 S4000
G1 X65.935 Y23.829 E.00109
; LINE_WIDTH: 0.151177
G1 X65.748 Y23.977 E.00182
; LINE_WIDTH: 0.198222
G1 X65.56 Y24.125 E.00256
M204 S10000
G1 X64.715 Y24.544 F30000
; LINE_WIDTH: 0.0889588
G1 F15000
M204 S4000
G1 X64.641 Y24.602 E.00034
; LINE_WIDTH: 0.11835
G1 X64.465 Y24.743 E.00123
; LINE_WIDTH: 0.160427
G1 X64.29 Y24.884 E.00185
; LINE_WIDTH: 0.202504
G1 X64.114 Y25.024 E.00247
; WIPE_START
G1 X64.29 Y24.884 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.216 Y25.497 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.101556
G1 F15000
M204 S4000
G1 X63.057 Y25.624 E.00089
; LINE_WIDTH: 0.143449
G1 X62.898 Y25.752 E.00145
; LINE_WIDTH: 0.179618
G1 X62.743 Y25.879 E.0019
; LINE_WIDTH: 0.210108
G1 X62.588 Y26.005 E.00229
; WIPE_START
G1 X62.743 Y25.879 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X61.626 Y26.541 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0996702
G1 F15000
M204 S4000
G1 X61.473 Y26.666 E.00084
; LINE_WIDTH: 0.137765
G1 X61.32 Y26.791 E.00133
; LINE_WIDTH: 0.17586
G1 X61.167 Y26.916 E.00183
; LINE_WIDTH: 0.211028
G1 X60.957 Y27.091 E.00315
; WIPE_START
G1 X61.167 Y26.916 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X59.921 Y27.701 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0987066
G1 F15000
M204 S4000
G1 X59.763 Y27.832 E.00086
; LINE_WIDTH: 0.134901
G1 X59.605 Y27.964 E.00135
; LINE_WIDTH: 0.171096
G1 X59.447 Y28.095 E.00183
; LINE_WIDTH: 0.209087
G1 X59.189 Y28.313 E.00385
; WIPE_START
G1 X59.447 Y28.095 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X58.062 Y29.013 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0973691
G1 F15000
M204 S4000
G1 X57.899 Y29.152 E.00088
; LINE_WIDTH: 0.130889
G1 X57.736 Y29.29 E.00135
; LINE_WIDTH: 0.168434
G1 X57.486 Y29.505 E.00288
; LINE_WIDTH: 0.209998
G1 X57.236 Y29.72 E.00378
; WIPE_START
G1 X57.486 Y29.505 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X55.991 Y30.539 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0996396
G1 F15000
M204 S4000
G1 X55.747 Y30.753 E.00138
; LINE_WIDTH: 0.137672
G1 X55.504 Y30.966 E.00218
; LINE_WIDTH: 0.175705
G1 X55.26 Y31.18 E.00299
; LINE_WIDTH: 0.213738
G1 X55.017 Y31.394 E.00379
; WIPE_START
G1 X55.26 Y31.18 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X53.544 Y32.44 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0993952
G1 F15000
M204 S4000
G1 X53.291 Y32.666 E.00144
; LINE_WIDTH: 0.136967
G1 X53.038 Y32.891 E.00227
; LINE_WIDTH: 0.174538
G1 X52.785 Y33.117 E.0031
; LINE_WIDTH: 0.214776
G1 X52.379 Y33.486 E.00645
; WIPE_START
G1 X52.785 Y33.117 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X50.447 Y34.991 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.103253
G1 F15000
M204 S4000
G1 X50.015 Y35.391 E.00264
; LINE_WIDTH: 0.148541
G1 X49.583 Y35.79 E.00438
; LINE_WIDTH: 0.188404
G1 X49.126 Y36.22 E.0063
; LINE_WIDTH: 0.222834
G1 X48.67 Y36.65 E.00771
; WIPE_START
G1 X49.126 Y36.22 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X43.722 Y41.61 Z1.4 F30000
G1 X38.631 Y46.688 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.222742
G1 F15000
M204 S4000
G1 X38.211 Y47.135 E.00754
; LINE_WIDTH: 0.188385
G1 X37.79 Y47.582 E.00616
; LINE_WIDTH: 0.148539
G1 X37.391 Y48.015 E.00438
; LINE_WIDTH: 0.103251
G1 X36.991 Y48.447 E.00264
; WIPE_START
G1 X37.391 Y48.015 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X35.486 Y50.379 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.214753
G1 F15000
M204 S4000
G1 X35.117 Y50.786 E.00646
; LINE_WIDTH: 0.17449
G1 X34.894 Y51.036 E.00306
; LINE_WIDTH: 0.13694
G1 X34.671 Y51.286 E.00224
; LINE_WIDTH: 0.0993893
G1 X34.448 Y51.536 E.00142
; WIPE_START
G1 X34.671 Y51.286 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X33.385 Y53.026 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.21361
G1 F15000
M204 S4000
G1 X33.173 Y53.267 E.00375
; LINE_WIDTH: 0.17561
G1 X32.962 Y53.509 E.00296
; LINE_WIDTH: 0.13761
G1 X32.75 Y53.75 E.00216
; LINE_WIDTH: 0.0996106
G1 X32.538 Y53.992 E.00137
; WIPE_START
G1 X32.75 Y53.75 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X31.72 Y55.236 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.210011
G1 F15000
M204 S4000
G1 X31.505 Y55.486 E.00378
; LINE_WIDTH: 0.168437
G1 X31.29 Y55.736 E.00288
; LINE_WIDTH: 0.130888
G1 X31.152 Y55.899 E.00135
; LINE_WIDTH: 0.0973782
G1 X31.013 Y56.062 E.00088
; WIPE_START
G1 X31.152 Y55.899 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X30.313 Y57.189 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.209096
G1 F15000
M204 S4000
G1 X30.095 Y57.447 E.00385
; LINE_WIDTH: 0.171105
G1 X29.964 Y57.605 E.00183
; LINE_WIDTH: 0.134912
G1 X29.832 Y57.763 E.00135
; LINE_WIDTH: 0.0987185
G1 X29.701 Y57.921 E.00086
; WIPE_START
G1 X29.832 Y57.763 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X29.091 Y58.957 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.210986
G1 F15000
M204 S4000
G1 X28.916 Y59.167 E.00315
; LINE_WIDTH: 0.175811
G1 X28.791 Y59.32 E.00182
; LINE_WIDTH: 0.137735
G1 X28.666 Y59.473 E.00133
; LINE_WIDTH: 0.0996588
G1 X28.541 Y59.626 E.00084
; WIPE_START
G1 X28.666 Y59.473 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X28.005 Y60.588 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.210102
G1 F15000
M204 S4000
G1 X27.879 Y60.743 E.00229
; LINE_WIDTH: 0.179602
G1 X27.752 Y60.898 E.0019
; LINE_WIDTH: 0.143407
G1 X27.624 Y61.057 E.00145
; LINE_WIDTH: 0.101546
G1 X27.497 Y61.216 E.00089
; WIPE_START
G1 X27.624 Y61.057 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X27.024 Y62.114 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.202505
G1 F15000
M204 S4000
G1 X26.884 Y62.29 E.00247
; LINE_WIDTH: 0.160426
G1 X26.743 Y62.465 E.00185
; LINE_WIDTH: 0.118348
G1 X26.602 Y62.641 E.00123
; LINE_WIDTH: 0.0889612
G1 X26.544 Y62.715 E.00034
M204 S10000
G1 X26.125 Y63.56 F30000
; LINE_WIDTH: 0.198213
G1 F15000
M204 S4000
G1 X25.977 Y63.748 E.00256
; LINE_WIDTH: 0.151173
G1 X25.829 Y63.935 E.00182
; LINE_WIDTH: 0.104132
G1 X25.681 Y64.123 E.00109
M204 S10000
G1 X25.29 Y64.94 F30000
; LINE_WIDTH: 0.196716
G1 F15000
M204 S4000
G1 X25.154 Y65.116 E.00236
; LINE_WIDTH: 0.150273
G1 X25.017 Y65.292 E.00168
; LINE_WIDTH: 0.10383
G1 X24.881 Y65.468 E.00101
M204 S10000
G1 X24.509 Y66.267 F30000
; LINE_WIDTH: 0.195305
G1 F15000
M204 S4000
G1 X24.382 Y66.433 E.00219
; LINE_WIDTH: 0.149431
G1 X24.256 Y66.599 E.00157
; LINE_WIDTH: 0.103556
G1 X24.13 Y66.766 E.00094
M204 S10000
G1 X23.798 Y67.523 F30000
; LINE_WIDTH: 0.195211
G1 F15000
M204 S4000
G1 X23.672 Y67.69 E.00219
; LINE_WIDTH: 0.149374
G1 X23.545 Y67.856 E.00156
; LINE_WIDTH: 0.103537
G1 X23.419 Y68.022 E.00094
M204 S10000
G1 X23.122 Y68.745 F30000
; LINE_WIDTH: 0.19371
G1 F15000
M204 S4000
G1 X23.004 Y68.902 E.00204
; LINE_WIDTH: 0.148471
G1 X22.887 Y69.059 E.00146
; LINE_WIDTH: 0.103232
G1 X22.77 Y69.216 E.00088
M204 S10000
G1 X22.475 Y69.938 F30000
; LINE_WIDTH: 0.192194
G1 F15000
M204 S4000
G1 X22.365 Y70.087 E.0019
; LINE_WIDTH: 0.147563
G1 X22.256 Y70.236 E.00136
; LINE_WIDTH: 0.102931
G1 X22.147 Y70.385 E.00083
; WIPE_START
G1 X22.256 Y70.236 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X21.31 Y72.194 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.190698
G1 F15000
M204 S4000
G1 X21.207 Y72.336 E.00178
; LINE_WIDTH: 0.146668
G1 X21.105 Y72.478 E.00128
; LINE_WIDTH: 0.102638
G1 X21.003 Y72.62 E.00078
; WIPE_START
G1 X21.105 Y72.478 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X20.255 Y74.34 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.189174
G1 F15000
M204 S4000
G1 X20.159 Y74.475 E.00167
; LINE_WIDTH: 0.14575
G1 X20.064 Y74.611 E.0012
; LINE_WIDTH: 0.102325
G1 X19.968 Y74.746 E.00073
; WIPE_START
G1 X20.064 Y74.611 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X19.298 Y76.388 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.187561
G1 F15000
M204 S4000
G1 X19.209 Y76.517 E.00157
; LINE_WIDTH: 0.144785
G1 X19.119 Y76.646 E.00113
; LINE_WIDTH: 0.102009
G1 X19.03 Y76.776 E.00069
; WIPE_START
G1 X19.119 Y76.646 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X18.418 Y78.359 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.186158
G1 F15000
M204 S4000
G1 X18.334 Y78.483 E.00149
; LINE_WIDTH: 0.143943
G1 X18.249 Y78.608 E.00107
; LINE_WIDTH: 0.101727
G1 X18.165 Y78.732 E.00066
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X18.249 Y78.608 E-.76
; WIPE_END
G1 E-.04 F1800
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z1.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z101 F600
    G1 Z99

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

