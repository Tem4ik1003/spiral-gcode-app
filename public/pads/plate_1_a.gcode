; HEADER_BLOCK_START
; BambuStudio 02.04.00.70
; model printing time: 48m 49s; total estimated time: 55m 59s
; total layer number: 10
; total filament length [mm] : 13864.39
; total filament volume [cm^3] : 33347.77
; total filament weight [g] : 44.02
; filament_density: 1.32,1.32,1.25,1.32
; filament_diameter: 1.75,1.75,1.75,1.75
; max_z_height: 2.00
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0,0
; additional_cooling_fan_speed = 70,70,70,70
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auto_disable_filter_on_overheat = 0
; auxiliary_fan = 0
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,0,0,0
; change_filament_gcode = ;===== A1 20251031 =======================\nM1007 S0 ; turn off mass estimation\nG392 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X267 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nM620.10 A0 F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60} L[flush_length] H[nozzle_diameter] T{flush_temperatures[next_extruder]}\n\nG1 Y128 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[flush_temperatures[next_extruder]]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E6 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nG1 X-38.2 F18000\nG1 X-48.2 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S4\n  G1 X-38.2 F18000\n  G1 X-48.2 F3000\n  G1 X-38.2 F18000 ;wipe and shake\n  G1 X-48.2 F3000\n  G1 X-38.2 F12000 ;wipe and shake\n  G1 X-48.2 F3000\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200,200,200
; close_fan_the_first_x_layers = 1,1,1,1
; complete_print_exhaust_fan_speed = 70,70,70,70
; cool_plate_temp = 35,35,35,35
; cool_plate_temp_initial_layer = 35,35,35,35
; cooling_filter_enabled = 0
; counter_coef_1 = 0,0,0,0
; counter_coef_2 = 0.008,0.008,0.008,0.008
; counter_coef_3 = -0.041,-0.041,-0.041,-0.041
; counter_limit_max = 0.033,0.033,0.033,0.033
; counter_limit_min = -0.035,-0.035,-0.035,-0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_filament_colour = ;;;
; default_filament_profile = "Bambu PLA Basic @BBL A1"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50,50,50
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70
; elefant_foot_compensation = 0.075
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1,1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0,0,0
; enable_prime_tower = 0
; enable_support = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0,0,0
; eng_plate_temp_initial_layer = 0,0,0,0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 256
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = Standard#1;Standard#1
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 80,80,80,80
; fan_direction = undefine
; fan_max_speed = 80,80,80,80
; fan_min_speed = 60,60,60,60
; filament_adaptive_volumetric_speed = 0,0,0,0
; filament_adhesiveness_category = 100,100,100,100
; filament_change_length = 10,10,10,10
; filament_change_length_nc = 10,10,10,10
; filament_colour = #000000;#0078BF;#B39B84;#000000
; filament_colour_type = 1;1;1;1
; filament_cooling_before_tower = 0,0,0,0
; filament_cost = 24.99,24.99,29.99,24.99
; filament_density = 1.32,1.32,1.25,1.32
; filament_diameter = 1.75,1.75,1.75,1.75
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.98,0.98,0.98,0.98
; filament_flush_temp = 0,0,0,0
; filament_flush_volumetric_speed = 0,0,0,0
; filament_ids = GFA01;GFA01;GFA02;GFA01
; filament_is_support = 0,0,0,0
; filament_long_retractions_when_cut = 1,1,nil,1
; filament_map = 1,1,1,1
; filament_map_2 = 0,0,0,0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 22,22,21,22
; filament_minimal_purge_on_wipe_tower = 15,15,15,15
; filament_multi_colour = #000000;#0078BF;#B39B84;#000000
; filament_notes = 
; filament_nozzle_map = 0,0,0,0
; filament_pre_cooling_temperature = 0,0,0,0
; filament_pre_cooling_temperature_nc = 0,0,0,0
; filament_prime_volume = 45,45,45,45
; filament_prime_volume_nc = 60,60,60,60
; filament_printable = 3,3,3,3
; filament_ramming_travel_time = 0,0,0,0
; filament_ramming_travel_time_nc = 0,0,0,0
; filament_ramming_volumetric_speed = -1,-1,-1,-1
; filament_ramming_volumetric_speed_nc = -1,-1,-1,-1
; filament_retract_length_nc = 14,14,14,14
; filament_retraction_distances_when_cut = 18,18,nil,18
; filament_scarf_gap = 0%,0%,15%,0%
; filament_scarf_height = 5%,5%,10%,5%
; filament_scarf_length = 10,10,10,10
; filament_scarf_seam_type = none,none,none,none
; filament_self_index = 1,2,3,4
; filament_settings_id = "Bambu PLA Matte @BBL A1";"Bambu PLA Matte @BBL A1";"Bambu PLA Metal @BBL A1";"Bambu PLA Matte @BBL A1"
; filament_shrink = 100%,100%,100%,100%
; filament_soluble = 0,0,0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA;PLA;PLA;PLA
; filament_velocity_adaptation_factor = 1,1,1,1
; filament_vendor = "Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab"
; filament_volume_map = 0,0,0,0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0,0,0,0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,437,474,108,123,0,425,123,172,272,0,172,108,437,474,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; group_algo_with_time = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 226x224,256x224,256x256,226x256
; hole_coef_1 = 0,0,0,0
; hole_coef_2 = -0.008,-0.008,-0.008,-0.008
; hole_coef_3 = 0.23415,0.23415,0.23415,0.23415
; hole_limit_max = 0.22,0.22,0.22,0.22
; hole_limit_min = 0.088,0.088,0.088,0.088
; host_type = octoprint
; hot_plate_temp = 65,65,65,65
; hot_plate_temp_initial_layer = 65,65,65,65
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 6.6,6.6,16.8,6.6
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
; inner_wall_speed = 300
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
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0,0,0,0
; machine_end_gcode = ;===== date: 20231229 =====================\nG392 S0 ;turn off nozzle clog detect\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != "by object"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X267 F15000\nT255\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nG1 X-28.5 F18000\nG1 X-48.2 F3000\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 256}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z256 F600\n    G1 Z256\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-48 Y180 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M40 E42 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C46 D10 M80 E46 F10 N80\nM1006 A44 B20 L100 C39 D20 M60 E48 F20 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C39 D10 M60 E39 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A0 B10 L100 C48 D10 M60 E44 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10  N80\nM1006 A44 B20 L100 C49 D20 M80 E41 F20 N80\nM1006 A0 B20 L100 C0 D20 M60 E0 F20 N80\nM1006 A0 B20 L100 C37 D20 M30 E37 F20 N60\nM1006 W\n;=====printer finish  sound=========\n\n;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\nM400\nM18 X Y Z\n\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 25
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 12000,12000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 12000,12000
; machine_max_acceleration_y = 12000,12000
; machine_max_acceleration_z = 1500,1500
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: A1 =========================\n;===== date: 20250822 ==================\nG392 S0\nM9833.2\n;M400\n;M73 P1.717\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S140\nM140 S[bed_temperature_initial_layer_single]\n\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B10 L100 C37 D10 M60 E37 F10 N60\nM1006 A0 B10 L100 C41 D10 M60 E41 F10 N60\nM1006 A0 B10 L100 C44 D10 M60 E44 F10 N60\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N60\nM1006 A43 B10 L100 C46 D10 M70 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C43 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C41 D10 M80 E41 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E44 F10 N80\nM1006 A0 B10 L100 C49 D10 M80 E49 F10 N80\nM1006 A0 B10 L100 C0 D10 M80 E0 F10 N80\nM1006 A44 B10 L100 C48 D10 M60 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A0 B10 L100 C44 D10 M80 E39 F10 N80\nM1006 A0 B10 L100 C0 D10 M60 E0 F10 N80\nM1006 A43 B10 L100 C46 D10 M60 E39 F10 N80\nM1006 W\nM18 \n;=====start printer sound ===================\n\n;=====avoid end stop =================\nG91\nG380 S2 Z40 F1200\nG380 S3 Z-15 F1200\nG90\n\n;===== reset machine status =================\n;M290 X39 Y39 Z8\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.65 Y1.2 Z0.6 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\nM1002 gcode_claim_action : 13\n\nG28 X\nG91\nG1 Z5 F1200\nG90\nG0 X128 F30000\nG0 Y254 F3000\nG91\nG1 Z-5 F1200\n\nM109 S25 H140\n\nM17 E0.3\nM83\nG1 E10 F1200\nG1 E-0.5 F30\nM17 D\n\nG28 Z P0 T140; home z with low precision,permit 300deg temperature\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\n\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  G90\n  G1 Z5 F1200\nM623\n\n;M400\n;M73 P1.717\n\n;===== prepare print temperature and material ==========\nM1002 gcode_claim_action : 24\n\nM400\n;G392 S1\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on\n\nG90\nG1 X-28.5 F30000\nG1 X-48.2 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n    M104 S250\n    M400\n    T[initial_no_support_extruder]\n    G1 X-48.2 F3000\n    M400\n\n    M620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\nM109 S{flush_temperatures[initial_no_support_extruder]} H300\nG92 E0\nG1 E50 F200 ; lower extrusion speed to avoid clog\nM400\nM106 P1 S178\nG92 E0\nG1 E5 F200\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG92 E0\nG1 E-0.5 F300\n\nG1 X-28.5 F30000\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\nG1 X-28.5 F30000 ;wipe and shake\nG1 X-48.2 F3000\n\n;G392 S0\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n;M400\n;M73 P1.717\n\n;===== auto extrude cali start =========================\nM975 S1\n;G392 S1\n\nG90\nM83\nT1000\nG1 X-48.2 Y0 Z10 F10000\nM400\nM1002 set_filament_type:UNKNOWN\n\nM412 S1 ;  ===turn on  filament runout detection===\nM400 P10\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\n\nM622 J1\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_extruder]}\n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n\n    M106 P1 S255\n    M400 S5\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S255\n        M400 S5\n        G1 X-28.5 F18000\n        G1 X-48.2 F3000\n        G1 X-28.5 F18000 ;wipe and shake\n        G1 X-48.2 F3000\n        G1 X-28.5 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-48.2 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X-28.5 F18000\n    G1 X-48.2 F3000\n    G1 X-28.5 F18000 ;wipe and shake\n    G1 X-48.2 F3000\n    G1 X-28.5 F12000 ;wipe and shake\n    G1 X-48.2 F3000\n    M400\n    M106 P1 S0\nM623 ; end of "draw extrinsic para cali paint"\n\n;G392 S0\n;===== auto extrude cali end ========================\n\n;M400\n;M73 P1.717\n\nM104 S170 ; prepare to wipe nozzle\nM106 S255 ; turn on fan\n\n;===== mech mode fast check start =====================\nM1002 gcode_claim_action : 3\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q1 A5 K0 O3\nM974 Q1 S2 P0\n\nM970.2 Q1 K1 W58 Z0.1\nM974 S2\n\nG1 X128 Y128 F20000\nG1 Z5 F1200\nM400 P200\nM970.3 Q0 A10 K0 O1\nM974 Q0 S2 P0\n\nM970.2 Q0 K1 W78 Z0.1\nM974 S2\n\nM975 S1\nG1 F30000\nG1 X0 Y5\nG28 X ; re-home XY\n\nG1 Z4 F1200\n\n;===== mech mode fast check end =======================\n\n;M400\n;M73 P1.717\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\n\nM975 S1\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\n;===== remove waste by touching start =====\n\nM104 S170 ; set temp down to heatbed acceptable\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nG0 X108 Y-0.5 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X110 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X112 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X114 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X116 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X118 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X120 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X122 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X124 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X126 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X128 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X130 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X132 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X134 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X136 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X138 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X140 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X142 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X144 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X146 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X148 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;===== remove waste by touching end =====\n\nG1 Z10 F1200\nG0 X118 Y261 F30000\nG1 Z5 F1200\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-50}\n\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S140 ; prepare to abl\nG0 Z5 F20000\n\nG0 X128 Y261 F20000  ; move to exposed steel surface\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z10 F1200\n\n;===== brush material wipe nozzle =====\n\nG90\nG1 Y250 F30000\nG1 X55\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X-35 F30000\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Z5.000 F1200\n\nG90\nG1 X30 Y250.000 F30000\nG1 Z1.300 F1200\nG1 Y262.5 F6000\nG91\nG1 X35 F30000\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Y-0.5\nG1 X45\nG1 Y-0.5\nG1 X-45\nG1 Z10.000 F1200\n\n;===== brush material wipe nozzle end =====\n\nG90\n;G0 X128 Y261 F20000  ; move to exposed steel surface\nG1 Y250 F30000\nG1 X138\nG1 Y261\nG0 Z-1.01 F1200      ; stop the nozzle\n\nG91\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nM109 S140\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM211 R; pop softend status\n\n;===== wipe nozzle end ================================\n\n;M400\n;M73 P1.717\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\n\nG90\nG1 Z5 F1200\nG1 X0 Y0 F30000\nG29.2 S1 ; turn on ABL\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140\nM106 S0 ; turn off fan , too noisy\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n\n;===== home after wipe mouth end =======================\n\n;M400\n;M73 P1.717\n\nG1 X108.000 Y-0.500 F30000\nG1 Z0.300 F1200\nM400\nG2814 Z0.32\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; prepare to print\n\n;===== nozzle load line ===============================\n;G90\n;M83\n;G1 Z5 F1200\n;G1 X88 Y-0.5 F20000\n;G1 Z0.3 F1200\n\n;M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n\n;G1 E2 F300\n;G1 X168 E4.989 F6000\n;G1 Z1 F1200\n;===== nozzle load line end ===========================\n\n;===== extrude cali test ===============================\n\nM400\n    M900 S\n    M900 C\n    G90\n    M83\n\n    M109 S{nozzle_temperature_initial_layer[initial_extruder]}\n    G0 X128 E8  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\n\nM900 R\n\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    G90\n    G1 X108.000 Y1.000 F30000\n    G91\n    G1 Z-0.700 F1200\n    G90\n    M83\n    G0 X128 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X133 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X138 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X143 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X148 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X153 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G91\n    G1 X1 Z-0.300\n    G1 X4\n    G1 Z1 F1200\n    G90\n    M400\nM623\n\nG1 Z0.2\n\n;M400\n;M73 P1.717\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\n;G392 S1 ; turn on clog detection\nM1007 S1 ; turn on mass estimation\nG29.4\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 29
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
; no_slow_down_for_cooling_on_outwalls = 0,0,0,0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.76
; nozzle_temperature = 220,220,220,220
; nozzle_temperature_initial_layer = 220,220,220,220
; nozzle_temperature_range_high = 240,240,240,240
; nozzle_temperature_range_low = 190,190,190,190
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100,100,100
; overhang_fan_threshold = 50%,50%,50%,50%
; overhang_threshold_participating_cooling = 95%,95%,95%,95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 2,2,0,2
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02,0.02,0.02
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
; print_compatible_printers = "Bambu Lab A1 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL A1
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 256
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1
; printer_notes = 
; printer_settings_id = Bambu Lab A1 0.4 nozzle
; printer_structure = i3
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
; reduce_fan_stop_start_freq = 1,1,1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3,3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 255
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0,0,0
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
; slow_down_for_layer_cooling = 1,1,1,1
; slow_down_layer_time = 6,6,6,6
; slow_down_min_speed = 20,20,20,20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45,45,45,45
; supertack_plate_temp_initial_layer = 45,45,45,45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
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
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45,45,45,45
; template_custom_gcode = 
; textured_plate_temp = 65,65,65,65
; textured_plate_temp_initial_layer = 65,65,65,65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != "by object"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-48.2 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X261 Y250 F20000\n      M400 P200\n      G39 S1\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0"
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
; wipe_tower_x = 15
; wipe_tower_y = 216.972
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
M73 P0 R55
M201 X12000 Y12000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P12000 R5000 T12000
M205 X9.00 Y9.00 Z3.00 E3.00
; FEATURE: Custom
;===== machine: A1 =========================
;===== date: 20250822 ==================
G392 S0
M9833.2
;M400
;M73 P1.717

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PLA
M104 S140
M140 S65

;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B10 L100 C37 D10 M60 E37 F10 N60
M1006 A0 B10 L100 C41 D10 M60 E41 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A43 B10 L100 C46 D10 M70 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C43 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C41 D10 M80 E41 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E44 F10 N80
M1006 A0 B10 L100 C49 D10 M80 E49 F10 N80
M1006 A0 B10 L100 C0 D10 M80 E0 F10 N80
M1006 A44 B10 L100 C48 D10 M60 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A0 B10 L100 C44 D10 M80 E39 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N80
M1006 A43 B10 L100 C46 D10 M60 E39 F10 N80
M1006 W
M18 
;=====start printer sound ===================

;=====avoid end stop =================
G91
G380 S2 Z40 F1200
G380 S3 Z-15 F1200
G90

;===== reset machine status =================
;M290 X39 Y39 Z8
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.65 Y1.2 Z0.6 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;M211 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem

;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

M1002 gcode_claim_action : 13

G28 X
G91
G1 Z5 F1200
G90
G0 X128 F30000
G0 Y254 F3000
G91
G1 Z-5 F1200

M109 S25 H140

M17 E0.3
M83
G1 E10 F1200
G1 E-0.5 F30
M17 D

G28 Z P0 T140; home z with low precision,permit 300deg temperature
M104 S220

M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  G90
  G1 Z5 F1200
M623

;M400
;M73 P1.717

;===== prepare print temperature and material ==========
M1002 gcode_claim_action : 24

M400
;G392 S1
M211 X0 Y0 Z0 ;turn off soft endstop
M975 S1 ; turn on

G90
G1 X-28.5 F30000
G1 X-48.2 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S220
    M104 S250
    M400
    T0
    G1 X-48.2 F3000
    M400

    M620.1 E F548.788 T240
    M109 S250 ;set nozzle to common flush temp
    M106 P1 S0
    G92 E0
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA
M621 S0A

M109 S240 H300
G92 E0
G1 E50 F200 ; lower extrusion speed to avoid clog
M400
M106 P1 S178
G92 E0
G1 E5 F200
M104 S220
G92 E0
M73 P2 R54
G1 E-0.5 F300

G1 X-28.5 F30000
M73 P3 R54
G1 X-48.2 F3000
G1 X-28.5 F30000 ;wipe and shake
M73 P3 R53
G1 X-48.2 F3000
G1 X-28.5 F30000 ;wipe and shake
G1 X-48.2 F3000

;G392 S0

M400
M106 P1 S0
;===== prepare print temperature and material end =====

;M400
;M73 P1.717

;===== auto extrude cali start =========================
M975 S1
;G392 S1

G90
M83
T1000
G1 X-48.2 Y0 Z10 F10000
M400
M1002 set_filament_type:UNKNOWN

M412 S1 ;  ===turn on  filament runout detection===
M400 P10
M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PLA

;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag

M622 J1
    M1002 gcode_claim_action : 8

    M109 S220
    G1 E10 F377.08
    M983 F6.28466 A0.3 H0.4; cali dynamic extrusion compensation

    M106 P1 S255
    M400 S5
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
M73 P4 R53
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F6.28466 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S255
        M400 S5
        G1 X-28.5 F18000
        G1 X-48.2 F3000
        G1 X-28.5 F18000 ;wipe and shake
        G1 X-48.2 F3000
        G1 X-28.5 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
    G1 X-48.2 F3000
    M400
    M984 A0.1 E1 S1 F6.28466 H0.4
    M106 P1 S178
    M400 S7
    G1 X-28.5 F18000
    G1 X-48.2 F3000
    G1 X-28.5 F18000 ;wipe and shake
    G1 X-48.2 F3000
    G1 X-28.5 F12000 ;wipe and shake
    G1 X-48.2 F3000
    M400
    M106 P1 S0
M623 ; end of "draw extrinsic para cali paint"

;G392 S0
;===== auto extrude cali end ========================

;M400
;M73 P1.717

M104 S170 ; prepare to wipe nozzle
M106 S255 ; turn on fan

;===== mech mode fast check start =====================
M1002 gcode_claim_action : 3

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q1 A5 K0 O3
M974 Q1 S2 P0

M970.2 Q1 K1 W58 Z0.1
M974 S2

G1 X128 Y128 F20000
G1 Z5 F1200
M400 P200
M970.3 Q0 A10 K0 O1
M974 Q0 S2 P0

M970.2 Q0 K1 W78 Z0.1
M974 S2

M975 S1
G1 F30000
G1 X0 Y5
G28 X ; re-home XY

G1 Z4 F1200

;===== mech mode fast check end =======================

;M400
;M73 P1.717

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14

M975 S1
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

;===== remove waste by touching start =====

M104 S170 ; set temp down to heatbed acceptable

M83
G1 E-1 F500
G90
M83

M109 S170
G0 X108 Y-0.5 F30000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X110 F10000
G380 S3 Z-5 F1200
M73 P12 R49
G1 Z2 F1200
G1 X112 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X114 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X116 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X118 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X120 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X122 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X124 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X126 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X128 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X130 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X132 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X134 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X136 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X138 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X140 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X142 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X144 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X146 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X148 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;===== remove waste by touching end =====

G1 Z10 F1200
G0 X118 Y261 F30000
G1 Z5 F1200
M109 S170

G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S140 ; prepare to abl
G0 Z5 F20000

G0 X128 Y261 F20000  ; move to exposed steel surface
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
G1 Z10 F1200

;===== brush material wipe nozzle =====

G90
G1 Y250 F30000
G1 X55
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X-35 F30000
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Z5.000 F1200

G90
G1 X30 Y250.000 F30000
G1 Z1.300 F1200
G1 Y262.5 F6000
G91
G1 X35 F30000
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Y-0.5
G1 X45
G1 Y-0.5
G1 X-45
G1 Z10.000 F1200

;===== brush material wipe nozzle end =====

G90
;G0 X128 Y261 F20000  ; move to exposed steel surface
G1 Y250 F30000
G1 X138
G1 Y261
G0 Z-1.01 F1200      ; stop the nozzle

G91
G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
M73 P12 R48
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

M109 S140
M106 S255 ; turn on fan (G28 has turn off fan)

M211 R; pop softend status

;===== wipe nozzle end ================================

;M400
;M73 P1.717

;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag

G90
G1 Z5 F1200
G1 X0 Y0 F30000
G29.2 S1 ; turn on ABL

M190 S65; ensure bed temp
M109 S140
M106 S0 ; turn off fan , too noisy

M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X49.3479 Y49.3479 I157.304 J157.304
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

;M400
;M73 P1.717

G1 X108.000 Y-0.500 F30000
G1 Z0.300 F1200
M400
G2814 Z0.32

M104 S220 ; prepare to print

;===== nozzle load line ===============================
;G90
;M83
;G1 Z5 F1200
;G1 X88 Y-0.5 F20000
;G1 Z0.3 F1200

;M109 S220

;G1 E2 F300
;G1 X168 E4.989 F6000
;G1 Z1 F1200
;===== nozzle load line end ===========================

;===== extrude cali test ===============================

M400
    M900 S
    M900 C
    G90
    M83

    M109 S220
    G0 X128 E8  F904.991
    G0 X133 E.3742  F1508.32
    G0 X138 E.3742  F6033.27
    G0 X143 E.3742  F1508.32
    G0 X148 E.3742  F6033.27
    G0 X153 E.3742  F1508.32
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400

M900 R

M1002 judge_flag extrude_cali_flag
M622 J1
    G90
    G1 X108.000 Y1.000 F30000
    G91
    G1 Z-0.700 F1200
    G90
    M83
    G0 X128 E10  F904.991
    G0 X133 E.3742  F1508.32
    G0 X138 E.3742  F6033.27
    G0 X143 E.3742  F1508.32
    G0 X148 E.3742  F6033.27
    G0 X153 E.3742  F1508.32
    G91
    G1 X1 Z-0.300
    G1 X4
    G1 Z1 F1200
    G90
    M400
M623

G1 Z0.2

;M400
;M73 P1.717

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
;G392 S1 ; turn on clog detection
M1007 S1 ; turn on mass estimation
G29.4
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S200


;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/10
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
; OBJECT_ID: 15978
G1 X200.191 Y98.832 F42000
M204 S6000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G3 X106.602 Y53.128 I-72.199 J29.169 E13.97388
G3 X128.497 Y50.134 I21.407 J74.998 E.82585
G3 X200.169 Y98.776 I-.504 J77.867 E3.42117
M204 S6000
G1 X200.615 Y98.661 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G3 X106.476 Y52.689 I-72.623 J29.34 E14.05587
G3 X128.501 Y49.677 I21.533 J75.438 E.83074
G3 X200.592 Y98.605 I-.508 J78.324 E3.44123
; WIPE_START
G1 X201.316 Y100.47 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X186.667 Y77.091 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50003
G1 F6300
M204 S500
G2 X181.824 Y72.266 I-279.249 J275.366 E.25464
G2 X177.803 Y68.645 I-53.854 J55.768 E.20159
G1 X176.595 Y67.666 E.05792
G1 X188.394 Y79.465 E.62155
G3 X190.512 Y82.23 I-51.738 J41.832 E.12973
G1 X173.801 Y65.519 E.8803
G2 X171.563 Y63.927 I-31.536 J41.975 E.10231
M73 P13 R48
G1 X192.04 Y84.404 E1.07866
G3 X193.317 Y86.328 I-36.414 J25.567 E.08605
G1 X169.694 Y62.704 E1.24444
G2 X167.964 Y61.621 I-21.535 J32.465 E.07603
G1 X194.376 Y88.033 E1.3913
G3 X195.267 Y89.571 I-29.56 J18.164 E.06623
G1 X166.43 Y60.733 E1.51909
G2 X164.95 Y59.9 I-16.64 J27.819 E.06326
G1 X196.1 Y91.05 E1.6409
G3 X196.827 Y92.423 I-37.161 J20.549 E.05789
G1 X163.593 Y59.189 E1.75069
G1 X162.275 Y58.518 E.0551
G1 X197.471 Y93.713 E1.85402
G1 X198.085 Y94.975 E.05226
G1 X161.02 Y57.909 E1.95253
G2 X159.839 Y57.374 I-10.784 J22.257 E.04829
G1 X198.643 Y96.179 E2.04412
G3 X199.137 Y97.319 I-21.512 J9.988 E.04627
G1 X158.674 Y56.856 E2.13149
G2 X157.561 Y56.39 I-7.227 J15.694 E.04493
G1 X199.613 Y98.442 E2.2152
G3 X200.051 Y99.526 I-15.304 J6.81 E.04357
G1 X156.477 Y55.952 E2.29541
G2 X155.41 Y55.531 I-8.558 J20.159 E.04271
G1 X200.454 Y100.575 E2.37281
G3 X200.849 Y101.617 I-14.704 J6.175 E.04151
G1 X154.381 Y55.149 E2.44782
G1 X153.38 Y54.795 E.03955
G1 X201.189 Y102.603 E2.51843
G1 X201.528 Y103.589 E.03884
G1 X152.416 Y54.477 E2.58712
G1 X151.458 Y54.165 E.03752
G1 X201.846 Y104.553 E2.65431
G3 X202.137 Y105.491 I-17.74 J6.029 E.03659
G1 X150.508 Y53.862 E2.71968
G1 X149.589 Y53.589 E.03574
G1 X202.397 Y106.397 E2.78182
G1 X202.657 Y107.304 E.03512
G1 X148.688 Y53.334 E2.84297
G2 X147.803 Y53.096 I-5.025 J16.891 E.03414
G1 X202.907 Y108.2 E2.90274
G1 X203.133 Y109.072 E.03355
G1 X146.942 Y52.881 E2.96
G1 X146.08 Y52.666 E.03307
G1 X203.341 Y109.927 E3.01637
G3 X203.538 Y110.771 I-16.008 J4.183 E.03226
G1 X145.228 Y52.461 E3.07162
G1 X144.397 Y52.276 E.03173
G1 X203.713 Y111.592 E3.12462
G1 X203.887 Y112.412 E.03126
G1 X143.584 Y52.11 E3.17662
G1 X142.782 Y51.953 E.03046
G1 X204.061 Y113.233 E3.22806
G1 X204.207 Y114.026 E.03002
G1 X141.979 Y51.797 E3.27804
G2 X141.187 Y51.652 I-3.237 J15.41 E.02999
G1 X204.347 Y114.812 E3.32712
G1 X204.469 Y115.58 E.02896
G1 X140.41 Y51.521 E3.37445
G2 X139.648 Y51.406 I-2.525 J14.134 E.02869
G1 X204.59 Y116.348 E3.42097
G1 X204.711 Y117.115 E.02896
G1 X138.896 Y51.3 E3.467
G1 X138.144 Y51.194 E.0283
G1 X204.806 Y117.856 E3.51161
G1 X204.896 Y118.593 E.02766
G1 X137.395 Y51.092 E3.55583
G1 X136.664 Y51.008 E.02738
G1 X204.987 Y119.33 E3.59906
G3 X205.073 Y120.062 I-13.909 J1.999 E.02746
M73 P14 R48
G1 X135.939 Y50.929 E3.64179
G1 X135.231 Y50.867 E.0265
G1 X205.142 Y120.778 E3.68274
G3 X205.203 Y121.486 I-13.498 J1.535 E.02649
G1 X134.522 Y50.805 E3.72333
G1 X133.813 Y50.742 E.0265
G1 X205.252 Y122.181 E3.76321
G1 X205.301 Y122.876 E.02595
G1 X133.115 Y50.69 E3.80257
G1 X132.426 Y50.648 E.02572
G1 X205.349 Y123.571 E3.84144
G3 X205.386 Y124.255 I-9.774 J.871 E.0255
G1 X131.742 Y50.611 E3.87937
G1 X131.067 Y50.582 E.0252
G1 X205.409 Y124.924 E3.91621
G1 X205.433 Y125.594 E.02497
G1 X130.398 Y50.56 E3.95264
G1 X129.739 Y50.547 E.02456
M73 P14 R47
G1 X205.456 Y126.264 E3.9886
G3 X205.472 Y126.926 I-12.66 J.634 E.02468
G1 X129.08 Y50.534 E4.02416
G2 X128.422 Y50.523 I-.565 J14.01 E.0245
G1 X205.478 Y127.579 E4.0591
G3 X205.48 Y128.227 I-18.558 J.373 E.02414
G1 X127.778 Y50.526 E4.0931
G1 X127.135 Y50.528 E.02398
G1 X205.474 Y128.868 E4.12672
G3 X205.464 Y129.504 I-12.136 J.136 E.02373
G1 X126.494 Y50.534 E4.15996
G1 X125.864 Y50.551 E.02347
G1 X205.443 Y130.129 E4.19199
G1 X205.421 Y130.754 E.02328
G1 X125.235 Y50.568 E4.22397
G1 X124.616 Y50.595 E.02309
G1 X205.399 Y131.378 E4.25545
G1 X205.377 Y132.003 E.02328
G1 X123.996 Y50.622 E4.28693
G2 X123.391 Y50.663 I.478 J11.541 E.02261
G1 X205.337 Y132.609 E4.31669
G1 X205.294 Y133.213 E.02256
G1 X122.787 Y50.706 E4.34629
G1 X122.183 Y50.748 E.02256
G1 X205.252 Y133.817 E4.37589
G1 X205.21 Y134.422 E.02256
G1 X121.578 Y50.79 E4.4055
G2 X120.983 Y50.841 I.432 J8.561 E.02227
G1 X205.159 Y135.017 E4.43419
G1 X205.097 Y135.602 E.02191
G1 X120.398 Y50.903 E4.46176
G1 X119.813 Y50.964 E.02191
G1 X205.036 Y136.187 E4.48934
G1 X204.974 Y136.772 E.02191
G1 X119.228 Y51.026 E4.51691
G1 X118.643 Y51.087 E.02191
G1 X204.913 Y137.357 E4.54449
G3 X204.84 Y137.93 I-10.97 J-1.109 E.02153
G1 X118.07 Y51.16 E4.57083
G1 X117.499 Y51.235 E.02146
M73 P15 R47
G1 X204.765 Y138.501 E4.59696
G3 X204.685 Y139.068 I-16.306 J-2.003 E.02132
G1 X116.934 Y51.317 E4.62251
G1 X116.376 Y51.406 E.02105
G1 X204.601 Y139.631 E4.64748
G3 X204.515 Y140.191 I-10.708 J-1.351 E.02113
G1 X115.818 Y51.494 E4.67237
G1 X115.259 Y51.582 E.02105
G1 X204.418 Y140.741 E4.69667
G1 X204.321 Y141.29 E.02079
G1 X114.701 Y51.67 E4.72097
G2 X114.153 Y51.769 I1.656 J10.762 E.02073
G1 X204.224 Y141.84 E4.74472
G1 X204.127 Y142.39 E.02079
G1 X113.608 Y51.87 E4.76836
G2 X113.065 Y51.974 I1.675 J10.178 E.02057
G1 X204.026 Y142.934 E4.79158
G1 X203.913 Y143.468 E.0203
G1 X112.532 Y52.087 E4.8137
G1 X111.999 Y52.2 E.0203
G1 X203.799 Y144.001 E4.83582
G1 X203.686 Y144.534 E.0203
G1 X111.466 Y52.314 E4.85794
G1 X110.933 Y52.427 E.02031
G1 X203.573 Y145.067 E4.88006
G3 X203.456 Y145.596 I-10.167 J-1.97 E.0202
G1 X110.404 Y52.545 E4.90171
G1 X109.883 Y52.67 E.01998
G1 X203.33 Y146.118 E4.9226
G1 X203.205 Y146.639 E.01997
G1 X109.361 Y52.795 E4.94349
G2 X108.849 Y52.929 I2.255 J9.657 E.01973
G1 X203.074 Y147.154 E4.96356
G1 X202.941 Y147.668 E.01976
G1 X108.339 Y53.065 E4.98342
G1 X107.829 Y53.202 E.01966
G1 X202.806 Y148.179 E5.00314
G1 X202.661 Y148.681 E.01947
G1 X107.319 Y53.338 E5.02241
G1 X106.809 Y53.475 E.01966
G1 X202.517 Y149.183 E5.04168
G1 X202.373 Y149.686 E.01947
G1 X106.308 Y53.62 E5.0605
G1 X105.809 Y53.768 E.01938
G1 X202.229 Y150.188 E5.0792
G3 X202.084 Y150.689 I-7.287 J-1.838 E.01944
G1 X105.311 Y53.916 E5.0978
G1 X104.823 Y54.074 E.01911
M73 P16 R47
G1 X201.926 Y151.177 E5.11515
G1 X201.767 Y151.665 E.01911
G1 X104.335 Y54.233 E5.1325
G1 X103.847 Y54.391 E.01911
M73 P16 R46
G1 X201.609 Y152.153 E5.14985
G1 X201.45 Y152.641 E.01911
G1 X103.359 Y54.55 E5.16721
G1 X102.871 Y54.708 E.01911
G1 X201.291 Y153.129 E5.18456
G3 X201.125 Y153.609 I-9.231 J-2.945 E.01891
G1 X102.394 Y54.878 E5.20087
G1 X101.92 Y55.051 E.01879
G1 X200.956 Y154.086 E5.21694
G3 X200.786 Y154.562 I-13.725 J-4.627 E.01885
G1 X101.446 Y55.223 E5.23295
G1 X100.972 Y55.396 E.01879
G1 X200.61 Y155.033 E5.24865
G1 X200.434 Y155.503 E.01871
G1 X100.498 Y55.568 E5.26435
G2 X100.029 Y55.745 I3.149 J9.069 E.01869
G1 X200.253 Y155.97 E5.27958
G1 X200.067 Y156.43 E.0185
G1 X99.565 Y55.928 E5.29421
G1 X99.101 Y56.111 E.01857
G1 X199.881 Y156.89 E5.30884
G1 X199.695 Y157.351 E.0185
G1 X98.645 Y56.3 E5.32309
G1 X98.191 Y56.493 E.01836
G1 X199.509 Y157.811 E5.33719
G1 X199.323 Y158.272 E.0185
G1 X97.737 Y56.686 E5.3513
G1 X97.283 Y56.878 E.01836
G1 X199.124 Y158.719 E5.36472
G1 X198.925 Y159.166 E.01824
G1 X96.83 Y57.071 E5.37813
G2 X96.378 Y57.266 I3.493 J8.709 E.01832
G1 X198.726 Y159.614 E5.39143
G1 X198.527 Y160.061 E.01824
G1 X95.934 Y57.468 E5.40433
G1 X95.49 Y57.671 E.01818
G1 X198.327 Y160.508 E5.41723
G3 X198.124 Y160.951 I-8.541 J-3.66 E.01816
G1 X95.05 Y57.878 E5.42966
G1 X94.616 Y58.089 E.01801
M73 P17 R46
G1 X197.915 Y161.389 E5.44156
G1 X197.706 Y161.826 E.01806
G1 X94.181 Y58.301 E5.45345
G1 X93.747 Y58.513 E.01801
G1 X197.491 Y162.258 E5.46501
G1 X197.273 Y162.686 E.0179
G1 X93.312 Y58.725 E5.47641
G1 X92.878 Y58.937 E.01801
G1 X197.055 Y163.114 E5.4878
G1 X196.836 Y163.542 E.0179
G1 X92.452 Y59.158 E5.49872
G1 X92.027 Y59.379 E.01786
G1 X196.618 Y163.971 E5.50963
G3 X196.399 Y164.398 I-6.249 J-2.929 E.0179
G1 X91.602 Y59.601 E5.52048
G1 X91.186 Y59.831 E.01771
G1 X196.169 Y164.814 E5.53025
G1 X195.938 Y165.23 E.01771
G1 X90.77 Y60.062 E5.54002
G1 X90.354 Y60.292 E.01771
G1 X195.708 Y165.646 E5.54979
G1 X195.477 Y166.062 E.01771
G1 X89.938 Y60.522 E5.55956
G1 X89.522 Y60.753 E.01771
G1 X195.247 Y166.478 E5.56933
G3 X195.013 Y166.89 I-7.759 J-4.128 E.01767
G1 X89.11 Y60.988 E5.57868
G1 X88.703 Y61.227 E.01759
G1 X194.773 Y167.297 E5.58749
G1 X194.533 Y167.703 E.01758
G1 X88.296 Y61.467 E5.59629
G2 X87.892 Y61.709 I6.437 J11.179 E.01755
G1 X194.29 Y168.107 E5.60477
G1 X194.041 Y168.504 E.01747
G1 X87.491 Y61.955 E5.61278
G1 X87.091 Y62.2 E.01751
M73 P17 R45
G1 X193.792 Y168.902 E5.6208
G1 X193.544 Y169.3 E.01747
G1 X86.695 Y62.452 E5.62852
G1 X86.303 Y62.706 E.01741
G1 X193.295 Y169.698 E5.63607
G1 X193.046 Y170.096 E.01747
M73 P18 R45
G1 X85.911 Y62.96 E5.64362
G1 X85.519 Y63.215 E.01741
G1 X192.791 Y170.487 E5.65083
G1 X192.534 Y170.876 E.01738
G1 X85.127 Y63.469 E5.65791
G1 X84.735 Y63.724 E.01741
G1 X192.276 Y171.265 E5.665
G3 X192.014 Y171.649 I-11.13 J-7.322 E.01733
G1 X84.352 Y63.987 E5.67139
G1 X83.968 Y64.25 E.01732
G1 X191.751 Y172.032 E5.67771
G1 X191.487 Y172.415 E.01732
G1 X83.585 Y64.513 E5.68404
G2 X83.207 Y64.781 I7.16 J10.464 E.01727
G1 X191.216 Y172.79 E5.68964
G1 X190.944 Y173.165 E.01724
G1 X82.83 Y65.051 E5.69518
G1 X82.453 Y65.32 E.01726
G1 X190.672 Y173.539 E5.70073
G1 X190.4 Y173.913 E.01724
G1 X82.081 Y65.595 E5.70597
G1 X81.71 Y65.87 E.01722
G1 X190.128 Y174.288 E5.71121
G3 X189.855 Y174.661 I-5.478 J-3.719 E.01723
G1 X81.339 Y66.145 E5.71636
G1 X80.976 Y66.429 E.01715
G1 X189.571 Y175.024 E5.72054
G1 X189.288 Y175.387 E.01715
G1 X80.613 Y66.712 E5.72472
G1 X80.25 Y66.996 E.01715
G1 X189.004 Y175.75 E5.7289
G1 X188.721 Y176.113 E.01715
G1 X79.887 Y67.279 E5.73308
G1 X79.524 Y67.563 E.01715
G1 X188.437 Y176.476 E5.73726
G3 X188.151 Y176.836 I-5.312 J-3.921 E.01714
G1 X79.163 Y67.848 E5.74122
G1 X78.809 Y68.14 E.01711
G1 X187.856 Y177.188 E5.74435
G1 X187.561 Y177.539 E.01709
M73 P19 R45
G1 X78.454 Y68.433 E5.74748
G2 X78.102 Y68.727 I5.42 J6.837 E.0171
G1 X187.266 Y177.891 E5.75048
G1 X186.971 Y178.242 E.01709
G1 X77.757 Y69.028 E5.75316
G1 X77.411 Y69.328 E.01707
G1 X186.676 Y178.594 E5.75584
G3 X186.379 Y178.942 I-6.599 J-5.333 E.01708
G1 X77.065 Y69.629 E5.75838
G1 X76.719 Y69.93 E.01707
G1 X186.075 Y179.285 E5.76059
G1 X185.771 Y179.628 E.01706
G1 X76.373 Y70.23 E5.76281
G2 X76.031 Y70.534 I5.639 J6.708 E.01706
G1 X185.466 Y179.969 E5.76477
G1 X185.153 Y180.303 E.01704
G1 X75.693 Y70.843 E5.7661
G1 X75.356 Y71.152 E.01704
G1 X184.841 Y180.638 E5.76744
G1 X184.529 Y180.972 E.01704
G1 X75.022 Y71.465 E5.76859
G1 X74.693 Y71.782 E.01703
G1 X184.217 Y181.307 E5.76947
G1 X183.905 Y181.641 E.01704
G1 X74.364 Y72.1 E5.77036
G1 X74.035 Y72.417 E.01703
M73 P19 R44
G1 X183.59 Y181.972 E5.77105
G1 X183.269 Y182.298 E.01703
G1 X73.707 Y72.735 E5.7715
G1 X73.378 Y73.053 E.01703
G1 X182.949 Y182.624 E5.77194
G3 X182.624 Y182.946 I-6.303 J-6.034 E.01703
G1 X73.054 Y73.376 E5.77187
G1 X72.737 Y73.705 E.01703
G1 X182.295 Y183.263 E5.77127
G1 X181.966 Y183.581 E.01703
G1 X72.419 Y74.034 E5.77068
G1 X72.102 Y74.362 E.01703
G1 X181.638 Y183.898 E5.77008
G1 X181.309 Y184.216 E.01703
M73 P20 R44
G1 X71.784 Y74.691 E5.76949
G1 X71.467 Y75.02 E.01703
G1 X180.98 Y184.533 E5.7689
G3 X180.646 Y184.846 I-6.142 J-6.221 E.01704
G1 X71.156 Y75.356 E5.7677
G1 X70.849 Y75.696 E.01705
G1 X180.309 Y185.155 E5.76606
G1 X179.971 Y185.464 E.01704
G1 X70.543 Y76.036 E5.76443
G1 X70.237 Y76.376 E.01705
G1 X179.629 Y185.768 E5.76251
G1 X179.283 Y186.069 E.01707
G1 X69.93 Y76.716 E5.76043
G1 X69.624 Y77.056 E.01705
G1 X178.937 Y186.369 E5.75834
G1 X178.591 Y186.67 E.01707
G1 X69.323 Y77.402 E5.75596
G1 X69.026 Y77.751 E.01708
G1 X178.245 Y186.971 E5.75343
G1 X177.9 Y187.271 E.01707
G1 X68.728 Y78.1 E5.7509
G2 X68.436 Y78.454 I6.675 J5.784 E.01711
G1 X177.548 Y187.566 E5.74772
G1 X177.193 Y187.858 E.01711
G1 X68.147 Y78.812 E5.7443
G1 X67.858 Y79.169 E.01712
G1 X176.839 Y188.15 E5.74087
G3 X176.48 Y188.438 I-8.4 J-10.111 E.01713
G1 X67.568 Y79.526 E5.73721
G1 X67.279 Y79.883 E.01712
G1 X176.12 Y188.724 E5.73348
G1 X175.76 Y189.01 E.01714
G1 X66.99 Y80.24 E5.72976
G1 X66.709 Y80.605 E.01717
G1 X175.393 Y189.29 E5.72522
G1 X175.024 Y189.567 E.01719
G1 X66.428 Y80.971 E5.7206
G1 X66.147 Y81.336 E.01717
G1 X174.655 Y189.845 E5.71598
G1 X174.287 Y190.123 E.01719
M73 P21 R44
G1 X65.874 Y81.71 E5.71093
G1 X65.602 Y82.084 E.01724
G1 X173.918 Y190.401 E5.70585
G1 X173.549 Y190.679 E.01719
G1 X65.33 Y82.459 E5.70076
G1 X65.057 Y82.833 E.01724
G1 X173.172 Y190.948 E5.69523
G1 X172.795 Y191.217 E.01726
G1 X64.785 Y83.207 E5.68969
G2 X64.515 Y83.583 I7.222 J5.477 E.01726
G1 X172.417 Y191.486 E5.68402
G1 X172.031 Y191.746 E.01735
G1 X64.251 Y83.966 E5.67757
G1 X63.988 Y84.349 E.01731
G1 X171.645 Y192.006 E5.67112
G1 X171.259 Y192.267 E.01735
M73 P21 R43
G1 X63.726 Y84.733 E5.66459
G1 X63.471 Y85.125 E.01741
G1 X170.873 Y192.527 E5.65767
G1 X170.487 Y192.788 E.01735
G1 X63.217 Y85.517 E5.65074
G1 X62.962 Y85.909 E.01741
G1 X170.099 Y193.046 E5.64369
G1 X169.704 Y193.297 E.01744
G1 X62.708 Y86.301 E5.6363
G1 X62.453 Y86.693 E.01741
G1 X169.309 Y193.549 E5.6289
G3 X168.912 Y193.798 I-7.037 J-10.772 E.01747
G1 X62.202 Y87.088 E5.62122
G1 X61.956 Y87.489 E.01751
G1 X168.511 Y194.043 E5.61303
G1 X168.109 Y194.289 E.01751
G1 X61.71 Y87.89 E5.60484
G2 X61.469 Y88.295 I7.631 J4.816 E.01757
G1 X167.705 Y194.531 E5.59625
G1 X167.295 Y194.768 E.01763
G1 X61.233 Y88.705 E5.58712
G1 X60.996 Y89.115 E.01763
G1 X166.885 Y195.004 E5.57799
G1 X166.475 Y195.241 E.01763
M73 P22 R43
G1 X60.759 Y89.525 E5.56886
G1 X60.523 Y89.935 E.01763
G1 X166.066 Y195.477 E5.55974
G1 X165.656 Y195.714 E.01763
G1 X60.286 Y90.344 E5.55061
G2 X60.057 Y90.761 I7.865 J4.602 E.01773
G1 X165.239 Y195.943 E5.54074
G1 X164.82 Y196.171 E.01776
G1 X59.829 Y91.18 E5.53065
G1 X59.602 Y91.599 E.01776
G1 X164.401 Y196.398 E5.52056
G3 X163.976 Y196.62 I-6.23 J-11.442 E.01785
G1 X59.38 Y92.024 E5.50985
G1 X59.159 Y92.449 E.01785
G1 X163.55 Y196.841 E5.4991
G1 X163.125 Y197.062 E.01786
G1 X58.939 Y92.875 E5.48829
G1 X58.727 Y93.31 E.01801
G1 X162.69 Y197.274 E5.47657
G1 X162.256 Y197.486 E.01801
G1 X58.515 Y93.744 E5.46484
G1 X58.303 Y94.179 E.01801
G1 X161.821 Y197.697 E5.45311
G1 X161.387 Y197.909 E.01801
G1 X58.091 Y94.613 E5.44138
G1 X57.879 Y95.048 E.01801
G1 X160.952 Y198.121 E5.42965
G3 X160.513 Y198.328 I-4.208 J-8.367 E.0181
G1 X57.672 Y95.487 E5.41739
G1 X57.47 Y95.932 E.01818
G1 X160.068 Y198.53 E5.40466
G1 X159.624 Y198.733 E.01818
G1 X57.267 Y96.376 E5.39193
G2 X57.072 Y96.827 I8.603 J3.986 E.01832
G1 X159.173 Y198.928 E5.37843
G1 X158.719 Y199.12 E.01836
G1 X56.879 Y97.281 E5.36467
G1 X56.687 Y97.734 E.01836
G1 X158.265 Y199.313 E5.35092
G1 X157.812 Y199.506 E.01836
M73 P23 R43
G1 X56.494 Y98.188 E5.33717
G1 X56.301 Y98.642 E.01836
G1 X157.358 Y199.698 E5.32341
G3 X156.9 Y199.887 I-2.934 J-6.45 E.01844
G1 X56.112 Y99.1 E5.30926
G1 X55.929 Y99.563 E.01856
G1 X156.433 Y200.067 E5.2943
G1 X155.966 Y200.246 E.01864
G1 X55.746 Y100.026 E5.27933
G2 X55.567 Y100.494 I12.701 J5.135 E.01864
M73 P23 R42
G1 X155.499 Y200.425 E5.26416
G1 X155.032 Y200.605 E.01864
G1 X55.391 Y100.964 E5.24882
G1 X55.215 Y101.435 E.01871
G1 X154.565 Y200.784 E5.23348
G3 X154.088 Y200.954 I-3.391 J-8.737 E.01884
G1 X55.048 Y101.914 E5.21719
G1 X54.883 Y102.395 E.01894
G1 X153.611 Y201.123 E5.20075
G3 X153.132 Y201.291 I-3.491 J-9.173 E.01889
G1 X54.717 Y102.876 E5.18428
G1 X54.551 Y103.357 E.01894
G1 X152.644 Y201.449 E5.1673
G1 X152.156 Y201.608 E.01911
G1 X54.386 Y103.837 E5.15032
G2 X54.227 Y104.325 I9.43 J3.337 E.01911
G1 X151.668 Y201.766 E5.13297
G1 X151.18 Y201.925 E.01911
G1 X54.072 Y104.816 E5.11544
G1 X53.916 Y105.307 E.01919
G1 X150.692 Y202.083 E5.09791
G3 X150.191 Y202.228 I-2.349 J-7.169 E.01944
G1 X53.771 Y105.809 E5.07915
G1 X53.627 Y106.311 E.01947
G1 X149.689 Y202.373 E5.06028
G1 X149.186 Y202.517 E.01947
G1 X53.483 Y106.813 E5.04141
G1 X53.339 Y107.316 E.01946
G1 X148.684 Y202.661 E5.02254
G1 X148.181 Y202.805 E.01947
G1 X53.195 Y107.818 E5.00367
G2 X53.06 Y108.33 I9.916 J2.881 E.01972
M73 P24 R42
G1 X147.671 Y202.94 E4.98385
G1 X147.157 Y203.073 E.01976
G1 X52.927 Y108.843 E4.96381
G2 X52.795 Y109.358 I14.01 J3.856 E.01979
G1 X146.642 Y203.204 E4.9436
G1 X146.12 Y203.329 E.01998
G1 X52.67 Y109.879 E4.92272
G1 X52.545 Y110.401 E.01997
G1 X145.599 Y203.454 E4.90183
G3 X145.07 Y203.572 I-2.579 J-10.265 E.02016
G1 X52.428 Y110.93 E4.88018
G1 X52.315 Y111.463 E.0203
G1 X144.537 Y203.686 E4.85806
G1 X144.004 Y203.799 E.0203
G1 X52.201 Y111.996 E4.83594
G1 X52.088 Y112.529 E.0203
G1 X143.471 Y203.912 E4.81382
G1 X142.938 Y204.025 E.02031
G1 X51.975 Y113.062 E4.7917
G2 X51.873 Y113.607 I7.81 J1.74 E.02065
G1 X142.393 Y204.127 E4.76836
G1 X141.843 Y204.224 E.02079
G1 X51.776 Y114.157 E4.74452
G1 X51.679 Y114.706 E.02078
G1 X141.294 Y204.321 E4.72068
G1 X140.744 Y204.418 E.02079
G1 X51.582 Y115.256 E4.69684
G1 X51.485 Y115.805 E.02078
G1 X140.194 Y204.515 E4.673
G3 X139.634 Y204.6 I-1.92 J-10.669 E.02113
G1 X51.4 Y116.367 E4.64793
G1 X51.316 Y116.929 E.02117
G1 X139.071 Y204.684 E4.62275
G3 X138.505 Y204.764 I-2.562 J-16.161 E.02132
G1 X51.236 Y117.495 E4.59711
G1 X51.161 Y118.067 E.02146
G1 X137.933 Y204.839 E4.57098
G3 X137.36 Y204.913 I-1.683 J-10.896 E.02153
G1 X51.087 Y118.64 E4.54465
G1 X51.026 Y119.225 E.02191
G1 X136.775 Y204.974 E4.51707
G1 X136.19 Y205.036 E.02191
G1 X50.964 Y119.81 E4.4895
G1 X50.903 Y120.395 E.02191
G1 X135.605 Y205.097 E4.46192
G1 X135.02 Y205.159 E.02191
M73 P25 R41
G1 X50.841 Y120.98 E4.43435
G2 X50.79 Y121.575 I8.501 J1.028 E.02227
G1 X134.425 Y205.21 E4.40567
G1 X133.821 Y205.252 E.02256
G1 X50.748 Y122.179 E4.37606
G1 X50.706 Y122.783 E.02256
G1 X133.217 Y205.294 E4.34646
G1 X132.612 Y205.336 E.02256
G1 X50.664 Y123.388 E4.31686
G2 X50.623 Y123.993 I8.694 J.888 E.02262
G1 X132.007 Y205.377 E4.28709
G1 X131.382 Y205.399 E.02328
G1 X50.601 Y124.618 E4.25533
G1 X50.579 Y125.243 E.02328
G1 X130.757 Y205.421 E4.22358
G1 X130.133 Y205.442 E.02328
G1 X50.558 Y125.867 E4.19182
G1 X50.536 Y126.492 E.02328
G1 X129.508 Y205.464 E4.16007
G3 X128.871 Y205.474 I-.503 J-12.138 E.02373
G1 X50.526 Y127.129 E4.12703
G1 X50.521 Y127.77 E.02387
G1 X128.23 Y205.479 E4.09357
G3 X127.582 Y205.478 I-.277 J-18.481 E.02414
G1 X50.522 Y128.418 E4.05934
G1 X50.528 Y129.07 E.02429
G1 X126.93 Y205.472 E4.02469
G3 X126.268 Y205.456 I-.031 J-12.644 E.02468
G1 X50.544 Y129.732 E3.98898
G1 X50.567 Y130.402 E.02497
G1 X125.598 Y205.433 E3.95246
G1 X124.928 Y205.41 E.02497
G1 X50.59 Y131.072 E3.91594
G1 X50.614 Y131.742 E.02497
G1 X124.258 Y205.386 E3.87942
G3 X123.579 Y205.353 I.296 J-13.002 E.02535
G1 X50.651 Y132.425 E3.84168
G1 X50.699 Y133.12 E.02595
G1 X122.89 Y205.311 E3.80284
G3 X122.19 Y205.257 I.673 J-13.406 E.02615
G1 X50.748 Y133.815 E3.76341
G1 X50.796 Y134.51 E.02595
G1 X121.482 Y205.195 E3.72353
G1 X120.773 Y205.133 E.02649
G1 X50.863 Y135.223 E3.68272
G1 X50.939 Y135.945 E.02706
G1 X120.065 Y205.071 E3.6414
G3 X119.34 Y204.993 I1.13 J-13.87 E.02715
M73 P26 R41
G1 X51.015 Y136.668 E3.59923
G1 X51.091 Y137.39 E.02706
G1 X118.611 Y204.91 E3.5568
G3 X117.86 Y204.806 I1.621 J-14.438 E.02823
G1 X51.187 Y138.133 E3.51218
G2 X51.287 Y138.879 I21.469 J-2.495 E.02805
G1 X117.108 Y204.7 E3.4673
G1 X116.356 Y204.595 E.02829
G1 X51.4 Y139.639 E3.42169
G2 X51.523 Y140.408 I14.752 J-1.96 E.02902
G1 X115.595 Y204.48 E3.37514
G1 X114.818 Y204.35 E.02932
G1 X51.662 Y141.193 E3.32695
G1 X51.8 Y141.978 E.02969
G1 X114.03 Y204.208 E3.27815
G1 X113.236 Y204.061 E.0301
G1 X51.938 Y142.763 E3.22901
G2 X52.112 Y143.583 I11.943 J-2.099 E.03123
G1 X112.418 Y203.889 E3.17677
G1 X111.597 Y203.714 E.03127
G1 X52.286 Y144.404 E3.12432
G1 X52.461 Y145.225 E.03126
G1 X110.775 Y203.539 E3.07187
G3 X109.932 Y203.342 I3.362 J-16.311 E.03226
G1 X52.658 Y146.068 E3.01708
G2 X52.868 Y146.925 I16.596 J-3.627 E.03289
G1 X109.077 Y203.134 E2.96093
G1 X108.205 Y202.908 E.03355
G1 X53.105 Y147.808 E2.90255
G1 X53.341 Y148.691 E.03404
G1 X107.309 Y202.659 E2.84289
G1 X106.403 Y202.399 E.03512
G1 X53.588 Y149.585 E2.78212
G1 X53.859 Y150.502 E.03563
G1 X105.496 Y202.139 E2.72011
G3 X104.547 Y201.836 I3.855 J-13.727 E.03712
G1 X54.164 Y151.453 E2.65408
G1 X54.474 Y152.41 E.03749
G1 X103.589 Y201.525 E2.58726
G3 X102.625 Y201.207 I5.568 J-18.525 E.03781
G1 X54.794 Y153.376 E2.51963
G1 X55.147 Y154.376 E.03948
G1 X101.625 Y200.853 E2.44832
G3 X100.596 Y200.471 I10.431 J-29.655 E.04087
G1 X55.543 Y155.418 E2.37327
G1 X55.946 Y156.467 E.04184
M73 P26 R40
G1 X99.53 Y200.051 E2.2959
G1 X98.445 Y199.613 E.04358
G1 X56.376 Y157.544 E2.21609
G2 X56.853 Y158.667 I21.033 J-8.265 E.04546
G1 X97.333 Y199.147 E2.13241
G1 X96.168 Y198.629 E.04751
G1 X57.371 Y159.832 E2.0437
G2 X57.906 Y161.013 I22.785 J-9.597 E.04827
G1 X94.987 Y198.094 E1.95338
G3 X93.733 Y197.486 I10.997 J-24.28 E.05195
G1 X58.514 Y162.267 E1.85523
G1 X59.185 Y163.585 E.0551
G1 X92.415 Y196.815 E1.75043
G3 X91.043 Y196.09 I9.686 J-19.987 E.05778
M73 P27 R40
G1 X59.896 Y164.942 E1.64079
G2 X60.705 Y166.398 I42.065 J-22.436 E.06206
G1 X89.593 Y195.286 E1.52174
G3 X88.045 Y194.384 I15.879 J-29.044 E.06674
G1 X61.648 Y167.988 E1.39051
G2 X62.698 Y169.683 I24.811 J-14.179 E.07429
G1 X86.321 Y193.307 E1.24443
G3 X84.448 Y192.08 I33.83 J-53.702 E.0834
G1 X63.929 Y171.561 E1.08091
G1 X65.47 Y173.748 E.09967
G1 X82.213 Y190.492 E.88202
G3 X79.424 Y188.349 I32.875 J-45.68 E.13103
G1 X67.651 Y176.576 E.62018
G2 X70.419 Y179.845 I56.958 J-45.438 E.15956
G1 X72.265 Y181.824 E.10081
G2 X77.119 Y186.691 I281.19 J-275.591 E.25604
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X75.707 Y185.275 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/10
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S153
; open powerlost recovery
M1003 S1
; OBJECT_ID: 15978
M204 S10000
G17
G3 Z.6 I.694 J1 P1  F42000
G1 X200.356 Y98.766 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
M204 S6000
G1 X200.856 Y100.033 E.04516
G3 X115.79 Y50.911 I-72.865 J27.967 E12.74275
G3 X128.201 Y49.952 I12.2 J77.084 E.41334
G3 X199.836 Y97.508 I-.21 J78.047 E3.02068
G1 X200.333 Y98.711 E.04317
M204 S10000
G1 X200.73 Y98.615 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X201.703 Y101.174 E.08412
G3 X52.542 Y149.425 I-73.708 J26.822 E7.74588
G3 X128.204 Y49.56 I75.464 J-21.42 E4.45898
G3 X200.703 Y98.571 I-.209 J78.436 E2.85257
; WIPE_START
M204 S6000
G1 X201.42 Y100.438 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X179.433 Y186.474 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42018
G1 F15000
M204 S6000
G1 X182.959 Y182.949 E.15326
G2 X188.077 Y177.298 I-54.273 J-54.293 E.2345
G1 X177.298 Y188.077 E.46863
G1 X174.782 Y190.059 E.09846
G1 X190.059 Y174.782 E.66418
G2 X191.453 Y172.855 I-58.697 J-43.916 E.07312
G1 X172.855 Y191.453 E.80855
G1 X171.131 Y192.643 E.06441
G1 X192.643 Y171.131 E.93527
G1 X193.631 Y169.609 E.05578
G1 X169.609 Y193.631 E1.04439
G3 X168.191 Y194.516 I-17.605 J-26.643 E.05139
G1 X194.516 Y168.191 E1.14451
G2 X195.29 Y166.883 I-36.975 J-22.772 E.04672
G1 X166.883 Y195.29 E1.23502
G3 X165.684 Y195.956 I-13.356 J-22.653 E.04216
G1 X195.956 Y165.684 E1.31607
G1 X196.619 Y164.487 E.04208
G1 X164.487 Y196.619 E1.39696
G3 X163.374 Y197.199 I-11.553 J-20.829 E.03858
G1 X197.199 Y163.374 E1.47055
G2 X197.712 Y162.327 I-19.735 J-10.331 E.03586
G1 X162.311 Y197.728 E1.53908
G3 X161.289 Y198.216 I-10.425 J-20.497 E.03483
G1 X198.22 Y161.285 E1.6056
G2 X198.682 Y160.29 I-14.021 J-7.111 E.03374
G1 X160.291 Y198.681 E1.66907
G3 X159.31 Y199.128 I-9.267 J-19.017 E.03315
G1 X199.11 Y159.328 E1.73034
G1 X199.539 Y158.366 E.03236
G1 X158.366 Y199.539 E1.78999
G1 X157.471 Y199.9 E.02968
G1 X199.9 Y157.471 E1.84464
G1 X200.262 Y156.576 E.02968
G1 X156.576 Y200.262 E1.89928
G3 X155.689 Y200.616 I-7.187 J-16.744 E.02936
G1 X200.616 Y155.689 E1.95322
G1 X200.934 Y154.837 E.02797
G1 X154.837 Y200.934 E2.00412
G3 X154.005 Y201.232 I-7.978 J-20.95 E.02716
G1 X201.226 Y154.012 E2.05295
G1 X201.506 Y153.198 E.02646
G1 X153.182 Y201.522 E2.1009
G3 X152.39 Y201.78 I-5.646 J-15.947 E.02562
G1 X201.786 Y152.384 E2.14753
G2 X202.048 Y151.589 I-15.067 J-5.394 E.02573
G1 X151.601 Y202.036 E2.19321
G1 X150.811 Y202.292 E.02551
G1 X202.293 Y150.81 E2.23821
G2 X202.52 Y150.05 I-21.715 J-6.894 E.0244
G1 X150.059 Y202.511 E2.2808
G1 X149.311 Y202.726 E.02392
G1 X202.74 Y149.297 E2.32286
G1 X202.935 Y148.568 E.0232
G1 X148.562 Y202.94 E2.36387
G3 X147.826 Y203.143 I-4.253 J-13.983 E.0235
G1 X203.13 Y147.839 E2.40439
G1 X203.325 Y147.11 E.0232
G1 X147.106 Y203.329 E2.44417
G3 X146.402 Y203.501 I-3.618 J-13.364 E.02229
G1 X203.501 Y146.402 E2.48241
G1 X203.661 Y145.708 E.02189
G1 X145.708 Y203.661 E2.51953
G1 X145.014 Y203.821 E.02189
G1 X203.821 Y145.014 E2.55665
G1 X203.981 Y144.321 E.02189
G1 X144.321 Y203.981 E2.59377
G3 X143.645 Y204.123 I-3.046 J-12.819 E.02122
G1 X204.123 Y143.645 E2.62931
G1 X204.259 Y142.975 E.02101
G1 X142.975 Y204.259 E2.66435
G3 X142.323 Y204.378 I-2.6 J-12.41 E.02039
G1 X204.378 Y142.323 E2.69789
G1 X204.492 Y141.675 E.02022
G1 X141.675 Y204.492 E2.73102
G1 X141.027 Y204.607 E.02022
G1 X204.607 Y141.027 E2.76415
G1 X204.721 Y140.38 E.02022
G1 X140.38 Y204.721 E2.79727
G3 X139.745 Y204.822 I-2.239 J-12.044 E.01975
G1 X204.822 Y139.745 E2.82924
G1 X204.915 Y139.118 E.0195
G1 X139.118 Y204.915 E2.86058
G3 X138.501 Y204.999 I-1.909 J-11.748 E.01915
G1 X205.002 Y138.497 E2.89121
G1 X205.083 Y137.883 E.01905
G1 X137.892 Y205.074 E2.92117
G1 X137.284 Y205.148 E.01884
G1 X205.158 Y137.275 E2.95086
G1 X205.221 Y136.678 E.01843
G1 X136.676 Y205.223 E2.98003
G3 X136.069 Y205.296 I-1.692 J-11.49 E.01879
G1 X205.283 Y136.082 E3.00912
G1 X205.346 Y135.486 E.01843
G1 X135.479 Y205.353 E3.03752
G1 X134.889 Y205.41 E.01823
G1 X205.409 Y134.89 E3.06591
G2 X205.453 Y134.312 I-8.251 J-.926 E.01783
G1 X134.312 Y205.453 E3.09292
G1 X133.738 Y205.493 E.01768
G1 X205.493 Y133.738 E3.1196
G1 X205.533 Y133.165 E.01768
G1 X133.165 Y205.533 E3.14629
G1 X132.591 Y205.574 E.01768
G1 X205.574 Y132.591 E3.17297
G2 X205.612 Y132.019 I-8.166 J-.834 E.01762
G1 X132.019 Y205.612 E3.19952
G1 X131.461 Y205.637 E.01717
G1 X205.631 Y131.466 E3.22461
G1 X205.651 Y130.913 E.01701
M73 P28 R40
G1 X130.903 Y205.661 E3.2497
G3 X130.355 Y205.676 I-.551 J-10.452 E.01686
G1 X205.67 Y130.361 E3.27437
G1 X205.689 Y129.808 E.01701
G1 X129.812 Y205.685 E3.29882
G1 X129.269 Y205.695 E.0167
G1 X205.706 Y129.258 E3.32315
G1 X205.71 Y128.719 E.01655
G1 X128.726 Y205.704 E3.34696
G1 X128.183 Y205.714 E.0167
G1 X205.715 Y128.181 E3.37077
G2 X205.714 Y127.649 I-15.247 J-.224 E.01636
G1 X127.649 Y205.714 E3.39391
G1 X127.12 Y205.709 E.01626
G1 X205.709 Y127.12 E3.4167
G2 X205.703 Y126.593 I-10.093 J-.15 E.01622
G1 X126.593 Y205.703 E3.43938
G1 X126.077 Y205.685 E.01586
G1 X205.685 Y126.077 E3.46101
G1 X205.667 Y125.562 E.01586
G1 X125.562 Y205.667 E3.48264
G1 X125.046 Y205.649 E.01586
G1 X205.649 Y125.046 E3.50427
G1 X205.631 Y124.531 E.01586
G1 X124.531 Y205.631 E3.5259
G1 X124.015 Y205.613 E.01586
G1 X205.613 Y124.015 E3.54753
G2 X205.581 Y123.514 I-7.193 J.21 E.01545
G1 X123.514 Y205.581 E3.56793
G1 X123.015 Y205.546 E.01537
G1 X205.546 Y123.015 E3.58809
G1 X205.511 Y122.516 E.01537
G1 X122.516 Y205.511 E3.60825
G1 X122.018 Y205.476 E.01537
G1 X205.476 Y122.018 E3.62842
G1 X205.441 Y121.519 E.01537
G1 X121.519 Y205.441 E3.64858
G3 X121.025 Y205.402 I.512 J-9.437 E.01523
G1 X205.4 Y121.027 E3.66825
G1 X205.349 Y120.544 E.01492
G1 X120.539 Y205.355 E3.6872
G1 X120.052 Y205.308 E.01503
G1 X205.299 Y120.061 E3.70615
G1 X205.248 Y119.579 E.01492
G1 X119.57 Y205.256 E3.72489
G1 X119.091 Y205.202 E.01482
G1 X205.197 Y119.096 E3.7435
G1 X205.146 Y118.613 E.01492
G1 X118.612 Y205.147 E3.76212
G3 X118.143 Y205.083 I.986 J-9.014 E.01457
G1 X205.086 Y118.14 E3.77993
G1 X205.024 Y117.668 E.01462
G1 X117.675 Y205.017 E3.79757
G1 X117.207 Y204.952 E.01452
G1 X204.962 Y117.197 E3.81521
G2 X204.889 Y116.736 I-8.661 J1.13 E.01434
G1 X116.739 Y204.886 E3.83238
G1 X116.271 Y204.82 E.01452
G1 X204.816 Y116.275 E3.84955
G1 X204.744 Y115.815 E.01434
G1 X115.805 Y204.754 E3.86668
G1 X115.347 Y204.677 E.01425
G1 X204.671 Y115.354 E3.88338
G1 X204.598 Y114.893 E.01434
G1 X114.89 Y204.601 E3.90008
G3 X114.435 Y204.523 I1.262 J-8.726 E.01421
G1 X204.523 Y114.434 E3.91663
G1 X204.44 Y113.984 E.01407
G1 X113.988 Y204.436 E3.93243
G1 X113.542 Y204.349 E.01399
G1 X204.356 Y113.534 E3.94822
G2 X204.272 Y113.085 I-12.975 J2.217 E.01404
G1 X113.095 Y204.262 E3.96396
G1 X112.648 Y204.175 E.01399
G1 X204.181 Y112.642 E3.97946
G1 X204.091 Y112.199 E.01391
M73 P28 R39
G1 X112.202 Y204.088 E3.99496
G3 X111.757 Y203.999 I1.056 J-6.393 E.01393
G1 X203.999 Y111.757 E4.01026
G1 X203.899 Y111.324 E.01368
G1 X111.324 Y203.899 E4.02475
G1 X110.891 Y203.799 E.01368
G1 X203.799 Y110.891 E4.03925
G1 X203.699 Y110.457 E.01368
G1 X110.457 Y203.699 E4.05374
G1 X110.024 Y203.599 E.01368
G1 X203.599 Y110.024 E4.06823
G1 X203.499 Y109.59 E.01368
G1 X109.59 Y203.499 E4.08273
G3 X109.158 Y203.397 I1.231 J-6.227 E.01365
G1 X203.397 Y109.158 E4.09712
G1 X203.285 Y108.737 E.01339
G1 X108.737 Y203.285 E4.11051
G1 X108.316 Y203.172 E.01339
G1 X203.172 Y108.316 E4.1239
G1 X203.059 Y107.896 E.01339
G1 X107.896 Y203.059 E4.13729
G1 X107.475 Y202.946 E.01339
G1 X202.946 Y107.475 E4.15068
G1 X202.834 Y107.054 E.01339
G1 X107.054 Y202.834 E4.16408
G1 X106.633 Y202.721 E.01339
G1 X202.721 Y106.633 E4.17747
G2 X202.6 Y106.22 I-7.955 J2.101 E.01322
G1 X106.22 Y202.6 E4.19017
G1 X105.809 Y202.478 E.0132
G1 X202.478 Y105.809 E4.20276
G1 X202.356 Y105.397 E.0132
G1 X105.397 Y202.356 E4.21536
G3 X104.99 Y202.23 I3.399 J-11.696 E.01311
G1 X202.23 Y104.99 E4.22758
G1 X202.102 Y104.584 E.01307
G1 X104.584 Y202.102 E4.23966
G1 X104.179 Y201.974 E.01307
G1 X201.974 Y104.179 E4.25173
G2 X201.842 Y103.778 I-7.728 J2.33 E.01299
G1 X103.778 Y201.842 E4.26341
G1 X103.381 Y201.705 E.0129
G1 X201.705 Y103.381 E4.27472
G1 X201.569 Y102.984 E.0129
G1 X102.984 Y201.569 E4.28603
G1 X102.587 Y201.432 E.0129
G1 X201.432 Y102.587 E4.29735
G1 X201.295 Y102.19 E.0129
G1 X102.19 Y201.295 E4.30866
G1 X101.793 Y201.159 E.0129
G1 X201.159 Y101.793 E4.31997
G2 X201.021 Y101.397 I-7.711 J2.445 E.0129
M73 P29 R39
G1 X101.397 Y201.021 E4.33125
G1 X101.008 Y200.876 E.01275
G1 X200.876 Y101.008 E4.34182
G1 X200.731 Y100.62 E.01275
G1 X100.62 Y200.731 E4.35239
G1 X100.232 Y200.586 E.01275
G1 X200.586 Y100.232 E4.36296
G2 X200.434 Y99.85 I-7.376 J2.711 E.01263
G1 X99.85 Y200.434 E4.37296
G1 X99.47 Y200.281 E.0126
G1 X200.281 Y99.47 E4.3828
G1 X200.127 Y99.09 E.0126
G1 X99.09 Y200.127 E4.39265
G1 X98.71 Y199.974 E.0126
G1 X199.974 Y98.71 E4.40249
G1 X199.82 Y98.33 E.0126
G1 X98.33 Y199.82 E4.41234
G1 X97.95 Y199.666 E.0126
G1 X199.666 Y97.95 E4.42218
G2 X199.511 Y97.572 I-5.502 J2.04 E.01257
G1 X97.572 Y199.511 E4.43187
G1 X97.203 Y199.347 E.01242
G1 X199.347 Y97.203 E4.44078
G1 X199.182 Y96.834 E.01242
G1 X96.834 Y199.182 E4.44968
G1 X96.464 Y199.018 E.01242
G1 X199.018 Y96.464 E4.45858
G1 X198.854 Y96.095 E.01242
G1 X96.095 Y198.854 E4.46749
G1 X95.726 Y198.689 E.01242
G1 X198.689 Y95.726 E4.47639
G1 X198.525 Y95.357 E.01242
G1 X95.357 Y198.525 E4.4853
G3 X94.991 Y198.357 I3.02 J-7.056 E.01237
G1 X198.357 Y94.991 E4.49389
G1 X198.185 Y94.63 E.0123
G1 X94.63 Y198.185 E4.5021
G1 X94.269 Y198.012 E.0123
G1 X198.012 Y94.269 E4.51032
G2 X197.84 Y93.908 I-7.023 J3.143 E.0123
G1 X93.908 Y197.84 E4.51848
G1 X93.555 Y197.659 E.01219
G1 X197.66 Y93.555 E4.52602
G1 X197.479 Y93.201 E.01219
G1 X93.201 Y197.479 E4.53356
G1 X92.848 Y197.299 E.01219
G1 X197.299 Y92.848 E4.54109
G1 X197.119 Y92.494 E.01219
G1 X92.494 Y197.119 E4.54863
G1 X92.141 Y196.939 E.01219
G1 X196.939 Y92.141 E4.55617
G1 X196.759 Y91.788 E.01219
G1 X91.787 Y196.759 E4.5637
G3 X91.436 Y196.577 I3.031 J-6.286 E.01217
G1 X196.577 Y91.436 E4.57106
G1 X196.386 Y91.093 E.01207
G1 X91.091 Y196.389 E4.57779
G1 X90.746 Y196.2 E.01209
G1 X196.196 Y90.75 E4.58452
G1 X196.006 Y90.407 E.01207
G1 X90.401 Y196.012 E4.59126
G3 X90.057 Y195.822 I3.701 J-7.08 E.01207
G1 X195.816 Y90.063 E4.59791
G1 X195.625 Y89.72 E.01206
G1 X89.719 Y195.626 E4.60433
G1 X89.381 Y195.431 E.012
G1 X195.435 Y89.377 E4.61076
G2 X195.242 Y89.036 I-6.587 J3.496 E.01204
G1 X89.043 Y195.235 E4.61708
G1 X88.705 Y195.04 E.012
G1 X195.045 Y88.7 E4.62318
G1 X194.847 Y88.364 E.01198
G1 X88.367 Y194.844 E4.62928
G1 X88.029 Y194.649 E.012
G1 X194.649 Y88.029 E4.63537
G2 X194.447 Y87.697 I-9.62 J5.629 E.01194
G1 X87.697 Y194.447 E4.64103
G1 X87.366 Y194.245 E.01193
G1 X194.245 Y87.366 E4.6466
G1 X194.042 Y87.035 E.01193
G1 X87.035 Y194.042 E4.65217
G3 X86.707 Y193.837 I3.751 J-6.365 E.0119
G1 X193.837 Y86.707 E4.65752
G1 X193.626 Y86.384 E.01186
G1 X86.384 Y193.626 E4.66245
G1 X86.06 Y193.416 E.01186
G1 X193.416 Y86.06 E4.66738
G1 X193.206 Y85.737 E.01186
G1 X85.737 Y193.206 E4.67231
G1 X85.413 Y192.996 E.01186
G1 X192.996 Y85.413 E4.67724
G1 X192.786 Y85.09 E.01186
G1 X85.09 Y192.786 E4.68217
G1 X84.766 Y192.576 E.01186
G1 X192.576 Y84.766 E4.6871
G2 X192.363 Y84.446 I-4.698 J2.891 E.01183
G1 X84.446 Y192.363 E4.69178
G1 X84.132 Y192.143 E.01178
G1 X192.143 Y84.132 E4.69587
G1 X191.924 Y83.818 E.01178
G1 X83.818 Y191.924 E4.69996
G1 X83.504 Y191.704 E.01178
G1 X191.704 Y83.504 E4.70405
G1 X191.484 Y83.191 E.01178
G1 X83.191 Y191.484 E4.70814
G1 X82.877 Y191.265 E.01178
M73 P30 R39
G1 X191.265 Y82.877 E4.71223
G1 X191.045 Y82.563 E.01178
G1 X82.563 Y191.045 E4.71632
G3 X82.251 Y190.824 I4.091 J-6.103 E.01177
G1 X190.824 Y82.251 E4.72027
G1 X190.597 Y81.944 E.01173
G1 X81.944 Y190.597 E4.72373
G1 X81.638 Y190.37 E.01173
G1 X190.37 Y81.638 E4.7272
G1 X190.143 Y81.331 E.01173
G1 X81.331 Y190.143 E4.73067
G3 X81.028 Y189.912 I5.714 J-7.829 E.01171
G1 X189.911 Y81.029 E4.73377
G1 X189.677 Y80.73 E.01168
G1 X80.727 Y189.68 E4.7367
G1 X80.425 Y189.448 E.01169
G1 X189.443 Y80.43 E4.73962
G1 X189.209 Y80.13 E.01168
G1 X80.124 Y189.216 E4.74255
G3 X79.827 Y188.98 I4.637 J-6.147 E.01168
G1 X188.975 Y79.831 E4.7453
G1 X188.741 Y79.531 E.01168
G1 X79.532 Y188.741 E4.74794
G1 X79.237 Y188.502 E.01166
G1 X188.507 Y79.232 E4.75057
G2 X188.269 Y78.936 I-5.756 J4.383 E.01167
G1 X78.943 Y188.263 E4.75304
G1 X78.648 Y188.024 E.01166
G1 X188.028 Y78.644 E4.75537
G1 X187.787 Y78.351 E.01165
G1 X78.354 Y187.785 E4.7577
G1 X78.059 Y187.546 E.01166
G1 X187.546 Y78.059 E4.76003
G2 X187.298 Y77.773 I-5.516 J4.533 E.01163
G1 X77.771 Y187.301 E4.76178
G1 X77.483 Y187.055 E.01163
M73 P30 R38
G1 X187.05 Y77.488 E4.7635
G1 X186.802 Y77.202 E.01163
G1 X77.195 Y186.809 E4.76523
G3 X76.91 Y186.561 I4.606 J-5.575 E.01163
G1 X186.554 Y76.917 E4.76684
G1 X186.306 Y76.631 E.01163
G1 X76.629 Y186.308 E4.76826
G1 X76.349 Y186.055 E.01161
G1 X186.058 Y76.346 E4.76968
G1 X185.81 Y76.061 E.01163
G1 X76.068 Y185.802 E4.77109
G1 X75.787 Y185.55 E.01161
G1 X185.554 Y75.782 E4.7722
G1 X185.297 Y75.506 E.0116
G1 X75.506 Y185.297 E4.77321
G1 X75.226 Y185.044 E.01161
G1 X185.039 Y75.23 E4.77422
G1 X184.782 Y74.954 E.0116
G1 X74.947 Y184.789 E4.77516
G1 X74.675 Y184.527 E.0116
G1 X184.525 Y74.678 E4.77577
G1 X184.267 Y74.402 E.0116
G1 X74.404 Y184.265 E4.77637
G1 X74.132 Y184.003 E.0116
G1 X184.01 Y74.126 E4.77698
G2 X183.748 Y73.854 I-5.312 J4.846 E.0116
G1 X73.861 Y183.741 E4.77741
G1 X73.59 Y183.479 E.0116
G1 X183.484 Y73.585 E4.77771
G1 X183.219 Y73.316 E.0116
G1 X73.318 Y183.217 E4.77802
G1 X73.047 Y182.955 E.0116
G1 X182.955 Y73.047 E4.77832
G1 X182.683 Y72.785 E.0116
G1 X72.782 Y182.686 E4.77802
G1 X72.518 Y182.417 E.0116
G1 X182.412 Y72.522 E4.77772
G1 X182.141 Y72.26 E.0116
G1 X72.253 Y182.148 E4.77741
G3 X71.992 Y181.876 I5.07 J-5.139 E.0116
G1 X181.869 Y71.998 E4.77699
G1 X181.598 Y71.736 E.0116
G1 X71.734 Y181.6 E4.77638
G1 X71.477 Y181.323 E.0116
G1 X181.326 Y71.474 E4.77577
G1 X181.055 Y71.212 E.0116
G1 X71.219 Y181.047 E4.77516
G1 X70.962 Y180.771 E.0116
G1 X180.778 Y70.955 E4.77431
G1 X180.499 Y70.7 E.01161
G1 X70.705 Y180.495 E4.7734
G1 X70.447 Y180.219 E.0116
G1 X180.221 Y70.445 E4.77249
G2 X179.941 Y70.192 I-4.991 J5.229 E.01161
G1 X70.192 Y179.941 E4.77142
G1 X69.944 Y179.656 E.01163
G1 X179.656 Y69.944 E4.7698
G1 X179.37 Y69.695 E.01163
G1 X69.695 Y179.37 E4.76818
G1 X69.447 Y179.085 E.01163
G1 X179.085 Y69.447 E4.76656
G1 X178.799 Y69.199 E.01163
G1 X69.199 Y178.799 E4.76494
G1 X68.951 Y178.514 E.01163
M73 P31 R38
G1 X178.514 Y68.951 E4.76331
G1 X178.229 Y68.703 E.01163
G1 X68.703 Y178.229 E4.76169
G3 X68.455 Y177.943 I3.909 J-3.638 E.01163
G1 X177.943 Y68.455 E4.76003
G1 X177.648 Y68.216 E.01166
G1 X68.217 Y177.648 E4.75761
G1 X67.978 Y177.353 E.01166
G1 X177.353 Y67.977 E4.75518
G1 X177.059 Y67.739 E.01166
G1 X67.739 Y177.058 E4.75275
G1 X67.5 Y176.763 E.01166
G1 X176.764 Y67.5 E4.75032
G1 X176.47 Y67.261 E.01166
G1 X67.262 Y176.469 E4.74789
G1 X67.023 Y176.174 E.01166
G1 X176.175 Y67.022 E4.74546
G2 X175.878 Y66.786 I-4.931 J5.904 E.01167
G1 X66.784 Y175.879 E4.74291
G3 X66.552 Y175.578 I5.602 J-4.565 E.01169
G1 X175.576 Y66.553 E4.73991
G1 X175.275 Y66.321 E.01169
G1 X66.32 Y175.276 E4.73689
G1 X66.088 Y174.974 E.0117
G1 X174.974 Y66.089 E4.73386
G2 X174.671 Y65.858 I-6.002 J7.577 E.01171
G1 X65.858 Y174.671 E4.73069
G1 X65.632 Y174.364 E.01173
G1 X174.364 Y65.632 E4.72722
G1 X174.058 Y65.405 E.01173
G1 X65.405 Y174.058 E4.72375
G1 X65.178 Y173.751 E.01173
G1 X173.751 Y65.178 E4.72029
G2 X173.439 Y64.956 I-4.373 J5.837 E.01177
G1 X64.956 Y173.439 E4.71634
G1 X64.737 Y173.125 E.01178
G1 X173.125 Y64.737 E4.71225
G1 X172.811 Y64.517 E.01178
G1 X64.517 Y172.811 E4.70816
G1 X64.297 Y172.497 E.01178
G1 X172.497 Y64.297 E4.70407
G1 X172.184 Y64.077 E.01178
G1 X64.077 Y172.184 E4.69998
G1 X63.858 Y171.87 E.01178
G1 X171.87 Y63.858 E4.69589
G1 X171.556 Y63.638 E.01178
G1 X63.638 Y171.556 E4.6918
G3 X63.425 Y171.235 I4.499 J-3.221 E.01183
G1 X171.235 Y63.425 E4.68713
G1 X170.912 Y63.215 E.01186
G1 X63.215 Y170.912 E4.6822
G1 X63.005 Y170.589 E.01186
G1 X170.589 Y63.005 E4.67727
G1 X170.265 Y62.795 E.01186
G1 X62.795 Y170.265 E4.67234
G1 X62.585 Y169.942 E.01186
G1 X169.942 Y62.585 E4.66741
G1 X169.618 Y62.375 E.01186
G1 X62.375 Y169.618 E4.66248
G1 X62.165 Y169.295 E.01186
G1 X169.295 Y62.165 E4.65755
G2 X168.966 Y61.959 I-4.073 J6.147 E.0119
G1 X61.961 Y168.965 E4.65213
G1 X61.761 Y168.631 E.01195
G1 X168.636 Y61.757 E4.64645
G1 X168.305 Y61.554 E.01193
G1 X61.56 Y168.298 E4.64078
G1 X61.36 Y167.965 E.01195
G1 X167.973 Y61.352 E4.63505
G1 X167.635 Y61.157 E.012
G1 X61.16 Y167.632 E4.62906
G1 X60.96 Y167.298 E.01195
G1 X167.297 Y60.961 E4.62307
G1 X166.959 Y60.766 E.012
G1 X60.759 Y166.965 E4.61708
G3 X60.564 Y166.627 I6.362 J-3.896 E.01201
G1 X166.621 Y60.57 E4.61087
G1 X166.283 Y60.375 E.012
G1 X60.371 Y166.286 E4.60455
G1 X60.179 Y165.945 E.01204
G1 X165.945 Y60.179 E4.59824
G2 X165.601 Y59.989 I-4.028 J6.858 E.01207
G1 X59.988 Y165.603 E4.59163
G1 X59.802 Y165.255 E.01213
G1 X165.256 Y59.801 E4.58467
G1 X164.911 Y59.612 E.01209
G1 X59.617 Y164.906 E4.57772
G1 X59.432 Y164.558 E.01213
G1 X164.566 Y59.424 E4.57077
G2 X164.216 Y59.24 I-4.836 J8.763 E.01214
G1 X59.247 Y164.21 E4.56362
G1 X59.062 Y163.861 E.01213
G1 X163.866 Y59.057 E4.55642
G1 X163.515 Y58.875 E.01216
G1 X58.876 Y163.513 E4.54922
G3 X58.694 Y163.162 I6.6 J-3.658 E.01216
G1 X163.161 Y58.695 E4.54179
G1 X162.803 Y58.52 E.01227
G1 X58.516 Y162.806 E4.53391
G1 X58.339 Y162.45 E.01223
M73 P32 R38
G1 X162.444 Y58.345 E4.52604
G1 X162.085 Y58.17 E.01227
G1 X58.161 Y162.094 E4.51817
G3 X57.989 Y161.733 I10.14 J-5.073 E.0123
G1 X161.727 Y57.995 E4.51008
G1 X161.368 Y57.82 E.01227
G1 X57.816 Y161.372 E4.50198
G1 X57.644 Y161.011 E.0123
G1 X161.009 Y57.645 E4.49388
G2 X160.645 Y57.476 I-2.6 J5.121 E.01235
G1 X57.476 Y160.645 E4.48534
G1 X57.312 Y160.276 E.01242
G1 X160.276 Y57.312 E4.47644
G1 X159.907 Y57.147 E.01242
G1 X57.147 Y159.907 E4.46754
G1 X56.983 Y159.538 E.01242
M73 P32 R37
G1 X159.538 Y56.983 E4.45863
G1 X159.168 Y56.819 E.01242
G1 X56.819 Y159.168 E4.44973
G1 X56.654 Y158.799 E.01242
G1 X158.799 Y56.654 E4.44082
G1 X158.43 Y56.49 E.01242
G1 X56.49 Y158.43 E4.43192
G3 X56.334 Y158.052 I5.316 J-2.406 E.01257
G1 X158.052 Y56.334 E4.42224
G1 X157.672 Y56.181 E.0126
G1 X56.181 Y157.672 E4.41239
G1 X56.027 Y157.292 E.0126
G1 X157.292 Y56.027 E4.40255
G1 X156.912 Y55.874 E.0126
G1 X55.874 Y156.912 E4.3927
G1 X55.72 Y156.532 E.0126
G1 X156.532 Y55.72 E4.38286
G1 X156.152 Y55.567 E.0126
G1 X55.567 Y156.152 E4.37301
G3 X55.415 Y155.77 I7.185 J-3.079 E.01263
G1 X155.77 Y55.415 E4.36301
G1 X155.382 Y55.27 E.01275
G1 X55.27 Y155.382 E4.35244
G1 X55.125 Y154.994 E.01275
G1 X154.994 Y55.125 E4.34187
G1 X154.605 Y54.979 E.01275
G1 X54.979 Y154.605 E4.3313
G3 X54.84 Y154.211 I9.976 J-3.743 E.01286
G1 X154.212 Y54.839 E4.32024
G1 X153.818 Y54.7 E.01285
G1 X54.701 Y153.816 E4.30914
G1 X54.563 Y153.422 E.01286
G1 X153.424 Y54.56 E4.29805
G2 X153.024 Y54.427 I-2.827 J7.793 E.01296
G1 X54.426 Y153.025 E4.28662
G1 X54.295 Y152.622 E.01302
G1 X152.621 Y54.296 E4.2748
G1 X152.219 Y54.165 E.01301
G1 X54.164 Y152.219 E4.26298
G1 X54.034 Y151.816 E.01302
G1 X151.816 Y54.034 E4.25116
G1 X151.414 Y53.902 E.01301
G1 X53.903 Y151.413 E4.23935
G1 X53.773 Y151.01 E.01302
G1 X151.012 Y53.771 E4.22753
G2 X150.603 Y53.647 I-2.729 J8.209 E.01314
G1 X53.645 Y150.605 E4.21532
G1 X53.523 Y150.192 E.01321
G1 X150.192 Y53.524 E4.20272
G1 X149.781 Y53.401 E.01318
G1 X53.402 Y149.78 E4.19013
G1 X53.281 Y149.368 E.01321
G1 X149.369 Y53.279 E4.1775
G1 X148.952 Y53.164 E.01333
G1 X53.166 Y148.95 E4.16436
G1 X53.053 Y148.528 E.0134
G1 X148.534 Y53.048 E4.15109
G1 X148.116 Y52.932 E.01333
G1 X52.941 Y148.107 E4.13782
G1 X52.828 Y147.686 E.0134
G1 X147.69 Y52.825 E4.12416
G1 X147.263 Y52.718 E.01352
G1 X52.716 Y147.265 E4.11049
G1 X52.603 Y146.844 E.0134
G1 X146.836 Y52.612 E4.09683
G1 X146.409 Y52.505 E.01352
G1 X52.499 Y146.415 E4.0828
G1 X52.396 Y145.985 E.0136
G1 X145.982 Y52.398 E4.06874
G2 X145.553 Y52.294 I-2.33 J8.665 E.01358
G1 X52.292 Y145.555 E4.05456
G3 X52.195 Y145.118 I11.059 J-2.692 E.01374
G1 X145.117 Y52.196 E4.03984
G1 X144.681 Y52.099 E.01373
G1 X52.099 Y144.681 E4.02506
G1 X52.003 Y144.243 E.01377
G1 X144.245 Y52.001 E4.01029
G2 X143.801 Y51.912 I-1.83 J7.968 E.01393
G1 X51.911 Y143.802 E3.99499
G1 X51.824 Y143.355 E.014
G1 X143.355 Y51.825 E3.97935
G1 X142.908 Y51.738 E.01398
G1 X51.738 Y142.908 E3.9637
G1 X51.651 Y142.461 E.014
G1 X142.462 Y51.651 E3.94806
G1 X142.015 Y51.564 E.01398
G1 X51.564 Y142.014 E3.93241
G1 X51.478 Y141.567 E.014
G1 X141.566 Y51.479 E3.91665
G1 X141.11 Y51.402 E.01422
G1 X51.4 Y141.112 E3.90022
G1 X51.323 Y140.655 E.01425
M73 P33 R37
G1 X140.654 Y51.324 E3.88371
G1 X140.198 Y51.247 E.01422
G1 X51.247 Y140.198 E3.8672
G3 X51.18 Y139.731 I8.927 J-1.513 E.0145
G1 X139.731 Y51.18 E3.84982
G1 X139.264 Y51.114 E.01451
G1 X51.114 Y139.263 E3.83235
G1 X51.049 Y138.796 E.01452
G1 X138.796 Y51.048 E3.81489
G1 X138.329 Y50.982 E.01451
G1 X50.983 Y138.328 E3.79742
G1 X50.917 Y137.86 E.01452
G1 X137.861 Y50.916 E3.77996
G2 X137.388 Y50.856 I-1.452 J9.582 E.01468
G1 X50.853 Y137.39 E3.76214
G1 X50.799 Y136.911 E.01482
G1 X136.91 Y50.8 E3.74373
G1 X136.432 Y50.745 E.01479
G1 X50.744 Y136.432 E3.72532
G3 X50.693 Y135.95 I12.195 J-1.546 E.0149
G1 X135.951 Y50.692 E3.70665
G1 X135.464 Y50.645 E.01503
G1 X50.647 Y135.463 E3.68748
G1 X50.601 Y134.975 E.01506
G1 X134.977 Y50.599 E3.66832
G2 X134.484 Y50.559 I-1.007 J9.398 E.01523
G1 X50.557 Y134.485 E3.64876
G1 X50.523 Y133.986 E.01538
G1 X133.985 Y50.524 E3.62858
G1 X133.486 Y50.489 E.01537
G1 X50.488 Y133.487 E3.60841
G1 X50.454 Y132.988 E.01538
G1 X132.988 Y50.454 E3.58823
G1 X132.489 Y50.419 E.01537
G1 X50.419 Y132.489 E3.56805
G3 X50.387 Y131.988 I7.31 J-.718 E.01545
G1 X131.989 Y50.386 E3.54768
G1 X131.477 Y50.364 E.01573
G1 X50.369 Y131.472 E3.52624
G1 X50.351 Y130.957 E.01586
G1 X130.966 Y50.342 E3.50479
G2 X130.448 Y50.326 I-.57 J10.15 E.01592
G1 X50.333 Y130.441 E3.48307
G1 X50.315 Y129.926 E.01586
G1 X129.924 Y50.316 E3.46107
G1 X129.4 Y50.307 E.01611
G1 X50.297 Y129.41 E3.43907
G3 X50.291 Y128.883 I10.109 J-.38 E.01622
G1 X128.876 Y50.297 E3.41655
G1 X128.352 Y50.288 E.01611
G1 X50.286 Y128.354 E3.39397
G3 X50.285 Y127.822 I15.21 J-.31 E.01636
G1 X127.819 Y50.287 E3.37086
G1 X127.282 Y50.291 E.01651
G1 X50.289 Y127.284 E3.34731
G1 X50.294 Y126.745 E.01655
G1 X126.745 Y50.294 E3.32375
G2 X126.199 Y50.307 I.039 J13.871 E.01678
G1 X50.311 Y126.195 E3.29931
G1 X50.33 Y125.642 E.01701
G1 X125.651 Y50.321 E3.27465
G2 X125.099 Y50.34 I.104 J10.86 E.01701
G1 X50.349 Y125.09 E3.24977
G1 X50.369 Y124.537 E.01701
G1 X124.536 Y50.369 E3.22447
G1 X123.973 Y50.399 E.01732
G1 X50.388 Y123.984 E3.19917
G3 X50.426 Y123.412 I8.223 J.262 E.01762
G1 X123.411 Y50.428 E3.17305
G1 X122.848 Y50.457 E.01732
G1 X50.466 Y122.839 E3.14685
G1 X50.506 Y122.265 E.01768
G1 X122.272 Y50.499 E3.12007
G1 X121.695 Y50.543 E.01781
G1 X50.547 Y121.691 E3.09321
G3 X50.59 Y121.115 I11.05 J.538 E.01778
G1 X121.113 Y50.591 E3.06606
G1 X120.517 Y50.654 E.01843
G1 X50.647 Y120.524 E3.03767
G1 X50.703 Y119.934 E.01823
G1 X119.921 Y50.716 E3.00928
G1 X119.325 Y50.779 E.01843
G1 X50.776 Y119.327 E2.98019
G1 X50.851 Y118.719 E.01884
G1 X118.729 Y50.842 E2.95102
G2 X118.12 Y50.916 I1.123 J11.658 E.01884
G1 X50.926 Y118.111 E2.92133
G1 X51 Y117.503 E.01884
G1 X117.506 Y50.997 E2.89137
G2 X116.882 Y51.087 I1.411 J11.957 E.01938
G1 X51.084 Y116.885 E2.86061
G1 X51.178 Y116.258 E.0195
G1 X116.248 Y51.188 E2.82898
G1 X115.614 Y51.288 E.01973
G1 X51.276 Y115.626 E2.79714
G1 X51.383 Y114.986 E.01997
G1 X114.98 Y51.389 E2.76492
G2 X114.341 Y51.494 I1.695 J12.248 E.01992
G1 X51.496 Y114.339 E2.73224
G1 X51.625 Y113.677 E.02074
G1 X113.686 Y51.616 E2.69817
G2 X113.027 Y51.742 I2.143 J13 E.02065
G1 X51.754 Y113.015 E2.66389
G1 X51.882 Y112.353 E.02074
G1 X112.35 Y51.885 E2.62887
G1 X111.673 Y52.028 E.02127
G1 X52.018 Y111.683 E2.59353
G1 X52.178 Y110.99 E.02189
G1 X110.996 Y52.172 E2.55714
G2 X110.306 Y52.329 I2.836 J14.091 E.02176
G1 X52.338 Y110.296 E2.52017
G1 X52.499 Y109.602 E.02189
G1 X109.606 Y52.495 E2.48278
G2 X108.898 Y52.67 I4.083 J18.08 E.02242
G1 X52.67 Y108.898 E2.44456
G1 X52.856 Y108.178 E.02285
G1 X108.178 Y52.856 E2.40518
G2 X107.442 Y53.059 I3.504 J14.15 E.02349
G1 X53.059 Y107.442 E2.36433
G1 X53.273 Y106.694 E.02392
G1 X106.694 Y53.273 E2.32249
G1 X105.946 Y53.488 E.02392
M73 P33 R36
G1 X53.488 Y105.946 E2.28064
G3 X53.707 Y105.193 I10.889 J2.761 E.0241
G1 X105.193 Y53.707 E2.2384
G1 X104.403 Y53.963 E.02555
G1 X53.963 Y104.403 E2.19288
G1 X54.22 Y103.612 E.02555
G1 X103.612 Y54.22 E2.14735
G1 X102.822 Y54.477 E.02555
G1 X54.477 Y102.822 E2.10183
G3 X54.764 Y102.002 I15.841 J5.078 E.02672
G1 X102.002 Y54.764 E2.05369
G2 X101.164 Y55.068 I5.388 J16.137 E.02741
M73 P34 R36
G1 X55.064 Y101.168 E2.00422
G1 X55.383 Y100.316 E.02797
G1 X100.298 Y55.401 E1.95272
G1 X99.432 Y55.733 E.02851
G1 X55.736 Y99.429 E1.89971
G1 X56.098 Y98.534 E.02968
G1 X98.55 Y56.082 E1.84562
G1 X97.639 Y56.459 E.03031
G1 X56.459 Y97.639 E1.7903
G3 X56.887 Y96.677 I13.683 J5.514 E.03236
G1 X96.677 Y56.887 E1.72989
G1 X95.716 Y57.315 E.03236
G1 X57.315 Y95.715 E1.66947
G3 X57.777 Y94.721 I14.487 J6.114 E.03372
G1 X94.721 Y57.777 E1.60615
G1 X93.679 Y58.285 E.03562
G1 X58.285 Y93.679 E1.53879
G3 X58.798 Y92.632 I20.166 J9.239 E.03585
G1 X92.632 Y58.798 E1.47095
G1 X91.519 Y59.378 E.03857
G1 X59.378 Y91.519 E1.39738
G3 X60.041 Y90.322 I23.253 J12.104 E.04207
G1 X90.323 Y60.041 E1.31652
G2 X89.124 Y60.706 I11.994 J23.032 E.04213
G1 X60.706 Y89.124 E1.23552
G3 X61.481 Y87.816 I33.681 J19.065 E.04676
G1 X87.817 Y61.479 E1.14499
G2 X86.401 Y62.362 I16.608 J28.223 E.05131
G1 X62.358 Y86.405 E1.04527
G1 X63.351 Y84.879 E.05597
G1 X84.883 Y63.346 E.93614
G2 X83.193 Y64.502 I54.263 J81.115 E.06294
G1 X64.541 Y83.155 E.81094
G3 X65.931 Y81.231 I37.454 J25.603 E.07298
G1 X81.231 Y65.931 E.66519
G1 X78.719 Y67.91 E.09831
G1 X67.909 Y78.719 E.46995
G1 X68.465 Y78.046 E.02683
G3 X72.866 Y73.229 I71.042 J60.498 E.20061
G1 X76.589 Y69.506 E.16187
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X75.175 Y70.92 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/10
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; OBJECT_ID: 15978
M204 S10000
G17
G3 Z.8 I-.264 J1.188 P1  F42000
G1 X200.356 Y98.766 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
M204 S6000
G1 X200.855 Y100.033 E.04516
G3 X111.772 Y51.656 I-72.865 J27.968 E12.60739
G3 X128.338 Y49.953 I16.25 J76.661 E.55345
G3 X199.835 Y97.508 I-.348 J78.048 E3.01609
G1 X200.333 Y98.711 E.04317
M204 S10000
G1 X200.719 Y98.619 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X201.229 Y99.889 E.04205
G3 X52.505 Y149.293 I-73.23 J28.11 E7.79277
G3 X128.341 Y49.561 I75.502 J-21.287 E4.45893
G3 X200.204 Y97.352 I-.342 J78.439 E2.80799
G1 X200.697 Y98.564 E.0402
; WIPE_START
M204 S6000
G1 X201.229 Y99.889 E-.54286
G1 X201.425 Y100.426 E-.21714
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X261 Y250 F20000
      M400 P200
      G39 S1
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X186.474 Y76.567 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42018
G1 F15000
M204 S6000
G1 X182.95 Y73.042 E.15323
G2 X177.956 Y68.466 I-57.075 J57.275 E.20829
G1 X177.342 Y67.967 E.02432
G1 X188.077 Y78.702 E.46672
G1 X190.059 Y81.218 E.09845
G1 X174.781 Y65.941 E.66419
G2 X172.855 Y64.547 I-44.413 J59.393 E.07309
G1 X191.461 Y83.154 E.80892
G3 X192.643 Y84.869 I-24.862 J18.395 E.06406
G1 X171.131 Y63.357 E.93526
G1 X169.609 Y62.369 E.05578
G1 X193.631 Y86.391 E1.04439
G3 X194.516 Y87.809 I-26.627 J17.596 E.05139
G1 X168.22 Y61.514 E1.14322
G1 X166.884 Y60.711 E.04794
G1 X195.29 Y89.117 E1.23499
G3 X195.956 Y90.316 I-22.588 J13.32 E.04216
G1 X165.655 Y60.015 E1.31734
G1 X164.516 Y59.409 E.03967
G1 X196.619 Y91.513 E1.39572
G1 X197.173 Y92.601 E.03754
G1 X163.376 Y58.804 E1.46935
G2 X162.306 Y58.267 I-10.803 J20.204 E.03682
G1 X197.728 Y93.689 E1.53999
G3 X198.229 Y94.724 I-19.502 J10.091 E.03537
G1 X161.276 Y57.771 E1.60657
G2 X160.29 Y57.318 I-9.14 J18.609 E.03337
G1 X198.682 Y95.71 E1.66914
G1 X199.11 Y96.672 E.03236
G1 X159.328 Y56.89 E1.72956
G1 X158.366 Y56.461 E.03236
G1 X199.539 Y97.634 E1.78999
G1 X199.9 Y98.529 E.02968
G1 X157.471 Y56.1 E1.84464
G1 X156.576 Y55.738 E.02968
G1 X200.262 Y99.424 E1.89928
G3 X200.616 Y100.311 I-16.743 J7.187 E.02936
G1 X155.689 Y55.384 E1.95322
G1 X154.837 Y55.066 E.02797
G1 X200.934 Y101.163 E2.00412
G3 X201.231 Y101.994 I-19.708 J7.513 E.02711
G1 X154.003 Y54.766 E2.05327
G2 X153.182 Y54.478 I-6.17 J16.312 E.02674
G1 X201.519 Y102.815 E2.10146
G3 X201.782 Y103.611 I-16.485 J5.887 E.0258
G1 X152.39 Y54.22 E2.14733
G1 X151.598 Y53.961 E.02561
G1 X202.037 Y104.4 E2.19285
G1 X202.292 Y105.189 E.02548
G1 X150.815 Y53.712 E2.23799
G1 X150.053 Y53.483 E.02446
G1 X202.517 Y105.947 E2.28089
G1 X202.737 Y106.701 E.02415
G1 X149.295 Y53.259 E2.32343
G1 X148.557 Y53.054 E.02355
G1 X202.938 Y107.435 E2.36427
G1 X203.132 Y108.163 E.02315
G1 X147.829 Y52.86 E2.40434
G1 X147.117 Y52.681 E.02256
G1 X203.326 Y108.89 E2.44373
G3 X203.501 Y109.598 I-10.419 J2.943 E.02242
G1 X146.405 Y52.503 E2.48226
G2 X145.697 Y52.328 I-4.004 J14.71 E.02243
G1 X203.661 Y110.292 E2.52002
G1 X203.821 Y110.986 E.02189
G1 X145.008 Y52.173 E2.55692
G1 X144.319 Y52.018 E.0217
G1 X203.981 Y111.679 E2.59383
G3 X204.123 Y112.355 I-12.816 J3.046 E.02122
G1 X143.65 Y51.882 E2.62909
G1 X142.987 Y51.752 E.02078
G1 X204.259 Y113.025 E2.66385
G3 X204.384 Y113.683 I-18.777 J3.897 E.02059
G1 X142.323 Y51.623 E2.69811
G2 X141.665 Y51.498 I-2.941 J13.709 E.0206
G1 X204.505 Y114.338 E2.73201
G3 X204.611 Y114.977 I-12.163 J2.339 E.01992
G1 X141.022 Y51.388 E2.76458
G1 X140.378 Y51.278 E.02007
G1 X204.711 Y115.611 E2.79692
G1 X204.812 Y116.245 E.01973
G1 X139.749 Y51.182 E2.82864
G1 X139.127 Y51.094 E.0193
G1 X204.912 Y116.879 E2.86003
G3 X205.002 Y117.503 I-11.891 J2.04 E.01938
G1 X138.506 Y51.006 E2.89099
G1 X137.884 Y50.918 E.0193
G1 X205.083 Y118.117 E2.92154
G3 X205.158 Y118.725 I-11.571 J1.732 E.01884
G1 X137.277 Y50.844 E2.95117
G1 X136.673 Y50.773 E.01871
G1 X205.221 Y119.322 E2.98017
G1 X205.283 Y119.918 E.01843
G1 X136.069 Y50.704 E3.00912
G1 X135.479 Y50.647 E.01823
G1 X205.346 Y120.514 E3.03752
G1 X205.409 Y121.11 E.01843
G1 X134.889 Y50.59 E3.06591
G2 X134.312 Y50.547 I-1.117 J11.004 E.01779
G1 X205.453 Y121.688 E3.09292
G1 X205.493 Y122.262 E.01768
G1 X133.738 Y50.507 E3.1196
G1 X133.165 Y50.467 E.01768
G1 X205.533 Y122.835 E3.14629
G1 X205.574 Y123.409 E.01768
G1 X132.591 Y50.426 E3.17297
G2 X132.019 Y50.388 I-1.028 J10.934 E.01764
G1 X205.612 Y123.981 E3.19952
G1 X205.631 Y124.534 E.01701
G1 X131.461 Y50.363 E3.22461
G1 X130.903 Y50.339 E.01717
G1 X205.651 Y125.087 E3.2497
G1 X205.67 Y125.639 E.01701
G1 X130.354 Y50.324 E3.27439
G1 X129.811 Y50.314 E.01672
G1 X205.689 Y126.192 E3.29887
G3 X205.706 Y126.742 I-10.521 J.594 E.01692
G1 X129.267 Y50.304 E3.32323
G1 X128.723 Y50.293 E.01672
G1 X205.71 Y127.281 E3.34707
G1 X205.715 Y127.819 E.01655
G1 X128.183 Y50.287 E3.37075
G1 X127.653 Y50.29 E.01632
G1 X205.712 Y128.35 E3.3937
G1 X205.706 Y128.877 E.01621
G1 X127.122 Y50.293 E3.4165
M73 P35 R36
G2 X126.592 Y50.296 I-.173 J12.717 E.01629
G1 X205.7 Y129.404 E3.43925
G3 X205.688 Y129.925 I-10.885 J.011 E.01604
G1 X126.072 Y50.31 E3.46133
G1 X125.552 Y50.324 E.01599
G1 X205.669 Y130.44 E3.48313
G1 X205.65 Y130.955 E.01584
G1 X125.039 Y50.343 E3.50465
G1 X124.531 Y50.369 E.01562
G1 X205.632 Y131.47 E3.52591
G1 X205.613 Y131.985 E.01584
G1 X124.023 Y50.395 E3.54717
G1 X123.516 Y50.421 E.01562
G1 X205.581 Y132.486 E3.56783
G1 X205.546 Y132.985 E.01537
G1 X123.008 Y50.447 E3.58838
G2 X122.51 Y50.482 I.484 J10.401 E.01536
G1 X205.511 Y133.484 E3.60853
G1 X205.476 Y133.982 E.01537
G1 X122.014 Y50.52 E3.62859
G1 X121.518 Y50.557 E.0153
G1 X205.441 Y134.481 E3.64864
G3 X205.4 Y134.973 I-7.069 J-.347 E.01519
G1 X121.027 Y50.6 E3.66817
G1 X120.544 Y50.651 E.01492
G1 X205.349 Y135.456 E3.68696
G1 X205.299 Y135.939 E.01492
G1 X120.061 Y50.701 E3.70574
G1 X119.579 Y50.752 E.01492
G1 X205.248 Y136.421 E3.72452
G1 X205.197 Y136.904 E.01492
G1 X119.096 Y50.803 E3.74331
G1 X118.613 Y50.854 E.01492
G1 X205.146 Y137.387 E3.76209
G3 X205.086 Y137.86 I-9.061 J-.909 E.01467
G1 X118.14 Y50.914 E3.78006
G1 X117.668 Y50.976 E.01462
G1 X205.024 Y138.332 E3.79786
G1 X204.962 Y138.803 E.01462
G1 X117.197 Y51.038 E3.81566
G2 X116.735 Y51.11 I1.208 J9.229 E.01436
G1 X204.893 Y139.268 E3.83271
G1 X204.824 Y139.732 E.01443
G1 X116.274 Y51.183 E3.84974
G1 X115.813 Y51.255 E.01435
G1 X204.753 Y140.195 E3.86673
G1 X204.673 Y140.649 E.01416
G1 X115.352 Y51.327 E3.8833
G1 X114.891 Y51.4 E.01435
G1 X204.593 Y141.102 E3.89987
G1 X204.513 Y141.556 E.01416
G1 X114.438 Y51.481 E3.91607
G1 X113.987 Y51.563 E.01411
G1 X204.433 Y142.009 E3.93222
G1 X204.353 Y142.463 E.01416
G1 X113.535 Y51.645 E3.94837
G2 X113.086 Y51.729 I1.262 J7.977 E.01406
G1 X204.272 Y142.915 E3.96434
G1 X204.181 Y143.358 E.01391
G1 X112.646 Y51.822 E3.97957
G1 X112.205 Y51.915 E.01384
G1 X204.091 Y143.801 E3.9948
G3 X203.999 Y144.243 I-8.481 J-1.541 E.01386
G1 X111.765 Y52.008 E4.00994
G1 X111.324 Y52.101 E.01384
G1 X203.899 Y144.676 E4.02474
G1 X203.799 Y145.109 E.01368
G1 X110.884 Y52.194 E4.03954
G2 X110.451 Y52.296 I1.899 J9.085 E.01365
G1 X203.699 Y145.543 E4.05399
G1 X203.599 Y145.976 E.01368
G1 X110.02 Y52.398 E4.0684
G1 X109.588 Y52.5 E.01363
G1 X203.499 Y146.41 E4.08281
G3 X203.397 Y146.842 I-6.245 J-1.236 E.01365
G1 X109.158 Y52.602 E4.09713
G1 X108.734 Y52.712 E.01346
G1 X203.285 Y147.263 E4.11066
G1 X203.172 Y147.684 E.01339
G1 X108.31 Y52.822 E4.12419
G1 X107.886 Y52.931 E.01346
G1 X203.059 Y148.104 E4.13771
G1 X202.946 Y148.525 E.01339
G1 X107.471 Y53.05 E4.15086
G1 X107.056 Y53.168 E.01327
G1 X202.834 Y148.946 E4.164
G1 X202.721 Y149.367 E.01339
G1 X106.641 Y53.287 E4.17714
G1 X106.226 Y53.405 E.01327
G1 X202.6 Y149.78 E4.18994
G1 X202.478 Y150.191 E.0132
G1 X105.811 Y53.524 E4.20268
M73 P35 R35
G2 X105.4 Y53.646 I2.347 J8.624 E.01319
G1 X202.356 Y150.603 E4.21525
G3 X202.23 Y151.01 I-11.731 J-3.41 E.01311
G1 X104.993 Y53.773 E4.22745
G1 X104.586 Y53.9 E.0131
G1 X202.102 Y151.416 E4.23958
G1 X201.974 Y151.821 E.01307
G1 X104.179 Y54.026 E4.25171
G2 X103.776 Y54.157 I2.908 J9.68 E.01303
G1 X201.842 Y152.222 E4.26347
G1 X201.705 Y152.619 E.0129
G1 X103.376 Y54.29 E4.27491
G1 X102.976 Y54.424 E.01296
G1 X201.569 Y153.016 E4.28635
G1 X201.432 Y153.413 E.0129
G1 X102.578 Y54.56 E4.29771
G1 X102.184 Y54.699 E.01285
G1 X201.295 Y153.81 E4.3089
G1 X201.159 Y154.207 E.0129
G1 X101.79 Y54.839 E4.32009
G2 X101.397 Y54.979 I2.477 J7.584 E.01284
G1 X201.021 Y154.603 E4.33124
G1 X200.876 Y154.992 E.01275
G1 X101.011 Y55.127 E4.34169
G1 X100.626 Y55.275 E.0127
G1 X200.731 Y155.38 E4.35213
G1 X200.586 Y155.768 E.01275
G1 X100.24 Y55.423 E4.36258
G1 X99.855 Y55.571 E.0127
G1 X200.434 Y156.15 E4.37275
G1 X200.281 Y156.53 E.0126
G1 X99.469 Y55.719 E4.38283
M73 P36 R35
G1 X99.084 Y55.867 E.0127
G1 X200.127 Y156.91 E4.39292
G1 X199.974 Y157.29 E.0126
G1 X98.704 Y56.02 E4.40277
G1 X98.329 Y56.179 E.01251
G1 X199.82 Y157.67 E4.41238
G1 X199.666 Y158.05 E.0126
G1 X97.955 Y56.338 E4.42199
G1 X97.58 Y56.497 E.01251
G1 X199.512 Y158.429 E4.43154
G1 X199.35 Y158.8 E.01247
G1 X97.205 Y56.656 E4.44079
G1 X96.831 Y56.815 E.01251
G1 X199.188 Y159.172 E4.45005
G1 X199.027 Y159.544 E.01246
G1 X96.456 Y56.974 E4.4593
G2 X96.088 Y57.14 I2.978 J7.109 E.01241
G1 X198.858 Y159.909 E4.46798
G1 X198.689 Y160.273 E.01234
G1 X95.722 Y57.307 E4.47654
G1 X95.355 Y57.474 E.01238
G1 X198.519 Y160.637 E4.4851
G1 X198.349 Y161.001 E.01234
G1 X94.993 Y57.644 E4.4935
G1 X94.634 Y57.819 E.01227
G1 X198.18 Y161.365 E4.50171
G1 X198.01 Y161.729 E.01234
G1 X94.275 Y57.994 E4.50993
G1 X93.917 Y58.169 E.01227
G1 X197.84 Y162.092 E4.51811
G1 X197.659 Y162.445 E.01219
G1 X93.558 Y58.344 E4.52588
G1 X93.199 Y58.519 E.01227
G1 X197.479 Y162.799 E4.53364
G1 X197.299 Y163.152 E.01219
G1 X92.841 Y58.694 E4.5414
G2 X92.487 Y58.874 I3.26 J6.841 E.0122
G1 X197.119 Y163.506 E4.54894
G1 X196.939 Y163.859 E.01219
G1 X92.136 Y59.056 E4.55637
G1 X91.785 Y59.239 E.01216
G1 X196.759 Y164.212 E4.56379
G3 X196.577 Y164.564 I-5.14 J-2.447 E.01217
G1 X91.436 Y59.423 E4.57104
G1 X91.093 Y59.614 E.01207
G1 X196.386 Y164.907 E4.57769
G1 X196.196 Y165.25 E.01207
G1 X90.75 Y59.804 E4.58434
G1 X90.407 Y59.994 E.01207
G1 X196.006 Y165.593 E4.59099
G1 X195.816 Y165.937 E.01207
G1 X90.063 Y60.184 E4.59764
G1 X89.72 Y60.375 E.01207
G1 X195.625 Y166.28 E4.6043
G1 X195.435 Y166.623 E.01207
G1 X89.377 Y60.565 E4.61095
G2 X89.036 Y60.758 I3.502 J6.598 E.01204
G1 X195.242 Y166.964 E4.6174
G1 X195.045 Y167.3 E.01198
G1 X88.7 Y60.955 E4.62339
G1 X88.364 Y61.153 E.01198
G1 X194.847 Y167.636 E4.62939
G1 X194.649 Y167.971 E.01198
G1 X88.029 Y61.351 E4.63539
G2 X87.697 Y61.553 I5.627 J9.618 E.01194
G1 X194.447 Y168.303 E4.64103
G1 X194.245 Y168.634 E.01193
G1 X87.366 Y61.755 E4.6466
G1 X87.035 Y61.958 E.01193
G1 X194.042 Y168.965 E4.65217
G3 X193.837 Y169.293 I-6.377 J-3.759 E.0119
G1 X86.707 Y62.163 E4.65752
G1 X86.383 Y62.373 E.01186
G1 X193.626 Y169.616 E4.66247
G1 X193.416 Y169.94 E.01186
G1 X86.059 Y62.583 E4.66741
G1 X85.736 Y62.792 E.01186
G1 X193.206 Y170.263 E4.67236
G1 X192.996 Y170.587 E.01186
G1 X85.412 Y63.002 E4.67731
G1 X85.088 Y63.212 E.01186
G1 X192.786 Y170.91 E4.68225
G1 X192.576 Y171.234 E.01186
G1 X84.765 Y63.423 E4.68715
G1 X84.448 Y63.639 E.0118
G1 X192.363 Y171.554 E4.69167
G1 X192.143 Y171.868 E.01178
G1 X84.131 Y63.856 E4.69591
G1 X83.814 Y64.072 E.0118
G1 X191.924 Y172.182 E4.70015
G1 X191.704 Y172.496 E.01178
G1 X83.497 Y64.288 E4.70438
G2 X83.184 Y64.509 I5.118 J7.581 E.01177
G1 X191.484 Y172.809 E4.70843
G1 X191.265 Y173.123 E.01178
G1 X82.873 Y64.731 E4.71241
G1 X82.561 Y64.953 E.01176
G1 X191.045 Y173.437 E4.7164
G3 X190.824 Y173.749 I-6.083 J-4.077 E.01177
G1 X82.251 Y65.176 E4.72027
G1 X81.944 Y65.403 E.01173
G1 X190.597 Y174.056 E4.72373
G1 X190.37 Y174.362 E.01173
G1 X81.638 Y65.63 E4.7272
G1 X81.331 Y65.857 E.01173
G1 X190.143 Y174.669 E4.73067
M73 P37 R35
G3 X189.911 Y174.971 I-5.891 J-4.281 E.0117
G1 X81.029 Y66.089 E4.73372
G1 X80.73 Y66.323 E.01168
G1 X189.677 Y175.27 E4.73657
G1 X189.443 Y175.57 E.01168
G1 X80.43 Y66.557 E4.73942
G1 X80.13 Y66.791 E.01168
G1 X189.209 Y175.87 E4.74226
G1 X188.975 Y176.169 E.01168
G1 X79.831 Y67.025 E4.74511
G1 X79.531 Y67.259 E.01168
G1 X188.741 Y176.469 E4.74796
G1 X188.507 Y176.768 E.01168
G1 X79.232 Y67.493 E4.75081
G2 X78.936 Y67.731 I4.395 J5.771 E.01167
G1 X188.269 Y177.064 E4.75333
G1 X188.028 Y177.356 E.01165
G1 X78.644 Y67.972 E4.75557
G1 X78.351 Y68.213 E.01165
G1 X187.787 Y177.649 E4.7578
G1 X187.546 Y177.941 E.01165
G1 X78.059 Y68.454 E4.76003
G2 X77.773 Y68.702 I4.566 J5.554 E.01163
G1 X187.298 Y178.227 E4.76168
G1 X187.05 Y178.512 E.01163
G1 X77.488 Y68.95 E4.7633
G1 X77.202 Y69.198 E.01163
G1 X186.802 Y178.798 E4.76493
G1 X186.554 Y179.083 E.01163
G1 X76.917 Y69.446 E4.76655
G1 X76.631 Y69.694 E.01163
G1 X186.306 Y179.369 E4.76817
G1 X186.058 Y179.654 E.01163
G1 X76.346 Y69.942 E4.76979
G1 X76.061 Y70.19 E.01163
G1 X185.81 Y179.939 E4.77141
G3 X185.556 Y180.219 I-5.485 J-4.711 E.01161
G1 X75.782 Y70.446 E4.77248
G1 X75.506 Y70.703 E.0116
G1 X185.301 Y180.498 E4.7734
G1 X185.046 Y180.776 E.01161
G1 X75.23 Y70.961 E4.77431
G1 X74.954 Y71.218 E.0116
G1 X184.789 Y181.053 E4.77516
G1 X184.527 Y181.325 E.0116
G1 X74.678 Y71.475 E4.77577
G1 X74.402 Y71.733 E.0116
G1 X184.265 Y181.596 E4.77637
G1 X184.003 Y181.868 E.0116
G1 X74.126 Y71.99 E4.77698
M73 P37 R34
G2 X73.854 Y72.252 I4.871 J5.336 E.0116
G1 X183.741 Y182.139 E4.77741
G1 X183.479 Y182.41 E.0116
G1 X73.585 Y72.516 E4.77771
G1 X73.316 Y72.781 E.0116
G1 X183.217 Y182.682 E4.77802
G1 X182.955 Y182.953 E.0116
G1 X73.046 Y73.046 E4.77832
G1 X72.782 Y73.314 E.01155
G1 X182.683 Y183.215 E4.77802
G1 X182.412 Y183.478 E.0116
G1 X72.518 Y73.583 E4.77772
G1 X72.253 Y73.852 E.0116
G1 X182.141 Y183.74 E4.77741
G1 X181.869 Y184.002 E.0116
G1 X71.992 Y74.124 E4.77699
G1 X71.734 Y74.4 E.0116
G1 X181.598 Y184.264 E4.77638
G1 X181.326 Y184.526 E.0116
G1 X71.477 Y74.677 E4.77577
G1 X71.219 Y74.953 E.0116
G1 X181.055 Y184.788 E4.77516
G3 X180.778 Y185.045 I-5.046 J-5.173 E.01161
G1 X70.962 Y75.229 E4.77431
G1 X70.705 Y75.505 E.0116
G1 X180.499 Y185.3 E4.7734
G1 X180.221 Y185.555 E.01161
G1 X70.447 Y75.781 E4.77249
G2 X70.192 Y76.059 I3.85 J3.792 E.01161
G1 X179.941 Y185.808 E4.77142
G1 X179.656 Y186.056 E.01163
G1 X69.944 Y76.344 E4.7698
G1 X69.695 Y76.63 E.01163
G1 X179.37 Y186.305 E4.76818
G1 X179.085 Y186.553 E.01163
G1 X69.447 Y76.915 E4.76656
G1 X69.199 Y77.201 E.01163
G1 X178.799 Y186.801 E4.76494
G1 X178.514 Y187.049 E.01163
G1 X68.951 Y77.486 E4.76331
G1 X68.703 Y77.771 E.01163
G1 X178.229 Y187.297 E4.76169
G3 X177.943 Y187.545 I-3.723 J-4.007 E.01163
G1 X68.455 Y78.057 E4.76003
G1 X68.217 Y78.352 E.01166
G1 X177.648 Y187.783 E4.7576
G1 X177.353 Y188.022 E.01166
G1 X67.978 Y78.647 E4.75516
G1 X67.739 Y78.942 E.01166
G1 X177.058 Y188.261 E4.75272
M73 P38 R34
G1 X176.764 Y188.5 E.01166
G1 X67.5 Y79.236 E4.75028
G1 X67.262 Y79.531 E.01166
G1 X176.469 Y188.738 E4.74784
G1 X176.174 Y188.977 E.01166
G1 X67.023 Y79.826 E4.74541
G1 X66.784 Y80.121 E.01166
G1 X175.879 Y189.216 E4.74297
G3 X175.578 Y189.448 I-4.574 J-5.614 E.01169
G1 X66.552 Y80.422 E4.73998
G1 X66.32 Y80.724 E.0117
G1 X175.276 Y189.68 E4.73693
G1 X174.974 Y189.912 E.0117
G1 X66.088 Y81.026 E4.73388
G2 X65.859 Y81.33 I5.7 J4.534 E.01171
G1 X174.671 Y190.142 E4.73065
G1 X174.364 Y190.368 E.01173
G1 X65.635 Y81.639 E4.72708
G1 X65.41 Y81.948 E.01174
G1 X174.058 Y190.595 E4.72351
G1 X173.751 Y190.822 E.01173
G1 X65.186 Y82.257 E4.71994
G1 X64.961 Y82.566 E.01174
G1 X173.439 Y191.044 E4.71613
G1 X173.125 Y191.263 E.01178
G1 X64.737 Y82.875 E4.71225
G1 X64.512 Y83.184 E.01174
G1 X172.811 Y191.483 E4.70837
G1 X172.497 Y191.703 E.01178
G1 X64.289 Y83.495 E4.70442
G1 X64.072 Y83.811 E.0118
G1 X172.184 Y191.923 E4.70022
G1 X171.87 Y192.142 E.01178
G1 X63.855 Y84.127 E4.69603
G1 X63.637 Y84.443 E.0118
G1 X171.556 Y192.362 E4.69183
G3 X171.235 Y192.575 I-3.21 J-4.481 E.01183
G1 X63.425 Y84.765 E4.68713
G1 X63.215 Y85.088 E.01186
G1 X170.912 Y192.785 E4.6822
G1 X170.589 Y192.995 E.01186
G1 X63.005 Y85.411 E4.67727
G1 X62.795 Y85.735 E.01186
G1 X170.265 Y193.205 E4.67234
G1 X169.942 Y193.415 E.01186
G1 X62.585 Y86.058 E4.66741
G1 X62.375 Y86.382 E.01186
G1 X169.618 Y193.625 E4.66248
G1 X169.295 Y193.835 E.01186
G1 X62.165 Y86.705 E4.65755
G2 X61.961 Y87.035 I4.616 J3.077 E.01192
G1 X168.966 Y194.041 E4.65213
G1 X168.636 Y194.243 E.01193
G1 X61.761 Y87.369 E4.64645
G1 X61.56 Y87.702 E.01195
G1 X168.305 Y194.446 E4.64078
G3 X167.973 Y194.648 I-5.938 J-9.38 E.01194
G1 X61.36 Y88.035 E4.63507
G1 X61.16 Y88.368 E.01195
G1 X167.637 Y194.846 E4.62917
G1 X167.302 Y195.044 E.01198
G1 X60.96 Y88.702 E4.62328
G1 X60.759 Y89.035 E.01195
G1 X166.966 Y195.241 E4.61739
G3 X166.625 Y195.434 I-3.848 J-6.411 E.01204
G1 X60.564 Y89.373 E4.61106
G1 X60.371 Y89.714 E.01204
G1 X166.282 Y195.624 E4.60452
G1 X165.939 Y195.815 E.01207
G1 X60.179 Y90.055 E4.59797
G2 X59.988 Y90.397 I6.45 J3.825 E.01206
G1 X165.595 Y196.005 E4.59136
G1 X165.252 Y196.195 E.01207
G1 X59.802 Y90.745 E4.58449
G1 X59.617 Y91.094 E.01213
G1 X164.909 Y196.385 E4.57762
G1 X164.565 Y196.576 E.01207
G1 X59.432 Y91.442 E4.57075
G1 X59.247 Y91.79 E.01213
G1 X164.216 Y196.76 E4.56362
G1 X163.866 Y196.943 E.01216
G1 X59.062 Y92.139 E4.55642
G1 X58.876 Y92.487 E.01213
G1 X163.515 Y197.125 E4.54922
G3 X163.161 Y197.305 I-3.617 J-6.667 E.0122
G1 X58.694 Y92.838 E4.54179
G1 X58.516 Y93.194 E.01223
G1 X162.803 Y197.48 E4.53391
G1 X162.444 Y197.655 E.01227
G1 X58.339 Y93.55 E4.52604
G1 X58.161 Y93.906 E.01223
G1 X162.085 Y197.83 E4.51817
G1 X161.727 Y198.005 E.01227
G1 X57.991 Y94.269 E4.50999
G1 X57.821 Y94.632 E.01234
G1 X161.368 Y198.18 E4.50179
G1 X161.009 Y198.355 E.01227
G1 X57.651 Y94.996 E4.49359
G1 X57.481 Y95.359 E.01234
G1 X160.645 Y198.524 E4.48515
M73 P39 R34
G1 X160.276 Y198.688 E.01242
G1 X57.31 Y95.723 E4.47649
G1 X57.14 Y96.086 E.01234
G1 X159.907 Y198.853 E4.46783
G1 X159.538 Y199.017 E.01242
G1 X56.978 Y96.457 E4.45886
G1 X56.815 Y96.828 E.01245
G1 X159.168 Y199.181 E4.44988
G1 X158.799 Y199.346 E.01242
G1 X56.652 Y97.199 E4.44091
G1 X56.489 Y97.57 E.01245
G1 X158.43 Y199.51 E4.43193
G3 X158.052 Y199.666 I-2.415 J-5.338 E.01257
G1 X56.334 Y97.948 E4.42224
G1 X56.181 Y98.328 E.0126
G1 X157.672 Y199.819 E4.41239
G1 X157.292 Y199.973 E.0126
G1 X56.027 Y98.708 E4.40255
G1 X55.874 Y99.088 E.0126
G1 X156.912 Y200.126 E4.3927
G1 X156.532 Y200.28 E.0126
G1 X55.72 Y99.468 E4.38286
G1 X55.567 Y99.848 E.0126
G1 X156.152 Y200.433 E4.37301
G3 X155.77 Y200.585 I-3.085 J-7.201 E.01263
G1 X55.415 Y100.23 E4.36302
G1 X55.27 Y100.618 E.01275
G1 X155.382 Y200.73 E4.35244
G1 X154.994 Y200.875 E.01275
G1 X55.125 Y101.006 E4.34187
M73 P39 R33
G1 X54.979 Y101.395 E.01274
G1 X154.605 Y201.021 E4.3313
G3 X154.209 Y201.158 I-2.779 J-7.387 E.0129
G1 X54.839 Y101.788 E4.32015
G1 X54.7 Y102.182 E.01285
G1 X153.812 Y201.294 E4.30896
G1 X153.415 Y201.431 E.0129
G1 X54.56 Y102.576 E4.29778
G2 X54.427 Y102.976 I7.56 J2.745 E.01297
G1 X153.018 Y201.568 E4.28633
G1 X152.621 Y201.704 E.0129
G1 X54.296 Y103.379 E4.27476
G1 X54.165 Y103.782 E.01302
G1 X152.225 Y201.841 E4.26319
G3 X151.824 Y201.974 I-2.729 J-7.585 E.01298
G1 X54.034 Y104.184 E4.25145
G1 X53.904 Y104.587 E.01302
G1 X151.418 Y202.102 E4.2395
G1 X151.012 Y202.229 E.01308
G1 X53.773 Y104.99 E4.22755
G2 X53.645 Y105.396 I5.749 J2.027 E.01309
G1 X150.605 Y202.355 E4.21537
G1 X150.192 Y202.476 E.01322
G1 X53.526 Y105.81 E4.20259
G1 X53.407 Y106.225 E.01326
G1 X149.779 Y202.597 E4.18982
G1 X149.366 Y202.717 E.01322
G1 X53.289 Y106.64 E4.17704
G1 X53.17 Y107.054 E.01326
G1 X148.951 Y202.835 E4.16413
G1 X148.529 Y202.947 E.0134
G1 X53.051 Y107.469 E4.15099
G1 X52.932 Y107.884 E.01326
G1 X148.108 Y203.06 E4.13784
G1 X147.687 Y203.172 E.0134
G1 X52.822 Y108.307 E4.1243
G1 X52.713 Y108.731 E.01346
G1 X147.266 Y203.284 E4.11075
G1 X146.844 Y203.397 E.0134
G1 X52.603 Y109.155 E4.09721
G2 X52.499 Y109.585 I12.291 J3.201 E.01359
G1 X146.412 Y203.498 E4.08294
G1 X145.979 Y203.598 E.01368
G1 X52.396 Y110.015 E4.06858
G1 X52.292 Y110.445 E.0136
G1 X145.545 Y203.698 E4.05423
G1 X145.112 Y203.798 E.01368
G1 X52.197 Y110.883 E4.03954
G1 X52.103 Y111.323 E.01382
G1 X144.678 Y203.898 E4.02478
G1 X144.245 Y203.998 E.01368
G1 X52.009 Y111.762 E4.01002
G1 X51.915 Y112.202 E.01382
G1 X143.804 Y204.091 E3.99492
G1 X143.36 Y204.181 E.01391
G1 X51.821 Y112.641 E3.97973
G2 X51.732 Y113.086 I9.22 J2.077 E.01394
G1 X142.917 Y204.271 E3.96433
G3 X142.465 Y204.353 I-1.792 J-8.585 E.01411
G1 X51.647 Y113.535 E3.94838
G1 X51.562 Y113.983 E.01404
G1 X142.012 Y204.433 E3.93235
G1 X141.558 Y204.513 E.01416
G1 X51.478 Y114.432 E3.91631
G2 X51.4 Y114.888 I10.832 J2.085 E.01421
G1 X141.105 Y204.593 E3.89998
G1 X140.651 Y204.673 E.01416
G1 X51.323 Y115.345 E3.88359
G1 X51.247 Y115.802 E.01425
G1 X140.198 Y204.753 E3.86719
G3 X139.731 Y204.82 I-1.2 J-6.698 E.01449
G1 X51.177 Y116.266 E3.84995
G1 X51.107 Y116.73 E.01443
G1 X139.263 Y204.886 E3.83263
G1 X138.796 Y204.951 E.01452
G1 X51.038 Y117.194 E3.8153
G1 X50.98 Y117.669 E.01472
G1 X138.328 Y205.017 E3.7975
G1 X137.86 Y205.083 E.01452
G1 X50.922 Y118.144 E3.7797
M73 P40 R33
G1 X50.863 Y118.62 E.01472
G1 X137.39 Y205.147 E3.76182
G1 X136.911 Y205.201 E.01482
G1 X50.805 Y119.095 E3.74353
G1 X50.747 Y119.57 E.01472
G1 X136.432 Y205.256 E3.72524
G3 X135.951 Y205.308 I-1.723 J-13.747 E.01489
G1 X50.692 Y120.049 E3.70666
G1 X50.645 Y120.536 E.01503
G1 X135.464 Y205.355 E3.68754
G1 X134.977 Y205.401 E.01503
G1 X50.599 Y121.023 E3.66842
G2 X50.559 Y121.516 I9.402 J1.007 E.01523
G1 X134.484 Y205.441 E3.64869
G1 X133.985 Y205.476 E.01537
G1 X50.524 Y122.015 E3.62853
G1 X50.489 Y122.514 E.01537
G1 X133.486 Y205.511 E3.60836
G1 X132.988 Y205.546 E.01537
G1 X50.454 Y123.012 E3.5882
G1 X50.419 Y123.511 E.01537
G1 X132.489 Y205.581 E3.56804
G3 X131.988 Y205.613 I-.713 J-7.172 E.01545
G1 X50.387 Y124.012 E3.54765
G1 X50.369 Y124.528 E.01586
G1 X131.472 Y205.631 E3.52602
G1 X130.957 Y205.649 E.01586
G1 X50.351 Y125.043 E3.50439
G1 X50.333 Y125.559 E.01586
G1 X130.441 Y205.667 E3.48276
G1 X129.926 Y205.685 E.01586
G1 X50.315 Y126.074 E3.46113
G1 X50.297 Y126.59 E.01586
G1 X129.41 Y205.703 E3.4395
G3 X128.883 Y205.709 I-.38 J-10.111 E.01622
G1 X50.291 Y127.117 E3.41683
G1 X50.286 Y127.646 E.01626
G1 X128.354 Y205.714 E3.39403
G3 X127.821 Y205.715 I-.288 J-12.76 E.01638
G1 X50.285 Y128.178 E3.37095
G1 X50.289 Y128.716 E.01655
G1 X127.281 Y205.708 E3.34726
G1 X126.741 Y205.701 E.0166
G1 X50.294 Y129.255 E3.32357
G2 X50.311 Y129.805 I10.513 J-.041 E.01692
G1 X126.198 Y205.692 E3.29926
G1 X125.645 Y205.672 E.01703
G1 X50.33 Y130.358 E3.27435
G1 X50.349 Y130.91 E.01701
G1 X125.091 Y205.652 E3.24945
G1 X124.538 Y205.632 E.01703
G1 X50.369 Y131.463 E3.22454
G1 X50.388 Y132.016 E.01701
G1 X123.984 Y205.612 E3.19963
G3 X123.412 Y205.574 I.284 J-8.532 E.01762
G1 X50.425 Y132.587 E3.17315
G1 X50.465 Y133.16 E.01765
G1 X122.839 Y205.534 E3.1465
G1 X122.265 Y205.494 E.01768
G1 X50.504 Y133.733 E3.11985
G1 X50.543 Y134.306 E.01765
G1 X121.691 Y205.453 E3.0932
G3 X121.115 Y205.41 I.539 J-11.059 E.01778
G1 X50.595 Y134.89 E3.0659
G1 X50.649 Y135.478 E.01816
G1 X120.524 Y205.353 E3.03786
G1 X119.934 Y205.297 E.01823
G1 X50.704 Y136.066 E3.00982
G2 X50.771 Y136.667 I14.402 J-1.308 E.01859
G1 X119.333 Y205.229 E2.98077
G1 X118.731 Y205.161 E.01863
G1 X50.839 Y137.269 E2.95161
G2 X50.921 Y137.884 I11.789 J-1.242 E.01906
G1 X118.116 Y205.079 E2.92137
G1 X117.495 Y204.992 E.01927
G1 X51.008 Y138.505 E2.89059
G1 X51.095 Y139.125 E.01927
G1 X116.875 Y204.905 E2.85981
G1 X116.254 Y204.818 E.01927
G1 X51.182 Y139.746 E2.82903
G2 X51.276 Y140.374 I12.028 J-1.48 E.01951
G1 X115.626 Y204.724 E2.79766
G1 X114.986 Y204.617 E.01997
G1 X51.383 Y141.014 E2.76515
G2 X51.496 Y141.66 I13.01 J-1.93 E.02016
G1 X114.341 Y204.505 E2.73222
G1 X113.683 Y204.381 E.02058
G1 X51.623 Y142.321 E2.69807
G1 X51.751 Y142.983 E.0207
G1 X113.025 Y204.257 E2.66392
G3 X112.352 Y204.117 I2.566 J-14.086 E.02113
G1 X51.879 Y143.644 E2.62912
G2 X52.022 Y144.32 I14.203 J-2.647 E.02125
G1 X111.673 Y203.972 E2.5934
G1 X110.995 Y203.827 E.02134
G1 X52.17 Y145.003 E2.55743
G2 X52.325 Y145.691 I16.507 J-3.347 E.02168
G1 X110.309 Y203.675 E2.5209
G1 X109.607 Y203.506 E.0222
G1 X52.494 Y146.393 E2.48305
G2 X52.673 Y147.106 I14.377 J-3.236 E.0226
G1 X108.894 Y203.327 E2.44424
G1 X108.165 Y203.131 E.02319
G1 X52.867 Y147.833 E2.40413
G1 X53.061 Y148.561 E.02315
G1 X107.436 Y202.936 E2.36401
G1 X106.707 Y202.741 E.02319
G1 X53.262 Y149.295 E2.32359
G1 X53.482 Y150.049 E.02415
G1 X105.955 Y202.521 E2.28127
G3 X105.194 Y202.294 I5.062 J-18.329 E.02441
G1 X53.706 Y150.807 E2.23844
G1 X53.962 Y151.596 E.02548
G1 X104.41 Y202.044 E2.19328
G3 X103.625 Y201.792 I4.886 J-16.596 E.02535
G1 X54.217 Y152.384 E2.14805
G2 X54.48 Y153.181 I16.743 J-5.086 E.02579
G1 X102.81 Y201.51 E2.10117
G1 X101.994 Y201.229 E.02652
G1 X54.767 Y154.002 E2.05321
G2 X55.068 Y154.836 I14.827 J-4.868 E.02725
G1 X101.168 Y200.936 E2.00424
G1 X100.316 Y200.617 E.02797
G1 X55.398 Y155.7 E1.95283
G1 X55.728 Y156.563 E.02843
G1 X99.429 Y200.264 E1.89991
G1 X98.534 Y199.902 E.02968
G1 X56.088 Y157.457 E1.84535
G1 X56.459 Y158.361 E.03005
G1 X97.639 Y199.541 E1.7903
G3 X96.677 Y199.113 I5.467 J-13.579 E.03236
G1 X56.887 Y159.323 E1.7299
G1 X57.315 Y160.284 E.03236
G1 X95.716 Y198.685 E1.66947
G3 X94.72 Y198.223 I6.113 J-14.484 E.03373
G1 X57.768 Y161.27 E1.60654
M73 P41 R33
G2 X58.264 Y162.3 I29.754 J-13.701 E.03514
G1 X93.679 Y197.715 E1.53969
G3 X92.632 Y197.202 I9.276 J-20.241 E.03585
G1 X58.8 Y163.37 E1.47086
G1 X59.406 Y164.509 E.03967
G1 X91.519 Y196.623 E1.39614
G3 X90.341 Y195.977 I15.346 J-29.436 E.04131
G1 X60.012 Y165.649 E1.31856
G2 X60.706 Y166.876 I295.826 J-166.471 E.04336
G1 X89.097 Y195.267 E1.23429
G3 X87.817 Y194.521 I14.317 J-26.024 E.04554
G1 X61.509 Y168.213 E1.14374
G2 X62.363 Y169.601 I20.284 J-11.527 E.05009
G1 X86.399 Y193.637 E1.04499
G1 X84.878 Y192.648 E.05578
G1 X63.352 Y171.122 E.93586
M73 P41 R32
G2 X64.541 Y172.845 I25.266 J-16.169 E.06436
G1 X83.155 Y191.459 E.80927
G3 X81.231 Y190.069 I25.604 J-37.456 E.07298
G1 X65.933 Y174.771 E.66509
G2 X67.961 Y177.333 I49.915 J-37.447 E.10046
G1 X78.667 Y188.039 E.46544
G3 X73.136 Y183.041 I46.365 J-56.874 E.22927
G1 X69.506 Y179.411 E.15782
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X70.92 Y180.825 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/10
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S183.6
; OBJECT_ID: 15978
M204 S10000
G17
G3 Z1 I.652 J1.028 P1  F42000
G1 X200.356 Y98.766 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
M204 S6000
G1 X200.855 Y100.033 E.04516
G3 X107.799 Y52.609 I-72.865 J27.968 E12.47182
G3 X128.475 Y49.954 I20.214 J75.576 E.69355
G3 X199.835 Y97.508 I-.485 J78.047 E3.01153
G1 X200.333 Y98.711 E.04317
M204 S10000
G1 X200.719 Y98.619 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X201.221 Y99.892 E.04205
G3 X107.698 Y52.231 I-73.231 J28.109 E11.61071
G3 X128.479 Y49.562 I20.316 J75.956 E.6457
G3 X200.196 Y97.355 I-.489 J78.439 E2.80358
G1 X200.696 Y98.564 E.04019
; WIPE_START
M204 S6000
G1 X201.221 Y99.892 E-.54281
G1 X201.426 Y100.426 E-.21719
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.2 F4000
            G39.3 S1
            G0 Z1.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X202.335 Y105.379 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G3 X202.788 Y106.943 I-29.634 J9.432 E.05402
G1 X106.943 Y202.788 E4.49629
G2 X111.893 Y204.005 I19.026 J-66.753 E.16912
G1 X51.984 Y144.096 E2.81045
G1 X51.733 Y142.86 E.04184
G1 X142.852 Y51.74 E4.27459
G1 X144.096 Y51.985 E.04206
G1 X204.016 Y111.904 E2.81096
G1 X204.267 Y113.14 E.04184
G1 X113.145 Y204.262 E4.27473
G2 X119.815 Y205.269 I20.374 J-112.412 E.22378
G1 X205.259 Y119.825 E4.00835
G1 X205.376 Y120.94 E.0372
G1 X135.057 Y50.621 E3.29881
G3 X136.185 Y50.732 I-1.545 J21.613 E.0376
G1 X50.731 Y136.185 E4.00881
G3 X50.621 Y135.057 I32.29 J-3.711 E.03761
G1 X120.943 Y205.379 E3.29894
G2 X122.567 Y205.5 I3.124 J-30.975 E.05402
M204 S10000
G1 X150.618 Y202.335 F42000
G1 F16200
M204 S6000
G1 X149.052 Y202.784 E.05401
G1 X53.216 Y106.948 E4.49589
G2 X51.995 Y111.893 I77.886 J21.844 E.169
G1 X111.893 Y51.996 E2.80991
G1 X113.141 Y51.733 E.04229
G1 X204.267 Y142.86 E4.27495
G1 X204.016 Y144.096 E.04184
G1 X144.103 Y204.009 E2.81066
G3 X142.852 Y204.26 I-5.954 J-26.451 E.04231
G1 X51.738 Y113.145 E4.27437
G2 X50.731 Y119.815 I112.389 J20.37 E.22378
G1 X136.185 Y205.268 E4.00881
G3 X135.057 Y205.379 I-2.669 J-21.468 E.0376
G1 X205.376 Y135.06 E3.29881
G1 X205.259 Y136.175 E.0372
G1 X119.825 Y50.741 E4.00787
G1 X120.94 Y50.624 E.0372
G1 X50.621 Y120.943 E3.29881
G2 X50.306 Y127.066 I66.599 J6.495 E.20344
G1 X128.926 Y205.686 E3.68821
G3 X127.066 Y205.694 I-1.084 J-35.527 E.06171
G1 X205.694 Y127.066 E3.68859
G3 X205.694 Y128.934 I-53.586 J.934 E.06197
G1 X127.068 Y50.308 E3.6885
G3 X128.929 Y50.311 I.87 J39.561 E.06175
G1 X50.306 Y128.934 E3.68836
G2 X50.352 Y130.562 I31.07 J-.06 E.05402
M204 S10000
G1 X56.671 Y97.2 F42000
G1 F16200
M204 S6000
G1 X57.333 Y95.713 E.05401
G1 X160.287 Y198.667 E4.82979
G2 X165.395 Y196.099 I-49.15 J-104.111 E.18966
G1 X59.901 Y90.605 E4.94892
G2 X59.125 Y92.036 I26.955 J15.541 E.05402
M204 S10000
G1 X63.043 Y170.619 F42000
G1 F16200
M204 S6000
G1 X62.833 Y170.296 E.01276
G1 X85.799 Y193.229 E1.07659
G1 X193.233 Y85.794 E5.03997
G1 X170.201 Y62.771 E1.08028
G1 X62.771 Y170.201 E5.03976
G3 X59.896 Y165.4 I107.003 J-67.324 E.18565
G1 X165.4 Y59.897 E4.94937
G2 X160.287 Y57.333 I-41.24 J75.866 E.18975
G1 X57.333 Y160.287 E4.82979
G2 X58.02 Y161.764 I28.494 J-12.355 E.05402
M204 S10000
G1 X189.079 Y176.012 F42000
G1 F16200
M204 S6000
G2 X190.08 Y174.728 I-23.835 J-19.629 E.05402
G1 X81.272 Y65.92 E5.10444
G2 X77.037 Y69.361 I92.955 J118.699 E.18102
G1 X186.639 Y178.963 E5.14164
G3 X182.943 Y182.943 I-115.145 J-103.19 E.18018
G1 X73.056 Y73.057 E5.15502
G2 X69.361 Y77.037 I63.208 J62.384 E.18019
G1 X178.963 Y186.639 E5.14164
G3 X174.728 Y190.08 I-97.288 J-115.377 E.18102
G1 X65.92 Y81.272 E5.10443
G3 X66.916 Y79.984 I21.529 J15.618 E.05402
M204 S10000
G1 X150.621 Y53.671 F42000
G1 F16200
M204 S6000
G2 X149.059 Y53.209 I-11.297 J35.335 E.05402
G1 X53.21 Y149.058 E4.49649
G2 X55.089 Y154.855 I129.361 J-38.723 E.20217
G1 X154.855 Y55.089 E4.68025
G1 X200.911 Y101.145 E2.16057
G1 X101.145 Y200.911 E4.68026
G1 X55.101 Y154.889 E2.15949
G1 X55.268 Y155.334 E.01578
M204 S10000
G1 X197.978 Y161.762 F42000
G1 F16200
M204 S6000
G1 X198.666 Y160.286 E.05401
G1 X95.713 Y57.333 E4.82975
G2 X90.605 Y59.901 I49.152 J104.117 E.18966
G1 X196.099 Y165.395 E4.94892
G3 X193.229 Y170.201 I-68.466 J-37.622 E.18573
G1 X85.797 Y62.769 E5.03984
G1 X62.769 Y85.797 E1.08028
G1 X170.201 Y193.229 E5.03985
G1 X193.167 Y170.296 E1.0766
G1 X192.957 Y170.619 E.01276
M204 S10000
G1 X202.335 Y150.621 F42000
G1 F16200
M204 S6000
G2 X202.788 Y149.057 I-29.631 J-9.431 E.05402
G1 X106.942 Y53.21 E4.49636
G2 X101.147 Y55.091 I36.796 J123.237 E.20212
G1 X200.911 Y154.855 E4.68016
G1 X154.855 Y200.911 E2.16057
G1 X55.089 Y101.145 E4.68025
G1 X101.106 Y55.106 E2.15926
M73 P42 R32
G1 X100.669 Y55.274 E.01554
M204 S10000
G1 X189.079 Y79.988 F42000
G1 F16200
M204 S6000
G3 X190.08 Y81.272 I-23.993 J19.753 E.05402
G1 X81.272 Y190.08 E5.10444
G3 X77.037 Y186.639 I93.018 J-118.774 E.18102
G1 X186.639 Y77.037 E5.14164
G2 X182.943 Y73.057 I-53.563 J46.02 E.18022
G1 X73.057 Y182.943 E5.15502
G3 X69.361 Y178.963 I63.183 J-62.361 E.1802
G1 X178.963 Y69.361 E5.14164
G2 X174.728 Y65.92 I-97.267 J115.351 E.18102
G1 X65.92 Y174.728 E5.10444
G2 X66.915 Y176.017 I84.257 J-64.062 E.05401
M204 S10000
G1 X195.309 Y89.181 F42000
G1 F16200
M204 S6000
G1 X196.099 Y90.605 E.05401
G1 X90.605 Y196.099 E4.94892
G2 X95.713 Y198.667 I54.237 J-101.502 E.18966
G1 X198.667 Y95.713 E4.82979
G2 X197.98 Y94.236 I-28.491 J12.353 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
G1 X198.667 Y95.713 E-.61871
G1 X198.404 Y95.976 E-.14129
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/10
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S175.95
; OBJECT_ID: 15978
M204 S10000
G17
G3 Z1.2 I-.997 J.697 P1  F42000
G1 X200.356 Y98.766 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
M204 S6000
G1 X200.855 Y100.033 E.04516
G3 X106.486 Y52.974 I-72.865 J27.968 E12.42662
G3 X128.612 Y49.955 I21.643 J76.048 E.74325
G3 X199.835 Y97.508 I-.623 J78.046 E3.00697
G1 X200.333 Y98.711 E.04317
M204 S10000
G1 X200.719 Y98.619 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X201.221 Y99.893 E.04205
G3 X106.378 Y52.597 I-73.231 J28.109 E11.56863
G3 X128.616 Y49.563 I21.624 J75.497 E.692
G3 X200.196 Y97.355 I-.626 J78.438 E2.79935
G1 X200.696 Y98.564 E.0402
; WIPE_START
M204 S6000
G1 X201.221 Y99.893 E-.54278
G1 X201.426 Y100.426 E-.21722
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.4 F4000
            G39.3 S1
            G0 Z1.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X170.281 Y63.272 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G3 X171.637 Y64.173 I-12.223 J19.872 E.05402
G1 X191.827 Y84.363 E.94715
G1 X192.107 Y84.764 E.01623
G3 X192.963 Y86.064 I-36.839 J25.189 E.05164
G1 X86.064 Y192.963 E5.01485
G3 X84.363 Y191.827 I36.939 J-57.123 E.06787
G1 X64.173 Y171.637 E.94715
G1 X63.895 Y171.24 E.01608
G3 X63.037 Y169.936 I36.877 J-25.217 E.0518
G1 X169.928 Y63.044 E5.01451
G2 X165.121 Y60.175 I-64.274 J102.265 E.18572
G1 X60.175 Y165.121 E4.9232
G3 X57.614 Y160.006 I66.312 J-36.411 E.18979
G1 X160.002 Y57.619 E4.80322
G3 X161.479 Y58.302 I-12.306 J28.556 E.05402
M204 S10000
G1 X133.853 Y50.908 F42000
G1 F16200
M204 S6000
G3 X135.476 Y51.041 I-1.724 J31.055 E.05402
G1 X204.952 Y120.517 E3.25926
G1 X204.915 Y120.168 E.01162
G1 X120.159 Y204.924 E3.97609
G1 X120.524 Y204.959 E.01215
G1 X51.041 Y135.476 E3.25961
G1 X51.076 Y135.841 E.01215
G1 X135.841 Y51.076 E3.9765
G3 X142.533 Y52.06 I-8.492 J80.985 E.22443
G1 X52.058 Y142.535 E4.24437
G2 X52.479 Y144.591 I72.606 J-13.822 E.06962
G1 X111.409 Y203.521 E2.76453
G1 X113.472 Y203.936 E.06979
G1 X203.943 Y113.464 E4.2442
G2 X203.521 Y111.409 I-77.319 J14.82 E.0696
G1 X144.594 Y52.483 E2.76436
G3 X148.749 Y53.519 I-17.24 J77.95 E.14206
G1 X53.52 Y148.749 E4.4674
G2 X55.382 Y154.562 I69.626 J-19.098 E.20256
G1 X154.562 Y55.382 E4.65276
G1 X155.532 Y55.744 E.03433
G1 X200.256 Y100.468 E2.09808
G1 X200.618 Y101.438 E.03433
G1 X101.438 Y200.618 E4.65276
G1 X100.468 Y200.256 E.03433
G1 X55.744 Y155.532 E2.09808
G1 X55.453 Y154.753 E.02758
M204 S10000
G1 X67.183 Y175.748 F42000
G1 F16200
M204 S6000
G3 X66.189 Y174.459 I83.432 J-65.319 E.05401
G1 X174.459 Y66.189 E5.07914
G1 X174.543 Y66.252 E.00347
G3 X178.698 Y69.626 I-55.441 J72.512 E.17759
G1 X69.62 Y178.704 E5.11704
G2 X73.323 Y182.677 I58.049 J-50.389 E.1802
G1 X182.677 Y73.323 E5.12999
G3 X186.371 Y77.305 I-109.944 J105.74 E.18018
G1 X77.302 Y186.374 E5.11666
G1 X78.282 Y187.221 E.04296
G2 X81.541 Y189.811 I651.359 J-816.484 E.1381
G1 X189.811 Y81.541 E5.07914
G2 X188.81 Y80.257 I-25.032 J18.465 E.05402
M204 S10000
G1 X101.249 Y55.456 F42000
G1 F16200
M204 S6000
G1 X100.45 Y55.762 E.02836
G1 X55.744 Y100.468 E2.09725
G1 X55.382 Y101.438 E.03434
G1 X154.562 Y200.618 E4.65276
G1 X155.532 Y200.256 E.03433
G1 X200.256 Y155.532 E2.09808
G1 X200.618 Y154.562 E.03434
G1 X101.439 Y55.383 E4.65271
G3 X107.251 Y53.519 I26.587 J72.906 E.20252
G1 X202.48 Y148.749 E4.46743
G2 X203.515 Y144.597 I-87.166 J-23.916 E.14194
G1 X144.597 Y203.515 E2.76395
M73 P42 R31
G3 X142.535 Y203.942 I-12.777 J-56.401 E.06986
G1 X52.06 Y113.467 E4.24437
G3 X52.269 Y112.41 I69.364 J13.172 E.03575
G3 X52.484 Y111.405 I17.399 J3.189 E.0341
G1 X111.408 Y52.48 E2.76427
G3 X113.464 Y52.057 I10.682 J46.652 E.06965
G1 X203.943 Y142.535 E4.24451
G2 X204.232 Y140.933 I-143.598 J-26.817 E.05401
M204 S10000
G1 X175.749 Y188.817 F42000
G1 F16200
M204 S6000
G3 X174.459 Y189.811 I-64.048 J-81.793 E.05401
G1 X66.189 Y81.541 E5.07914
G1 X66.244 Y81.467 E.00306
G3 X67.689 Y79.617 I206.07 J159.509 E.07787
G3 X69.629 Y77.304 I44.727 J35.53 E.10013
G1 X178.704 Y186.38 E5.11694
G2 X182.677 Y182.677 I-66.545 J-75.383 E.18018
G1 X73.323 Y73.323 E5.12999
G3 X77.296 Y69.62 I54.391 J54.378 E.1802
G1 X186.371 Y178.695 E5.11694
G2 X189.811 Y174.459 I-111.313 J-93.874 E.18103
G1 X81.541 Y66.189 E5.07914
M73 P43 R31
G1 X80.254 Y67.186 E.05401
M204 S10000
G1 X94.522 Y58.31 F42000
G1 F16200
M204 S6000
G1 X95.994 Y57.614 E.05401
G1 X198.384 Y160.004 E4.80333
G3 X195.821 Y165.117 I-65.82 J-29.784 E.18978
G1 X90.883 Y60.179 E4.92289
G2 X86.064 Y63.037 I35.589 J65.49 E.18587
G1 X192.956 Y169.928 E5.01451
G3 X191.827 Y171.637 I-25.014 J-15.312 E.06795
G1 X171.62 Y191.843 E.94792
G1 X171.239 Y192.105 E.01536
G2 X169.931 Y192.959 I162.966 J251.015 E.05181
G1 X63.037 Y86.064 E5.01464
G3 X64.173 Y84.363 I57.03 J36.877 E.06788
G1 X84.362 Y64.175 E.94708
G3 X85.713 Y63.267 I49.854 J72.747 E.05401
M204 S10000
G1 X50.325 Y126.646 F42000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.38292
G1 F3000;_EXTRUDE_SET_SPEED
M204 S6000
G1 X50.419 Y123.937 E.07511
G3 X138.815 Y204.931 I77.578 J4.066 E9.72916
G3 X136.799 Y205.178 I-22.454 J-174.507 E.05628
G3 X132.676 Y205.541 I-7.717 J-64.159 E.11469
G3 X50.324 Y126.706 I-4.673 J-77.55 E3.54622
; Slow Down End
M204 S10000
G1 X89.456 Y195.032 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F16200
M204 S6000
G1 X89.988 Y195.333 E.02029
G2 X90.877 Y195.827 I14.623 J-25.235 E.03372
G1 X195.825 Y90.879 E4.92332
G3 X196.582 Y92.305 I-44.591 J24.625 E.05355
G3 X198.382 Y95.998 I-55.731 J29.444 E.1363
G1 X95.998 Y198.382 E4.80307
G3 X94.52 Y197.698 I20.356 J-45.888 E.05401
M204 S10000
G1 X105.686 Y202.033 F42000
G1 F16200
M204 S6000
G2 X107.251 Y202.48 I9.335 J-29.684 E.05402
G1 X202.484 Y107.247 E4.46758
G2 X202.181 Y106.202 I-37.512 J10.324 E.03611
G1 X202.03 Y105.684 E.0179
M204 S10000
G1 X161.478 Y197.694 F42000
G1 F16200
M204 S6000
G3 X160.058 Y198.356 I-20.578 J-42.275 E.05198
G1 X160.002 Y198.382 E.00203
G1 X57.614 Y95.994 E4.80326
G3 X60.175 Y90.879 I72.35 J33.038 E.18978
G1 X165.121 Y195.825 E4.9232
G3 X163.686 Y196.594 I-38.848 J-70.702 E.05401
M204 S10000
G1 X150.317 Y202.032 F42000
G1 F16200
M204 S6000
G3 X148.753 Y202.484 I-21.389 J-71.013 E.05401
G1 X53.521 Y107.253 E4.46752
G1 X53.97 Y105.687 E.05401
M204 S10000
G1 X137.459 Y204.743 F42000
G1 F16200
M204 S6000
G3 X135.841 Y204.924 I-16.221 J-137.501 E.05401
G1 X51.076 Y120.159 E3.9765
G1 X51.041 Y120.524 E.01215
G1 X120.517 Y51.048 E3.25926
G1 X120.168 Y51.085 E.01162
G1 X204.915 Y135.832 E3.97567
G1 X204.952 Y135.483 E.01162
G1 X135.476 Y204.959 E3.25926
G3 X128.56 Y205.32 I-7.742 J-82.058 E.22979
G1 X50.68 Y127.44 E3.6535
G2 X50.684 Y128.557 I23.626 J.485 E.03705
G1 X128.56 Y50.681 E3.65331
G1 X127.444 Y50.685 E.037
G1 X205.32 Y128.56 E3.6533
G2 X205.32 Y127.44 I-32.142 J-.56 E.03716
G1 X127.44 Y205.32 E3.6535
G3 X125.812 Y205.283 I-.123 J-31.069 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F16200
G1 X127.44 Y205.32 E-.61871
G1 X127.703 Y205.057 E-.1413
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/10
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S153
; OBJECT_ID: 15978
M204 S10000
G17
G3 Z1.4 I1.005 J.687 P1  F42000
G1 X200.356 Y98.766 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F16213.044
M204 S6000
G1 X200.855 Y100.033 E.04516
G3 X106.486 Y52.974 I-72.865 J27.968 E12.42661
G3 X128.75 Y49.956 I21.641 J76.037 E.74781
G3 X199.835 Y97.508 I-.76 J78.045 E3.00242
G1 X200.333 Y98.711 E.04317
M204 S10000
G1 X200.719 Y98.62 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X201.221 Y99.892 E.04204
G3 X106.378 Y52.597 I-73.231 J28.109 E11.56868
G3 X128.753 Y49.564 I21.624 J75.496 E.69622
G3 X200.196 Y97.355 I-.763 J78.437 E2.79514
G1 X200.696 Y98.564 E.0402
; WIPE_START
M204 S6000
G1 X201.221 Y99.892 E-.54276
G1 X201.426 Y100.426 E-.21724
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
M106 S255
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.6 F4000
            G39.3 S1
            G0 Z1.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X178.855 Y186.984 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40025
; LAYER_HEIGHT: 0.4
G1 F3000
M204 S6000
G1 X183.884 Y181.956 E.36457
G2 X188.554 Y176.648 I-63.61 J-60.687 E.36252
G1 X176.693 Y188.51 E.85993
G1 X175.825 Y189.213 E.05724
G1 X173.911 Y190.655 E.12285
G1 X190.668 Y173.898 E1.21485
G1 X192.187 Y171.742 E.13517
G1 X171.73 Y192.2 E1.48311
G3 X169.866 Y193.427 I-26.863 J-38.775 E.1144
G1 X193.41 Y169.882 E1.70694
G1 X193.609 Y169.576 E.01871
G2 X194.486 Y168.17 I-26.422 J-17.453 E.08497
G1 X168.173 Y194.483 E1.90767
G3 X166.623 Y195.396 I-47.375 J-78.643 E.09221
G1 X195.39 Y166.629 E2.08556
G1 X196.182 Y165.2 E.08374
G1 X165.193 Y196.189 E2.24662
G1 X163.834 Y196.912 E.07895
G1 X196.91 Y163.835 E2.398
M73 P44 R31
G1 X197.572 Y162.537 E.07469
G1 X162.526 Y197.583 E2.54075
G3 X161.305 Y198.167 I-11.792 J-23.062 E.06944
G1 X198.167 Y161.305 E2.6725
G1 X198.724 Y160.111 E.06749
G1 X160.111 Y198.724 E2.79933
G3 X158.956 Y199.243 I-14.694 J-31.184 E.06493
G1 X199.243 Y158.956 E2.9207
G2 X199.705 Y157.856 I-20.758 J-9.384 E.06116
G1 X157.856 Y199.705 E3.03397
G1 X156.788 Y200.137 E.05907
G1 X200.137 Y156.788 E3.14272
G2 X200.563 Y155.725 I-20.123 J-8.683 E.0587
G1 X155.727 Y200.561 E3.25052
G1 X154.726 Y200.926 E.05461
G1 X200.943 Y154.708 E3.35067
G2 X201.284 Y153.731 I-18.493 J-6.993 E.05307
G1 X153.725 Y201.29 E3.44794
G3 X152.756 Y201.622 I-5.235 J-13.706 E.05248
G1 X201.618 Y152.76 E3.54239
G2 X201.944 Y151.798 I-18.198 J-6.689 E.05207
G1 X151.813 Y201.928 E3.63436
G1 X150.87 Y202.235 E.05084
G1 X202.237 Y150.868 E3.724
G2 X202.509 Y149.959 I-25.906 J-8.255 E.04865
G1 X149.959 Y202.509 E3.8098
G3 X149.067 Y202.764 I-5.854 J-18.76 E.04758
G1 X202.763 Y149.068 E3.89291
G1 X202.996 Y148.198 E.04616
G1 X148.194 Y203.001 E3.9731
G3 X147.322 Y203.235 I-5.443 J-18.501 E.04624
G1 X203.229 Y147.328 E4.05314
G2 X203.446 Y146.475 I-12.114 J-3.533 E.04517
G1 X146.478 Y203.443 E4.13008
G1 X145.634 Y203.65 E.04457
G1 X203.637 Y145.647 E4.20515
G1 X203.828 Y144.819 E.04356
G1 X144.816 Y203.831 E4.27827
G1 X144.005 Y204.005 E.04255
G1 X204.012 Y143.998 E4.35043
G1 X204.166 Y143.208 E.04128
G1 X143.2 Y204.173 E4.4199
G1 X142.413 Y204.324 E.04108
G1 X204.32 Y142.417 E4.4881
G1 X204.473 Y141.627 E.04128
G1 X141.626 Y204.474 E4.5563
G3 X140.858 Y204.606 I-9.826 J-54.96 E.03998
G1 X204.606 Y140.858 E4.62162
G2 X204.732 Y140.095 I-14.623 J-2.809 E.03964
G1 X140.095 Y204.732 E4.68607
G1 X139.354 Y204.836 E.03835
G1 X204.836 Y139.354 E4.74733
G1 X204.94 Y138.613 E.03835
G1 X138.613 Y204.94 E4.80859
G1 X137.872 Y205.044 E.03835
G1 X205.044 Y137.872 E4.86985
M73 P44 R30
G2 X205.135 Y137.145 I-10.376 J-1.664 E.03759
G1 X137.145 Y205.135 E4.92919
G1 X136.433 Y205.21 E.03668
G1 X205.21 Y136.433 E4.98619
G1 X205.285 Y135.722 E.03668
G1 X135.722 Y205.285 E5.0432
G1 X135.01 Y205.359 E.03668
G1 X205.359 Y135.01 E5.10021
G2 X205.421 Y134.312 I-13.304 J-1.52 E.03593
G1 X134.315 Y205.418 E5.15504
G1 X133.629 Y205.467 E.03529
G1 X205.475 Y133.621 E5.20875
G2 X205.52 Y132.939 I-19.538 J-1.639 E.03504
G1 X132.942 Y205.517 E5.2618
G3 X132.266 Y205.557 I-1.183 J-14.466 E.03473
G1 X205.562 Y132.261 E5.31383
M73 P45 R30
G2 X205.59 Y131.596 I-12.707 J-.874 E.03413
G1 X131.596 Y205.589 E5.36443
G1 X130.927 Y205.622 E.03437
G1 X205.613 Y130.936 E5.41465
G1 X205.636 Y130.276 E.03384
G1 X130.272 Y205.641 E5.4638
G1 X129.624 Y205.652 E.03323
G1 X205.659 Y129.616 E5.51246
G2 X205.672 Y128.967 I-12.376 J-.564 E.03329
G1 X128.976 Y205.663 E5.56035
G1 X128.327 Y205.675 E.03323
G1 X205.677 Y128.325 E5.60774
G2 X205.675 Y127.69 I-16.714 J-.248 E.03251
G1 X127.688 Y205.678 E5.65393
G1 X127.056 Y205.672 E.03236
G1 X205.664 Y127.065 E5.6989
G1 X205.653 Y126.439 E.03209
G1 X126.431 Y205.661 E5.74347
G1 X125.816 Y205.639 E.03156
G1 X205.642 Y125.813 E5.78728
G2 X205.628 Y125.19 I-9.879 J-.09 E.03194
G1 X125.2 Y205.618 E5.83088
G1 X124.585 Y205.596 E.03156
G1 X205.598 Y124.583 E5.87332
G1 X205.569 Y123.976 E.03115
G1 X123.97 Y205.575 E5.91577
G3 X123.369 Y205.539 I.382 J-11.487 E.03087
G1 X205.539 Y123.369 E5.95718
G2 X205.497 Y122.775 I-12.812 J.608 E.03056
G1 X122.769 Y205.503 E5.99763
G3 X122.175 Y205.459 I.946 J-17 E.0305
G1 X205.454 Y122.181 E6.03752
G1 X205.411 Y121.587 E.03052
G1 X121.585 Y205.413 E6.0772
M73 P46 R30
G3 X121 Y205.361 I.699 J-11.158 E.03009
G1 X205.361 Y121 E6.11596
G1 X205.3 Y120.424 E.0297
G1 X120.424 Y205.3 E6.15334
G1 X119.848 Y205.239 E.0297
G1 X205.239 Y119.848 E6.19072
G1 X205.179 Y119.272 E.0297
G1 X119.272 Y205.179 E6.22811
G1 X118.696 Y205.118 E.0297
G1 X205.118 Y118.696 E6.26549
G2 X205.045 Y118.132 I-8.103 J.769 E.02913
G1 X118.132 Y205.045 E6.30101
G1 X117.574 Y204.966 E.0289
G1 X204.966 Y117.574 E6.3358
M73 P46 R29
G1 X204.888 Y117.016 E.0289
G1 X117.016 Y204.888 E6.37058
G1 X116.457 Y204.81 E.0289
G1 X204.81 Y116.458 E6.40537
G1 X204.731 Y115.899 E.0289
G1 X115.899 Y204.731 E6.44016
G3 X115.353 Y204.641 I1.447 J-10.485 E.02841
G1 X204.641 Y115.353 E6.47326
G1 X204.55 Y114.807 E.02835
G1 X114.807 Y204.55 E6.50618
G3 X114.267 Y204.453 I1.583 J-10.364 E.02812
G1 X204.453 Y114.267 E6.53829
G1 X204.349 Y113.734 E.02784
G1 X113.734 Y204.349 E6.56943
G1 X113.201 Y204.245 E.02784
G1 X204.245 Y113.201 E6.60056
M73 P47 R29
G1 X204.142 Y112.668 E.02784
G1 X112.668 Y204.142 E6.6317
G1 X112.135 Y204.038 E.02784
G1 X204.038 Y112.135 E6.66284
G2 X203.929 Y111.607 I-10.111 J1.816 E.02762
G1 X111.607 Y203.929 E6.69318
G1 X111.086 Y203.814 E.02737
G1 X203.814 Y111.086 E6.72259
G1 X203.698 Y110.565 E.02737
G1 X110.565 Y203.698 E6.752
G3 X110.051 Y203.575 I3.246 J-14.738 E.02709
G1 X203.575 Y110.051 E6.78037
G1 X203.452 Y109.537 E.02707
G1 X109.537 Y203.452 E6.80866
G3 X109.028 Y203.325 I2.17 J-9.761 E.02692
G1 X203.325 Y109.028 E6.83636
G1 X203.19 Y108.526 E.02665
G1 X108.526 Y203.19 E6.86301
G1 X108.023 Y203.056 E.02665
G1 X203.056 Y108.023 E6.88966
G1 X202.921 Y107.521 E.02665
G1 X107.521 Y202.921 E6.91631
G1 X107.019 Y202.786 E.02665
G1 X202.786 Y107.019 E6.94297
G2 X202.65 Y106.519 I-7.229 J1.706 E.02658
G1 X106.518 Y202.65 E6.96936
G1 X106.027 Y202.505 E.02626
G1 X202.501 Y106.031 E6.99416
M73 P48 R29
G1 X202.352 Y105.544 E.02614
G1 X105.536 Y202.359 E7.01897
G3 X105.05 Y202.209 I2.642 J-9.369 E.02609
G1 X202.203 Y105.056 E7.04339
G1 X202.053 Y104.568 E.02614
G1 X104.569 Y202.052 E7.06742
M73 P48 R28
G1 X104.089 Y201.896 E.0259
G1 X201.904 Y104.081 E7.09145
G2 X201.747 Y103.602 I-9.227 J2.774 E.02586
G1 X103.608 Y201.74 E7.11486
G1 X103.128 Y201.584 E.0259
G1 X201.587 Y103.125 E7.13813
G2 X201.426 Y102.649 I-9.149 J2.831 E.02575
G1 X102.649 Y201.426 E7.16117
G1 X102.182 Y201.256 E.02547
G1 X201.256 Y102.182 E7.18269
G1 X201.086 Y101.715 E.02547
G1 X101.715 Y201.086 E7.20422
G1 X101.248 Y200.916 E.02547
G1 X200.916 Y101.248 E7.22575
G1 X200.746 Y100.782 E.02547
G1 X100.782 Y200.746 E7.24727
G1 X100.315 Y200.576 E.02547
G1 X200.576 Y100.315 E7.2688
G2 X200.398 Y99.857 I-6.651 J2.334 E.02521
G1 X99.857 Y200.398 E7.28903
M73 P49 R28
G1 X99.403 Y200.214 E.02508
G1 X200.214 Y99.403 E7.30862
G1 X200.031 Y98.95 E.02508
G1 X98.95 Y200.031 E7.32822
G1 X98.496 Y199.848 E.02507
G1 X199.848 Y98.496 E7.34781
G1 X199.665 Y98.043 E.02507
G1 X98.043 Y199.665 E7.36741
G3 X97.59 Y199.48 I3.284 J-8.699 E.02504
G1 X199.48 Y97.59 E7.38683
G1 X199.287 Y97.147 E.02481
G1 X97.147 Y199.287 E7.40501
G1 X96.703 Y199.094 E.02481
G1 X199.094 Y96.703 E7.42319
G2 X198.898 Y96.262 I-8.521 J3.529 E.02473
G1 X96.262 Y198.898 E7.44092
G1 X95.828 Y198.696 E.02456
G1 X198.696 Y95.828 E7.45772
G1 X198.493 Y95.394 E.02456
G1 X95.394 Y198.493 E7.47452
G1 X94.959 Y198.291 E.02456
G1 X198.291 Y94.959 E7.49133
G1 X198.088 Y94.525 E.02456
G1 X94.525 Y198.088 E7.50813
M73 P50 R27
G1 X94.091 Y197.886 E.02456
G1 X197.886 Y94.091 E7.52493
G2 X197.677 Y93.663 I-8.28 J3.773 E.02442
G1 X93.665 Y197.675 E7.54068
G1 X93.243 Y197.46 E.02427
G1 X197.465 Y93.238 E7.5559
G1 X197.253 Y92.813 E.02434
G1 X92.821 Y197.245 E7.57112
G1 X92.4 Y197.03 E.02427
G1 X197.034 Y92.396 E7.5858
G1 X196.813 Y91.98 E.02414
G1 X91.978 Y196.815 E7.60036
G1 X91.556 Y196.6 E.02427
G1 X196.592 Y91.564 E7.61492
G1 X196.371 Y91.149 E.02414
G1 X91.143 Y196.377 E7.62885
G1 X90.73 Y196.153 E.02407
G1 X196.15 Y90.733 E7.64274
G2 X195.928 Y90.318 I-7.996 J3.998 E.02413
G1 X90.318 Y195.928 E7.65658
G1 X89.911 Y195.698 E.02395
G1 X195.698 Y89.911 E7.66938
M73 P51 R27
G1 X195.468 Y89.504 E.02395
G1 X89.504 Y195.468 E7.68218
G3 X89.099 Y195.237 I4.201 J-7.825 E.02393
G1 X195.237 Y89.099 E7.69478
G1 X194.998 Y88.701 E.02379
G1 X88.701 Y194.998 E7.70629
G1 X88.304 Y194.759 E.02379
G1 X194.759 Y88.304 E7.7178
G1 X194.52 Y87.906 E.02379
G1 X87.906 Y194.52 E7.72931
G1 X87.508 Y194.281 E.02379
G1 X194.281 Y87.508 E7.74082
G1 X194.042 Y87.11 E.02379
G1 X87.11 Y194.042 E7.75233
G3 X86.715 Y193.8 I4.418 J-7.663 E.02374
G1 X193.8 Y86.715 E7.76345
G1 X193.552 Y86.326 E.02364
G1 X86.326 Y193.552 E7.77368
G1 X85.937 Y193.304 E.02364
G1 X193.304 Y85.937 E7.78392
M73 P51 R26
G2 X193.054 Y85.55 I-11.202 J6.964 E.02361
G1 X85.552 Y193.053 E7.79376
G1 X85.171 Y192.797 E.02351
G1 X192.801 Y85.167 E7.80294
M73 P52 R26
G1 X192.547 Y84.784 E.02355
G1 X84.791 Y192.54 E7.81213
G1 X84.411 Y192.284 E.02351
G1 X192.29 Y84.405 E7.82104
G1 X192.028 Y84.03 E.02344
G1 X84.031 Y192.027 E7.8296
G1 X83.65 Y191.771 E.02351
G1 X191.765 Y83.656 E7.83816
G1 X191.503 Y83.281 E.02344
G1 X83.275 Y191.509 E7.84636
G1 X82.905 Y191.242 E.02338
G1 X191.241 Y82.907 E7.85415
G1 X190.979 Y82.532 E.02344
G1 X82.536 Y190.975 E7.86193
G1 X82.166 Y190.708 E.02338
G1 X190.712 Y82.162 E7.86942
G1 X190.442 Y81.796 E.02334
G1 X81.796 Y190.441 E7.87658
G3 X81.433 Y190.167 I5.685 J-7.925 E.02331
G1 X190.171 Y81.43 E7.88328
G2 X189.896 Y81.068 I-7.024 J5.059 E.0233
G1 X81.071 Y189.893 E7.88958
M73 P53 R26
G1 X80.709 Y189.618 E.0233
G1 X189.616 Y80.711 E7.89558
G1 X189.337 Y80.353 E.02326
G1 X80.347 Y189.343 E7.90158
G3 X79.99 Y189.063 I4.251 J-5.781 E.02325
G1 X189.058 Y79.996 E7.90719
G1 X188.778 Y79.638 E.02326
G1 X79.639 Y188.778 E7.91245
G1 X79.287 Y188.493 E.02321
G1 X188.499 Y79.281 E7.91771
G2 X188.215 Y78.928 I-6.872 J5.234 E.02322
G1 X78.935 Y188.208 E7.92265
M73 P53 R25
G1 X78.583 Y187.924 E.02321
G1 X187.928 Y78.579 E7.92729
G1 X187.64 Y78.23 E.02319
G1 X78.231 Y187.639 E7.93194
G3 X77.885 Y187.348 I4.318 J-5.5 E.02317
G1 X187.348 Y77.885 E7.93586
G1 X187.052 Y77.545 E.02314
G1 X77.543 Y187.053 E7.93915
G1 X77.202 Y186.758 E.02314
G1 X186.755 Y77.204 E7.94243
M73 P54 R25
G1 X186.459 Y76.863 E.02314
G1 X76.861 Y186.462 E7.94572
G1 X76.519 Y186.167 E.02314
G1 X186.163 Y76.523 E7.94901
G1 X185.867 Y76.182 E.02314
G1 X76.184 Y185.865 E7.95182
G1 X75.85 Y185.562 E.02311
G1 X185.565 Y75.847 E7.95414
G1 X185.258 Y75.518 E.0231
G1 X75.516 Y185.26 E7.95608
G1 X75.182 Y184.957 E.02311
G1 X184.951 Y75.188 E7.95802
G1 X184.643 Y74.859 E.0231
G1 X74.852 Y184.65 E7.95968
G1 X74.525 Y184.34 E.02309
G1 X184.336 Y74.529 E7.96109
G1 X184.029 Y74.2 E.0231
G1 X74.199 Y184.03 E7.9625
G3 X73.876 Y183.716 I5.852 J-6.326 E.02309
G1 X183.716 Y73.876 E7.96319
G1 X183.398 Y73.558 E.02308
G1 X73.558 Y183.398 E7.96319
M73 P55 R25
G1 X73.239 Y183.079 E.02308
G1 X183.079 Y73.239 E7.96319
G1 X182.761 Y72.921 E.02308
G1 X72.921 Y182.761 E7.96319
G1 X72.603 Y182.442 E.02308
G1 X182.442 Y72.603 E7.96319
G1 X182.124 Y72.284 E.02308
G1 X72.284 Y182.124 E7.96319
M73 P55 R24
G3 X71.971 Y181.8 I4.488 J-4.651 E.02309
G1 X181.802 Y71.97 E7.9625
G1 X181.475 Y71.66 E.02309
G1 X71.664 Y181.471 E7.96109
G1 X71.357 Y181.141 E.0231
G1 X181.148 Y71.35 E7.95968
G2 X180.818 Y71.043 I-6.878 J7.079 E.0231
G1 X71.05 Y180.812 E7.95802
G1 X70.742 Y180.482 E.0231
G1 X180.484 Y70.741 E7.95608
G1 X180.15 Y70.438 E.02311
G1 X70.435 Y180.153 E7.95414
G3 X70.132 Y179.819 I6.202 J-5.948 E.02311
G1 X179.816 Y70.135 E7.95192
M73 P56 R24
G2 X179.481 Y69.833 I-6.616 J7.003 E.02311
G1 X69.833 Y179.482 E7.94931
G1 X69.534 Y179.144 E.02312
G1 X179.14 Y69.538 E7.94623
G1 X178.798 Y69.243 E.02314
G1 X69.238 Y178.803 E7.94295
G1 X68.944 Y178.46 E.02315
G1 X178.457 Y68.947 E7.93946
G1 X178.115 Y68.652 E.02314
G1 X68.651 Y178.116 E7.93597
G3 X68.362 Y177.769 I6.483 J-5.695 E.02318
G1 X177.769 Y68.362 E7.93185
G1 X177.417 Y68.077 E.02321
G1 X68.077 Y177.417 E7.927
G1 X67.792 Y177.065 E.02321
G1 X177.065 Y67.792 E7.92215
G1 X176.714 Y67.507 E.02321
G1 X67.507 Y176.713 E7.9173
G1 X67.222 Y176.362 E.02321
G1 X176.362 Y67.222 E7.91244
M73 P57 R24
G1 X176.01 Y66.937 E.02321
G1 X66.937 Y176.01 E7.90759
G3 X66.657 Y175.653 I4.957 J-4.167 E.02326
G1 X175.654 Y66.656 E7.90206
M73 P57 R23
G1 X175.294 Y66.38 E.02328
G1 X66.384 Y175.289 E7.89578
G1 X66.11 Y174.926 E.02331
G1 X174.933 Y66.103 E7.8895
G2 X174.57 Y65.829 I-8.042 J10.291 E.02331
G1 X65.837 Y174.563 E7.88301
G1 X65.563 Y174.2 E.02331
G1 X174.204 Y65.559 E7.87632
G1 X173.838 Y65.288 E.02334
G1 X65.289 Y173.837 E7.86962
G3 X65.021 Y173.468 I5.15 J-4.021 E.02338
G1 X173.468 Y65.021 E7.86219
G1 X173.094 Y64.759 E.02344
G1 X64.759 Y173.094 E7.85405
G1 X64.497 Y172.719 E.02344
G1 X172.719 Y64.497 E7.84591
G1 X172.345 Y64.235 E.02344
G1 X64.235 Y172.345 E7.83777
M73 P58 R23
G1 X63.973 Y171.97 E.02344
G1 X171.97 Y63.973 E7.82963
G1 X171.596 Y63.71 E.02344
G1 X63.71 Y171.596 E7.82149
G3 X63.453 Y171.216 I7.127 J-5.108 E.02351
G1 X171.214 Y63.455 E7.81251
G1 X170.828 Y63.204 E.0236
G1 X63.199 Y170.833 E7.8029
G1 X62.946 Y170.45 E.02355
G1 X170.442 Y62.953 E7.7933
G1 X170.056 Y62.703 E.0236
G1 X62.696 Y170.063 E7.78344
G1 X62.448 Y169.674 E.02364
G1 X169.67 Y62.452 E7.77341
G1 X169.284 Y62.201 E.0236
G1 X62.2 Y169.285 E7.76339
G3 X61.959 Y168.89 I7.427 J-4.816 E.02374
G1 X168.89 Y61.959 E7.75234
G1 X168.492 Y61.72 E.02379
G1 X61.72 Y168.492 E7.74083
M73 P58 R22
G1 X61.481 Y168.094 E.02379
G1 X168.094 Y61.481 E7.72932
M73 P59 R22
G1 X167.697 Y61.242 E.02379
G1 X61.242 Y167.697 E7.71781
G1 X61.003 Y167.299 E.02379
G1 X167.299 Y61.003 E7.7063
G1 X166.901 Y60.764 E.02379
G1 X60.764 Y166.901 E7.69479
G3 X60.532 Y166.496 I7.607 J-4.613 E.02393
G1 X166.496 Y60.532 E7.68219
G1 X166.089 Y60.302 E.02395
G1 X60.302 Y166.089 E7.66939
G1 X60.072 Y165.683 E.02395
G1 X165.683 Y60.072 E7.65659
G2 X165.267 Y59.85 I-4.374 J7.699 E.02413
G1 X59.85 Y165.267 E7.64254
G1 X59.629 Y164.852 E.02414
G1 X164.852 Y59.629 E7.62843
G1 X164.436 Y59.408 E.02414
G1 X59.408 Y164.436 E7.61431
G1 X59.187 Y164.02 E.02414
G1 X164.02 Y59.187 E7.6002
G1 X163.605 Y58.966 E.02414
G1 X58.966 Y163.605 E7.58609
M73 P60 R22
G3 X58.748 Y163.187 I5.872 J-3.339 E.02419
G1 X163.187 Y58.747 E7.57169
G1 X162.762 Y58.535 E.02434
G1 X58.539 Y162.759 E7.55602
G1 X58.33 Y162.331 E.02441
G1 X162.337 Y58.323 E7.54035
G2 X161.91 Y58.113 I-6.23 J12.139 E.02439
G1 X58.121 Y161.903 E7.52453
G1 X57.913 Y161.475 E.02441
G1 X161.479 Y57.908 E7.5084
G1 X161.048 Y57.702 E.02449
G1 X57.704 Y161.047 E7.49228
G3 X57.5 Y160.614 I8.15 J-4.111 E.02452
G1 X160.612 Y57.501 E7.47549
G1 X160.172 Y57.305 E.02472
G1 X57.3 Y160.177 E7.458
M73 P60 R21
G1 X57.101 Y159.739 E.02464
G1 X159.731 Y57.109 E7.44051
G1 X159.291 Y56.913 E.02472
G1 X56.906 Y159.297 E7.42271
G1 X56.713 Y158.854 E.02481
G1 X158.85 Y56.717 E7.40475
M73 P61 R21
G1 X158.409 Y56.52 E.02472
G1 X56.52 Y158.41 E7.3868
G3 X56.335 Y157.958 I9.441 J-4.139 E.02502
G1 X157.958 Y56.336 E7.36748
G1 X157.504 Y56.152 E.02507
G1 X56.151 Y157.506 E7.34796
G1 X55.966 Y157.053 E.02505
G1 X157.051 Y55.969 E7.32843
G1 X156.597 Y55.786 E.02508
G1 X55.782 Y156.601 E7.3089
G3 X55.603 Y156.143 I9.738 J-4.077 E.02519
G1 X156.144 Y55.603 E7.28901
G2 X155.686 Y55.423 I-3.066 J7.15 E.02519
G1 X55.428 Y155.682 E7.26856
G1 X55.252 Y155.22 E.0253
G1 X155.221 Y55.252 E7.24752
G1 X154.755 Y55.081 E.02543
G1 X55.077 Y154.759 E7.22648
G3 X54.907 Y154.292 I10.134 J-3.961 E.02546
G1 X154.289 Y54.91 E7.20507
G2 X153.821 Y54.742 I-3.839 J9.983 E.02553
G1 X54.74 Y153.822 E7.18315
M73 P62 R21
G1 X54.574 Y153.352 E.02557
G1 X153.346 Y54.58 E7.16081
G1 X152.871 Y54.418 E.02571
G1 X54.413 Y152.876 E7.13804
G1 X54.254 Y152.399 E.02579
G1 X152.397 Y54.256 E7.1152
G2 X151.92 Y54.095 I-2.984 J8.097 E.02578
G1 X54.096 Y151.92 E7.09208
G1 X53.947 Y151.432 E.02614
G1 X151.434 Y53.945 E7.06763
G1 X150.947 Y53.795 E.0261
G1 X53.798 Y150.944 E7.04319
M73 P62 R20
G1 X53.648 Y150.457 E.02614
G1 X150.461 Y53.644 E7.01874
G2 X149.972 Y53.497 I-3.404 J10.412 E.0262
G1 X53.499 Y149.969 E6.99407
G1 X53.35 Y149.481 E.02614
G1 X149.476 Y53.356 E6.96893
G1 X148.98 Y53.215 E.02643
G1 X53.214 Y148.981 E6.94288
G1 X53.079 Y148.479 E.02665
G1 X148.484 Y53.074 E6.91668
G2 X147.985 Y52.936 I-2.625 J8.521 E.02653
G1 X52.945 Y147.977 E6.89028
M73 P63 R20
G1 X52.81 Y147.475 E.02665
G1 X147.477 Y52.808 E6.86319
G1 X146.969 Y52.679 E.02687
G1 X52.675 Y146.972 E6.8361
G3 X52.548 Y146.463 I9.64 J-2.681 E.02692
G1 X146.46 Y52.551 E6.80848
G2 X145.947 Y52.427 I-2.905 J10.941 E.02706
G1 X52.425 Y145.95 E6.78021
G3 X52.302 Y145.436 I14.592 J-3.754 E.02709
G1 X145.429 Y52.309 E6.75152
G1 X144.91 Y52.191 E.02726
G1 X52.187 Y144.914 E6.72231
G1 X52.071 Y144.393 E.02737
G1 X144.392 Y52.072 E6.6931
G2 X143.866 Y51.961 I-2.175 J8.973 E.02754
G1 X51.962 Y143.866 E6.66292
G1 X51.858 Y143.332 E.02784
G1 X143.335 Y51.856 E6.63189
G1 X142.803 Y51.751 E.02778
G1 X51.755 Y142.799 E6.60087
G1 X51.651 Y142.266 E.02784
G1 X142.272 Y51.646 E6.56984
G2 X141.73 Y51.55 I-2.297 J11.474 E.02819
G1 X51.547 Y141.733 E6.53809
M73 P64 R20
G3 X51.45 Y141.193 I10.289 J-2.127 E.02812
G1 X141.188 Y51.456 E6.50579
G1 X140.645 Y51.362 E.02823
G1 X51.359 Y140.648 E6.47308
G3 X51.269 Y140.101 I10.397 J-1.994 E.0284
G1 X140.101 Y51.269 E6.44019
M73 P64 R19
G1 X139.545 Y51.189 E.02883
G1 X51.191 Y139.543 E6.40552
G1 X51.112 Y138.985 E.0289
G1 X138.988 Y51.109 E6.37085
G1 X138.431 Y51.028 E.02883
G1 X51.034 Y138.426 E6.33619
G1 X50.955 Y137.868 E.0289
G1 X137.868 Y50.955 E6.30101
G1 X137.299 Y50.887 E.02935
G1 X50.88 Y137.306 E6.26522
G1 X50.815 Y136.734 E.02949
G1 X136.731 Y50.819 E6.22873
G1 X136.162 Y50.75 E.02935
G1 X50.75 Y136.163 E6.19224
G3 X50.698 Y135.578 I11.191 J-1.295 E.03009
G1 X135.583 Y50.694 E6.15399
G1 X135.002 Y50.638 E.02991
G1 X50.647 Y134.993 E6.1156
M73 P65 R19
G1 X50.595 Y134.407 E.03013
G1 X134.412 Y50.59 E6.07658
G1 X133.817 Y50.549 E.03058
G1 X50.544 Y133.822 E6.03714
G3 X50.497 Y133.232 I11.22 J-1.186 E.03034
G1 X133.222 Y50.507 E5.99739
G1 X132.627 Y50.465 E.03058
G1 X50.461 Y132.632 E5.9569
G3 X50.425 Y132.031 I11.459 J-.984 E.03087
G1 X132.031 Y50.425 E5.91629
G1 X131.421 Y50.398 E.03131
G1 X50.403 Y131.415 E5.87362
G1 X50.382 Y130.8 E.03156
G1 X130.811 Y50.371 E5.83094
G2 X130.189 Y50.356 I-.643 J13.595 E.03188
G1 X50.361 Y130.185 E5.78744
G1 X50.339 Y129.57 E.03156
G1 X129.565 Y50.343 E5.74377
G1 X128.942 Y50.33 E.03198
G1 X50.332 Y128.94 E5.69909
G1 X50.332 Y128.304 E.03264
G1 X128.308 Y50.327 E5.65314
G1 X127.669 Y50.329 E.03273
G1 X50.332 Y127.667 E5.60686
G1 X50.332 Y127.03 E.03264
G1 X127.031 Y50.331 E5.56058
M73 P66 R19
G2 X126.387 Y50.338 I-.16 J13.617 E.03304
G1 X50.341 Y126.384 E5.5132
M73 P66 R18
G1 X50.364 Y125.724 E.03384
G1 X125.733 Y50.355 E5.46412
G2 X125.074 Y50.378 I.158 J14.465 E.0338
G1 X50.387 Y125.065 E5.41468
G1 X50.41 Y124.405 E.03384
G1 X124.404 Y50.41 E5.36446
G1 X123.735 Y50.443 E.03437
G1 X50.438 Y123.74 E5.31387
G1 X50.48 Y123.062 E.03483
G1 X123.058 Y50.483 E5.26184
G1 X122.372 Y50.533 E.03529
G1 X50.525 Y122.38 E5.20878
G1 X50.579 Y121.688 E.03554
G1 X121.685 Y50.582 E5.15507
G2 X120.99 Y50.64 I.551 J10.758 E.03576
G1 X50.64 Y120.991 E5.1003
G1 X50.713 Y120.282 E.03656
G1 X120.279 Y50.715 E5.04344
G1 X119.567 Y50.79 E.03668
G1 X50.785 Y119.572 E4.98658
G3 X50.866 Y118.855 I15.41 J1.361 E.03699
G1 X118.856 Y50.865 E4.92917
G2 X118.132 Y50.951 I2.231 J21.696 E.03735
G1 X50.957 Y118.126 E4.87007
G1 X51.049 Y117.398 E.03765
G1 X117.399 Y51.048 E4.81024
M73 P67 R18
G2 X116.651 Y51.159 I2.056 J16.425 E.03876
G1 X51.155 Y116.655 E4.74833
G1 X51.267 Y115.906 E.0388
G1 X115.898 Y51.276 E4.68559
G2 X115.141 Y51.396 I2.192 J16.294 E.03927
G1 X51.4 Y115.137 E4.62116
G1 X51.533 Y114.367 E.0401
G1 X114.366 Y51.534 E4.55523
G1 X113.59 Y51.673 E.04039
G1 X51.673 Y113.591 E4.4889
G1 X51.83 Y112.797 E.04148
G1 X112.801 Y51.826 E4.42029
G1 X111.996 Y51.994 E.04216
G1 X51.987 Y112.003 E4.35054
G3 X52.169 Y111.184 I14.196 J2.729 E.04302
G1 X111.189 Y52.164 E4.27882
G1 X110.358 Y52.358 E.04373
G1 X52.357 Y110.359 E4.20494
G3 X52.554 Y109.525 I17.992 J3.812 E.04392
G1 X109.527 Y52.552 E4.13043
G2 X108.679 Y52.764 I4.04 J18.024 E.04481
G1 X52.77 Y108.673 E4.05332
G3 X52.989 Y107.817 I13.646 J3.037 E.04529
G1 X107.818 Y52.988 E3.97499
G1 X106.929 Y53.24 E.04733
G1 X53.245 Y106.924 E3.89203
G1 X53.501 Y106.032 E.04761
G1 X106.041 Y53.492 E3.80907
M73 P67 R17
G2 X105.122 Y53.774 I5.605 J19.865 E.04932
G1 X53.763 Y105.133 E3.72341
G1 X54.056 Y104.203 E.04999
G1 X104.201 Y54.058 E3.63539
G2 X103.252 Y54.37 I6.138 J20.259 E.05121
M73 P68 R17
G1 X54.382 Y103.241 E3.54302
G1 X54.716 Y102.27 E.05265
G1 X102.282 Y54.703 E3.44849
G2 X101.29 Y55.059 I6.301 J19.143 E.05405
G1 X55.057 Y101.292 E3.35185
G1 X55.437 Y100.275 E.05566
G1 X100.257 Y55.456 E3.24936
G1 X99.223 Y55.852 E.05675
G1 X55.863 Y99.213 E3.14355
G1 X56.294 Y98.144 E.05907
G1 X98.14 Y56.299 E3.0337
G1 X97.033 Y56.769 E.06162
G1 X56.757 Y97.045 E2.91993
G3 X57.266 Y95.899 I33.041 J13.986 E.06425
G1 X95.899 Y57.266 E2.80087
G1 X95.72 Y57.348 E.01011
G2 X94.702 Y57.827 I8.651 J19.707 E.05769
G1 X57.827 Y94.702 E2.67339
G1 X58.433 Y93.459 E.07089
G1 X93.459 Y58.433 E2.53933
G2 X92.18 Y59.074 I11.605 J24.716 E.07333
G1 X59.088 Y92.167 E2.39917
G1 X59.811 Y90.807 E.07895
G1 X90.801 Y59.817 E2.24672
G1 X89.372 Y60.609 E.08374
G1 X60.604 Y89.378 E2.08566
G3 X61.543 Y87.802 I30.536 J17.132 E.09408
G1 X87.802 Y61.543 E1.90369
G2 X86.143 Y62.564 I18.657 J32.146 E.09984
G1 X62.564 Y86.143 E1.70944
G3 X63.832 Y84.239 I36.967 J23.233 E.1173
G1 X84.239 Y63.832 E1.47946
G2 X82.104 Y65.331 I35.198 J52.423 E.13375
G1 X65.373 Y82.062 E1.21296
G1 X65.438 Y81.971 E.00572
G3 X67.451 Y79.346 I65.872 J48.429 E.1696
G1 X79.337 Y67.46 E.86171
G1 X79.173 Y67.594 E.01086
G2 X74.048 Y72.113 I50.577 J62.528 E.35038
G1 X69.105 Y77.055 E.35832
M106 S153
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
M73 P69 R17
G1 X70.52 Y75.641 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/10
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; OBJECT_ID: 15978
M204 S10000
G17
G3 Z1.6 I-.213 J1.198 P1  F42000
G1 X200.356 Y98.766 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
M204 S6000
G1 X200.855 Y100.033 E.04516
G3 X107.799 Y52.609 I-72.865 J27.968 E12.47182
G3 X128.887 Y49.958 I20.334 J76.529 E.70716
G3 X199.835 Y97.508 I-.897 J78.043 E2.99788
G1 X200.333 Y98.711 E.04318
M204 S10000
G1 X200.719 Y98.62 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X201.221 Y99.892 E.04204
G3 X107.698 Y52.231 I-73.231 J28.109 E11.61074
G3 X128.89 Y49.566 I20.436 J76.913 E.65831
G3 X200.196 Y97.355 I-.9 J78.435 E2.79093
G1 X200.696 Y98.564 E.0402
; WIPE_START
M204 S6000
G1 X201.221 Y99.892 E-.54274
G1 X201.426 Y100.426 E-.21726
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.8 F4000
            G39.3 S1
            G0 Z1.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X186.694 Y76.803 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42012
G1 F15000
M204 S6000
G1 X181.982 Y72.091 E.20482
G2 X177.203 Y67.845 I-53.334 J55.223 E.19655
G1 X188.097 Y78.739 E.47354
G3 X190.063 Y81.239 I-36.783 J30.957 E.09778
G1 X174.717 Y65.892 E.6671
G2 X172.8 Y64.509 I-27.378 J35.917 E.07266
G1 X191.527 Y83.236 E.81403
G3 X192.676 Y84.919 I-54.201 J38.256 E.06265
G1 X171.084 Y63.327 E.93858
G1 X169.563 Y62.339 E.05577
G1 X193.673 Y86.449 E1.04805
G1 X194.54 Y87.849 E.05062
G1 X168.149 Y61.458 E1.14717
G2 X166.845 Y60.688 I-110.554 J185.598 E.04656
G1 X195.313 Y89.155 E1.23746
G3 X196.003 Y90.379 I-23.04 J13.804 E.04319
G1 X165.633 Y60.009 E1.32015
G2 X164.475 Y59.385 I-13.844 J24.295 E.04042
G1 X196.609 Y91.518 E1.39679
G1 X197.214 Y92.658 E.03966
G1 X163.342 Y58.785 E1.47238
G2 X162.274 Y58.251 I-11.502 J21.656 E.0367
G1 X197.727 Y93.704 E1.54109
G1 X198.235 Y94.745 E.03561
G1 X161.255 Y57.765 E1.6075
G2 X160.254 Y57.298 I-10.432 J21.038 E.03395
G1 X198.706 Y95.75 E1.67146
G3 X199.14 Y96.717 I-27.52 J12.928 E.0326
G1 X159.296 Y56.873 E1.73196
G2 X158.34 Y56.45 I-9.163 J19.426 E.03215
G1 X199.549 Y97.66 E1.79131
G1 X199.911 Y98.555 E.02967
G1 X157.429 Y56.073 E1.84661
G2 X156.544 Y55.721 I-8.476 J20.018 E.0293
G1 X200.272 Y99.45 E1.90084
G3 X200.625 Y100.335 I-16.712 J7.159 E.0293
G1 X155.671 Y55.382 E1.95408
G2 X154.824 Y55.068 I-7.075 J17.812 E.02776
G1 X200.943 Y101.187 E2.00475
G3 X201.236 Y102.013 I-16.814 J6.418 E.02693
G1 X153.988 Y54.766 E2.0538
G2 X153.158 Y54.469 I-6.506 J16.905 E.02709
G1 X201.518 Y102.829 E2.10216
G3 X201.797 Y103.641 I-17.148 J6.335 E.02639
G1 X152.356 Y54.201 E2.14911
G2 X151.571 Y53.949 I-6.124 J17.739 E.02536
G1 X202.048 Y104.426 E2.19418
G1 X202.299 Y105.211 E.02533
G1 X150.797 Y53.709 E2.23873
G2 X150.033 Y53.478 I-5.302 J16.151 E.02456
G1 X202.526 Y105.971 E2.28183
M73 P69 R16
G3 X202.745 Y106.723 I-14.236 J4.546 E.02408
G1 X149.287 Y53.265 E2.32375
G1 X148.541 Y53.053 E.02384
G1 X202.94 Y107.452 E2.36466
G1 X203.135 Y108.181 E.02319
G1 X147.807 Y52.852 E2.40508
G1 X147.087 Y52.666 E.02284
G1 X203.331 Y108.909 E2.44484
G3 X203.51 Y109.622 I-13.509 J3.775 E.02259
G1 X146.383 Y52.495 E2.48323
G1 X145.69 Y52.335 E.02188
G1 X203.678 Y110.324 E2.5207
G3 X203.83 Y111.009 I-13.982 J3.459 E.02158
G1 X144.996 Y52.175 E2.55745
G1 X144.302 Y52.015 E.02188
G1 X203.976 Y111.688 E2.59393
G1 X204.122 Y112.367 E.02135
G1 X143.631 Y51.877 E2.62945
G1 X142.965 Y51.744 E.02086
G1 X204.257 Y113.036 E2.66428
G1 X204.382 Y113.695 E.0206
G1 X142.301 Y51.614 E2.69858
G1 X141.655 Y51.501 E.02016
G1 X204.507 Y114.353 E2.7321
G3 X204.619 Y114.998 I-14.583 J2.85 E.02011
G1 X141.009 Y51.389 E2.76503
G1 X140.363 Y51.276 E.02016
G1 X204.726 Y115.639 E2.79778
G3 X204.819 Y116.266 I-11.913 J2.098 E.01949
G1 X139.73 Y51.176 E2.82937
G1 X139.102 Y51.082 E.01949
G1 X204.907 Y116.887 E2.86043
G1 X204.994 Y117.507 E.01927
G1 X138.486 Y50.999 E2.89103
G1 X137.878 Y50.924 E.01883
G1 X205.081 Y118.128 E2.92125
G3 X205.16 Y118.74 I-8.726 J1.43 E.01897
G1 X137.269 Y50.85 E2.9511
G1 X136.661 Y50.775 E.01883
G1 X205.222 Y119.336 E2.98026
G1 X205.285 Y119.932 E.01842
G1 X136.055 Y50.702 E3.00933
G1 X135.465 Y50.646 E.01823
G1 X205.348 Y120.528 E3.03771
G1 X205.41 Y121.124 E.01842
G1 X134.875 Y50.589 E3.06609
G2 X134.298 Y50.546 I-1.107 J10.98 E.01777
G1 X205.455 Y121.703 E3.0931
G1 X205.496 Y122.277 E.01771
G1 X133.725 Y50.506 E3.11982
G1 X133.151 Y50.466 E.01767
G1 X205.538 Y122.852 E3.14655
G1 X205.579 Y123.427 E.01771
G1 X132.578 Y50.425 E3.17327
G2 X132.006 Y50.387 I-1.019 J10.899 E.01762
G1 X205.607 Y123.988 E3.19934
G1 X205.634 Y124.548 E.01725
G1 X131.448 Y50.363 E3.22476
G1 X130.89 Y50.338 E.01716
G1 X205.661 Y125.109 E3.25018
G3 X205.677 Y125.658 I-9.504 J.548 E.01689
G1 X130.341 Y50.323 E3.27474
G1 X129.796 Y50.311 E.01676
G1 X205.687 Y126.202 E3.2989
G1 X205.698 Y126.746 E.01672
G1 X129.25 Y50.299 E3.32306
G2 X128.709 Y50.291 I-.434 J11.54 E.01663
G1 X205.708 Y127.29 E3.34703
M73 P70 R16
G3 X205.711 Y127.827 I-11.4 J.338 E.0165
G1 X128.177 Y50.292 E3.37032
G1 X127.644 Y50.293 E.01637
G1 X205.709 Y128.358 E3.39337
G1 X205.707 Y128.889 E.01633
G1 X127.112 Y50.294 E3.41642
G2 X126.581 Y50.297 I-.215 J10.929 E.01632
G1 X205.703 Y129.418 E3.43932
G1 X205.685 Y129.934 E.01585
G1 X126.061 Y50.31 E3.46113
G1 X125.541 Y50.324 E.01598
G1 X205.667 Y130.449 E3.48294
G1 X205.649 Y130.965 E.01585
G1 X125.027 Y50.343 E3.50451
G1 X124.518 Y50.368 E.01566
G1 X205.631 Y131.48 E3.52585
G1 X205.613 Y131.996 E.01585
G1 X124.009 Y50.392 E3.54719
G1 X123.5 Y50.417 E.01566
G1 X205.584 Y132.5 E3.56806
G1 X205.553 Y133.003 E.01548
G1 X123.002 Y50.452 E3.5884
G1 X122.504 Y50.487 E.01534
G1 X205.521 Y133.504 E3.60863
G1 X205.482 Y133.999 E.01525
G1 X122.006 Y50.523 E3.62858
G1 X121.509 Y50.559 E.01534
G1 X205.443 Y134.493 E3.64852
G3 X205.399 Y134.983 I-9.371 J-.597 E.0151
G1 X121.017 Y50.601 E3.66796
G1 X120.535 Y50.652 E.01492
G1 X205.348 Y135.465 E3.68674
G1 X205.298 Y135.948 E.01492
G1 X120.052 Y50.702 E3.70551
G1 X119.569 Y50.753 E.01492
G1 X205.247 Y136.431 E3.72429
G1 X205.196 Y136.913 E.01492
G1 X119.087 Y50.804 E3.74307
G1 X118.604 Y50.855 E.01492
G1 X205.145 Y137.396 E3.76184
G3 X205.082 Y137.866 I-6.789 J-.676 E.01458
G1 X118.131 Y50.915 E3.77966
G1 X117.659 Y50.977 E.01461
G1 X205.016 Y138.334 E3.79729
G1 X204.95 Y138.802 E.01452
G1 X117.188 Y51.039 E3.81492
G1 X116.726 Y51.11 E.01438
G1 X204.885 Y139.269 E3.83216
G1 X204.819 Y139.737 E.01452
G1 X116.263 Y51.181 E3.8494
G1 X115.801 Y51.253 E.01438
G1 X204.752 Y140.204 E3.86659
G1 X204.676 Y140.661 E.01424
G1 X115.34 Y51.325 E3.88332
G1 X114.887 Y51.405 E.01414
G1 X204.599 Y141.118 E3.89968
G3 X204.521 Y141.573 I-8.722 J-1.266 E.0142
G1 X114.434 Y51.486 E3.91595
G1 X113.982 Y51.567 E.01414
G1 X204.434 Y142.019 E3.93186
G1 X204.347 Y142.466 E.01398
G1 X113.529 Y51.647 E3.94777
G2 X113.078 Y51.73 I1.47 J9.29 E.01409
G1 X204.261 Y142.913 E3.96359
G1 X204.174 Y143.359 E.01398
G1 X112.635 Y51.82 E3.97908
G1 X112.191 Y51.91 E.0139
G1 X204.087 Y143.806 E3.99458
G3 X203.997 Y144.25 I-6.405 J-1.062 E.01392
G1 X111.75 Y52.003 E4.00986
G1 X111.317 Y52.103 E.01367
G1 X203.897 Y144.683 E4.02435
G1 X203.797 Y145.116 E.01367
G1 X110.884 Y52.203 E4.03884
G1 X110.45 Y52.303 E.01367
G1 X203.697 Y145.55 E4.05333
G1 X203.597 Y145.983 E.01367
G1 X110.017 Y52.403 E4.06782
G1 X109.583 Y52.503 E.01367
G1 X203.497 Y146.417 E4.08231
G3 X203.396 Y146.849 I-6.263 J-1.243 E.01364
G1 X109.151 Y52.604 E4.09669
G1 X108.727 Y52.714 E.01346
G1 X203.283 Y147.269 E4.11021
G1 X203.17 Y147.69 E.01339
G1 X108.303 Y52.823 E4.12373
G1 X107.88 Y52.933 E.01345
G1 X203.057 Y148.111 E4.13725
G1 X202.945 Y148.531 E.01339
G1 X107.465 Y53.052 E4.15037
G1 X107.051 Y53.171 E.01326
G1 X202.832 Y148.952 E4.16349
G1 X202.719 Y149.373 E.01339
G1 X106.636 Y53.29 E4.17661
G1 X106.221 Y53.409 E.01326
G1 X202.598 Y149.785 E4.18938
G1 X202.476 Y150.197 E.01319
G1 X105.807 Y53.527 E4.2021
G1 X105.392 Y53.646 E.01326
G1 X202.355 Y150.609 E4.21482
G3 X202.228 Y151.016 I-11.727 J-3.412 E.0131
G1 X104.986 Y53.774 E4.22698
G1 X104.584 Y53.905 E.01301
G1 X202.1 Y151.421 E4.23892
G1 X201.973 Y151.827 E.01307
G1 X104.181 Y54.035 E4.25087
G1 X103.779 Y54.166 E.01301
G1 X201.84 Y152.228 E4.26261
G1 X201.703 Y152.625 E.0129
G1 X103.376 Y54.297 E4.27417
G1 X102.973 Y54.428 E.01301
G1 X201.567 Y153.021 E4.28573
G1 X201.43 Y153.418 E.0129
G1 X102.573 Y54.561 E4.29718
G1 X102.179 Y54.701 E.01285
G1 X201.294 Y153.815 E4.30836
G1 X201.157 Y154.212 E.0129
G1 X101.786 Y54.84 E4.31955
G2 X101.392 Y54.981 I2.498 J7.634 E.01284
G1 X201.02 Y154.608 E4.33068
G1 X200.874 Y154.996 E.01274
G1 X101.007 Y55.129 E4.34112
G1 X100.621 Y55.276 E.01269
G1 X200.729 Y155.385 E4.35157
G1 X200.584 Y155.773 E.01274
G1 X100.236 Y55.424 E4.36201
G1 X99.85 Y55.572 E.01269
G1 X200.432 Y156.154 E4.37217
M73 P71 R16
G1 X200.279 Y156.534 E.0126
G1 X99.465 Y55.72 E4.38225
G1 X99.079 Y55.868 E.01269
G1 X200.125 Y156.914 E4.39234
G1 X199.972 Y157.294 E.0126
G1 X98.699 Y56.022 E4.40218
G1 X98.325 Y56.181 E.0125
G1 X199.818 Y157.674 E4.41179
G1 X199.665 Y158.054 E.0126
G1 X97.95 Y56.34 E4.42139
G1 X97.576 Y56.499 E.0125
G1 X199.51 Y158.433 E4.43094
G1 X199.348 Y158.804 E.01246
G1 X97.201 Y56.658 E4.44019
G1 X96.827 Y56.817 E.0125
G1 X199.187 Y159.176 E4.44944
G1 X199.025 Y159.548 E.01246
G1 X96.452 Y56.976 E4.45869
G2 X96.086 Y57.142 I2.53 J6.05 E.01238
G1 X198.857 Y159.913 E4.46731
G1 X198.687 Y160.277 E.01234
G1 X95.721 Y57.311 E4.47581
G1 X95.356 Y57.479 E.01236
G1 X198.517 Y160.641 E4.4843
G1 X198.348 Y161.004 E.01234
G1 X94.991 Y57.647 E4.4928
G2 X94.628 Y57.818 I3.448 J7.819 E.01233
G1 X198.178 Y161.368 E4.5012
G1 X198.008 Y161.732 E.01234
G1 X94.27 Y57.993 E4.50939
G1 X93.912 Y58.169 E.01225
G1 X197.838 Y162.095 E4.51755
G1 X197.658 Y162.448 E.01219
G1 X93.554 Y58.344 E4.52528
G1 X93.195 Y58.52 E.01225
G1 X197.478 Y162.802 E4.53302
G1 X197.298 Y163.155 E.01219
G1 X92.837 Y58.695 E4.54075
G2 X92.484 Y58.875 I3.523 J7.344 E.01219
G1 X197.118 Y163.509 E4.54828
G1 X196.938 Y163.862 E.01219
G1 X92.133 Y59.058 E4.5557
G1 X91.783 Y59.24 E.01216
G1 X196.758 Y164.215 E4.56313
G3 X196.575 Y164.566 I-5.128 J-2.443 E.01216
G1 X91.434 Y59.425 E4.57037
G1 X91.09 Y59.615 E.01206
G1 X196.385 Y164.91 E4.57702
M73 P71 R15
G1 X196.195 Y165.253 E.01206
G1 X90.747 Y59.805 E4.58366
G1 X90.404 Y59.996 E.01206
G1 X196.004 Y165.596 E4.59031
G1 X195.814 Y165.939 E.01206
G1 X90.061 Y60.186 E4.59696
G1 X89.718 Y60.376 E.01206
G1 X195.624 Y166.282 E4.60361
G1 X195.434 Y166.626 E.01206
G1 X89.374 Y60.566 E4.61026
G2 X89.034 Y60.76 I2.601 J4.966 E.01203
G1 X195.241 Y166.966 E4.61667
G1 X195.043 Y167.302 E.01198
G1 X88.701 Y60.96 E4.62256
G1 X88.368 Y61.16 E.01195
G1 X194.846 Y167.638 E4.62845
G1 X194.648 Y167.974 E.01198
G1 X88.035 Y61.36 E4.63433
G1 X87.702 Y61.561 E.01195
G1 X194.446 Y168.305 E4.64004
G1 X194.243 Y168.636 E.01192
G1 X87.368 Y61.761 E4.64572
G1 X87.035 Y61.961 E.01195
G1 X194.041 Y168.967 E4.65139
G3 X193.835 Y169.295 I-6.384 J-3.764 E.0119
G1 X86.704 Y62.164 E4.65685
G1 X86.379 Y62.371 E.01188
G1 X193.625 Y169.618 E4.66188
G1 X193.415 Y169.942 E.01185
G1 X86.053 Y62.579 E4.66691
G1 X85.727 Y62.787 E.01188
G1 X193.205 Y170.265 E4.67195
G1 X192.995 Y170.588 E.01185
G1 X85.405 Y62.998 E4.67681
G1 X85.084 Y63.211 E.01183
G1 X192.785 Y170.912 E4.68163
G1 X192.575 Y171.235 E.01185
G1 X84.763 Y63.423 E4.68645
G2 X84.444 Y63.638 I3.949 J6.207 E.01181
G1 X192.362 Y171.556 E4.69105
G1 X192.142 Y171.869 E.01177
G1 X84.131 Y63.858 E4.69514
G1 X83.817 Y64.077 E.01177
G1 X191.923 Y172.183 E4.69923
G1 X191.703 Y172.497 E.01177
G1 X83.503 Y64.297 E4.70332
G1 X83.189 Y64.517 E.01177
G1 X191.483 Y172.811 E4.7074
G1 X191.264 Y173.124 E.01177
G1 X82.876 Y64.736 E4.71149
G1 X82.562 Y64.956 E.01177
G1 X191.044 Y173.438 E4.71558
G3 X190.823 Y173.75 I-6.082 J-4.078 E.01176
G1 X82.25 Y65.177 E4.71953
G1 X81.943 Y65.404 E.01172
G1 X190.596 Y174.057 E4.723
G1 X190.369 Y174.363 E.01172
G1 X81.637 Y65.631 E4.72646
M73 P72 R15
G1 X81.33 Y65.858 E.01172
G1 X190.142 Y174.67 E4.72993
G3 X189.91 Y174.972 I-5.897 J-4.287 E.0117
G1 X81.027 Y66.089 E4.73301
G1 X80.727 Y66.322 E.01169
G1 X189.677 Y175.271 E4.73591
G1 X189.443 Y175.571 E.01168
G1 X80.426 Y66.554 E4.7388
G1 X80.126 Y66.787 E.01169
G1 X189.209 Y175.87 E4.7417
G1 X188.975 Y176.17 E.01168
G1 X79.825 Y67.02 E4.7446
G2 X79.53 Y67.258 I4.947 J6.43 E.01166
G1 X188.741 Y176.469 E4.74726
G1 X188.507 Y176.769 E.01168
G1 X79.235 Y67.498 E4.74988
G1 X78.941 Y67.737 E.01166
G1 X188.269 Y177.064 E4.75234
G1 X188.028 Y177.357 E.01165
G1 X78.647 Y67.976 E4.75465
G1 X78.353 Y68.215 E.01166
G1 X187.787 Y177.649 E4.75696
G1 X187.546 Y177.942 E.01165
G1 X78.058 Y68.454 E4.75928
G2 X77.77 Y68.7 I4.883 J6.023 E.01163
G1 X187.298 Y178.227 E4.76103
G1 X187.05 Y178.513 E.01162
G1 X77.483 Y68.945 E4.76275
G1 X77.195 Y69.191 E.01163
G1 X186.802 Y178.798 E4.76447
G1 X186.554 Y179.083 E.01162
G1 X76.909 Y69.439 E4.76612
G1 X76.626 Y69.689 E.01162
G1 X186.306 Y179.369 E4.76764
G1 X186.058 Y179.654 E.01162
G1 X76.343 Y69.939 E4.76916
G1 X76.06 Y70.19 E.01162
G1 X185.81 Y179.94 E4.77068
G3 X185.556 Y180.219 I-5.443 J-4.674 E.01161
G1 X75.782 Y70.446 E4.77173
G1 X75.506 Y70.703 E.0116
G1 X185.301 Y180.498 E4.77264
G1 X185.046 Y180.776 E.01161
G1 X75.23 Y70.96 E4.77355
G1 X74.954 Y71.218 E.0116
G1 X184.79 Y181.054 E4.77442
G1 X184.53 Y181.327 E.0116
G1 X74.678 Y71.475 E4.77513
G1 X74.402 Y71.733 E.0116
G1 X184.271 Y181.601 E4.77584
G1 X184.011 Y181.875 E.0116
G1 X74.126 Y71.99 E4.77655
G2 X73.856 Y72.253 I3.636 J4.011 E.0116
G1 X183.747 Y182.144 E4.77683
G1 X183.48 Y182.411 E.01159
G1 X73.589 Y72.52 E4.77683
G1 X73.322 Y72.786 E.01159
G1 X183.214 Y182.678 E4.77683
G1 X182.947 Y182.945 E.01159
G1 X73.055 Y73.053 E4.77683
G1 X72.789 Y73.32 E.01159
G1 X182.68 Y183.211 E4.77683
G1 X182.413 Y183.478 E.01159
G1 X72.522 Y73.587 E4.77683
G1 X72.255 Y73.853 E.01159
G1 X182.147 Y183.745 E4.77683
G3 X181.876 Y184.008 I-3.898 J-3.737 E.0116
G1 X71.991 Y74.123 E4.77655
G1 X71.732 Y74.397 E.0116
G1 X181.6 Y184.265 E4.77584
G1 X181.324 Y184.523 E.0116
G1 X71.472 Y74.67 E4.77514
G1 X71.212 Y74.944 E.0116
G1 X181.048 Y184.78 E4.77443
G1 X180.772 Y185.037 E.0116
G1 X70.956 Y75.221 E4.77356
G1 X70.701 Y75.5 E.01161
G1 X180.496 Y185.295 E4.77264
G1 X180.22 Y185.552 E.0116
G1 X70.446 Y75.778 E4.77173
G2 X70.192 Y76.058 I5.205 J4.97 E.01161
G1 X179.942 Y185.808 E4.77069
G1 X179.659 Y186.058 E.01162
G1 X69.944 Y76.343 E4.76917
G1 X69.696 Y76.629 E.01162
G1 X179.376 Y186.309 E4.76765
G1 X179.093 Y186.559 E.01162
G1 X69.448 Y76.914 E4.76613
G1 X69.2 Y77.2 E.01162
G1 X178.807 Y186.807 E4.76449
G1 X178.52 Y187.053 E.01163
G1 X68.952 Y77.485 E4.76276
G1 X68.704 Y77.77 E.01162
G1 X178.232 Y187.298 E4.76104
G3 X177.944 Y187.544 I-4.846 J-5.396 E.01163
G1 X68.456 Y78.056 E4.75929
G1 X68.216 Y78.35 E.01165
G1 X177.649 Y187.782 E4.7569
G1 X177.354 Y188.021 E.01166
G1 X67.977 Y78.643 E4.75452
G1 X67.737 Y78.937 E.01165
G1 X177.06 Y188.26 E4.75213
M73 P73 R15
G1 X176.765 Y188.498 E.01166
G1 X67.497 Y79.23 E4.74974
G2 X67.259 Y79.525 I6.142 J5.209 E.01166
G1 X176.47 Y188.737 E4.74729
G1 X176.175 Y188.976 E.01166
G1 X67.025 Y79.825 E4.74463
G1 X66.792 Y80.125 E.01168
G1 X175.881 Y189.214 E4.74197
G3 X175.578 Y189.445 I-3.457 J-4.236 E.0117
G1 X66.558 Y80.425 E4.73894
G1 X66.325 Y80.725 E.01168
G1 X175.273 Y189.674 E4.73586
G1 X174.969 Y189.903 E.01171
G1 X66.091 Y81.025 E4.73279
G2 X65.861 Y81.328 I4.466 J3.639 E.0117
G1 X174.665 Y190.132 E4.72959
G1 X174.361 Y190.362 E.01171
G1 X65.636 Y81.637 E4.72612
G1 X65.412 Y81.946 E.01174
G1 X174.057 Y190.591 E4.72265
G1 X173.752 Y190.82 E.01171
G1 X65.187 Y82.255 E4.71919
M73 P73 R14
G1 X64.963 Y82.564 E.01174
G1 X173.443 Y191.044 E4.71549
G1 X173.131 Y191.266 E.01176
G1 X64.738 Y82.873 E4.71171
G1 X64.514 Y83.182 E.01174
G1 X172.82 Y191.488 E4.70793
G3 X172.508 Y191.709 I-6.515 J-8.877 E.01176
G1 X64.291 Y83.493 E4.70402
G1 X64.076 Y83.812 E.01181
G1 X172.191 Y191.927 E4.69962
G1 X171.875 Y192.144 E.01179
G1 X63.862 Y84.13 E4.69522
G1 X63.647 Y84.449 E.01181
G1 X171.559 Y192.361 E4.69081
G3 X171.238 Y192.573 I-4.215 J-6.026 E.01183
G1 X63.432 Y84.767 E4.6862
G1 X63.217 Y85.086 E.01181
G1 X170.915 Y192.783 E4.68148
G1 X170.591 Y192.993 E.01185
G1 X63.002 Y85.404 E4.67676
G2 X62.788 Y85.724 I5.962 J4.218 E.01182
G1 X170.268 Y193.203 E4.67199
G1 X169.944 Y193.414 E.01185
G1 X62.581 Y86.05 E4.66696
G1 X62.373 Y86.376 E.01188
G1 X169.621 Y193.624 E4.66192
G1 X169.298 Y193.834 E.01185
G1 X62.166 Y86.702 E4.65689
G2 X61.963 Y87.032 I6.216 J4.04 E.01192
G1 X168.968 Y194.037 E4.65137
G1 X168.635 Y194.237 E.01195
G1 X61.763 Y87.365 E4.64559
G1 X61.562 Y87.699 E.01195
G1 X168.301 Y194.438 E4.63981
G1 X167.968 Y194.638 E.01195
G1 X61.362 Y88.032 E4.63402
G1 X61.162 Y88.365 E.01195
G1 X167.635 Y194.838 E4.62824
G1 X167.302 Y195.038 E.01195
G1 X60.962 Y88.698 E4.62246
G1 X60.761 Y89.032 E.01195
G1 X166.968 Y195.239 E4.61668
G3 X166.63 Y195.434 I-3.895 J-6.356 E.012
G1 X60.566 Y89.37 E4.61047
G1 X60.373 Y89.71 E.01203
G1 X166.29 Y195.627 E4.60404
G1 X165.949 Y195.819 E.01203
G1 X60.181 Y90.051 E4.5976
G2 X59.99 Y90.393 I6.441 J3.822 E.01205
G1 X165.607 Y196.01 E4.59104
G1 X165.258 Y196.196 E.01212
G1 X59.804 Y90.742 E4.58395
G1 X59.619 Y91.09 E.01212
G1 X164.91 Y196.381 E4.57686
G1 X164.562 Y196.566 E.01212
G1 X59.434 Y91.438 E4.56977
G1 X59.249 Y91.787 E.01212
G1 X164.214 Y196.751 E4.56268
G1 X163.865 Y196.936 E.01212
G1 X59.064 Y92.135 E4.55559
G1 X58.878 Y92.483 E.01212
G1 X163.517 Y197.122 E4.5485
G3 X163.166 Y197.304 I-3.653 J-6.586 E.01216
G1 X58.697 Y92.835 E4.54116
G1 X58.522 Y93.193 E.01226
G1 X162.81 Y197.482 E4.53329
G1 X162.454 Y197.659 E.01223
G1 X58.347 Y93.552 E4.52541
G1 X58.172 Y93.91 E.01226
G1 X162.098 Y197.837 E4.51754
G3 X161.735 Y198.007 I-3.435 J-6.855 E.01233
G1 X57.997 Y94.269 E4.50936
G1 X57.822 Y94.627 E.01226
G1 X161.371 Y198.177 E4.50115
G1 X161.008 Y198.346 E.01234
G1 X57.647 Y94.986 E4.49293
G2 X57.477 Y95.349 I6.847 J3.445 E.01232
G1 X160.644 Y198.516 E4.48454
M73 P74 R14
G1 X160.28 Y198.685 E.01234
G1 X57.31 Y95.715 E4.47599
G1 X57.143 Y96.082 E.01238
G1 X159.916 Y198.855 E4.46743
G3 X159.551 Y199.024 I-3.394 J-6.876 E.01236
G1 X56.976 Y96.449 E4.45879
G1 X56.815 Y96.821 E.01246
G1 X159.179 Y199.185 E4.44965
G1 X158.808 Y199.347 E.01246
G1 X56.653 Y97.192 E4.44052
G1 X56.491 Y97.564 E.01246
G1 X158.436 Y199.508 E4.43139
G3 X158.057 Y199.663 I-3.142 J-7.131 E.01257
G1 X56.336 Y97.943 E4.42167
G1 X56.183 Y98.323 E.0126
G1 X157.677 Y199.817 E4.41183
G1 X157.297 Y199.971 E.0126
G1 X56.029 Y98.703 E4.40199
G1 X55.876 Y99.082 E.0126
G1 X156.918 Y200.124 E4.39215
G1 X156.538 Y200.278 E.0126
G1 X55.722 Y99.462 E4.3823
G1 X55.569 Y99.842 E.0126
G1 X156.158 Y200.431 E4.37246
G3 X155.776 Y200.583 I-3.08 J-7.181 E.01262
G1 X55.417 Y100.224 E4.36248
G1 X55.272 Y100.612 E.01274
G1 X155.388 Y200.728 E4.35191
G1 X155 Y200.873 E.01274
G1 X55.127 Y101 E4.34134
G1 X54.982 Y101.389 E.01274
G1 X154.611 Y201.018 E4.33078
G3 X154.215 Y201.156 I-2.822 J-7.505 E.01289
G1 X54.844 Y101.785 E4.31952
G1 X54.708 Y102.182 E.0129
G1 X153.818 Y201.292 E4.30821
G1 X153.422 Y201.429 E.0129
G1 X54.571 Y102.578 E4.2969
G1 X54.434 Y102.975 E.0129
G1 X153.025 Y201.566 E4.28559
G1 X152.628 Y201.702 E.0129
G1 X54.298 Y103.372 E4.27428
G1 X54.161 Y103.769 E.0129
G1 X152.231 Y201.839 E4.26297
G3 X151.83 Y201.972 I-2.738 J-7.602 E.01298
G1 X54.028 Y104.17 E4.25132
G1 X53.901 Y104.575 E.01307
G1 X151.425 Y202.099 E4.23925
G1 X151.019 Y202.227 E.01307
G1 X53.773 Y104.981 E4.22718
G2 X53.647 Y105.389 I7.725 J2.598 E.01312
G1 X150.611 Y202.353 E4.2149
G1 X150.197 Y202.472 E.01324
G1 X53.528 Y105.803 E4.20208
G1 X53.41 Y106.218 E.01326
G1 X149.783 Y202.592 E4.18925
G1 X149.37 Y202.711 E.01324
G1 X53.291 Y106.633 E4.17643
G1 X53.172 Y107.047 E.01326
G1 X148.956 Y202.831 E4.1636
G3 X148.541 Y202.95 I-2.769 J-8.867 E.01326
G1 X53.053 Y107.462 E4.15075
G1 X52.934 Y107.876 E.01326
G1 X148.119 Y203.061 E4.13757
G1 X147.697 Y203.172 E.01342
G1 X52.824 Y108.3 E4.12399
G1 X52.715 Y108.724 E.01346
G1 X147.275 Y203.284 E4.1104
G1 X146.852 Y203.395 E.01342
G1 X52.605 Y109.148 E4.09681
G2 X52.504 Y109.58 I8.185 J2.144 E.01365
G1 X146.423 Y203.499 E4.08255
G1 X145.993 Y203.602 E.0136
G1 X52.404 Y110.013 E4.0682
G1 X52.304 Y110.447 E.01367
G1 X145.563 Y203.706 E4.05385
G3 X145.125 Y203.801 I-2.192 J-8.961 E.01377
G1 X52.204 Y110.88 E4.03918
G1 X52.104 Y111.313 E.01367
G1 X144.686 Y203.896 E4.02444
G1 X144.247 Y203.99 E.01381
G1 X52.004 Y111.747 E4.00969
G2 X51.914 Y112.19 I6.313 J1.508 E.01392
G1 X143.807 Y204.084 E3.9945
G1 X143.368 Y204.178 E.01381
G1 X51.827 Y112.637 E3.97918
G1 X51.74 Y113.084 E.01399
G1 X142.922 Y204.265 E3.96354
G1 X142.473 Y204.35 E.01402
G1 X51.653 Y113.53 E3.94783
G1 X51.567 Y113.977 E.01399
G1 X142.025 Y204.435 E3.93211
G1 X141.577 Y204.521 E.01403
G1 X51.48 Y114.424 E3.9164
G2 X51.401 Y114.879 I8.669 J1.728 E.01419
G1 X141.118 Y204.596 E3.89989
G1 X140.658 Y204.669 E.01433
G1 X51.325 Y115.336 E3.88319
G1 X51.248 Y115.793 E.01424
G1 X140.197 Y204.742 E3.8665
G1 X139.737 Y204.815 E.01433
G1 X51.178 Y116.256 E3.84953
G1 X51.109 Y116.72 E.01442
G1 X139.276 Y204.887 E3.83253
G1 X138.816 Y204.96 E.01433
G1 X51.04 Y117.184 E3.81553
G1 X50.979 Y117.657 E.01466
G1 X138.341 Y205.019 E3.79749
M73 P75 R13
G1 X137.866 Y205.077 E.01471
G1 X50.919 Y118.131 E3.77945
G1 X50.859 Y118.604 E.01466
G1 X137.391 Y205.135 E3.76141
G1 X136.916 Y205.194 E.01471
G1 X50.801 Y119.079 E3.7433
G1 X50.751 Y119.562 E.01494
G1 X136.44 Y205.252 E3.72482
G3 X135.962 Y205.307 I-1.28 J-9.105 E.01482
G1 X50.701 Y120.046 E3.70617
G1 X50.651 Y120.53 E.01494
G1 X135.475 Y205.353 E3.68719
G1 X134.988 Y205.4 E.01503
G1 X50.601 Y121.013 E3.66821
G2 X50.557 Y121.503 I10.032 J1.144 E.01511
G1 X134.496 Y205.441 E3.64869
G1 X133.998 Y205.477 E.01534
G1 X50.518 Y121.997 E3.62875
G1 X50.479 Y122.492 E.01525
G1 X133.5 Y205.512 E3.6088
G1 X133.002 Y205.548 E.01534
G1 X50.447 Y122.993 E3.58857
G1 X50.416 Y123.496 E.01548
G1 X132.504 Y205.583 E3.56823
G1 X131.995 Y205.608 E.01566
G1 X50.387 Y124 E3.54737
G1 X50.369 Y124.516 E.01585
G1 X131.486 Y205.632 E3.52604
G1 X130.977 Y205.657 E.01566
G1 X50.351 Y125.031 E3.5047
G1 X50.333 Y125.546 E.01585
G1 X130.461 Y205.674 E3.48304
G1 X129.937 Y205.683 E.01612
G1 X50.315 Y126.062 E3.46103
G1 X50.297 Y126.577 E.01585
G1 X129.412 Y205.692 E3.43902
G1 X128.888 Y205.701 E.01612
G1 X50.295 Y127.108 E3.41633
G1 X50.295 Y127.642 E.0164
G1 X128.364 Y205.71 E3.39354
G3 X127.835 Y205.715 I-.359 J-10.105 E.01625
G1 X50.295 Y128.175 E3.37057
G1 X50.295 Y128.709 E.0164
G1 X127.297 Y205.711 E3.34717
G1 X126.759 Y205.706 E.01654
G1 X50.295 Y129.242 E3.32378
G2 X50.31 Y129.791 I7.861 J.057 E.01687
G1 X126.21 Y205.691 E3.29927
G1 X125.658 Y205.672 E.01697
G1 X50.33 Y130.344 E3.27445
G1 X50.349 Y130.896 E.017
G1 X125.107 Y205.654 E3.24963
G1 X124.555 Y205.636 E.01697
G1 X50.368 Y131.449 E3.2248
G1 X50.387 Y132.002 E.017
G1 X123.993 Y205.608 E3.19955
G1 X123.428 Y205.576 E.01741
G1 X50.42 Y132.568 E3.17354
G1 X50.455 Y133.136 E.0175
G1 X122.862 Y205.544 E3.14745
G3 X122.29 Y205.505 I.596 J-13.046 E.01763
G1 X50.498 Y133.713 E3.12071
G1 X50.549 Y134.297 E.01804
G1 X121.711 Y205.459 E3.09332
G3 X121.129 Y205.411 I.632 J-11.123 E.01795
G1 X50.6 Y134.882 E3.0658
G1 X50.652 Y135.466 E.01804
G1 X120.533 Y205.348 E3.03767
G1 X119.937 Y205.285 E.01842
G1 X50.703 Y136.051 E3.00953
G2 X50.769 Y136.651 I11.541 J-.974 E.01855
G1 X119.341 Y205.223 E2.98073
G1 X118.745 Y205.16 E.01842
G1 X50.838 Y137.253 E2.95184
G2 X50.918 Y137.867 I11.777 J-1.232 E.01904
G1 X118.133 Y205.082 E2.92175
G1 X117.512 Y204.995 E.01927
G1 X51.005 Y138.487 E2.89098
G1 X51.093 Y139.108 E.01927
G1 X116.892 Y204.907 E2.86021
G1 X116.271 Y204.82 E.01927
G1 X51.18 Y139.729 E2.82944
G2 X51.273 Y140.356 I12.028 J-1.472 E.01948
G1 X115.644 Y204.727 E2.79813
G1 X115.004 Y204.62 E.01997
G1 X51.38 Y140.996 E2.76562
G2 X51.492 Y141.641 I14.746 J-2.212 E.02011
G1 X114.358 Y204.508 E2.73273
G1 X113.696 Y204.379 E.02073
G1 X51.617 Y142.3 E2.69851
G1 X51.742 Y142.958 E.0206
G1 X113.034 Y204.25 E2.66429
G1 X112.372 Y204.121 E.02073
G1 X51.877 Y143.627 E2.62962
G1 X52.023 Y144.306 E.02135
G1 X111.705 Y203.988 E2.59431
G1 X111.02 Y203.836 E.02158
G1 X52.168 Y144.985 E2.55819
G2 X52.321 Y145.671 I11.962 J-2.305 E.02162
G1 X110.33 Y203.68 E2.52155
G1 X109.628 Y203.511 E.02219
G1 X52.494 Y146.378 E2.48352
G1 X52.667 Y147.084 E.02235
G1 X108.915 Y203.332 E2.44503
G1 X108.187 Y203.137 E.02319
G1 X52.859 Y147.809 E2.40505
G1 X53.056 Y148.54 E.02326
G1 X107.458 Y202.942 E2.3648
G1 X106.729 Y202.747 E.02319
G1 X53.253 Y149.27 E2.32455
G2 X53.48 Y150.031 I11.605 J-3.051 E.0244
G1 X105.978 Y202.528 E2.282
G3 X105.217 Y202.301 I3.943 J-14.594 E.0244
G1 X53.715 Y150.799 E2.23873
G1 X53.95 Y151.567 E.0247
G1 X104.427 Y202.044 E2.19417
G1 X103.637 Y201.788 E.02554
G1 X54.199 Y152.35 E2.14901
G1 X54.467 Y153.151 E.02598
G1 X102.846 Y201.531 E2.103
G3 X102.017 Y201.235 I3.823 J-12.019 E.02708
G1 X54.755 Y153.973 E2.05442
G2 X55.056 Y154.807 I19.156 J-6.442 E.02728
G1 X101.178 Y200.929 E2.00487
G1 X100.339 Y200.624 E.02743
G1 X55.382 Y155.666 E1.95426
G2 X55.718 Y156.536 I18.66 J-6.715 E.02867
G1 X99.457 Y200.275 E1.90129
G1 X98.562 Y199.914 E.02967
G1 X56.083 Y157.434 E1.84652
G1 X56.448 Y158.333 E.0298
G1 X97.667 Y199.552 E1.79176
M73 P76 R13
G3 X96.725 Y199.144 I7.306 J-18.136 E.03156
G1 X56.856 Y159.275 E1.73304
G2 X57.29 Y160.242 I28.002 J-11.977 E.03258
G1 X95.758 Y198.71 E1.67215
G3 X94.754 Y198.24 I8.482 J-19.409 E.03408
G1 X57.76 Y161.246 E1.60807
G1 X58.268 Y162.287 E.03561
G1 X93.713 Y197.732 E1.54073
G3 X92.667 Y197.219 I6.822 J-15.251 E.0358
G1 X58.781 Y163.333 E1.47301
G1 X59.386 Y164.472 E.03966
G1 X91.528 Y196.614 E1.39716
G1 X90.389 Y196.008 E.03966
G1 X59.992 Y165.611 E1.32132
G2 X60.682 Y166.834 I23.73 J-12.575 E.04317
G1 X89.166 Y195.318 E1.23817
G3 X87.831 Y194.517 I14.699 J-26.001 E.04784
G1 X61.483 Y168.169 E1.14535
G2 X62.318 Y169.537 I26.527 J-15.248 E.04928
G1 X86.463 Y193.682 E1.04956
G3 X84.915 Y192.668 I18.599 J-30.065 E.0569
G1 X63.304 Y171.057 E.9394
G2 X64.499 Y172.785 I33.622 J-21.966 E.06458
G1 X83.248 Y191.534 E.81501
G1 X81.297 Y190.117 E.07411
G1 X65.936 Y174.756 E.66773
G2 X67.884 Y177.237 I36.491 J-26.641 E.09699
G1 X78.763 Y188.116 E.47288
G1 X78.044 Y187.534 E.02843
G3 X74.106 Y183.992 I58.499 J-69.013 E.16283
G1 X69.271 Y179.158 E.21014
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X70.686 Y180.572 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/10
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; OBJECT_ID: 15978
M204 S10000
G17
G3 Z1.8 I.649 J1.029 P1  F42000
G1 X200.356 Y98.766 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
M204 S6000
G1 X200.855 Y100.033 E.04515
G3 X111.772 Y51.656 I-72.865 J27.968 E12.60735
G3 X129.024 Y49.959 I16.247 J76.642 E.57622
G3 X199.836 Y97.508 I-1.034 J78.042 E2.99334
G1 X200.333 Y98.711 E.04318
M204 S10000
G1 X200.719 Y98.62 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X201.23 Y99.889 E.04205
G3 X129.37 Y206.43 I-73.23 J28.112 E4.62741
G1 X129.028 Y206.433 E.01051
G3 X129.028 Y49.567 I-1.027 J-78.433 E7.6351
G3 X200.205 Y97.352 I-1.028 J78.434 E2.78691
G1 X200.697 Y98.564 E.0402
; WIPE_START
M204 S6000
G1 X201.23 Y99.889 E-.54277
G1 X201.431 Y100.424 E-.21723
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2 F4000
            G39.3 S1
            G0 Z2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X179.197 Y186.694 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42012
G1 F15000
M204 S6000
G1 X183.909 Y181.982 E.20482
G2 X188.155 Y177.203 I-55.233 J-53.344 E.19655
G1 X177.261 Y188.097 E.47354
G3 X174.765 Y190.059 I-30.36 J-36.046 E.0976
G1 X190.108 Y174.717 E.66692
G2 X191.491 Y172.8 I-35.931 J-27.388 E.07266
G1 X172.763 Y191.528 E.81408
G3 X171.084 Y192.673 I-37.285 J-52.843 E.06248
G1 X192.673 Y171.084 E.93847
G1 X193.661 Y169.562 E.05576
G1 X169.562 Y193.661 E1.04755
G3 X168.18 Y194.511 I-12.851 J-19.373 E.04988
G1 X194.542 Y168.149 E1.14591
G2 X195.312 Y166.845 I-178.114 J-106.119 E.04655
G1 X166.845 Y195.313 E1.23745
G3 X165.621 Y196.003 I-13.824 J-23.076 E.04319
G1 X195.975 Y165.648 E1.31948
G2 X196.636 Y164.454 I-16.67 J-10 E.04194
G1 X164.482 Y196.609 E1.39771
G1 X163.342 Y197.214 E.03966
G1 X197.19 Y163.367 E1.47131
G1 X197.744 Y162.279 E.03752
G1 X162.274 Y197.749 E1.54182
G3 X161.263 Y198.227 I-9.654 J-19.108 E.03441
G1 X198.227 Y161.263 E1.60681
G1 X198.693 Y160.263 E.0339
G1 X160.263 Y198.693 E1.67052
G3 X159.283 Y199.14 I-9.028 J-18.506 E.03312
G1 X199.14 Y159.283 E1.73255
G2 X199.549 Y158.34 I-17.769 J-8.271 E.03158
G1 X158.34 Y199.549 E1.79129
G1 X157.445 Y199.911 E.02967
G1 X199.911 Y157.445 E1.84592
G1 X200.272 Y156.55 E.02967
G1 X156.55 Y200.272 E1.90054
G3 X155.665 Y200.625 I-7.161 J-16.717 E.0293
G1 X200.625 Y155.665 E1.95435
G1 X200.943 Y154.813 E.02796
G1 X154.813 Y200.943 E2.00524
G3 X153.989 Y201.234 I-5.956 J-15.579 E.02686
G1 X201.239 Y153.983 E2.05392
G1 X201.527 Y153.162 E.02674
G1 X153.175 Y201.514 E2.10178
G1 X152.361 Y201.794 E.02645
G1 X201.789 Y152.367 E2.14854
G1 X202.044 Y151.578 E.02548
G1 X151.568 Y202.054 E2.19414
G1 X150.789 Y202.3 E.02511
G1 X202.299 Y150.789 E2.2391
G2 X202.526 Y150.029 I-15.124 J-4.931 E.0244
G1 X150.037 Y202.518 E2.28165
G1 X149.287 Y202.734 E.02397
G1 X202.745 Y149.277 E2.32373
G1 X202.94 Y148.548 E.02319
G1 X148.538 Y202.95 E2.36478
G3 X147.812 Y203.143 I-4.399 J-15.082 E.02311
G1 X203.135 Y147.819 E2.40486
G1 X203.331 Y147.091 E.02319
G1 X147.088 Y203.333 E2.44478
G3 X146.378 Y203.51 I-4.576 J-16.857 E.0225
G1 X203.505 Y146.383 E2.48323
G1 X203.665 Y145.69 E.02188
G1 X145.676 Y203.678 E2.5207
G3 X144.991 Y203.83 I-3.382 J-13.666 E.02156
G1 X203.825 Y144.996 E2.55743
G1 X203.985 Y144.303 E.02188
G1 X144.313 Y203.975 E2.59389
G1 X143.634 Y204.12 E.02133
G1 X204.126 Y143.628 E2.62953
G1 X204.263 Y142.958 E.02101
G1 X142.962 Y204.259 E2.66467
G1 X142.304 Y204.383 E.02057
G1 X204.385 Y142.303 E2.69856
G1 X204.503 Y141.651 E.02037
G1 X141.646 Y204.508 E2.7323
G3 X141.007 Y204.613 I-2.104 J-10.725 E.01992
G1 X204.617 Y141.004 E2.76503
G1 X204.716 Y140.371 E.01969
G1 X140.373 Y204.714 E2.7969
G1 X139.739 Y204.814 E.01972
G1 X204.816 Y139.738 E2.82878
G1 X204.915 Y139.105 E.01969
G1 X139.105 Y204.915 E2.86065
G3 X138.482 Y205.004 I-2.031 J-11.881 E.01936
G1 X205.004 Y138.482 E2.89163
G1 X205.085 Y137.868 E.01905
G1 X137.868 Y205.085 E2.92185
G3 X137.26 Y205.16 I-1.721 J-11.543 E.01882
G1 X205.16 Y137.26 E2.95151
G1 X205.222 Y136.664 E.01842
G1 X136.664 Y205.222 E2.98014
G1 X136.068 Y205.285 E.01842
G1 X205.285 Y136.068 E3.00878
G1 X205.348 Y135.472 E.01842
G1 X135.472 Y205.348 E3.03741
G1 X134.876 Y205.41 E.01842
G1 X205.41 Y134.876 E3.06605
G2 X205.459 Y134.294 I-11.046 J-1.214 E.01795
G1 X134.298 Y205.455 E3.09328
G1 X133.723 Y205.496 E.0177
G1 X205.504 Y133.715 E3.12023
G2 X205.545 Y133.141 I-16.421 J-1.44 E.01768
G1 X133.149 Y205.537 E3.14694
G1 X132.575 Y205.577 E.0177
G1 X205.579 Y132.573 E3.17342
G2 X205.612 Y132.006 I-10.772 J-.912 E.01744
G1 X132.011 Y205.608 E3.19938
M73 P76 R12
G1 X131.451 Y205.635 E.01723
G1 X205.632 Y131.454 E3.22455
G1 X205.651 Y130.901 E.017
G1 X130.891 Y205.661 E3.24972
G3 X130.341 Y205.678 I-.621 J-11.252 E.01692
G1 X205.67 Y130.348 E3.27448
G1 X205.69 Y129.795 E.017
G1 X129.795 Y205.69 E3.29905
G1 X129.249 Y205.703 E.01678
G1 X205.705 Y129.246 E3.32347
G1 X205.708 Y128.71 E.01648
G1 X128.711 Y205.707 E3.34699
G1 X128.178 Y205.707 E.01638
G1 X205.711 Y128.174 E3.37027
G2 X205.713 Y127.638 I-11.168 J-.314 E.01647
G1 X127.645 Y205.706 E3.39353
G1 X127.112 Y205.705 E.01638
G1 X205.704 Y127.114 E3.41626
G1 X205.694 Y126.591 E.0161
G1 X126.582 Y205.703 E3.4389
G1 X126.066 Y205.685 E.01585
G1 X205.684 Y126.067 E3.46088
G1 X205.674 Y125.543 E.0161
G1 X125.551 Y205.667 E3.48286
G1 X125.035 Y205.649 E.01585
G1 X205.657 Y125.027 E3.50453
G1 X205.633 Y124.517 E.01568
G1 X124.52 Y205.631 E3.52589
G1 X124.004 Y205.613 E.01585
G1 X205.609 Y124.008 E3.54725
G2 X205.583 Y123.501 I-10.644 J.296 E.01561
G1 X123.5 Y205.584 E3.56804
M73 P77 R12
G1 X122.997 Y205.553 E.01548
G1 X205.547 Y123.003 E3.58835
G1 X205.512 Y122.505 E.01535
G1 X122.496 Y205.521 E3.6086
G1 X122.001 Y205.482 E.01525
G1 X205.477 Y122.007 E3.62856
G1 X205.441 Y121.509 E.01535
G1 X121.507 Y205.443 E3.64851
G3 X121.017 Y205.399 I.595 J-9.345 E.0151
G1 X205.399 Y121.017 E3.66796
G1 X205.348 Y120.535 E.01492
G1 X120.535 Y205.348 E3.68674
G1 X120.052 Y205.298 E.01492
G1 X205.298 Y120.052 E3.70551
G1 X205.247 Y119.569 E.01492
G1 X119.569 Y205.247 E3.72429
G1 X119.087 Y205.196 E.01492
G1 X205.196 Y119.087 E3.74307
G1 X205.145 Y118.604 E.01492
G1 X118.604 Y205.145 E3.76184
G3 X118.134 Y205.082 I.673 J-6.77 E.01458
G1 X205.082 Y118.134 E3.77952
G1 X205.016 Y117.666 E.01452
G1 X117.666 Y205.016 E3.79699
G1 X117.198 Y204.95 E.01452
G1 X204.95 Y117.198 E3.81447
G1 X204.885 Y116.731 E.01452
G1 X116.731 Y204.885 E3.83194
G1 X116.263 Y204.819 E.01452
G1 X204.819 Y116.263 E3.84941
G2 X204.752 Y115.796 I-9.004 J1.051 E.01449
G1 X115.796 Y204.752 E3.8668
G1 X115.339 Y204.676 E.01424
G1 X204.676 Y115.339 E3.88334
G1 X204.599 Y114.882 E.01424
G1 X114.882 Y204.599 E3.89988
G3 X114.427 Y204.521 I1.272 J-8.756 E.0142
G1 X204.521 Y114.427 E3.91626
G1 X204.434 Y113.981 E.01398
G1 X113.981 Y204.434 E3.9319
G1 X113.534 Y204.347 E.01399
G1 X204.347 Y113.534 E3.94754
G1 X204.261 Y113.087 E.01398
G1 X113.087 Y204.261 E3.96318
G1 X112.641 Y204.174 E.01398
G1 X204.174 Y112.641 E3.97882
G1 X204.087 Y112.194 E.01399
G1 X112.194 Y204.087 E3.99446
G3 X111.75 Y203.998 I1.47 J-8.507 E.01394
G1 X203.998 Y111.75 E4.00992
G1 X203.901 Y111.313 E.01375
G1 X111.313 Y203.901 E4.02469
G1 X110.876 Y203.804 E.01375
G1 X203.804 Y110.876 E4.03946
G2 X203.706 Y110.441 I-12.471 J2.576 E.01372
G1 X110.441 Y203.706 E4.05414
G1 X110.011 Y203.603 E.0136
G1 X203.603 Y110.011 E4.06835
G1 X203.5 Y109.581 E.0136
G1 X109.581 Y203.5 E4.08256
G3 X109.151 Y203.396 I1.866 J-8.612 E.01358
G1 X203.396 Y109.151 E4.09667
G1 X203.283 Y108.731 E.01339
G1 X108.73 Y203.283 E4.11008
G1 X108.309 Y203.171 E.0134
G1 X203.17 Y108.31 E4.12349
G1 X203.057 Y107.889 E.01339
G1 X107.888 Y203.059 E4.13689
G1 X107.467 Y202.946 E.0134
G1 X202.945 Y107.469 E4.1503
G1 X202.832 Y107.048 E.01339
G1 X107.046 Y202.834 E4.16371
G3 X106.63 Y202.716 I2.25 J-8.727 E.01328
G1 X202.719 Y106.627 E4.17687
G2 X202.596 Y106.217 I-5.955 J1.57 E.01316
G1 X106.217 Y202.596 E4.18945
G1 X105.805 Y202.475 E.01322
G1 X202.471 Y105.809 E4.20196
G1 X202.346 Y105.4 E.01313
G1 X105.392 Y202.354 E4.21447
G3 X104.984 Y202.228 I2.808 J-9.811 E.01311
G1 X202.221 Y104.992 E4.22676
G1 X202.096 Y104.583 E.01313
G1 X104.579 Y202.1 E4.23896
G1 X104.173 Y201.973 E.01307
G1 X201.971 Y104.175 E4.25116
G2 X201.842 Y103.771 I-7.788 J2.276 E.01304
G1 X103.772 Y201.84 E4.26295
G1 X103.375 Y201.703 E.0129
G1 X201.708 Y103.371 E4.27438
G1 X201.574 Y102.971 E.01296
G1 X102.979 Y201.567 E4.28582
G1 X102.582 Y201.43 E.0129
G1 X201.438 Y102.574 E4.29713
G1 X201.295 Y102.183 E.01279
G1 X102.185 Y201.293 E4.3082
G1 X101.788 Y201.157 E.0129
G1 X201.153 Y101.792 E4.31926
G1 X201.011 Y101.401 E.01279
G1 X101.392 Y201.02 E4.33029
G1 X101.004 Y200.874 E.01274
G1 X200.868 Y101.01 E4.34098
G1 X200.726 Y100.619 E.01279
G1 X100.615 Y200.729 E4.35167
G1 X100.227 Y200.584 E.01274
G1 X200.584 Y100.228 E4.36236
G2 X200.432 Y99.846 I-5.555 J1.977 E.01264
G1 X99.846 Y200.432 E4.37238
G1 X99.466 Y200.279 E.0126
G1 X200.279 Y99.466 E4.38222
G1 X200.125 Y99.086 E.0126
G1 X99.086 Y200.125 E4.39206
G1 X98.706 Y199.972 E.0126
G1 X199.972 Y98.706 E4.40191
G1 X199.818 Y98.326 E.0126
G1 X98.326 Y199.818 E4.41175
G1 X97.946 Y199.665 E.0126
G1 X199.665 Y97.946 E4.42159
G2 X199.51 Y97.567 I-7.317 J2.774 E.01257
G1 X97.567 Y199.51 E4.43131
G1 X97.196 Y199.348 E.01246
G1 X199.348 Y97.196 E4.44044
G1 X199.187 Y96.824 E.01246
G1 X96.824 Y199.187 E4.44958
M73 P78 R12
G1 X96.452 Y199.025 E.01246
G1 X199.025 Y96.452 E4.45871
G2 X198.859 Y96.085 I-10.581 J4.563 E.01239
G1 X96.087 Y198.857 E4.46736
G1 X95.723 Y198.687 E.01234
G1 X198.692 Y95.718 E4.47592
G1 X198.525 Y95.352 E.01238
G1 X95.359 Y198.517 E4.48447
G1 X94.995 Y198.348 E.01234
G1 X198.354 Y94.989 E4.49286
G1 X198.179 Y94.63 E.01226
G1 X94.632 Y198.178 E4.50108
G1 X94.268 Y198.008 E.01234
G1 X198.004 Y94.272 E4.50929
G1 X197.829 Y93.913 E.01226
G1 X93.905 Y197.838 E4.51747
G1 X93.551 Y197.658 E.01219
G1 X197.655 Y93.555 E4.52523
G1 X197.48 Y93.196 E.01226
G1 X93.198 Y197.478 E4.53299
G1 X92.845 Y197.298 E.01219
G1 X197.305 Y92.838 E4.54075
G2 X197.123 Y92.486 I-5.137 J2.432 E.01217
G1 X92.491 Y197.118 E4.54821
G1 X92.138 Y196.938 E.01219
G1 X196.938 Y92.138 E4.55552
G1 X196.753 Y91.789 E.01212
G1 X91.785 Y196.758 E4.56283
G3 X91.433 Y196.576 I3.284 J-6.782 E.01217
G1 X196.568 Y91.441 E4.57007
G1 X196.382 Y91.093 E.01212
G1 X91.087 Y196.388 E4.57704
G1 X90.742 Y196.2 E.01209
G1 X196.197 Y90.745 E4.58402
G1 X196.012 Y90.396 E.01212
G1 X90.396 Y196.013 E4.591
G3 X90.054 Y195.821 I5.317 J-9.882 E.01204
G1 X195.821 Y90.054 E4.59755
G1 X195.628 Y89.713 E.01203
G1 X89.713 Y195.628 E4.60398
G1 X89.373 Y195.435 E.01203
G1 X195.435 Y89.373 E4.61041
G2 X195.24 Y89.034 I-6.541 J3.549 E.01201
G1 X89.034 Y195.24 E4.61663
G1 X88.701 Y195.04 E.01195
G1 X195.04 Y88.701 E4.62241
G1 X194.84 Y88.368 E.01195
G1 X88.368 Y194.84 E4.62819
G1 X88.035 Y194.64 E.01195
G1 X194.64 Y88.035 E4.63398
G1 X194.439 Y87.702 E.01195
G1 X87.701 Y194.439 E4.63976
G1 X87.368 Y194.239 E.01195
G1 X194.239 Y87.368 E4.64554
G1 X194.039 Y87.035 E.01195
G1 X87.035 Y194.039 E4.65132
G3 X86.704 Y193.836 I3.708 J-6.419 E.01192
G1 X193.836 Y86.704 E4.65688
G1 X193.629 Y86.379 E.01188
G1 X86.378 Y193.629 E4.66202
G1 X86.053 Y193.421 E.01188
G1 X193.421 Y86.053 E4.66716
M73 P78 R11
G1 X193.213 Y85.727 E.01188
G1 X85.727 Y193.213 E4.6723
G3 X85.407 Y193 I3.933 J-6.232 E.01182
G1 X193.002 Y85.405 E4.677
G1 X192.789 Y85.084 E.01183
G1 X85.088 Y192.785 E4.68162
G1 X84.77 Y192.57 E.01181
G1 X192.577 Y84.763 E4.68623
G2 X192.362 Y84.444 I-6.176 J3.929 E.01181
G1 X84.451 Y192.355 E4.69074
G1 X84.133 Y192.14 E.01181
G1 X192.142 Y84.131 E4.69504
G1 X191.923 Y83.817 E.01177
G1 X83.814 Y191.925 E4.69934
G1 X83.496 Y191.71 E.01181
G1 X191.703 Y83.503 E4.70364
G1 X191.483 Y83.189 E.01177
G1 X83.185 Y191.488 E4.70761
G1 X82.876 Y191.264 E.01174
G1 X191.264 Y82.876 E4.71149
G1 X191.044 Y82.562 E.01177
G1 X82.567 Y191.039 E4.71537
G1 X82.258 Y190.815 E.01174
G1 X190.823 Y82.25 E4.71918
G1 X190.596 Y81.943 E.01172
G1 X81.949 Y190.59 E4.72275
G1 X81.64 Y190.366 E.01174
G1 X190.369 Y81.637 E4.72632
G1 X190.142 Y81.33 E.01172
G1 X81.331 Y190.141 E4.72989
G3 X81.026 Y189.912 I4.221 J-5.918 E.01171
G1 X189.91 Y81.028 E4.73305
G1 X189.677 Y80.729 E.01168
G1 X80.725 Y189.68 E4.736
G1 X80.423 Y189.449 E.01169
G1 X189.443 Y80.429 E4.73895
G1 X189.209 Y80.13 E.01168
G1 X80.122 Y189.216 E4.74186
G1 X79.827 Y188.978 E.01166
G1 X188.975 Y79.83 E4.7445
G1 X188.741 Y79.531 E.01168
G1 X79.532 Y188.739 E4.74715
M73 P79 R11
G1 X79.238 Y188.5 E.01166
G1 X188.507 Y79.231 E4.74979
G2 X188.269 Y78.936 I-5.764 J4.39 E.01166
G1 X78.943 Y188.262 E4.75227
G1 X78.648 Y188.023 E.01166
G1 X188.028 Y78.643 E4.7546
G1 X187.787 Y78.351 E.01165
G1 X78.353 Y187.784 E4.75694
G1 X78.058 Y187.546 E.01166
G1 X187.546 Y78.058 E4.75927
G2 X187.298 Y77.773 I-5.492 J4.513 E.01162
G1 X77.772 Y187.298 E4.76094
G1 X77.487 Y187.051 E.01162
G1 X187.05 Y77.487 E4.76258
G1 X186.802 Y77.202 E.01162
G1 X77.201 Y186.803 E4.76421
G1 X76.915 Y186.555 E.01162
G1 X186.554 Y76.917 E4.76585
G1 X186.306 Y76.631 E.01162
G1 X76.63 Y186.307 E4.76748
G1 X76.344 Y186.06 E.01162
G1 X186.058 Y76.346 E4.76912
G1 X185.81 Y76.06 E.01162
G1 X76.062 Y185.808 E4.77057
G1 X75.783 Y185.554 E.01161
G1 X185.554 Y75.782 E4.77161
G1 X185.297 Y75.506 E.0116
G1 X75.504 Y185.299 E4.77256
G1 X75.225 Y185.045 E.01161
G1 X185.039 Y75.23 E4.77351
G1 X184.782 Y74.954 E.0116
G1 X74.946 Y184.79 E4.77442
G1 X74.673 Y184.53 E.0116
G1 X184.525 Y74.678 E4.77513
G1 X184.267 Y74.402 E.0116
G1 X74.399 Y184.271 E4.77584
G1 X74.125 Y184.011 E.0116
G1 X184.01 Y74.126 E4.77655
G2 X183.747 Y73.856 I-3.999 J3.623 E.0116
G1 X73.856 Y183.747 E4.77683
G1 X73.589 Y183.48 E.01159
G1 X183.48 Y73.589 E4.77683
G1 X183.214 Y73.322 E.01159
G1 X73.322 Y183.213 E4.77683
G1 X73.055 Y182.947 E.01159
G1 X182.947 Y73.055 E4.77683
G1 X182.68 Y72.789 E.01159
G1 X72.789 Y182.68 E4.77683
G1 X72.522 Y182.413 E.01159
G1 X182.413 Y72.522 E4.77683
G1 X182.147 Y72.255 E.01159
G1 X72.255 Y182.147 E4.77683
G3 X71.992 Y181.876 I3.736 J-3.896 E.0116
G1 X181.877 Y71.991 E4.77655
G1 X181.603 Y71.732 E.0116
G1 X71.735 Y181.6 E4.77584
G1 X71.477 Y181.324 E.0116
G1 X181.33 Y71.472 E4.77514
G1 X181.056 Y71.212 E.0116
G1 X71.22 Y181.048 E4.77443
G1 X70.963 Y180.772 E.0116
G1 X180.779 Y70.956 E4.77356
G1 X180.5 Y70.701 E.0116
G1 X70.705 Y180.496 E4.77264
G1 X70.448 Y180.22 E.0116
G1 X180.222 Y70.446 E4.77173
G2 X179.942 Y70.192 I-4.993 J5.231 E.01161
G1 X70.192 Y179.942 E4.77069
G1 X69.941 Y179.659 E.01162
G1 X179.657 Y69.944 E4.76917
G1 X179.371 Y69.696 E.01162
G1 X69.691 Y179.376 E4.76765
G1 X69.441 Y179.093 E.01162
G1 X179.086 Y69.448 E4.76613
G1 X178.8 Y69.2 E.01162
G1 X69.193 Y178.807 E4.76449
G1 X68.947 Y178.52 E.01163
G1 X178.515 Y68.952 E4.76276
G1 X178.23 Y68.704 E.01162
G1 X68.702 Y178.232 E4.76104
G3 X68.456 Y177.944 I5.568 J-4.994 E.01163
G1 X177.944 Y68.456 E4.75929
G1 X177.651 Y68.216 E.01165
G1 X68.217 Y177.65 E4.75693
G1 X67.978 Y177.355 E.01166
G1 X177.357 Y67.976 E4.75457
G1 X177.064 Y67.736 E.01165
G1 X67.739 Y177.061 E4.75221
G1 X67.5 Y176.766 E.01166
G1 X176.771 Y67.496 E4.74985
G2 X176.474 Y67.259 I-5.093 J6.095 E.01167
G1 X67.261 Y176.472 E4.74732
G1 X67.022 Y176.177 E.01166
G1 X176.174 Y67.026 E4.74468
G1 X175.874 Y66.792 E.01168
G1 X66.788 Y175.878 E4.74182
G1 X66.556 Y175.577 E.01169
G1 X175.574 Y66.559 E4.7389
G1 X175.274 Y66.325 E.01168
G1 X66.323 Y175.276 E4.73598
M73 P80 R11
G1 X66.09 Y174.975 E.01169
G1 X174.975 Y66.091 E4.73305
G2 X174.673 Y65.86 I-4.793 J5.94 E.0117
G1 X65.86 Y174.673 E4.72996
G1 X65.633 Y174.366 E.01172
G1 X174.366 Y65.633 E4.72649
G1 X174.059 Y65.406 E.01172
G1 X65.406 Y174.059 E4.72302
G1 X65.179 Y173.753 E.01172
G1 X173.753 Y65.179 E4.71956
G2 X173.441 Y64.958 I-4.369 J5.828 E.01176
G1 X64.958 Y173.441 E4.71562
G1 X64.738 Y173.127 E.01177
G1 X173.127 Y64.738 E4.71153
G1 X172.813 Y64.518 E.01177
G1 X64.518 Y172.813 E4.70744
G1 X64.299 Y172.5 E.01177
G1 X172.5 Y64.299 E4.70335
G1 X172.186 Y64.079 E.01177
G1 X64.079 Y172.186 E4.69926
G1 X63.859 Y171.872 E.01177
G1 X171.872 Y63.859 E4.69517
G1 X171.558 Y63.64 E.01177
G1 X63.64 Y171.558 E4.69108
G3 X63.425 Y171.24 I5.977 J-4.26 E.01181
G1 X171.238 Y63.427 E4.68649
G1 X170.915 Y63.217 E.01185
G1 X63.212 Y170.919 E4.68167
G1 X63 Y170.598 E.01183
G1 X170.591 Y63.007 E4.67685
G1 X170.268 Y62.797 E.01185
G1 X62.788 Y170.276 E4.67199
G1 X62.581 Y169.95 E.01188
G1 X169.944 Y62.587 E4.66696
G1 X169.621 Y62.376 E.01185
G1 X62.373 Y169.624 E4.66192
G1 X62.166 Y169.298 E.01188
G1 X169.298 Y62.166 E4.65689
M73 P80 R10
G2 X168.968 Y61.963 I-3.076 J4.611 E.01192
G1 X61.963 Y168.968 E4.65137
G1 X61.763 Y168.635 E.01195
G1 X168.635 Y61.763 E4.64559
G1 X168.301 Y61.562 E.01195
G1 X61.562 Y168.301 E4.63981
G1 X61.362 Y167.968 E.01195
G1 X167.968 Y61.362 E4.63402
G1 X167.635 Y61.162 E.01195
G1 X61.162 Y167.635 E4.62824
G1 X60.962 Y167.302 E.01195
G1 X167.302 Y60.962 E4.62246
G1 X166.968 Y60.761 E.01195
G1 X60.761 Y166.968 E4.61668
G3 X60.566 Y166.63 I6.369 J-3.902 E.012
G1 X166.63 Y60.566 E4.61047
G1 X166.29 Y60.373 E.01203
G1 X60.373 Y166.289 E4.60404
G1 X60.181 Y165.949 E.01203
G1 X165.949 Y60.181 E4.5976
G2 X165.607 Y59.99 I-3.832 J6.458 E.01205
G1 X59.99 Y165.607 E4.59104
G1 X59.804 Y165.258 E.01212
G1 X165.258 Y59.804 E4.58395
G1 X164.91 Y59.619 E.01212
G1 X59.619 Y164.91 E4.57686
G1 X59.434 Y164.562 E.01212
G1 X164.562 Y59.434 E4.56977
G1 X164.214 Y59.249 E.01212
G1 X59.249 Y164.213 E4.56268
G1 X59.064 Y163.865 E.01212
G1 X163.865 Y59.064 E4.55559
G1 X163.517 Y58.878 E.01212
G1 X58.878 Y163.517 E4.5485
G3 X58.697 Y163.165 I5.127 J-2.877 E.01217
G1 X163.166 Y58.696 E4.54116
G1 X162.81 Y58.518 E.01223
G1 X58.521 Y162.807 E4.53331
G1 X58.346 Y162.449 E.01226
G1 X162.454 Y58.341 E4.52545
G1 X162.098 Y58.163 E.01223
G1 X58.171 Y162.091 E4.5176
G1 X57.996 Y161.733 E.01226
G1 X161.738 Y57.991 E4.50953
G1 X161.376 Y57.818 E.0123
G1 X57.82 Y161.374 E4.50145
G3 X57.648 Y161.014 I7.452 J-3.786 E.0123
G1 X161.015 Y57.646 E4.49326
G2 X160.65 Y57.478 I-3.39 J6.89 E.01236
G1 X57.48 Y160.648 E4.48468
G1 X57.312 Y160.283 E.01236
G1 X160.281 Y57.314 E4.47594
G1 X159.912 Y57.149 E.01242
G1 X57.144 Y159.917 E4.4672
G3 X56.976 Y159.551 I8.681 J-4.179 E.01238
G1 X159.543 Y56.985 E4.45841
G1 X159.173 Y56.821 E.01242
G1 X56.815 Y159.179 E4.4494
G1 X56.653 Y158.808 E.01246
G1 X158.804 Y56.656 E4.44038
G1 X158.435 Y56.492 E.01242
G1 X56.491 Y158.436 E4.43136
G3 X56.336 Y158.057 I7.169 J-3.158 E.01257
G1 X158.057 Y56.337 E4.42167
M73 P81 R10
G1 X157.677 Y56.183 E.0126
G1 X56.183 Y157.677 E4.41183
G1 X56.029 Y157.297 E.0126
G1 X157.297 Y56.03 E4.40199
G1 X156.918 Y55.876 E.0126
G1 X55.876 Y156.917 E4.39214
G1 X55.722 Y156.538 E.0126
G1 X156.538 Y55.722 E4.3823
G1 X156.158 Y55.569 E.0126
G1 X55.569 Y156.158 E4.37246
G3 X55.417 Y155.776 I7.184 J-3.081 E.01262
G1 X155.776 Y55.417 E4.36248
G1 X155.388 Y55.272 E.01274
G1 X55.272 Y155.388 E4.35191
G1 X55.127 Y155 E.01274
G1 X155 Y55.127 E4.34134
G1 X154.611 Y54.982 E.01274
G1 X54.982 Y154.611 E4.33078
G3 X54.844 Y154.215 I7.46 J-2.807 E.01289
G1 X154.215 Y54.844 E4.31952
G1 X153.818 Y54.708 E.0129
G1 X54.708 Y153.818 E4.30821
G1 X54.571 Y153.421 E.0129
G1 X153.422 Y54.571 E4.2969
G1 X153.025 Y54.434 E.0129
G1 X54.434 Y153.025 E4.28559
G1 X54.298 Y152.628 E.0129
G1 X152.628 Y54.298 E4.27428
G1 X152.231 Y54.161 E.0129
G1 X54.161 Y152.231 E4.26298
G3 X54.028 Y151.83 I7.6 J-2.738 E.01298
G1 X151.83 Y54.028 E4.25132
G1 X151.425 Y53.901 E.01307
G1 X53.901 Y151.425 E4.23925
G1 X53.773 Y151.019 E.01307
G1 X151.019 Y53.773 E4.22718
G2 X150.611 Y53.647 I-2.594 J7.714 E.01312
G1 X53.647 Y150.611 E4.2149
G1 X53.528 Y150.197 E.01325
G1 X150.197 Y53.528 E4.20206
G1 X149.782 Y53.41 E.01326
G1 X53.409 Y149.783 E4.18923
G1 X53.289 Y149.369 E.01325
G1 X149.367 Y53.291 E4.17639
G1 X148.953 Y53.172 E.01326
G1 X53.17 Y148.955 E4.16356
G1 X53.051 Y148.541 E.01325
G1 X148.538 Y53.053 E4.15073
G1 X148.124 Y52.934 E.01326
G1 X52.938 Y148.12 E4.13761
G1 X52.827 Y147.697 E.01343
G1 X147.699 Y52.825 E4.12397
G1 X147.274 Y52.717 E.01348
G1 X52.716 Y147.275 E4.11031
G1 X52.605 Y146.852 E.01343
G1 X146.849 Y52.609 E4.09665
G2 X146.423 Y52.501 I-2.443 J8.801 E.01351
G1 X52.501 Y146.423 E4.08266
G1 X52.398 Y145.993 E.0136
G1 X145.989 Y52.402 E4.06829
G1 X145.555 Y52.302 E.01368
G1 X52.294 Y145.563 E4.05392
G3 X52.199 Y145.125 I8.709 J-2.133 E.01377
G1 X145.121 Y52.203 E4.03922
G1 X144.687 Y52.103 E.01368
G1 X52.105 Y144.686 E4.02444
G1 X52.011 Y144.246 E.01381
G1 X144.253 Y52.003 E4.00967
G2 X143.81 Y51.914 I-1.554 J6.554 E.01392
G1 X51.917 Y143.807 E3.99446
G1 X51.823 Y143.367 E.01381
G1 X143.363 Y51.827 E3.97913
G1 X142.916 Y51.74 E.01398
G1 X51.734 Y142.923 E3.96359
G1 X51.649 Y142.474 E.01404
G1 X142.47 Y51.653 E3.94786
G1 X142.023 Y51.567 E.01399
G1 X51.564 Y142.025 E3.93213
G1 X51.479 Y141.577 E.01404
G1 X141.576 Y51.48 E3.9164
G2 X141.121 Y51.401 I-1.727 J8.664 E.01419
G1 X51.401 Y141.121 E3.90001
G1 X51.325 Y140.664 E.01424
G1 X140.664 Y51.325 E3.88347
G1 X140.207 Y51.248 E.01424
G1 X51.248 Y140.207 E3.86694
G3 X51.182 Y139.741 I8.948 J-1.521 E.01449
G1 X139.744 Y51.178 E3.8497
G1 X139.28 Y51.109 E.01442
G1 X51.116 Y139.273 E3.83239
G1 X51.05 Y138.805 E.01452
G1 X138.816 Y51.04 E3.81507
G1 X138.341 Y50.981 E.01471
G1 X50.984 Y138.338 E3.79728
G1 X50.919 Y137.87 E.01452
G1 X137.866 Y50.923 E3.77948
G1 X137.391 Y50.865 E.01471
G1 X50.854 Y137.401 E3.76162
G1 X50.8 Y136.922 E.01481
G1 X136.916 Y50.806 E3.74333
G1 X136.44 Y50.748 E.01471
G1 X50.745 Y136.443 E3.72505
G3 X50.695 Y135.96 I9.213 J-1.211 E.01492
G1 X135.962 Y50.693 E3.70644
G1 X135.475 Y50.647 E.01503
G1 X50.652 Y135.47 E3.68715
G1 X50.609 Y134.979 E.01513
G1 X134.988 Y50.6 E3.66787
M73 P82 R10
G2 X134.495 Y50.56 I-1.012 J9.39 E.01522
G1 X50.566 Y134.489 E3.64829
G1 X50.523 Y133.998 E.01513
G1 X133.996 Y50.525 E3.62848
G1 X133.498 Y50.49 E.01536
G1 X50.48 Y133.508 E3.60867
G3 X50.447 Y133.007 I9.565 J-.88 E.01542
G1 X132.999 Y50.455 E3.58843
G1 X132.501 Y50.42 E.01536
G1 X50.416 Y132.504 E3.5681
G3 X50.387 Y132 I9.616 J-.806 E.01553
G1 X132.001 Y50.387 E3.54762
G1 X131.489 Y50.364 E.01573
G1 X50.369 Y131.484 E3.52618
G1 X50.351 Y130.969 E.01585
G1 X130.978 Y50.342 E3.50475
G2 X130.462 Y50.325 I-.671 J12.326 E.01588
G1 X50.333 Y130.454 E3.48309
G1 X50.315 Y129.938 E.01585
M73 P82 R9
G1 X129.941 Y50.313 E3.4612
G1 X129.419 Y50.301 E.01604
G1 X50.297 Y129.423 E3.43931
G3 X50.295 Y128.892 I7.586 J-.298 E.01633
G1 X128.894 Y50.292 E3.41661
G1 X128.36 Y50.293 E.01642
G1 X50.295 Y128.358 E3.39339
G1 X50.295 Y127.825 E.0164
G1 X127.826 Y50.294 E3.37018
G1 X127.292 Y50.294 E.01642
G1 X50.295 Y127.291 E3.34696
G1 X50.295 Y126.758 E.0164
G1 X126.758 Y50.295 E3.32374
G2 X126.213 Y50.306 I-.045 J10.906 E.01675
G1 X50.31 Y126.209 E3.2994
G1 X50.33 Y125.656 E.017
G1 X125.665 Y50.321 E3.27475
G2 X125.114 Y50.339 I.158 J13.218 E.01696
G1 X50.349 Y125.104 E3.24994
G1 X50.368 Y124.551 E.017
G1 X124.554 Y50.365 E3.22476
G1 X123.994 Y50.392 E.01723
G1 X50.387 Y123.998 E3.19959
G3 X50.42 Y123.432 I10.865 J.346 E.01744
G1 X123.43 Y50.422 E3.17364
G1 X122.856 Y50.463 E.0177
G1 X50.455 Y122.864 E3.14716
G3 X50.495 Y122.29 I16.487 J.866 E.01767
G1 X122.281 Y50.504 E3.12045
G1 X121.707 Y50.545 E.0177
G1 X50.541 Y121.711 E3.09351
G3 X50.589 Y121.129 I11.132 J.633 E.01795
G1 X121.129 Y50.589 E3.06629
G1 X120.533 Y50.652 E.01842
G1 X50.652 Y120.533 E3.03765
G1 X50.715 Y119.937 E.01842
G1 X119.937 Y50.715 E3.00902
G1 X119.341 Y50.777 E.01842
G1 X50.777 Y119.341 E2.98038
G1 X50.84 Y118.745 E.01842
G1 X118.745 Y50.84 E2.95175
G2 X118.137 Y50.914 I1.115 J11.65 E.01882
G1 X50.918 Y118.133 E2.92193
G1 X51.005 Y117.512 E.01927
G1 X117.523 Y50.995 E2.89143
G2 X116.902 Y51.083 I1.79 J14.901 E.01929
G1 X51.093 Y116.892 E2.86064
G1 X51.18 Y116.271 E.01927
G1 X116.272 Y51.179 E2.82947
G1 X115.642 Y51.275 E.01958
G1 X51.273 Y115.644 E2.79803
G1 X51.38 Y115.004 E.01997
G1 X114.997 Y51.387 E2.76535
G1 X114.349 Y51.502 E.02025
G1 X51.491 Y114.36 E2.73235
G1 X51.612 Y113.705 E.02047
G1 X113.7 Y51.617 E2.69888
G2 X113.048 Y51.736 I2.059 J13.133 E.02039
G1 X51.738 Y113.046 E2.66507
G1 X51.88 Y112.37 E.02125
G1 X112.378 Y51.872 E2.62975
G2 X111.703 Y52.014 I2.356 J12.95 E.02118
G1 X52.023 Y111.694 E2.59422
G1 X52.166 Y111.017 E.02125
G1 X111.01 Y52.174 E2.55786
G1 X110.316 Y52.334 E.02188
G1 X52.326 Y110.324 E2.52078
G1 X52.491 Y109.626 E.02206
G1 X109.623 Y52.494 E2.48345
G2 X108.919 Y52.664 I2.9 J13.531 E.02225
G1 X52.664 Y108.919 E2.44533
G1 X52.85 Y108.2 E.02284
G1 X108.2 Y52.85 E2.40597
G2 X107.464 Y53.052 I3.489 J14.137 E.02345
G1 X53.052 Y107.464 E2.36521
G1 X53.267 Y106.716 E.02392
G1 X106.716 Y53.267 E2.32338
G1 X105.968 Y53.481 E.02391
G1 X53.481 Y105.968 E2.28154
G3 X53.698 Y105.218 I14.486 J3.78 E.02401
G1 X105.217 Y53.699 E2.23947
G1 X104.427 Y53.956 E.02554
G1 X53.944 Y104.439 E2.19444
G3 X54.204 Y103.645 I15.276 J4.567 E.02567
G1 X103.637 Y54.212 E2.14879
G1 X102.846 Y54.469 E.02554
G1 X54.484 Y102.832 E2.10226
G1 X54.764 Y102.018 E.02645
G1 X102.027 Y54.755 E2.05448
G2 X101.191 Y55.058 I5.364 J16.111 E.02735
G1 X55.054 Y101.195 E2.0055
G1 X55.373 Y100.343 E.02796
G1 X100.325 Y55.39 E1.95402
G1 X99.459 Y55.723 E.02851
G1 X55.725 Y99.457 E1.90109
G1 X56.086 Y98.562 E.02967
G1 X98.573 Y56.076 E1.84684
G1 X97.646 Y56.469 E.03095
G1 X56.448 Y97.667 E1.79083
G3 X56.856 Y96.725 I18.226 J7.345 E.03156
G1 X96.719 Y56.862 E1.73278
G2 X95.758 Y57.29 I7.683 J18.561 E.03234
G1 X57.29 Y95.758 E1.67215
G3 X57.76 Y94.754 I19.413 J8.484 E.03407
G1 X94.754 Y57.76 E1.60807
G1 X93.713 Y58.268 E.03561
G1 X58.268 Y93.713 E1.54073
G3 X58.781 Y92.667 I15.24 J6.817 E.0358
G1 X92.668 Y58.779 E1.47307
G1 X91.556 Y59.359 E.03856
G1 X59.386 Y91.528 E1.39837
G1 X59.992 Y90.389 E.03966
G1 X90.362 Y60.019 E1.32014
G1 X89.165 Y60.682 E.04206
G1 X60.682 Y89.166 E1.23814
G3 X61.483 Y87.831 I25.673 J14.503 E.04784
G1 X87.831 Y61.483 E1.14535
G2 X86.463 Y62.318 I15.268 J26.56 E.04928
G1 X62.318 Y86.463 E1.04956
G3 X63.332 Y84.915 I30.072 J18.603 E.0569
G1 X84.915 Y63.332 E.93817
M73 P83 R9
G2 X83.256 Y64.458 I20.678 J32.266 E.06162
G1 X64.466 Y83.248 E.81679
G1 X65.883 Y81.297 E.07412
G1 X81.301 Y65.879 E.67018
G2 X78.771 Y67.876 I57.121 J74.983 E.09907
G1 X67.824 Y78.823 E.47582
G1 X68.465 Y78.046 E.03095
G3 X72.008 Y74.105 I62.925 J53.023 E.1629
G1 X76.842 Y69.271 E.21013
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X75.428 Y70.686 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/10
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; OBJECT_ID: 15978
M204 S10000
G17
G3 Z2 I-.267 J1.187 P1  F42000
G1 X200.356 Y98.767 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F16213.044
M204 S6000
G1 X200.856 Y100.033 E.04515
G3 X117.137 Y50.71 I-72.865 J27.967 E12.78799
G3 X129.161 Y49.96 I10.9 J78.042 E.40003
G3 X199.836 Y97.508 I-1.171 J78.039 E2.98881
G1 X200.333 Y98.711 E.04318
M204 S10000
G1 X200.719 Y98.62 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X201.23 Y99.889 E.04204
G3 X52.927 Y105.261 I-73.23 J28.11 E9.16423
G3 X129.165 Y49.568 I75.077 J22.745 E3.11292
G3 X200.204 Y97.352 I-1.165 J78.431 E2.7827
G1 X200.697 Y98.564 E.04021
; WIPE_START
M204 S6000
G1 X201.23 Y99.889 E-.54275
G1 X201.431 Y100.424 E-.21726
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y128 F18000 ; move to safe pos
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.2 F4000
            G39.3 S1
            G0 Z2.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X186.684 Y76.793 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42012
G1 F15000
M204 S6000
G1 X181.982 Y72.091 E.20438
G2 X177.203 Y67.845 I-53.335 J55.223 E.19656
G1 X188.154 Y78.797 E.47604
G1 X190.108 Y81.283 E.09719
G1 X174.717 Y65.892 E.66903
G2 X172.8 Y64.509 I-27.357 J35.887 E.07266
G1 X191.491 Y83.2 E.81247
G3 X192.687 Y84.93 I-32.407 J23.692 E.06466
G1 X171.084 Y63.327 E.93906
G1 X169.563 Y62.339 E.05577
G1 X193.674 Y86.45 E1.04811
G3 X194.511 Y87.82 I-25.713 J16.638 E.04933
G1 X168.18 Y61.489 E1.14456
G2 X166.845 Y60.687 I-16.281 J25.599 E.04788
G1 X195.313 Y89.155 E1.23747
G3 X196.003 Y90.379 I-23.084 J13.829 E.04319
G1 X165.621 Y59.997 E1.32068
G1 X164.482 Y59.391 E.03966
G1 X196.609 Y91.518 E1.39652
G1 X197.214 Y92.658 E.03966
G1 X163.342 Y58.786 E1.47237
G2 X162.274 Y58.251 I-10.776 J20.196 E.03671
G1 X197.729 Y93.706 E1.54116
G1 X198.239 Y94.749 E.03568
G1 X161.246 Y57.756 E1.60802
G2 X160.262 Y57.305 I-9.105 J18.575 E.03329
G1 X198.703 Y95.746 E1.67099
G3 X199.14 Y96.717 I-24.436 J11.592 E.03273
G1 X159.3 Y56.877 E1.73179
G2 X158.341 Y56.451 I-6.595 J13.556 E.03228
G1 X199.549 Y97.66 E1.79129
G1 X199.911 Y98.555 E.02967
G1 X157.445 Y56.089 E1.84591
G1 X156.55 Y55.728 E.02967
G1 X200.272 Y99.45 E1.90054
G3 X200.622 Y100.332 I-12.449 J5.436 E.02918
G1 X155.665 Y55.375 E1.95422
G1 X154.813 Y55.057 E.02796
G1 X200.927 Y101.171 E2.00453
G1 X201.232 Y102.01 E.02743
G1 X153.98 Y54.757 E2.05401
G2 X153.159 Y54.47 I-7.719 J20.721 E.02674
G1 X201.531 Y102.842 E2.10268
G1 X201.799 Y103.644 E.02598
G1 X152.36 Y54.204 E2.14906
G2 X151.572 Y53.95 I-5.557 J15.841 E.02547
G1 X202.048 Y104.426 E2.19415
G1 X202.283 Y105.194 E.0247
G1 X150.804 Y53.715 E2.23772
G1 X150.037 Y53.481 E.02466
G1 X202.518 Y105.963 E2.2813
G3 X202.745 Y106.723 I-10.769 J3.629 E.0244
G1 X149.275 Y53.253 E2.32428
G1 X148.537 Y53.048 E.02354
G1 X202.94 Y107.452 E2.36485
G1 X203.135 Y108.181 E.02319
G1 X147.808 Y52.853 E2.40503
G1 X147.09 Y52.669 E.02276
G1 X203.331 Y108.909 E2.4447
G3 X203.51 Y109.622 I-13.521 J3.779 E.02259
G1 X146.381 Y52.493 E2.48332
G1 X145.688 Y52.334 E.02185
G1 X203.678 Y110.324 E2.52076
G3 X203.835 Y111.014 I-19.716 J4.835 E.02175
G1 X144.995 Y52.174 E2.55768
G1 X144.302 Y52.015 E.02185
G1 X203.987 Y111.699 E2.59441
G3 X204.12 Y112.366 I-12.653 J2.879 E.02091
G1 X143.629 Y51.875 E2.62947
G1 X142.962 Y51.741 E.02094
G1 X204.249 Y113.028 E2.66409
G1 X204.378 Y113.69 E.02073
G1 X142.304 Y51.617 E2.69825
G1 X141.657 Y51.503 E.02019
G1 X204.507 Y114.353 E2.73197
G3 X204.619 Y114.998 I-12.271 J2.464 E.02014
G1 X141.01 Y51.39 E2.76498
G1 X140.363 Y51.276 E.02019
G1 X204.726 Y115.639 E2.79776
G3 X204.819 Y116.266 I-11.924 J2.1 E.01949
G1 X139.731 Y51.177 E2.82932
G1 X139.105 Y51.085 E.01943
G1 X204.907 Y116.887 E2.8603
G1 X204.994 Y117.507 E.01927
G1 X138.484 Y50.997 E2.89111
G1 X137.876 Y50.923 E.01881
G1 X205.081 Y118.128 E2.92131
G3 X205.16 Y118.74 I-8.723 J1.43 E.01897
G1 X137.269 Y50.849 E2.95114
G1 X136.661 Y50.775 E.01882
G1 X205.222 Y119.336 E2.98027
G1 X205.285 Y119.932 E.01842
G1 X136.055 Y50.702 E3.00932
G1 X135.465 Y50.646 E.01823
G1 X205.348 Y120.528 E3.03771
G1 X205.41 Y121.124 E.01842
G1 X134.875 Y50.589 E3.06609
G2 X134.298 Y50.546 I-1.108 J10.986 E.01777
G1 X205.455 Y121.702 E3.09307
G1 X205.495 Y122.276 E.01769
G1 X133.725 Y50.506 E3.11976
G1 X133.151 Y50.466 E.01767
G1 X205.536 Y122.85 E3.14646
G1 X205.576 Y123.424 E.01769
G1 X132.578 Y50.425 E3.17315
G2 X132.006 Y50.387 I-1.018 J10.882 E.01762
G1 X205.61 Y123.991 E3.19947
G1 X205.636 Y124.55 E.0172
G1 X131.448 Y50.363 E3.22483
G1 X130.89 Y50.338 E.01716
G1 X205.661 Y125.109 E3.2502
G3 X205.676 Y125.657 I-9.639 J.532 E.01685
G1 X130.34 Y50.322 E3.27475
G1 X129.794 Y50.309 E.0168
G1 X205.685 Y126.2 E3.29891
G1 X205.695 Y126.743 E.01669
G1 X129.247 Y50.295 E3.32308
G2 X128.712 Y50.294 I-.305 J10.895 E.01645
G1 X205.704 Y127.286 E3.34676
G1 X205.714 Y127.829 E.01669
G1 X128.179 Y50.294 E3.37035
G1 X127.646 Y50.294 E.01638
G1 X205.714 Y128.362 E3.39351
G1 X205.709 Y128.891 E.01626
G1 X127.113 Y50.295 E3.41648
G2 X126.581 Y50.297 I-.228 J10.385 E.01634
G1 X205.703 Y129.418 E3.43932
G1 X205.685 Y129.934 E.01585
G1 X126.061 Y50.31 E3.46113
G1 X125.541 Y50.324 E.01598
G1 X205.667 Y130.449 E3.48294
G1 X205.649 Y130.965 E.01585
G1 X125.027 Y50.343 E3.50454
G1 X124.517 Y50.366 E.01569
G1 X205.631 Y131.48 E3.52593
G1 X205.613 Y131.996 E.01585
G1 X124.007 Y50.389 E3.54731
G2 X123.502 Y50.418 I.333 J10.237 E.01554
G1 X205.584 Y132.5 E3.56799
G1 X205.553 Y133.003 E.01548
G1 X123.004 Y50.453 E3.58831
G1 X122.506 Y50.489 E.01535
G1 X205.521 Y133.504 E3.60857
G1 X205.482 Y133.999 E.01525
G1 X122.007 Y50.524 E3.62854
G1 X121.509 Y50.559 E.01535
G1 X205.443 Y134.493 E3.64851
G3 X205.399 Y134.983 I-9.356 J-.596 E.0151
G1 X121.017 Y50.601 E3.66796
M73 P83 R8
G1 X120.535 Y50.652 E.01492
G1 X205.348 Y135.465 E3.68673
G1 X205.298 Y135.948 E.01492
G1 X120.052 Y50.702 E3.70551
G1 X119.569 Y50.753 E.01492
G1 X205.247 Y136.431 E3.72429
G1 X205.196 Y136.913 E.01492
G1 X119.087 Y50.804 E3.74307
M73 P84 R8
G1 X118.604 Y50.855 E.01492
G1 X205.145 Y137.396 E3.76184
G3 X205.082 Y137.866 I-6.782 J-.676 E.01458
G1 X118.131 Y50.915 E3.77966
G1 X117.659 Y50.977 E.01461
G1 X205.016 Y138.334 E3.79729
G1 X204.95 Y138.802 E.01452
G1 X117.188 Y51.039 E3.81492
G1 X116.725 Y51.109 E.0144
G1 X204.885 Y139.269 E3.8322
G1 X204.819 Y139.737 E.01452
G1 X116.262 Y51.18 E3.84948
G1 X115.798 Y51.25 E.0144
G1 X204.752 Y140.204 E3.86671
G1 X204.676 Y140.661 E.01424
G1 X115.342 Y51.327 E3.88322
G1 X114.889 Y51.407 E.01415
G1 X204.599 Y141.118 E3.8996
G3 X204.521 Y141.573 I-8.712 J-1.264 E.0142
G1 X114.436 Y51.487 E3.9159
G1 X113.982 Y51.567 E.01415
G1 X204.434 Y142.019 E3.93182
G1 X204.347 Y142.466 E.01399
G1 X113.529 Y51.648 E3.94775
G2 X113.078 Y51.73 I1.395 J8.926 E.0141
G1 X204.261 Y142.913 E3.96359
G1 X204.174 Y143.359 E.01398
G1 X112.635 Y51.82 E3.97908
G1 X112.192 Y51.91 E.0139
G1 X204.087 Y143.806 E3.99458
G3 X203.997 Y144.25 I-6.399 J-1.061 E.01392
G1 X111.75 Y52.003 E4.00986
G1 X111.317 Y52.103 E.01367
G1 X203.897 Y144.683 E4.02435
G1 X203.797 Y145.116 E.01367
G1 X110.884 Y52.203 E4.03884
G1 X110.45 Y52.303 E.01367
G1 X203.697 Y145.55 E4.05333
G1 X203.597 Y145.983 E.01367
G1 X110.017 Y52.403 E4.06781
G1 X109.583 Y52.503 E.01367
G1 X203.497 Y146.417 E4.0823
G3 X203.396 Y146.849 I-6.253 J-1.241 E.01364
G1 X109.151 Y52.604 E4.09669
G1 X108.727 Y52.714 E.01346
G1 X203.283 Y147.269 E4.11021
G1 X203.17 Y147.69 E.01339
G1 X108.303 Y52.823 E4.12373
G1 X107.88 Y52.933 E.01345
G1 X203.057 Y148.111 E4.13725
G1 X202.945 Y148.531 E.01339
G1 X107.465 Y53.052 E4.15037
G1 X107.051 Y53.171 E.01326
G1 X202.832 Y148.952 E4.16349
G1 X202.719 Y149.373 E.01339
G1 X106.636 Y53.29 E4.17661
G1 X106.221 Y53.409 E.01326
G1 X202.598 Y149.785 E4.18938
G1 X202.476 Y150.197 E.01319
G1 X105.807 Y53.527 E4.2021
G1 X105.392 Y53.646 E.01326
G1 X202.355 Y150.609 E4.21482
G3 X202.228 Y151.016 I-11.724 J-3.411 E.0131
G1 X104.986 Y53.774 E4.22698
G1 X104.584 Y53.905 E.01301
G1 X202.1 Y151.421 E4.23892
G1 X201.973 Y151.827 E.01307
G1 X104.181 Y54.035 E4.25087
G1 X103.779 Y54.166 E.01301
G1 X201.84 Y152.228 E4.26261
G1 X201.703 Y152.625 E.0129
G1 X103.376 Y54.297 E4.27417
G1 X102.973 Y54.428 E.01301
G1 X201.567 Y153.021 E4.28573
G1 X201.43 Y153.418 E.0129
G1 X102.573 Y54.561 E4.29717
G1 X102.179 Y54.701 E.01285
G1 X201.294 Y153.815 E4.30836
G1 X201.157 Y154.212 E.0129
G1 X101.786 Y54.84 E4.31954
G2 X101.392 Y54.981 I2.485 J7.597 E.01284
G1 X201.02 Y154.608 E4.33068
G1 X200.874 Y154.996 E.01274
G1 X101.007 Y55.129 E4.34112
G1 X100.621 Y55.276 E.01269
G1 X200.729 Y155.385 E4.35157
G1 X200.584 Y155.773 E.01274
G1 X100.236 Y55.424 E4.36201
G1 X99.85 Y55.572 E.01269
G1 X200.432 Y156.154 E4.37217
G1 X200.279 Y156.534 E.0126
G1 X99.465 Y55.72 E4.38225
G1 X99.079 Y55.868 E.01269
G1 X200.125 Y156.914 E4.39234
G1 X199.972 Y157.294 E.0126
G1 X98.699 Y56.022 E4.40218
G1 X98.325 Y56.181 E.0125
G1 X199.818 Y157.674 E4.41179
G1 X199.665 Y158.054 E.0126
G1 X97.95 Y56.34 E4.42139
G1 X97.576 Y56.499 E.0125
G1 X199.51 Y158.433 E4.43094
G1 X199.348 Y158.804 E.01246
G1 X97.201 Y56.658 E4.44019
G1 X96.827 Y56.817 E.0125
G1 X199.187 Y159.176 E4.44944
G1 X199.025 Y159.548 E.01246
G1 X96.453 Y56.976 E4.45869
G2 X96.085 Y57.141 I2.979 J7.107 E.0124
G1 X198.857 Y159.913 E4.46736
G1 X198.687 Y160.277 E.01234
G1 X95.718 Y57.308 E4.47592
G1 X95.352 Y57.475 E.01238
G1 X198.517 Y160.641 E4.48447
G1 X198.348 Y161.004 E.01234
G1 X94.989 Y57.646 E4.49286
G1 X94.63 Y57.821 E.01226
G1 X198.178 Y161.368 E4.50108
G1 X198.008 Y161.732 E.01234
G1 X94.272 Y57.996 E4.50929
M73 P85 R8
G1 X93.913 Y58.171 E.01226
G1 X197.838 Y162.095 E4.51747
G1 X197.658 Y162.448 E.01219
G1 X93.555 Y58.345 E4.52523
G1 X93.196 Y58.52 E.01226
G1 X197.478 Y162.802 E4.53299
G1 X197.298 Y163.155 E.01219
G1 X92.838 Y58.695 E4.54075
G2 X92.484 Y58.875 I3.261 J6.839 E.01219
G1 X197.118 Y163.509 E4.54828
G1 X196.938 Y163.862 E.01219
G1 X92.133 Y59.058 E4.5557
G1 X91.783 Y59.24 E.01216
G1 X196.758 Y164.215 E4.56313
G3 X196.575 Y164.566 I-5.128 J-2.443 E.01216
G1 X91.434 Y59.425 E4.57037
G1 X91.09 Y59.615 E.01206
G1 X196.385 Y164.91 E4.57702
G1 X196.195 Y165.253 E.01206
G1 X90.747 Y59.805 E4.58366
G1 X90.404 Y59.996 E.01206
G1 X196.004 Y165.596 E4.59031
G1 X195.814 Y165.939 E.01206
G1 X90.061 Y60.186 E4.59696
G1 X89.718 Y60.376 E.01206
G1 X195.624 Y166.282 E4.60361
G1 X195.434 Y166.626 E.01206
G1 X89.374 Y60.566 E4.61026
G2 X89.034 Y60.76 I2.606 J4.976 E.01203
G1 X195.241 Y166.966 E4.61667
G1 X195.043 Y167.302 E.01198
G1 X88.701 Y60.96 E4.62256
G1 X88.368 Y61.16 E.01195
G1 X194.846 Y167.638 E4.62845
G1 X194.648 Y167.974 E.01198
G1 X88.035 Y61.36 E4.63433
G1 X87.702 Y61.561 E.01195
G1 X194.446 Y168.305 E4.64004
G1 X194.243 Y168.636 E.01192
G1 X87.368 Y61.761 E4.64572
G1 X87.035 Y61.961 E.01195
G1 X194.041 Y168.967 E4.65139
G3 X193.835 Y169.295 I-6.364 J-3.752 E.0119
G1 X86.704 Y62.164 E4.65684
G1 X86.379 Y62.371 E.01188
G1 X193.625 Y169.618 E4.66188
G1 X193.415 Y169.942 E.01185
G1 X86.053 Y62.579 E4.66691
G1 X85.727 Y62.787 E.01188
G1 X193.205 Y170.265 E4.67195
G1 X192.995 Y170.588 E.01185
G1 X85.407 Y63 E4.67672
G1 X85.088 Y63.215 E.01181
G1 X192.785 Y170.912 E4.68144
G1 X192.575 Y171.235 E.01185
G1 X84.77 Y63.43 E4.68616
G1 X84.451 Y63.645 E.01181
G1 X192.362 Y171.556 E4.69074
G1 X192.142 Y171.869 E.01177
G1 X84.133 Y63.86 E4.69504
G1 X83.814 Y64.075 E.01181
G1 X191.923 Y172.183 E4.69934
G1 X191.703 Y172.497 E.01177
G1 X83.496 Y64.29 E4.70364
G2 X83.185 Y64.512 I3.026 J4.563 E.01176
G1 X191.483 Y172.811 E4.70761
G1 X191.264 Y173.124 E.01177
G1 X82.876 Y64.736 E4.71149
G1 X82.567 Y64.961 E.01174
G1 X191.044 Y173.438 E4.71537
G3 X190.823 Y173.75 I-6.066 J-4.066 E.01176
G1 X82.258 Y65.185 E4.71918
G1 X81.949 Y65.41 E.01174
G1 X190.596 Y174.057 E4.72275
G1 X190.369 Y174.363 E.01172
G1 X81.64 Y65.634 E4.72632
M73 P85 R7
G1 X81.331 Y65.859 E.01174
G1 X190.142 Y174.67 E4.72989
G3 X189.91 Y174.972 I-5.893 J-4.284 E.0117
G1 X81.027 Y66.088 E4.73305
G1 X80.725 Y66.32 E.01169
G1 X189.677 Y175.271 E4.736
G1 X189.443 Y175.571 E.01168
G1 X80.423 Y66.551 E4.73895
G2 X80.122 Y66.783 I4.273 J5.847 E.01169
G1 X189.209 Y175.87 E4.74186
G1 X188.975 Y176.17 E.01168
G1 X79.827 Y67.022 E4.7445
G1 X79.532 Y67.261 E.01166
G1 X188.741 Y176.469 E4.74715
G1 X188.507 Y176.769 E.01168
G1 X79.238 Y67.5 E4.74979
G1 X78.943 Y67.738 E.01166
G1 X188.269 Y177.064 E4.75227
G1 X188.028 Y177.357 E.01165
G1 X78.648 Y67.977 E4.7546
G1 X78.353 Y68.216 E.01166
G1 X187.787 Y177.649 E4.75694
G1 X187.546 Y177.942 E.01165
G1 X78.059 Y68.454 E4.75927
G2 X77.77 Y68.7 I4.454 J5.522 E.01163
G1 X187.298 Y178.227 E4.76103
G1 X187.05 Y178.513 E.01162
G1 X77.483 Y68.945 E4.76275
M73 P86 R7
G1 X77.195 Y69.191 E.01163
G1 X186.802 Y178.798 E4.76447
G1 X186.554 Y179.083 E.01162
G1 X76.909 Y69.439 E4.76612
G1 X76.626 Y69.689 E.01162
G1 X186.306 Y179.369 E4.76764
G1 X186.058 Y179.654 E.01162
G1 X76.343 Y69.939 E4.76916
G1 X76.06 Y70.19 E.01162
G1 X185.81 Y179.94 E4.77068
G3 X185.556 Y180.219 I-5.448 J-4.678 E.01161
G1 X75.782 Y70.446 E4.77173
G1 X75.506 Y70.703 E.0116
G1 X185.301 Y180.498 E4.77264
G1 X185.046 Y180.776 E.01161
G1 X75.23 Y70.96 E4.77355
G1 X74.954 Y71.218 E.0116
G1 X184.79 Y181.054 E4.77442
G1 X184.53 Y181.327 E.0116
G1 X74.678 Y71.475 E4.77513
G1 X74.402 Y71.733 E.0116
G1 X184.271 Y181.601 E4.77584
G1 X184.011 Y181.875 E.0116
G1 X74.126 Y71.99 E4.77655
G2 X73.856 Y72.253 I3.636 J4.011 E.0116
G1 X183.747 Y182.144 E4.77683
G1 X183.48 Y182.411 E.01159
G1 X73.589 Y72.52 E4.77683
G1 X73.322 Y72.786 E.01159
G1 X183.214 Y182.678 E4.77683
G1 X182.947 Y182.945 E.01159
G1 X73.055 Y73.053 E4.77683
G1 X72.789 Y73.32 E.01159
G1 X182.68 Y183.211 E4.77683
G1 X182.413 Y183.478 E.01159
G1 X72.522 Y73.587 E4.77683
G1 X72.255 Y73.853 E.01159
G1 X182.147 Y183.745 E4.77683
G3 X181.876 Y184.008 I-3.897 J-3.737 E.0116
G1 X71.991 Y74.123 E4.77655
G1 X71.732 Y74.397 E.0116
G1 X181.6 Y184.265 E4.77584
G1 X181.324 Y184.523 E.0116
G1 X71.472 Y74.67 E4.77514
G1 X71.212 Y74.944 E.0116
G1 X181.048 Y184.78 E4.77443
G1 X180.772 Y185.037 E.0116
G1 X70.956 Y75.221 E4.77356
G1 X70.701 Y75.5 E.01161
G1 X180.496 Y185.295 E4.77264
G1 X180.22 Y185.552 E.0116
G1 X70.446 Y75.778 E4.77173
G2 X70.192 Y76.058 I5.197 J4.963 E.01161
G1 X179.942 Y185.808 E4.77069
G1 X179.659 Y186.058 E.01162
G1 X69.944 Y76.343 E4.76917
G1 X69.696 Y76.629 E.01162
G1 X179.376 Y186.309 E4.76765
G1 X179.093 Y186.559 E.01162
G1 X69.448 Y76.914 E4.76613
G1 X69.2 Y77.2 E.01162
G1 X178.807 Y186.807 E4.76449
G1 X178.52 Y187.053 E.01163
G1 X68.952 Y77.485 E4.76276
G1 X68.704 Y77.77 E.01162
G1 X178.232 Y187.298 E4.76104
G3 X177.944 Y187.544 I-4.827 J-5.373 E.01163
G1 X68.456 Y78.056 E4.75929
G1 X68.218 Y78.351 E.01166
G1 X177.649 Y187.782 E4.75685
G1 X177.354 Y188.021 E.01166
G1 X67.979 Y78.646 E4.75441
G1 X67.74 Y78.94 E.01166
G1 X177.06 Y188.26 E4.75198
G1 X176.765 Y188.498 E.01166
G1 X67.502 Y79.235 E4.74954
G1 X67.263 Y79.53 E.01166
G1 X176.47 Y188.737 E4.7471
G1 X176.175 Y188.976 E.01166
G1 X67.024 Y79.825 E4.74467
G1 X66.786 Y80.119 E.01166
G1 X175.881 Y189.214 E4.74223
G3 X175.578 Y189.445 I-3.453 J-4.231 E.0117
G1 X66.553 Y80.42 E4.73915
G1 X66.321 Y80.722 E.01169
G1 X175.273 Y189.674 E4.736
G1 X174.969 Y189.903 E.01171
G1 X66.09 Y81.024 E4.73284
G2 X65.861 Y81.328 I5.704 J4.539 E.01171
G1 X174.665 Y190.132 E4.72959
G1 X174.361 Y190.362 E.01171
G1 X65.636 Y81.637 E4.72612
G1 X65.412 Y81.946 E.01174
G1 X174.057 Y190.591 E4.72265
G1 X173.752 Y190.82 E.01171
G1 X65.187 Y82.255 E4.71919
G1 X64.963 Y82.564 E.01174
G1 X173.443 Y191.044 E4.71549
G1 X173.131 Y191.266 E.01176
G1 X64.738 Y82.873 E4.71171
M73 P87 R7
G1 X64.514 Y83.182 E.01174
G1 X172.82 Y191.488 E4.70793
G3 X172.508 Y191.709 I-6.506 J-8.864 E.01176
G1 X64.291 Y83.493 E4.70402
G1 X64.076 Y83.812 E.01181
G1 X172.191 Y191.927 E4.69962
G1 X171.875 Y192.144 E.01179
G1 X63.862 Y84.13 E4.69522
G1 X63.647 Y84.449 E.01181
G1 X171.559 Y192.361 E4.69081
G3 X171.238 Y192.574 I-4.319 J-6.178 E.01183
G1 X63.432 Y84.767 E4.6862
G1 X63.217 Y85.086 E.01181
G1 X170.915 Y192.784 E4.68149
G1 X170.592 Y192.994 E.01185
G1 X63.002 Y85.404 E4.67678
G2 X62.788 Y85.724 I5.995 J4.239 E.01182
G1 X170.268 Y193.204 E4.67202
G1 X169.945 Y193.414 E.01185
G1 X62.581 Y86.05 E4.667
G1 X62.373 Y86.376 E.01188
G1 X169.622 Y193.625 E4.66197
G3 X169.298 Y193.834 I-4.386 J-6.447 E.01186
G1 X62.166 Y86.702 E4.6569
G2 X61.963 Y87.032 I6.222 J4.044 E.01192
G1 X168.968 Y194.037 E4.65136
G1 X168.637 Y194.24 E.01192
G1 X61.763 Y87.365 E4.64571
G1 X61.562 Y87.699 E.01195
G1 X168.307 Y194.444 E4.64007
G3 X167.976 Y194.646 I-5.321 J-8.326 E.01193
G1 X61.362 Y88.032 E4.63438
G1 X61.162 Y88.365 E.01195
G1 X167.641 Y194.844 E4.62849
G1 X167.305 Y195.042 E.01198
G1 X60.962 Y88.698 E4.62261
G1 X60.761 Y89.032 E.01195
G1 X166.969 Y195.239 E4.61672
G3 X166.63 Y195.434 I-5.722 J-9.585 E.01201
G1 X60.566 Y89.37 E4.61047
G1 X60.373 Y89.71 E.01203
G1 X166.29 Y195.627 E4.60404
G1 X165.949 Y195.819 E.01203
G1 X60.181 Y90.051 E4.5976
G2 X59.99 Y90.393 I6.466 J3.836 E.01205
G1 X165.607 Y196.01 E4.59104
G1 X165.258 Y196.196 E.01212
G1 X59.804 Y90.742 E4.58395
G1 X59.619 Y91.09 E.01212
G1 X164.91 Y196.381 E4.57686
G1 X164.562 Y196.566 E.01212
G1 X59.434 Y91.438 E4.56977
M73 P87 R6
G1 X59.249 Y91.786 E.01212
G1 X164.214 Y196.751 E4.56268
G1 X163.865 Y196.936 E.01212
G1 X59.064 Y92.135 E4.55559
G1 X58.878 Y92.483 E.01212
G1 X163.517 Y197.122 E4.5485
G3 X163.165 Y197.303 I-2.782 J-4.949 E.01217
G1 X58.696 Y92.834 E4.54116
G1 X58.518 Y93.19 E.01223
G1 X162.807 Y197.478 E4.53329
G1 X162.448 Y197.653 E.01226
G1 X58.341 Y93.546 E4.52542
G1 X58.163 Y93.902 E.01223
G1 X162.09 Y197.828 E4.51754
G1 X161.731 Y198.003 E.01226
G1 X57.991 Y94.262 E4.50946
G1 X57.818 Y94.624 E.0123
G1 X161.373 Y198.178 E4.50137
G1 X161.014 Y198.353 E.01226
G1 X57.646 Y94.985 E4.49327
G2 X57.477 Y95.349 I9.179 J4.483 E.01235
G1 X160.651 Y198.523 E4.48485
G1 X160.285 Y198.69 E.01238
G1 X57.311 Y95.716 E4.47615
G1 X57.144 Y96.083 E.01239
G1 X159.918 Y198.857 E4.46746
G3 X159.551 Y199.024 I-4.919 J-10.385 E.01239
G1 X56.978 Y96.45 E4.45872
G2 X56.817 Y96.823 I7.47 J3.458 E.01247
G1 X159.179 Y199.185 E4.44957
G1 X158.808 Y199.347 E.01246
G1 X56.658 Y97.197 E4.44031
G1 X56.499 Y97.572 E.01251
G1 X158.436 Y199.508 E4.43105
G3 X158.057 Y199.663 I-3.135 J-7.115 E.01257
G1 X56.341 Y97.947 E4.4215
G1 X56.182 Y98.321 E.01251
G1 X157.677 Y199.817 E4.41188
G1 X157.297 Y199.971 E.0126
G1 X56.023 Y98.696 E4.40227
G2 X55.868 Y99.075 I7.348 J3.226 E.01257
G1 X156.918 Y200.124 E4.39248
G1 X156.538 Y200.278 E.0126
G1 X55.717 Y99.457 E4.38252
G1 X55.567 Y99.84 E.01264
G1 X156.158 Y200.431 E4.37256
G3 X155.776 Y200.583 I-3.098 J-7.227 E.01262
G1 X55.417 Y100.224 E4.36248
G1 X55.272 Y100.612 E.01274
G1 X155.388 Y200.728 E4.35191
M73 P88 R6
G1 X155 Y200.873 E.01274
G1 X55.127 Y101 E4.34134
G1 X54.982 Y101.389 E.01274
G1 X154.611 Y201.018 E4.33078
G3 X154.215 Y201.156 I-2.812 J-7.475 E.01289
G1 X54.844 Y101.785 E4.31952
G1 X54.708 Y102.182 E.0129
G1 X153.818 Y201.292 E4.30821
G1 X153.422 Y201.429 E.0129
G1 X54.571 Y102.578 E4.2969
G1 X54.434 Y102.975 E.0129
G1 X153.025 Y201.566 E4.28559
G1 X152.628 Y201.702 E.0129
G1 X54.298 Y103.372 E4.27428
G1 X54.161 Y103.769 E.0129
G1 X152.231 Y201.839 E4.26297
G3 X151.83 Y201.972 I-2.739 J-7.603 E.01298
G1 X54.028 Y104.17 E4.25132
G1 X53.901 Y104.575 E.01307
G1 X151.425 Y202.099 E4.23925
G1 X151.019 Y202.227 E.01307
G1 X53.773 Y104.981 E4.22718
G2 X53.647 Y105.389 I7.693 J2.588 E.01312
G1 X150.611 Y202.353 E4.2149
G1 X150.197 Y202.472 E.01325
G1 X53.528 Y105.803 E4.20206
G1 X53.41 Y106.218 E.01326
G1 X149.783 Y202.591 E4.18921
G1 X149.368 Y202.71 E.01325
G1 X53.291 Y106.633 E4.17637
G1 X53.172 Y107.047 E.01326
G1 X148.954 Y202.829 E4.16353
G1 X148.54 Y202.948 E.01325
G1 X53.053 Y107.462 E4.15068
G1 X52.934 Y107.876 E.01326
G1 X148.121 Y203.064 E4.13768
G1 X147.698 Y203.174 E.01344
G1 X52.825 Y108.301 E4.12403
G1 X52.716 Y108.725 E.01347
G1 X147.275 Y203.285 E4.11037
G1 X146.852 Y203.395 E.01344
G1 X52.607 Y109.15 E4.09671
G2 X52.502 Y109.578 I8.647 J2.344 E.01356
G1 X146.423 Y203.499 E4.08261
G1 X145.993 Y203.602 E.0136
G1 X52.403 Y110.012 E4.06825
G1 X52.303 Y110.446 E.01368
G1 X145.563 Y203.706 E4.05389
G3 X145.127 Y203.804 I-3.041 J-12.494 E.01372
G1 X52.203 Y110.879 E4.0393
G1 X52.103 Y111.313 E.01368
G1 X144.691 Y203.9 E4.02466
G1 X144.254 Y203.997 E.01375
G1 X52.003 Y111.747 E4.01001
G2 X51.914 Y112.19 I6.433 J1.531 E.01392
G1 X143.81 Y204.086 E3.99459
G1 X143.363 Y204.173 E.01398
G1 X51.827 Y112.637 E3.97895
G1 X51.74 Y113.084 E.01398
G1 X142.916 Y204.26 E3.96331
G1 X142.47 Y204.347 E.01398
G1 X51.653 Y113.53 E3.94767
G1 X51.567 Y113.977 E.01398
G1 X142.023 Y204.433 E3.93203
G1 X141.576 Y204.52 E.01398
G1 X51.48 Y114.424 E3.91639
G2 X51.401 Y114.879 I8.63 J1.721 E.0142
G1 X141.121 Y204.599 E3.90002
G1 X140.664 Y204.675 E.01424
G1 X51.325 Y115.336 E3.88348
G1 X51.248 Y115.793 E.01424
G1 X140.207 Y204.752 E3.86694
G3 X139.741 Y204.818 I-1.505 J-8.836 E.01449
G1 X51.178 Y116.256 E3.8497
G1 X51.109 Y116.72 E.01442
G1 X139.273 Y204.884 E3.83239
G1 X138.805 Y204.95 E.01452
G1 X51.04 Y117.184 E3.81507
G1 X50.978 Y117.656 E.01464
G1 X138.338 Y205.016 E3.7974
G1 X137.87 Y205.081 E.01452
G1 X50.917 Y118.129 E3.77972
G1 X50.856 Y118.601 E.01464
G1 X137.4 Y205.145 E3.76195
G1 X136.917 Y205.196 E.01492
G1 X50.803 Y119.081 E3.74328
G1 X50.753 Y119.564 E.01493
G1 X136.435 Y205.246 E3.72449
G1 X135.952 Y205.297 E.01492
G1 X50.702 Y120.047 E3.7057
G1 X50.652 Y120.53 E.01493
G1 X135.469 Y205.348 E3.68691
G1 X134.987 Y205.399 E.01492
G1 X50.601 Y121.013 E3.66812
G2 X50.557 Y121.503 I9.564 J1.107 E.01511
G1 X134.495 Y205.441 E3.64867
G1 X133.997 Y205.476 E.01535
G1 X50.518 Y121.997 E3.62871
G1 X50.479 Y122.492 E.01525
G1 X133.499 Y205.511 E3.60874
G1 X133 Y205.546 E.01535
G1 X50.447 Y122.993 E3.58848
G1 X50.416 Y123.496 E.01548
G1 X132.502 Y205.581 E3.56816
G3 X131.998 Y205.61 I-.84 J-10.207 E.01553
G1 X50.387 Y124 E3.5475
G1 X50.369 Y124.515 E.01585
G1 X131.488 Y205.634 E3.52611
G1 X130.978 Y205.657 E.01569
G1 X50.351 Y125.031 E3.50472
M73 P89 R6
G1 X50.333 Y125.546 E.01585
G1 X130.461 Y205.674 E3.48304
G1 X129.937 Y205.683 E.01612
G1 X50.315 Y126.062 E3.46103
G1 X50.297 Y126.577 E.01585
G1 X129.412 Y205.692 E3.43902
G1 X128.888 Y205.701 E.01612
G1 X50.291 Y127.104 E3.41651
G1 X50.286 Y127.633 E.01626
G1 X128.364 Y205.71 E3.39392
G3 X127.835 Y205.715 I-.359 J-10.094 E.01625
G1 X50.286 Y128.166 E3.37095
G1 X50.296 Y128.709 E.01669
G1 X127.297 Y205.711 E3.34715
G1 X126.759 Y205.706 E.01654
G1 X50.305 Y129.252 E3.32335
G1 X50.315 Y129.795 E.01669
G1 X126.209 Y205.69 E3.29904
G1 X125.656 Y205.67 E.017
G1 X50.324 Y130.338 E3.2746
G2 X50.338 Y130.886 I10.463 J.005 E.01684
G1 X125.104 Y205.651 E3.24996
G1 X124.551 Y205.632 E.017
G1 X50.362 Y131.443 E3.22488
G1 X50.387 Y132.001 E.01716
G1 X123.998 Y205.612 E3.19979
G3 X123.432 Y205.58 I.344 J-10.822 E.01744
G1 X50.422 Y132.569 E3.17367
G1 X50.458 Y133.139 E.01754
G1 X122.864 Y205.545 E3.1474
G3 X122.29 Y205.505 I.866 J-16.489 E.01767
G1 X50.496 Y133.711 E3.12079
G1 X50.548 Y134.296 E.01805
G1 X121.711 Y205.459 E3.09338
G3 X121.129 Y205.411 I.63 J-11.097 E.01795
G1 X50.599 Y134.881 E3.06584
G1 X50.651 Y135.466 E.01805
G1 X120.533 Y205.348 E3.03769
M73 P89 R5
G1 X119.937 Y205.285 E.01842
G1 X50.703 Y136.051 E3.00954
G2 X50.769 Y136.651 I11.819 J-1.005 E.01855
G1 X119.341 Y205.223 E2.98074
G1 X118.745 Y205.16 E.01842
G1 X50.838 Y137.253 E2.95184
G2 X50.918 Y137.867 I11.772 J-1.231 E.01903
G1 X118.133 Y205.082 E2.92175
G1 X117.513 Y204.995 E.01926
G1 X51.005 Y138.487 E2.89098
G1 X51.093 Y139.108 E.01927
G1 X116.892 Y204.907 E2.86021
G1 X116.271 Y204.82 E.01927
G1 X51.18 Y139.729 E2.82944
G2 X51.273 Y140.356 I12.018 J-1.47 E.01948
G1 X115.642 Y204.725 E2.79804
G1 X114.995 Y204.61 E.02021
G1 X51.38 Y140.996 E2.76522
G2 X51.492 Y141.642 I12.374 J-1.815 E.02014
G1 X114.347 Y204.496 E2.7322
G1 X113.699 Y204.382 E.02021
G1 X51.621 Y142.304 E2.69846
G1 X51.75 Y142.966 E.02073
G1 X113.048 Y204.264 E2.66453
G1 X112.378 Y204.128 E.02101
G1 X51.879 Y143.628 E2.62983
G2 X52.014 Y144.297 I9.643 J-1.599 E.02096
G1 X111.703 Y203.986 E2.59464
G1 X111.01 Y203.826 E.02188
G1 X52.174 Y144.99 E2.55753
G1 X52.334 Y145.684 E.02188
G1 X110.316 Y203.666 E2.52043
G1 X109.623 Y203.506 E.02188
G1 X52.494 Y146.377 E2.48332
G2 X52.664 Y147.081 I13.507 J-2.894 E.02225
G1 X108.915 Y203.332 E2.44518
G1 X108.187 Y203.137 E.02319
G1 X52.85 Y147.8 E2.40541
G2 X53.052 Y148.536 I14.152 J-3.493 E.02345
G1 X107.458 Y202.942 E2.36495
G1 X106.729 Y202.747 E.02319
G1 X53.267 Y149.284 E2.32395
G1 X53.481 Y150.032 E.02391
G1 X105.978 Y202.528 E2.28195
G3 X105.218 Y202.302 I6.156 J-22.067 E.02436
G1 X53.698 Y150.782 E2.23951
G1 X53.944 Y151.561 E.02511
G1 X104.439 Y202.056 E2.19497
G3 X103.645 Y201.796 I4.568 J-15.278 E.02567
G1 X54.204 Y152.355 E2.14917
G1 X54.484 Y153.168 E.02645
G1 X102.832 Y201.516 E2.10163
G1 X102.018 Y201.236 E.02645
G1 X54.764 Y153.982 E2.05408
G2 X55.054 Y154.805 I15.855 J-5.123 E.02685
G1 X101.195 Y200.946 E2.00567
G1 X100.343 Y200.627 E.02796
G1 X55.373 Y155.657 E1.95478
G2 X55.725 Y156.543 I17.092 J-6.281 E.02929
G1 X99.457 Y200.275 E1.901
G1 X98.562 Y199.914 E.02967
G1 X56.086 Y157.438 E1.84638
G1 X56.448 Y158.333 E.02967
G1 X97.667 Y199.552 E1.79175
G3 X96.708 Y199.126 I5.619 J-13.954 E.03226
G1 X56.856 Y159.275 E1.7323
G2 X57.29 Y160.242 I27.941 J-11.95 E.03258
G1 X95.746 Y198.698 E1.67165
G3 X94.763 Y198.248 I8.108 J-19.009 E.03327
G1 X57.76 Y161.246 E1.60843
G1 X58.268 Y162.287 E.03561
G1 X93.73 Y197.749 E1.54147
G1 X92.642 Y197.195 E.03752
G1 X58.781 Y163.333 E1.47193
G1 X59.386 Y164.472 E.03966
G1 X91.555 Y196.641 E1.39833
G3 X90.391 Y196.01 I11.43 J-22.487 E.0407
G1 X59.992 Y165.611 E1.3214
G2 X60.682 Y166.834 I23.664 J-12.538 E.04317
G1 X89.166 Y195.318 E1.23817
G3 X87.831 Y194.517 I14.757 J-26.097 E.04784
G1 X61.452 Y168.138 E1.14667
G2 X62.325 Y169.544 I28.963 J-17.001 E.05087
G1 X86.463 Y193.682 E1.04926
G3 X84.915 Y192.668 I18.595 J-30.059 E.0569
G1 X63.317 Y171.07 E.93882
G2 X64.466 Y172.752 I50.611 J-33.327 E.06261
G1 X83.256 Y191.542 E.81679
G3 X81.244 Y190.064 I27.241 J-39.179 E.07674
G1 X65.883 Y174.703 E.66774
G2 X67.884 Y177.237 I58.751 J-44.328 E.09925
G1 X78.763 Y188.116 E.47289
G1 X78.044 Y187.534 E.02842
G3 X74.106 Y183.993 I53.031 J-62.932 E.16282
G1 X69.271 Y179.158 E.21016
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X70.685 Y180.572 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/10
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; OBJECT_ID: 15978
M204 S10000
G17
G3 Z2.2 I.649 J1.03 P1  F42000
G1 X200.719 Y98.62 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X201.228 Y99.89 E.04204
G3 X123.826 Y49.67 I-73.228 J28.104 E12.11229
G3 X129.3 Y49.569 I4.624 J102.868 E.16827
G3 X200.203 Y97.352 I-1.301 J78.425 E2.77853
G1 X200.697 Y98.564 E.04021
; WIPE_START
M204 S6000
G1 X201.228 Y99.89 E-.54272
G1 X201.43 Y100.425 E-.21729
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y128 F18000 ; move to safe pos
M73 P90 R5
G1 X-48.2 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.4 F4000
            G39.3 S1
            G0 Z2.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END


G1 X177.752 Y188.365 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X188.41 Y177.708 E.46313
; WIPE_START
M204 S6000
G1 X186.996 Y179.122 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X190.408 Y175.177 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X175.225 Y190.359 E.65975
; WIPE_START
M204 S6000
G1 X176.639 Y188.945 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X173.194 Y191.857 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X191.824 Y173.227 E.80959
; WIPE_START
M204 S6000
G1 X190.41 Y174.641 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X193.036 Y171.482 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X171.516 Y193.002 E.93514
; WIPE_START
M204 S6000
G1 X172.93 Y191.588 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X169.953 Y194.032 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X194.01 Y169.975 E1.04539
; WIPE_START
M204 S6000
G1 X192.596 Y171.389 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X194.898 Y168.553 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X168.572 Y194.88 E1.14403
; WIPE_START
M204 S6000
G1 X169.986 Y193.466 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X167.234 Y195.684 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X195.685 Y167.233 E1.23632
; WIPE_START
M204 S6000
G1 X194.271 Y168.647 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X196.357 Y166.027 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X165.999 Y196.386 E1.31924
; WIPE_START
M204 S6000
G1 X167.413 Y194.972 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.855 Y196.997 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X197.021 Y164.831 E1.39776
G1 X197.584 Y163.734
G1 X163.716 Y197.602 E1.47172
G1 X162.658 Y198.127
G1 X198.138 Y162.647 E1.54179
G1 X198.646 Y161.606
G1 X161.616 Y198.636 E1.60914
G1 X160.606 Y199.112
G1 X199.105 Y160.613 E1.67296
G1 X199.533 Y159.652
G1 X159.632 Y199.553 E1.73388
G1 X158.689 Y199.963
G1 X199.961 Y158.691 E1.79348
G1 X200.331 Y157.788
G1 X157.788 Y200.331 E1.84871
G1 X156.893 Y200.693
G1 X200.692 Y156.893 E1.9033
G1 X201.052 Y156
G1 X156.001 Y201.052 E1.95771
G1 X155.162 Y201.357
G1 X201.371 Y155.148 E2.00799
G1 X201.668 Y154.318
G1 X154.323 Y201.663 E2.05737
G1 X153.487 Y201.966
G1 X201.948 Y153.504 E2.10589
G1 X202.228 Y152.691
G1 X152.684 Y202.235 E2.15294
G1 X151.89 Y202.496
G1 X202.496 Y151.89 E2.19905
G1 X202.741 Y151.111
G1 X151.111 Y202.741 E2.24357
G1 X150.354 Y202.965
G1 X202.972 Y150.347 E2.28651
G1 X203.197 Y149.59
G1 X149.606 Y203.18 E2.32876
G1 X148.858 Y203.395
G1 X203.393 Y148.86 E2.36978
G1 X203.588 Y148.132
G1 X148.118 Y203.602 E2.41044
G1 X147.398 Y203.789
G1 X203.783 Y147.403 E2.45021
G1 X203.966 Y146.687
G1 X146.684 Y203.969 E2.48919
G1 X145.982 Y204.138
G1 X204.126 Y145.994 E2.52663
G1 X204.286 Y145.3
G1 X145.292 Y204.295 E2.5636
G1 X144.615 Y204.439
G1 X204.446 Y144.607 E2.59998
G1 X204.59 Y143.93
G1 X143.937 Y204.583 E2.63567
G1 X143.26 Y204.727
G1 X204.719 Y143.268 E2.67069
G1 X204.848 Y142.606
G1 X142.594 Y204.859 E2.70521
G1 X141.94 Y204.98
G1 X204.976 Y141.944 E2.73924
G1 X205.095 Y141.292
G1 X141.292 Y205.095 E2.77257
G1 X140.651 Y205.202
G1 X205.202 Y140.651 E2.80506
G1 X205.303 Y140.018
G1 X140.018 Y205.303 E2.83693
G1 X139.398 Y205.39
G1 X205.39 Y139.398 E2.86768
G1 X205.477 Y138.777
G1 X138.777 Y205.477 E2.89843
G1 X138.157 Y205.564
G1 X205.564 Y138.157 E2.92918
G1 X205.651 Y137.536
G1 X137.536 Y205.651 E2.95993
G1 X136.94 Y205.714
G1 X205.714 Y136.94 E2.98855
G1 X205.777 Y136.344
G1 X136.344 Y205.777 E3.01717
G1 X135.748 Y205.839
G1 X205.839 Y135.748 E3.04578
G1 X205.902 Y135.153
G1 X135.153 Y205.902 E3.0744
G1 X134.567 Y205.955
G1 X205.957 Y134.564 E3.10226
G1 X206.003 Y133.985
G1 X133.993 Y205.995 E3.12916
G1 X133.42 Y206.035
G1 X206.047 Y133.408 E3.15602
G1 X206.082 Y132.84
G1 X132.846 Y206.075 E3.18245
G1 X132.273 Y206.116
G1 X206.117 Y132.272 E3.20888
G1 X206.141 Y131.714
G1 X131.712 Y206.143 E3.23431
G1 X131.153 Y206.168
G1 X206.16 Y131.162 E3.2594
G1 X206.179 Y130.609
G1 X130.599 Y206.189 E3.28433
G1 X130.056 Y206.199
G1 X206.199 Y130.057 E3.30875
G1 X206.218 Y129.504
G1 X129.514 Y206.208 E3.33317
G1 X128.971 Y206.218
G1 X206.226 Y128.962 E3.35712
G1 X206.231 Y128.424
G1 X128.428 Y206.227 E3.38091
G1 X127.888 Y206.234
G1 X206.233 Y127.889 E3.40444
G1 X206.224 Y127.365
G1 X127.36 Y206.229 E3.42702
G1 X126.831 Y206.225
G1 X206.214 Y126.841 E3.44959
G1 X206.205 Y126.317
G1 X126.308 Y206.214 E3.47192
G1 X125.788 Y206.201
G1 X206.196 Y125.793 E3.49411
G1 X206.187 Y125.269
G1 X125.269 Y206.187 E3.51629
G1 X124.762 Y206.16
G1 X206.164 Y124.758 E3.53732
G1 X206.142 Y124.248
G1 X124.255 Y206.134 E3.55835
G1 X123.749 Y206.107
G1 X206.116 Y123.74 E3.57928
G1 X206.082 Y123.241
G1 X123.242 Y206.081 E3.59978
G1 X122.735 Y206.054
G1 X206.047 Y122.743 E3.62028
G1 X206.012 Y122.245
G1 X122.236 Y206.02 E3.64044
G1 X121.742 Y205.981
G1 X205.977 Y121.746 E3.66041
G1 X205.942 Y121.248
G1 X121.248 Y205.942 E3.68037
G1 X120.763 Y205.893
M73 P91 R5
G1 X205.893 Y120.763 E3.6993
G1 X205.842 Y120.281
G1 X120.281 Y205.843 E3.71807
G1 X119.798 Y205.792
G1 X205.792 Y119.798 E3.73684
G1 X205.741 Y119.316
G1 X119.315 Y205.741 E3.75561
G1 X118.833 Y205.691
G1 X205.69 Y118.833 E3.77437
M73 P91 R4
G1 X205.636 Y118.354
G1 X118.354 Y205.636 E3.79281
G1 X117.883 Y205.574
G1 X205.57 Y117.887 E3.81044
G1 X205.505 Y117.419
G1 X117.411 Y205.513 E3.82808
G1 X116.942 Y205.448
G1 X205.439 Y116.952 E3.8456
G1 X205.373 Y116.484
G1 X116.478 Y205.379 E3.8629
G1 X116.015 Y205.309
G1 X205.307 Y116.017 E3.88021
G1 X205.237 Y115.554
G1 X115.555 Y205.235 E3.89709
G1 X115.102 Y205.155
G1 X205.16 Y115.097 E3.91346
G1 X205.084 Y114.64
G1 X114.649 Y205.075 E3.92984
G1 X114.196 Y204.995
G1 X205.002 Y114.189 E3.94599
G1 X204.915 Y113.742
G1 X113.742 Y204.915 E3.96192
G1 X113.289 Y204.836
G1 X204.829 Y113.296 E3.97785
G1 X204.742 Y112.849
G1 X112.841 Y204.75 E3.99354
G1 X112.398 Y204.66
G1 X204.655 Y112.403 E4.00903
G1 X204.568 Y111.956
G1 X111.955 Y204.57 E4.02451
G1 X111.517 Y204.475
G1 X204.477 Y111.515 E4.03956
G1 X204.38 Y111.078
G1 X111.083 Y204.375 E4.05418
G1 X110.65 Y204.275
G1 X204.283 Y110.642 E4.0688
G1 X204.183 Y110.208
G1 X110.217 Y204.175 E4.0833
G1 X109.784 Y204.075
G1 X204.08 Y109.778 E4.09764
G1 X203.977 Y109.348
G1 X109.35 Y203.975 E4.11198
G1 X108.922 Y203.87
G1 X203.87 Y108.922 E4.12597
G1 X203.757 Y108.501
G1 X108.501 Y203.757 E4.13935
G1 X108.081 Y203.645
G1 X203.645 Y108.081 E4.15273
G1 X203.532 Y107.66
G1 X107.66 Y203.532 E4.16611
G1 X107.239 Y203.419
G1 X203.419 Y107.239 E4.17949
G1 X203.307 Y106.819
G1 X106.819 Y203.307 E4.19287
G1 X106.399 Y203.193
G1 X203.193 Y106.399 E4.20617
G1 X203.071 Y105.988
G1 X105.988 Y203.071 E4.21876
G1 X105.576 Y202.95
G1 X202.95 Y105.576 E4.23134
G1 X202.828 Y105.165
G1 X105.165 Y202.828 E4.24392
G1 X104.759 Y202.7
G1 X202.7 Y104.759 E4.25602
G1 X202.572 Y104.354
G1 X104.353 Y202.573 E4.26807
G1 X103.948 Y202.445
G1 X202.444 Y103.949 E4.28012
G1 X202.311 Y103.548
G1 X103.549 Y202.311 E4.29171
G1 X103.152 Y202.174
G1 X202.175 Y103.152 E4.30301
G1 X202.038 Y102.755
G1 X102.755 Y202.038 E4.31431
G1 X102.359 Y201.901
G1 X201.901 Y102.358 E4.32561
G1 X201.765 Y101.962
G1 X101.962 Y201.764 E4.3369
G1 X101.565 Y201.628
G1 X201.628 Y101.565 E4.3482
G1 X201.49 Y101.17
G1 X101.17 Y201.49 E4.35937
G1 X100.782 Y201.345
G1 X201.345 Y100.782 E4.36993
M73 P92 R4
G1 X201.199 Y100.394
G1 X100.394 Y201.199 E4.38049
G1 X100.006 Y201.054
G1 X201.054 Y100.006 E4.39105
G1 X200.902 Y99.625
G1 X99.625 Y200.902 E4.40096
G1 X99.245 Y200.748
G1 X200.748 Y99.245 E4.4108
G1 X200.595 Y98.866
G1 X98.865 Y200.595 E4.42064
G1 X98.486 Y200.441
G1 X200.441 Y98.486 E4.43047
G1 X200.288 Y98.106
G1 X98.106 Y200.288 E4.44031
G1 X97.726 Y200.135
G1 X200.135 Y97.726 E4.45014
G1 X199.979 Y97.348
G1 X97.349 Y199.979 E4.4598
G1 X96.98 Y199.814
G1 X199.818 Y96.976 E4.46881
G1 X199.656 Y96.605
G1 X96.611 Y199.65 E4.47782
G1 X96.242 Y199.486
G1 X199.494 Y96.233 E4.48683
G1 X199.328 Y95.866
G1 X95.873 Y199.322 E4.49564
G1 X95.504 Y199.157
G1 X199.161 Y95.5 E4.50442
G1 X198.994 Y95.133
G1 X95.135 Y198.993 E4.5132
G1 X94.77 Y198.825
G1 X198.824 Y94.771 E4.52166
G1 X198.649 Y94.412
G1 X94.408 Y198.653 E4.52976
G1 X94.047 Y198.481
G1 X198.474 Y94.054 E4.53785
G1 X198.299 Y93.695
G1 X93.687 Y198.308 E4.54592
G1 X93.334 Y198.128
G1 X198.125 Y93.337 E4.55368
G1 X197.95 Y92.979
G1 X92.98 Y197.948 E4.56143
G1 X92.627 Y197.768
G1 X197.775 Y92.62 E4.56919
G1 X197.594 Y92.268
G1 X92.274 Y197.588 E4.57667
G1 X91.92 Y197.408
G1 X197.409 Y91.92 E4.58397
G1 X197.224 Y91.572
G1 X91.567 Y197.228 E4.59128
G1 X91.216 Y197.046
G1 X197.038 Y91.224 E4.59851
G1 X196.853 Y90.875
G1 X90.872 Y196.856 E4.60538
G1 X90.529 Y196.666
G1 X196.668 Y90.527 E4.61225
G1 X196.483 Y90.179
G1 X90.186 Y196.476 E4.61912
G1 X89.843 Y196.286
G1 X196.293 Y89.836 E4.62576
G1 X196.1 Y89.496
G1 X89.5 Y196.096 E4.6323
G1 X89.157 Y195.906
G1 X195.907 Y89.155 E4.63884
G1 X195.713 Y88.816
G1 X88.816 Y195.713 E4.64519
G1 X88.48 Y195.515
G1 X195.513 Y88.483 E4.65109
G1 X195.313 Y88.15
G1 X88.145 Y195.318 E4.65698
G1 X87.809 Y195.121
G1 X195.113 Y87.817 E4.66288
M73 P92 R3
G1 X194.913 Y87.484
G1 X87.478 Y194.918 E4.66854
G1 X87.15 Y194.713
G1 X194.712 Y87.15 E4.6741
G1 X194.512 Y86.817
G1 X86.822 Y194.508 E4.67967
G1 X86.494 Y194.303
G1 X194.311 Y86.486 E4.68518
G1 X194.103 Y86.16
G1 X86.166 Y194.098 E4.69042
M73 P93 R3
G1 X85.837 Y193.893
G1 X193.896 Y85.834 E4.69566
G1 X193.688 Y85.508
G1 X85.509 Y193.687 E4.70091
G1 X85.186 Y193.478
G1 X193.476 Y85.187 E4.70575
G1 X193.261 Y84.869
G1 X84.865 Y193.265 E4.71036
G1 X84.544 Y193.053
G1 X193.047 Y84.55 E4.71497
G1 X192.832 Y84.232
G1 X84.224 Y192.84 E4.71955
G1 X83.91 Y192.62
G1 X192.617 Y83.913 E4.72384
G1 X192.402 Y83.595
G1 X83.596 Y192.401 E4.72814
G1 X83.283 Y192.181
G1 X192.187 Y83.276 E4.73243
G1 X191.969 Y82.962
G1 X82.969 Y191.961 E4.73656
G1 X82.655 Y191.742
G1 X191.747 Y82.651 E4.74054
G1 X191.525 Y82.339
G1 X82.342 Y191.522 E4.74453
G1 X82.028 Y191.303
G1 X191.303 Y82.028 E4.74851
G1 X191.076 Y81.721
G1 X81.721 Y191.076 E4.75199
G1 X81.415 Y190.849
G1 X190.849 Y81.415 E4.75546
G1 X190.623 Y81.108
G1 X81.108 Y190.623 E4.75892
G1 X80.804 Y190.394
G1 X190.393 Y80.805 E4.76219
G1 X190.159 Y80.505
G1 X80.502 Y190.162 E4.76514
G1 X80.2 Y189.931
G1 X189.925 Y80.206 E4.76808
G1 X189.691 Y79.907
G1 X79.899 Y189.699 E4.77103
G1 X79.602 Y189.462
G1 X189.458 Y79.607 E4.77374
G1 X189.224 Y79.308
G1 X79.308 Y189.224 E4.77638
G1 X79.013 Y188.985
G1 X188.99 Y79.008 E4.77902
G1 X188.755 Y78.71
G1 X78.718 Y188.747 E4.7816
G1 X78.424 Y188.508
G1 X188.514 Y78.418 E4.78394
G1 X188.273 Y78.126
G1 X78.129 Y188.269 E4.78627
G1 X77.834 Y188.031
G1 X188.032 Y77.833 E4.7886
G1 X187.787 Y77.545
G1 X77.544 Y187.788 E4.79058
G1 X77.256 Y187.542
G1 X187.539 Y77.26 E4.7923
G1 X187.291 Y76.975
G1 X76.969 Y187.297 E4.79402
G1 X76.681 Y187.051
G1 X187.043 Y76.689 E4.79575
G1 X186.795 Y76.404
G1 X76.4 Y186.799 E4.79717
G1 X76.12 Y186.546
G1 X186.547 Y76.119 E4.79859
G1 X186.299 Y75.834
G1 X75.839 Y186.293 E4.8
G1 X75.558 Y186.041
G1 X186.047 Y75.552 E4.80128
G1 X185.79 Y75.276
G1 X75.278 Y185.788 E4.80229
G1 X74.997 Y185.535
G1 X185.533 Y75 E4.8033
G1 X185.275 Y74.724
G1 X74.717 Y185.283 E4.80431
M73 P94 R3
G1 X74.441 Y185.025
G1 X185.018 Y74.448 E4.8051
G1 X184.761 Y74.172
G1 X74.168 Y184.765 E4.80581
G1 X73.894 Y184.506
G1 X184.503 Y73.896 E4.80652
G1 X184.245 Y73.621
G1 X73.621 Y184.245 E4.80714
G1 X73.355 Y183.978
G1 X183.978 Y73.355 E4.80714
G1 X183.712 Y73.088
G1 X73.088 Y183.712 E4.80714
G1 X72.821 Y183.445
G1 X183.445 Y72.821 E4.80714
G1 X183.179 Y72.555
G1 X72.555 Y183.179 E4.80714
G1 X72.288 Y182.912
G1 X182.912 Y72.288 E4.80714
G1 X182.645 Y72.022
G1 X72.022 Y182.645 E4.80714
G1 X71.755 Y182.379
G1 X182.379 Y71.755 E4.80714
G1 X182.106 Y71.494
G1 X71.496 Y182.104 E4.80652
G1 X71.239 Y181.828
G1 X181.832 Y71.235 E4.80581
G1 X181.559 Y70.975
G1 X70.982 Y181.552 E4.8051
G1 X70.724 Y181.276
G1 X181.283 Y70.717 E4.80431
G1 X181.003 Y70.465
G1 X70.467 Y181 E4.8033
G1 X70.21 Y180.724
G1 X180.722 Y70.212 E4.80229
G1 X180.441 Y69.959
G1 X69.953 Y180.448 E4.80128
G1 X69.701 Y180.166
G1 X180.161 Y69.707 E4.80001
G1 X179.88 Y69.454
G1 X69.453 Y179.881 E4.79859
G1 X69.205 Y179.596
G1 X179.6 Y69.201 E4.79717
G1 X179.319 Y68.949
G1 X68.957 Y179.31 E4.79575
G1 X68.709 Y179.025
G1 X179.031 Y68.703 E4.79402
G1 X178.744 Y68.458
G1 X68.461 Y178.74 E4.7923
G1 X68.213 Y178.455
G1 X178.456 Y68.212 E4.79058
M73 P94 R2
G1 X178.166 Y67.968
G1 X67.968 Y178.166 E4.78864
G1 X67.727 Y177.874
G1 X177.874 Y67.728 E4.7864
G1 X177.581 Y67.487
G1 X67.486 Y177.582 E4.78416
G1 X67.245 Y177.29
G1 X177.289 Y67.246 E4.78192
G1 X176.992 Y67.01
G1 X67.01 Y176.991 E4.77924
G1 X66.776 Y176.692
G1 X176.692 Y66.776 E4.77639
G1 X176.393 Y66.542
G1 X66.542 Y176.393 E4.77354
G1 X66.308 Y176.093
G1 X176.094 Y66.308 E4.77069
G1 X175.794 Y66.074
G1 X66.075 Y175.794 E4.76785
G1 X65.841 Y175.495
G1 X175.495 Y65.841 E4.765
G1 X175.195 Y65.607
G1 X65.607 Y175.195 E4.76215
G1 X65.377 Y174.891
G1 X174.891 Y65.378 E4.75891
G1 X174.585 Y65.151
G1 X65.151 Y174.585 E4.75544
M73 P95 R2
G1 X64.924 Y174.279
G1 X174.278 Y64.924 E4.75197
G1 X173.971 Y64.698
G1 X64.697 Y173.972 E4.74848
G1 X64.475 Y173.661
G1 X173.658 Y64.477 E4.74454
G1 X173.345 Y64.258
G1 X64.253 Y173.349 E4.74056
G1 X64.031 Y173.038
G1 X173.031 Y64.038 E4.73657
G1 X172.717 Y63.819
G1 X63.813 Y172.723 E4.73244
G1 X63.598 Y172.405
G1 X172.404 Y63.599 E4.72814
G1 X172.09 Y63.38
G1 X63.383 Y172.087 E4.72384
G1 X63.168 Y171.768
G1 X171.776 Y63.16 E4.71955
G1 X171.454 Y62.949
G1 X62.953 Y171.45 E4.71487
G1 X62.739 Y171.131
G1 X171.13 Y62.739 E4.71015
G1 X170.807 Y62.529
G1 X62.524 Y170.813 E4.70544
G1 X62.312 Y170.492
G1 X170.484 Y62.319 E4.70061
G1 X170.161 Y62.109
G1 X62.104 Y170.166 E4.69558
G1 X61.897 Y169.84
G1 X169.837 Y61.899 E4.69055
G1 X169.514 Y61.689
G1 X61.689 Y169.514 E4.68551
G1 X61.488 Y169.183
G1 X169.183 Y61.488 E4.67987
G1 X168.849 Y61.287
G1 X61.287 Y168.849 E4.67409
G1 X61.087 Y168.516
G1 X168.516 Y61.087 E4.66831
G1 X168.183 Y60.887
G1 X60.887 Y168.183 E4.66253
G1 X60.687 Y167.85
G1 X167.85 Y60.687 E4.65676
G1 X167.517 Y60.487
G1 X60.487 Y167.517 E4.65098
G1 X60.287 Y167.184
G1 X167.184 Y60.287 E4.6452
G1 X166.845 Y60.093
G1 X60.093 Y166.845 E4.6389
G1 X59.9 Y166.504
G1 X166.504 Y59.9 E4.63248
G1 X166.164 Y59.707
G1 X59.707 Y166.164 E4.62605
G1 X59.517 Y165.821
G1 X165.821 Y59.517 E4.61942
G1 X165.473 Y59.332
G1 X59.332 Y165.473 E4.61233
G1 X59.147 Y165.124
G1 X165.124 Y59.147 E4.60525
G1 X164.776 Y58.962
G1 X58.962 Y164.776 E4.59817
G1 X58.776 Y164.428
G1 X164.428 Y58.776 E4.59108
G1 X164.08 Y58.591
G1 X58.591 Y164.08 E4.584
G1 X58.406 Y163.732
G1 X163.732 Y58.406 E4.57691
G1 X163.381 Y58.224
G1 X58.225 Y163.38 E4.56953
G1 X58.05 Y163.021
G1 X163.025 Y58.047 E4.56167
G1 X162.669 Y57.869
G1 X57.875 Y162.663 E4.5538
G1 X57.7 Y162.305
G1 X162.313 Y57.692 E4.54594
G1 X161.952 Y57.519
M73 P96 R2
G1 X57.525 Y161.946 E4.53786
G1 X57.351 Y161.588
G1 X161.591 Y57.347 E4.52977
G1 X161.23 Y57.175
G1 X57.176 Y161.23 E4.52168
G1 X57.006 Y160.866
G1 X160.865 Y57.007 E4.51317
G1 X160.496 Y56.843
G1 X56.839 Y160.5 E4.5044
G1 X56.672 Y160.134
G1 X160.127 Y56.678 E4.49563
G1 X159.758 Y56.514
G1 X56.505 Y159.767 E4.48683
G1 X56.344 Y159.395
G1 X159.389 Y56.35 E4.47782
G1 X159.02 Y56.186
G1 X56.182 Y159.023 E4.4688
G1 X56.021 Y158.652
G1 X158.651 Y56.021 E4.45979
G1 X158.276 Y55.863
G1 X55.865 Y158.274 E4.45023
G1 X55.712 Y157.894
G1 X157.899 Y55.707 E4.44052
G1 X157.522 Y55.551
G1 X55.558 Y157.514 E4.4308
G1 X55.405 Y157.134
G1 X157.142 Y55.397 E4.42097
G1 X156.759 Y55.247
G1 X55.252 Y156.755 E4.41101
G1 X55.098 Y156.375
G1 X156.377 Y55.096 E4.40104
G1 X155.994 Y54.946
G1 X54.946 Y155.994 E4.39103
G1 X54.8 Y155.606
G1 X155.603 Y54.803 E4.38037
M73 P96 R1
G1 X155.212 Y54.661
G1 X54.655 Y155.218 E4.36968
G1 X54.51 Y154.83
G1 X154.821 Y54.519 E4.35899
G1 X154.43 Y54.377
G1 X54.372 Y154.435 E4.348
G1 X54.236 Y154.038
G1 X154.039 Y54.234 E4.33695
G1 X153.648 Y54.092
G1 X54.099 Y153.641 E4.32589
G1 X53.962 Y153.245
G1 X153.252 Y53.955 E4.31463
G1 X152.853 Y53.821
G1 X53.826 Y152.848 E4.3032
G1 X53.689 Y152.451
G1 X152.453 Y53.687 E4.29178
G1 X152.052 Y53.555
G1 X53.555 Y152.052 E4.28015
G1 X53.427 Y151.646
G1 X151.646 Y53.428 E4.26808
G1 X151.24 Y53.3
G1 X53.3 Y151.241 E4.256
G1 X53.173 Y150.835
G1 X150.835 Y53.173 E4.24389
G1 X150.421 Y53.053
G1 X53.054 Y150.42 E4.23107
G1 X52.935 Y150.006
G1 X150.006 Y52.935 E4.21822
G1 X149.592 Y52.816
G1 X52.816 Y149.592 E4.20538
G1 X52.697 Y149.177
G1 X149.177 Y52.697 E4.19253
G1 X148.763 Y52.578
G1 X52.578 Y148.763 E4.17969
G1 X52.459 Y148.349
G1 X148.348 Y52.46 E4.16684
G1 X147.927 Y52.348
G1 X52.348 Y147.926 E4.15333
G1 X52.239 Y147.503
G1 X147.503 Y52.239 E4.13968
G1 X147.079 Y52.129
G1 X52.129 Y147.079 E4.12603
G1 X52.023 Y146.652
G1 X146.65 Y52.025 E4.112
M73 P97 R1
G1 X146.217 Y51.925
G1 X51.92 Y146.222 E4.09765
G1 X51.817 Y145.792
G1 X145.783 Y51.825 E4.08331
G1 X145.35 Y51.725
G1 X51.719 Y145.356 E4.06873
G1 X51.625 Y144.916
G1 X144.917 Y51.625 E4.05397
G1 X144.483 Y51.525
G1 X51.532 Y144.477 E4.0392
G1 X51.438 Y144.037
G1 X144.045 Y51.43 E4.02423
G1 X143.602 Y51.34
G1 X51.345 Y143.597 E4.00904
G1 X51.251 Y143.158
G1 X143.159 Y51.25 E3.99385
G1 X142.711 Y51.164
G1 X51.164 Y142.712 E3.97818
G1 X51.08 Y142.262
G1 X142.258 Y51.085 E3.96212
G1 X141.804 Y51.005
G1 X50.996 Y141.813 E3.94605
G1 X50.916 Y141.36
G1 X141.351 Y50.925 E3.92984
G1 X140.898 Y50.845
G1 X50.84 Y140.903 E3.91346
G1 X50.763 Y140.446
G1 X140.444 Y50.765 E3.89708
G1 X139.983 Y50.693
G1 X50.693 Y139.983 E3.88011
G1 X50.627 Y139.516
G1 X139.516 Y50.627 E3.86265
G1 X139.048 Y50.561
G1 X50.561 Y139.048 E3.84519
G1 X50.495 Y138.581
G1 X138.581 Y50.495 E3.82773
G1 X138.113 Y50.43
G1 X50.43 Y138.113 E3.81027
G1 X50.364 Y137.646
G1 X137.646 Y50.364 E3.7928
G1 X137.17 Y50.307
G1 X50.307 Y137.169 E3.7746
G1 X50.252 Y136.691
G1 X136.691 Y50.252 E3.75617
G1 X136.212 Y50.198
G1 X50.198 Y136.212 E3.73774
G1 X50.154 Y135.723
G1 X135.726 Y50.151 E3.71851
G1 X135.239 Y50.104
G1 X50.111 Y135.232 E3.69923
G1 X50.068 Y134.742
G1 X134.752 Y50.058 E3.67994
G1 X134.254 Y50.023
G1 X50.025 Y134.252 E3.66015
G1 X49.982 Y133.762
G1 X133.755 Y49.988 E3.64036
G1 X133.257 Y49.954
G1 X49.945 Y133.265 E3.6203
G1 X49.914 Y132.763
G1 X132.758 Y49.919 E3.59999
G1 X132.26 Y49.884
G1 X49.883 Y132.261 E3.57968
G1 X49.858 Y131.753
G1 X131.753 Y49.858 E3.55875
G1 X131.242 Y49.835
G1 X49.835 Y131.242 E3.53752
G1 X49.813 Y130.731
G1 X130.731 Y49.813 E3.51628
G1 X130.211 Y49.8
G1 X49.804 Y130.207 E3.49408
G1 X49.795 Y129.683
G1 X129.691 Y49.787 E3.47188
G1 X129.168 Y49.777
G1 X49.786 Y129.159 E3.44953
G1 X49.776 Y128.635
G1 X128.634 Y49.777 E3.42675
G1 X128.101 Y49.777
G1 X49.767 Y128.11 E3.40397
G1 X49.769 Y127.575
G1 X127.567 Y49.777 E3.38072
G1 X127.034 Y49.777
G1 X49.774 Y127.038 E3.35734
G1 X49.782 Y126.496
G1 X126.497 Y49.781 E3.33364
G1 X125.95 Y49.795
G1 X49.801 Y125.943 E3.30901
M73 P98 R1
G1 X49.821 Y125.391
G1 X125.402 Y49.809 E3.28437
G1 X124.846 Y49.832
G1 X49.84 Y124.838 E3.25939
G1 X49.859 Y124.286
G1 X124.288 Y49.857 E3.2343
G1 X123.727 Y49.884
G1 X49.883 Y123.728 E3.20888
G1 X49.918 Y123.16
G1 X123.154 Y49.925 E3.18245
G1 X122.58 Y49.965
G1 X49.953 Y122.592 E3.15602
G1 X49.997 Y122.014
G1 X122.007 Y50.005 E3.12916
G1 X121.433 Y50.045
G1 X50.043 Y121.436 E3.10226
G1 X50.098 Y120.847
G1 X120.847 Y50.098 E3.0744
G1 X120.251 Y50.161
G1 X50.16 Y120.252 E3.04579
G1 X50.223 Y119.656
G1 X119.655 Y50.223 E3.01718
M73 P98 R0
G1 X119.06 Y50.286
G1 X50.285 Y119.06 E2.98857
G1 X50.35 Y118.462
G1 X118.464 Y50.349 E2.95987
G1 X117.85 Y50.43
G1 X50.43 Y117.849 E2.9297
G1 X50.51 Y117.235
G1 X117.235 Y50.51 E2.89952
G1 X116.611 Y50.602
G1 X50.601 Y116.611 E2.86842
G1 X50.695 Y115.984
G1 X115.983 Y50.696 E2.83707
G1 X115.345 Y50.801
G1 X50.802 Y115.344 E2.80468
G1 X50.916 Y114.697
G1 X114.697 Y50.916 E2.77158
G1 X114.049 Y51.03
G1 X51.03 Y114.049 E2.73848
G1 X51.145 Y113.402
G1 X113.402 Y51.144 E2.70538
G1 X112.74 Y51.273
G1 X51.27 Y112.743 E2.67117
G1 X51.406 Y112.074
G1 X112.062 Y51.417 E2.63583
G1 X111.385 Y51.561
G1 X51.554 Y111.393 E2.59998
G1 X51.713 Y110.7
G1 X110.708 Y51.705 E2.5636
G1 X110.018 Y51.862
G1 X51.873 Y110.007 E2.52665
G1 X52.033 Y109.314
G1 X109.316 Y52.031 E2.48921
G1 X108.602 Y52.211
G1 X52.212 Y108.602 E2.45042
G1 X52.397 Y107.883
G1 X107.882 Y52.398 E2.41108
G1 X107.141 Y52.605
G1 X52.606 Y107.141 E2.36983
G1 X52.82 Y106.394
G1 X106.394 Y52.82 E2.32803
G1 X105.646 Y53.035
G1 X53.034 Y105.646 E2.28623
G1 X53.26 Y104.887
G1 X104.888 Y53.259 E2.24349
G1 X104.11 Y53.504
G1 X53.505 Y104.109 E2.19902
G1 X53.772 Y103.309
G1 X103.316 Y53.765 E2.15292
G1 X102.513 Y54.034
G1 X54.052 Y102.496 E2.10588
G1 X54.332 Y101.682
G1 X101.677 Y54.338 E2.05736
G1 X100.838 Y54.643
G1 X54.629 Y100.851 E2.00798
G1 X54.948 Y100
G1 X99.999 Y54.949 E1.95769
G1 X99.121 Y55.293
G1 X55.293 Y99.121 E1.90453
G1 X55.664 Y98.217
G1 X98.217 Y55.664 E1.84916
G1 X97.291 Y56.057
G1 X56.057 Y97.291 E1.79182
G1 X56.449 Y96.365
G1 X96.364 Y56.451 E1.73448
G1 X95.395 Y56.886
G1 X56.887 Y95.394 E1.67335
G1 X57.354 Y94.394
G1 X94.383 Y57.365 E1.60907
G1 X93.342 Y57.873
G1 X57.854 Y93.36 E1.54209
G1 X58.398 Y92.284
G1 X92.288 Y58.393 E1.4727
; WIPE_START
M204 S6000
G1 X90.874 Y59.807 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X91.169 Y58.979 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X59.003 Y91.145 E1.39775
; WIPE_START
M204 S6000
G1 X60.418 Y89.731 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X59.614 Y90.001 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X89.972 Y59.643 E1.31922
; WIPE_START
M204 S6000
M73 P99 R0
G1 X88.558 Y61.057 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.763 Y60.318 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X60.318 Y88.763 E1.23608
; WIPE_START
M204 S6000
G1 X61.733 Y87.349 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X61.121 Y87.427 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X87.427 Y61.121 E1.14313
; WIPE_START
M204 S6000
G1 X86.013 Y62.535 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.047 Y61.969 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X61.969 Y86.046 E1.04629
; WIPE_START
M204 S6000
G1 X63.383 Y84.632 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X62.998 Y84.484 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X84.484 Y62.998 E.93363
; WIPE_START
M204 S6000
G1 X83.069 Y64.413 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.807 Y64.141 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X64.157 Y82.792 E.81044
; WIPE_START
M204 S6000
G1 X65.571 Y81.377 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.587 Y80.829 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X80.823 Y65.593 E.66207
; WIPE_START
M204 S6000
G1 X79.409 Y67.007 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.292 Y67.591 Z2.4 F42000
G1 Z2
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X67.635 Y78.247 E.46307
; WIPE_START
M204 S6000
G1 X69.05 Y76.833 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X73.541 Y83.004 Z2.4 F42000
G1 X158.627 Y199.901 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.209611
G1 F15000
M204 S6000
G1 X158.279 Y200.138 E.00571
; WIPE_START
G1 X158.627 Y199.901 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X160.544 Y199.05 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.192892
G1 F15000
M204 S6000
G1 X160.417 Y199.139 E.00189
; LINE_WIDTH: 0.151005
G1 X160.29 Y199.227 E.00136
; LINE_WIDTH: 0.109119
G1 X160.164 Y199.315 E.00083
; WIPE_START
G1 X160.29 Y199.227 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X162.596 Y198.066 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.195047
G1 F15000
M204 S6000
G1 X162.46 Y198.163 E.00206
; LINE_WIDTH: 0.152293
G1 X162.325 Y198.259 E.00148
; LINE_WIDTH: 0.109539
G1 X162.189 Y198.356 E.0009
; WIPE_START
G1 X162.325 Y198.259 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X164.793 Y196.935 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.197996
G1 F15000
M204 S6000
G1 X164.644 Y197.046 E.00235
; LINE_WIDTH: 0.154062
G1 X164.494 Y197.157 E.00168
; LINE_WIDTH: 0.110128
G1 X164.345 Y197.267 E.00102
; WIPE_START
G1 X164.494 Y197.157 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X166.01 Y196.401 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.183249
G1 F15000
M204 S6000
G1 X165.938 Y196.39 E.00084
; LINE_WIDTH: 0.208971
G1 X165.865 Y196.379 E.00099
; LINE_WIDTH: 0.199567
G1 X165.738 Y196.474 E.00202
; LINE_WIDTH: 0.155005
G1 X165.611 Y196.568 E.00145
; LINE_WIDTH: 0.110442
G1 X165.484 Y196.662 E.00087
; WIPE_START
G1 X165.611 Y196.568 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X167.174 Y195.623 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.201574
G1 F15000
M204 S6000
G1 X167.01 Y195.748 E.00267
; LINE_WIDTH: 0.156209
G1 X166.845 Y195.874 E.00191
; LINE_WIDTH: 0.110844
G1 X166.68 Y195.999 E.00114
; WIPE_START
G1 X166.845 Y195.874 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X168.511 Y194.819 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.202419
G1 F15000
M204 S6000
G1 X168.333 Y194.958 E.00294
; LINE_WIDTH: 0.156716
G1 X168.155 Y195.097 E.00209
; LINE_WIDTH: 0.111013
G1 X167.977 Y195.236 E.00125
; WIPE_START
G1 X168.155 Y195.097 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X169.892 Y193.971 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.210558
G1 F15000
M204 S6000
G1 X169.744 Y194.09 E.0026
; LINE_WIDTH: 0.175867
G1 X169.596 Y194.209 E.00206
; LINE_WIDTH: 0.141176
G1 X169.447 Y194.328 E.00152
; LINE_WIDTH: 0.106006
G1 X169.314 Y194.432 E.00087
; WIPE_START
G1 X169.447 Y194.328 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X171.455 Y192.941 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.206818
G1 F15000
M204 S6000
G1 X171.234 Y193.124 E.00383
; LINE_WIDTH: 0.159361
G1 X171.013 Y193.306 E.00272
; LINE_WIDTH: 0.111904
G1 X170.792 Y193.488 E.00161
; WIPE_START
G1 X171.013 Y193.306 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X173.133 Y191.797 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.209905
G1 F15000
M204 S6000
G1 X172.844 Y192.042 E.00516
; LINE_WIDTH: 0.161948
G1 X172.637 Y192.213 E.0026
; LINE_WIDTH: 0.112766
G1 X172.43 Y192.383 E.00152
; WIPE_START
G1 X172.637 Y192.213 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X175.165 Y190.299 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.211279
G1 F15000
M204 S6000
G1 X174.868 Y190.557 E.0054
; LINE_WIDTH: 0.162037
G1 X174.571 Y190.815 E.00382
; LINE_WIDTH: 0.112796
G1 X174.275 Y191.073 E.00224
; WIPE_START
G1 X174.571 Y190.815 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X177.692 Y188.305 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.220542
G1 F15000
M204 S6000
G1 X177.401 Y188.567 E.00567
; LINE_WIDTH: 0.182723
G1 X177.11 Y188.829 E.00446
; LINE_WIDTH: 0.144904
G1 X176.819 Y189.091 E.00325
; LINE_WIDTH: 0.107085
G1 X176.528 Y189.353 E.00205
; WIPE_START
G1 X176.819 Y189.091 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X182.357 Y183.839 Z2.4 F42000
G1 X186.6 Y179.816 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.112007
G1 F15000
M204 S6000
G1 X186.118 Y180.332 E.00397
; LINE_WIDTH: 0.150707
G1 X185.647 Y180.824 E.00599
; LINE_WIDTH: 0.180454
G1 X185.175 Y181.317 E.00764
; LINE_WIDTH: 0.225088
G3 X182.294 Y184.224 I-112.438 J-108.58 E.06076
; LINE_WIDTH: 0.207199
G1 X181.312 Y185.172 E.01827
; LINE_WIDTH: 0.159576
G1 X180.33 Y186.12 E.01297
; LINE_WIDTH: 0.111955
G1 X179.747 Y186.669 E.00451
; WIPE_START
G1 X180.33 Y186.12 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X185.56 Y180.56 Z2.4 F42000
G1 X189.334 Y176.548 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.105452
G1 F15000
M204 S6000
G1 X189.141 Y176.765 E.00148
; LINE_WIDTH: 0.140015
G1 X188.948 Y176.983 E.0023
; LINE_WIDTH: 0.174578
G1 X188.756 Y177.201 E.00312
; LINE_WIDTH: 0.216103
G1 X188.35 Y177.648 E.00852
; WIPE_START
G1 X188.756 Y177.201 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X191.087 Y174.261 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.112866
G1 F15000
M204 S6000
G1 X190.864 Y174.519 E.00194
; LINE_WIDTH: 0.162267
G1 X190.642 Y174.777 E.00331
; LINE_WIDTH: 0.211669
G1 X190.419 Y175.035 E.00469
; LINE_WIDTH: 0.237012
G1 X190.347 Y175.116 E.00171
; WIPE_START
G1 X190.419 Y175.035 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X192.371 Y172.443 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.112195
G1 F15000
M204 S6000
G1 X192.169 Y172.684 E.00178
; LINE_WIDTH: 0.160247
G1 X191.966 Y172.925 E.00301
; LINE_WIDTH: 0.2083
G1 X191.764 Y173.166 E.00424
; WIPE_START
G1 X191.966 Y172.925 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X193.496 Y170.784 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.11176
G1 F15000
M204 S6000
G1 X193.322 Y170.997 E.00154
; LINE_WIDTH: 0.158929
G1 X193.149 Y171.209 E.00259
; LINE_WIDTH: 0.206097
G1 X192.975 Y171.422 E.00365
; WIPE_START
G1 X193.149 Y171.209 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X194.403 Y169.344 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.111311
G1 F15000
M204 S6000
G1 X194.252 Y169.534 E.00135
; LINE_WIDTH: 0.157595
G1 X194.1 Y169.724 E.00227
; LINE_WIDTH: 0.203879
G1 X193.949 Y169.914 E.00319
; WIPE_START
G1 X194.1 Y169.724 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X195.26 Y167.953 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.111806
G1 F15000
M204 S6000
G1 X195.139 Y168.11 E.00111
; LINE_WIDTH: 0.159079
G1 X195.017 Y168.267 E.00188
; LINE_WIDTH: 0.20488
G1 X194.838 Y168.492 E.0038
; WIPE_START
G1 X195.017 Y168.267 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X195.99 Y166.689 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.110039
G1 F15000
M204 S6000
G1 X195.891 Y166.821 E.0009
; LINE_WIDTH: 0.153782
G1 X195.792 Y166.952 E.00149
; LINE_WIDTH: 0.207346
G3 X195.624 Y167.172 I-8.369 J-6.203 E.0037
; WIPE_START
G1 X195.792 Y166.952 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X196.653 Y165.493 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.110428
G1 F15000
M204 S6000
G1 X196.534 Y165.651 E.00109
; LINE_WIDTH: 0.154949
G1 X196.415 Y165.808 E.0018
; LINE_WIDTH: 0.199471
G1 X196.296 Y165.966 E.00252
; WIPE_START
G1 X196.415 Y165.808 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X197.832 Y163.247 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.109836
G1 F15000
M204 S6000
G1 X197.729 Y163.389 E.00096
; LINE_WIDTH: 0.15318
G1 X197.626 Y163.531 E.00158
; LINE_WIDTH: 0.196524
G1 X197.522 Y163.673 E.0022
; WIPE_START
G1 X197.626 Y163.531 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X198.865 Y161.147 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.109398
G1 F15000
M204 S6000
G1 X198.771 Y161.279 E.00088
; LINE_WIDTH: 0.151854
G1 X198.678 Y161.412 E.00144
; LINE_WIDTH: 0.194309
G1 X198.584 Y161.544 E.002
; WIPE_START
G1 X198.678 Y161.412 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X199.727 Y159.218 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.108951
G1 F15000
M204 S6000
G1 X199.641 Y159.342 E.00081
; LINE_WIDTH: 0.150522
G1 X199.556 Y159.466 E.00132
; LINE_WIDTH: 0.192092
G1 X199.471 Y159.59 E.00183
; WIPE_START
G1 X199.556 Y159.466 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X201.529 Y152.093 Z2.4 F42000
G1 X205.829 Y136.026 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.178647
G1 F15000
M204 S6000
G1 X205.709 Y136.277 E.00307
; WIPE_START
G1 X205.829 Y136.026 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X199.727 Y131.441 Z2.4 F42000
G1 X98.636 Y55.485 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.108659
G1 F15000
M204 S6000
G1 X98.517 Y55.566 E.00077
; LINE_WIDTH: 0.149627
G1 X98.398 Y55.646 E.00125
; LINE_WIDTH: 0.190595
G1 X98.279 Y55.726 E.00173
; WIPE_START
G1 X98.398 Y55.646 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.783 Y56.272 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.10866
G1 F15000
M204 S6000
G1 X96.664 Y56.352 E.00077
; LINE_WIDTH: 0.14963
G1 X96.545 Y56.433 E.00125
; LINE_WIDTH: 0.190601
G1 X96.426 Y56.513 E.00173
; WIPE_START
G1 X96.545 Y56.433 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.851 Y57.137 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.109539
G1 F15000
M204 S6000
G1 X94.715 Y57.234 E.0009
; LINE_WIDTH: 0.152293
G1 X94.58 Y57.33 E.00148
; LINE_WIDTH: 0.195048
G1 X94.444 Y57.427 E.00206
; WIPE_START
G1 X94.58 Y57.33 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.769 Y58.153 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.112912
G1 F15000
M204 S6000
G1 X92.637 Y58.246 E.00092
; LINE_WIDTH: 0.162412
G1 X92.506 Y58.34 E.00157
; LINE_WIDTH: 0.203121
G1 X92.35 Y58.455 E.00253
M204 S10000
G1 X91.675 Y58.713 F42000
; LINE_WIDTH: 0.110286
G1 F15000
M204 S6000
G1 X91.551 Y58.804 E.00084
; LINE_WIDTH: 0.154536
G1 X91.428 Y58.894 E.00139
; LINE_WIDTH: 0.207316
G2 X91.23 Y59.041 I5.005 J6.956 E.0033
M204 S10000
G1 X90.507 Y59.347 F42000
; LINE_WIDTH: 0.110419
G1 F15000
M204 S6000
G1 X90.349 Y59.466 E.00109
; LINE_WIDTH: 0.154933
G1 X90.191 Y59.585 E.0018
; LINE_WIDTH: 0.199448
G1 X90.034 Y59.704 E.00252
M204 S10000
G1 X89.31 Y60.01 F42000
; LINE_WIDTH: 0.109965
G1 F15000
M204 S6000
G1 X89.179 Y60.109 E.0009
; LINE_WIDTH: 0.153572
G1 X89.048 Y60.208 E.00148
; LINE_WIDTH: 0.207587
G2 X88.824 Y60.379 I4.701 J6.376 E.00378
M204 S10000
G1 X88.022 Y60.765 F42000
; LINE_WIDTH: 0.111005
G1 F15000
M204 S6000
G1 X87.844 Y60.904 E.00125
; LINE_WIDTH: 0.156693
G1 X87.666 Y61.043 E.00209
; LINE_WIDTH: 0.20238
G1 X87.488 Y61.182 E.00293
M204 S10000
G1 X86.686 Y61.568 F42000
; LINE_WIDTH: 0.105898
G1 F15000
M204 S6000
G1 X86.553 Y61.672 E.00086
; LINE_WIDTH: 0.141019
G1 X86.405 Y61.791 E.00152
; LINE_WIDTH: 0.17577
G1 X86.256 Y61.91 E.00206
; LINE_WIDTH: 0.210521
G1 X86.107 Y62.029 E.0026
; WIPE_START
G1 X86.256 Y61.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.207 Y62.512 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.111904
G1 F15000
M204 S6000
G1 X84.986 Y62.694 E.00161
; LINE_WIDTH: 0.159362
G1 X84.765 Y62.877 E.00272
; LINE_WIDTH: 0.206819
G1 X84.544 Y63.059 E.00383
; WIPE_START
G1 X84.765 Y62.877 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.569 Y63.617 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.112748
G1 F15000
M204 S6000
G1 X83.363 Y63.787 E.00152
; LINE_WIDTH: 0.161894
G1 X83.156 Y63.958 E.0026
; LINE_WIDTH: 0.209854
G1 X82.868 Y64.202 E.00514
; WIPE_START
G1 X83.156 Y63.958 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.739 Y64.914 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.11285
G1 F15000
M204 S6000
G1 X81.481 Y65.136 E.00194
; LINE_WIDTH: 0.162229
G1 X81.222 Y65.358 E.00331
; LINE_WIDTH: 0.211607
G1 X80.964 Y65.581 E.00468
; LINE_WIDTH: 0.236976
G1 X80.883 Y65.653 E.00172
; WIPE_START
G1 X80.964 Y65.581 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.452 Y66.667 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.105435
G1 F15000
M204 S6000
G1 X79.234 Y66.859 E.00148
; LINE_WIDTH: 0.139954
G1 X79.017 Y67.051 E.00229
; LINE_WIDTH: 0.174472
G1 X78.8 Y67.244 E.00311
; LINE_WIDTH: 0.216018
G1 X78.352 Y67.651 E.00854
; WIPE_START
G1 X78.8 Y67.244 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.189 Y69.396 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.106014
G1 F15000
M204 S6000
G1 X75.686 Y69.872 E.00356
; LINE_WIDTH: 0.14172
G1 X75.184 Y70.349 E.00557
; LINE_WIDTH: 0.177426
G1 X74.682 Y70.826 E.00759
; LINE_WIDTH: 0.222015
G2 X70.825 Y74.683 I145.621 J149.477 E.07961
; LINE_WIDTH: 0.180358
G1 X70.353 Y75.176 E.00764
; LINE_WIDTH: 0.150619
G1 X69.882 Y75.668 E.00598
; LINE_WIDTH: 0.11195
G1 X69.401 Y76.183 E.00396
; WIPE_START
G1 X69.882 Y75.668 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X67.695 Y78.307 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.220529
G1 F15000
M204 S6000
G1 X67.433 Y78.598 E.00567
; LINE_WIDTH: 0.182709
G1 X67.171 Y78.889 E.00446
; LINE_WIDTH: 0.144889
G1 X66.909 Y79.18 E.00325
; LINE_WIDTH: 0.107069
G1 X66.647 Y79.471 E.00205
; WIPE_START
G1 X66.909 Y79.18 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.647 Y80.889 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.236693
G1 F15000
M204 S6000
G1 X65.582 Y80.963 E.00155
; LINE_WIDTH: 0.211884
G1 X65.373 Y81.208 E.00445
; LINE_WIDTH: 0.162401
G1 X65.163 Y81.454 E.00314
; LINE_WIDTH: 0.112918
G1 X64.953 Y81.699 E.00184
; WIPE_START
G1 X65.163 Y81.454 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X64.217 Y82.852 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.21019
G1 F15000
M204 S6000
G1 X63.957 Y83.157 E.00546
; LINE_WIDTH: 0.161762
G1 X63.787 Y83.363 E.00259
; LINE_WIDTH: 0.112699
G1 X63.617 Y83.569 E.00152
; WIPE_START
G1 X63.787 Y83.363 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X63.059 Y84.544 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.206826
G1 F15000
M204 S6000
G1 X62.877 Y84.765 E.00383
; LINE_WIDTH: 0.159363
G1 X62.694 Y84.986 E.00272
; LINE_WIDTH: 0.111899
G1 X62.512 Y85.207 E.00161
; WIPE_START
G1 X62.694 Y84.986 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X62.03 Y86.107 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.210528
G1 F15000
M204 S6000
G1 X61.91 Y86.256 E.0026
; LINE_WIDTH: 0.17576
G1 X61.791 Y86.405 E.00206
; LINE_WIDTH: 0.140992
G1 X61.671 Y86.553 E.00152
; LINE_WIDTH: 0.105884
G1 X61.568 Y86.686 E.00086
M204 S10000
G1 X61.182 Y87.488 F42000
; LINE_WIDTH: 0.202416
G1 F15000
M204 S6000
G1 X61.043 Y87.666 E.00293
; LINE_WIDTH: 0.156718
G1 X60.904 Y87.844 E.00209
; LINE_WIDTH: 0.11102
G1 X60.765 Y88.022 E.00125
M204 S10000
G1 X60.379 Y88.824 F42000
; LINE_WIDTH: 0.221936
G1 F15000
M204 S6000
G1 X60.306 Y88.918 E.00174
; LINE_WIDTH: 0.196869
G1 X60.204 Y89.052 E.00212
; LINE_WIDTH: 0.153391
G1 X60.102 Y89.187 E.00152
; LINE_WIDTH: 0.109913
G1 X59.999 Y89.321 E.00092
M204 S10000
G1 X59.599 Y89.989 F42000
; LINE_WIDTH: 0.183326
G1 F15000
M204 S6000
G1 X59.61 Y90.062 E.00084
; LINE_WIDTH: 0.208974
G1 X59.621 Y90.134 E.00099
; LINE_WIDTH: 0.19953
G1 X59.527 Y90.262 E.00202
; LINE_WIDTH: 0.154987
G1 X59.432 Y90.389 E.00144
; LINE_WIDTH: 0.110445
G1 X59.338 Y90.516 E.00087
M204 S10000
G1 X59.065 Y91.206 F42000
; LINE_WIDTH: 0.197987
G1 F15000
M204 S6000
G1 X58.954 Y91.356 E.00235
; LINE_WIDTH: 0.154061
G1 X58.843 Y91.505 E.00168
; LINE_WIDTH: 0.110136
G1 X58.733 Y91.655 E.00102
; WIPE_START
G1 X58.843 Y91.505 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X57.916 Y93.422 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.195402
G1 F15000
M204 S6000
G1 X57.811 Y93.568 E.00224
; LINE_WIDTH: 0.151629
G1 X57.705 Y93.715 E.0016
; LINE_WIDTH: 0.108959
G1 X57.621 Y93.833 E.00078
; WIPE_START
G1 X57.705 Y93.715 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X56.949 Y95.456 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.192754
G1 F15000
M204 S6000
G1 X56.862 Y95.582 E.00188
; LINE_WIDTH: 0.150917
G1 X56.774 Y95.709 E.00135
; LINE_WIDTH: 0.109081
G1 X56.686 Y95.835 E.00083
; WIPE_START
G1 X56.774 Y95.709 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X56.119 Y97.354 Z2.4 F42000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.190594
G1 F15000
M204 S6000
G1 X56.039 Y97.472 E.00173
; LINE_WIDTH: 0.149624
G1 X55.958 Y97.591 E.00125
; LINE_WIDTH: 0.108654
G1 X55.878 Y97.71 E.00077
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X55.958 Y97.591 E-.76
; WIPE_END
G1 E-.04 F1800
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20231229 =====================
G392 S0 ;turn off nozzle clog detect

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z2.5 F900 ; lower z a little
G1 X0 Y128 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X267 F15000
T255
G1 X-28.5 F18000
G1 X-48.2 F3000
G1 X-28.5 F18000
G1 X-48.2 F3000
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z102 F600
    G1 Z100

M400 P100
M17 R ; restore z current

G90
G1 X-48 Y180 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M40 E42 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C46 D10 M80 E46 F10 N80
M1006 A44 B20 L100 C39 D20 M60 E48 F20 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C44 D10 M60 E44 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C39 D10 M60 E39 F10 N60
M1006 A0 B10 L100 C0 D10 M60 E0 F10 N60
M1006 A0 B10 L100 C48 D10 M60 E44 F10 N80
M1006 A0 B10 L100 C0 D10 M60 E0 F10  N80
M1006 A44 B20 L100 C49 D20 M80 E41 F20 N80
M1006 A0 B20 L100 C0 D20 M60 E0 F20 N80
M1006 A0 B20 L100 C37 D20 M30 E37 F20 N60
M1006 W
;=====printer finish  sound=========

;M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M400
M18 X Y Z

M73 P100 R0
; EXECUTABLE_BLOCK_END

