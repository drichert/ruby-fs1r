module Fs1r
  class Performance < Base
    def parameter_change(params)
      super(
        :pah => 0x10,
        :pam => 0x00,
        :pal => params[:pal],
        :dvm => params[:dvm],
        :dvl => params[:dvl]
      )
    end

    def name_0; end
    def name_1; end
    def name_2; end
    def name_3; end
    def name_4; end
    def name_5; end
    def name_6; end
    def name_7; end
    def name_8; end
    def name_9; end
    def name_10; end
    def name_11; end

    def category; end
    def volume; end
    def pan; end
    def note_shift; end
    def individual_out; end
    def fseq_part; end
    def fseq_bank; end
    def fseq_number; end
    def fseq_speed; end
    def midi_clock; end

    def fseq_start_step_offset_hi; end
    def fseq_start_step_offset_lo; end

    def fseq_start_step_of_loop_point_hi; end
    def fseq_start_step_of_loop_point_lo; end

    def fseq_end_step_of_loop_point_hi; end
    def fseq_end_step_of_loop_point_lo; end

    def fseq_loop_mode; end
    def fseq_play_mode; end
    def fseq_velocity_sensitivity_for_tempo; end
    def fseq_formant_pitch_mode; end
    def fseq_key_on_trigger; end
    def fseq_formant_sequence_delay; end
    def fseq_level_level_velocity_sensitivity; end

    def controller_1_part_switch; end
    def controller_2_part_switch; end
    def controller_3_part_switch; end
    def controller_4_part_switch; end
    def controller_5_part_switch; end
    def controller_6_part_switch; end
    def controller_7_part_switch; end
    def controller_8_part_switch; end

    def controller_1_source_switch_hi; end
    def controller_1_source_switch_lo; end
    def controller_2_source_switch_hi; end
    def controller_2_source_switch_lo; end
    def controller_3_source_switch_hi; end
    def controller_3_source_switch_lo; end
    def controller_4_source_switch_hi; end
    def controller_4_source_switch_lo; end
    def controller_5_source_switch_hi; end
    def controller_5_source_switch_lo; end
    def controller_6_source_switch_hi; end
    def controller_6_source_switch_lo; end
    def controller_7_source_switch_hi; end
    def controller_7_source_switch_lo; end
    def controller_8_source_switch_hi; end
    def controller_8_source_switch_lo; end

    def controller_1_destination; end
    def controller_2_destination; end
    def controller_3_destination; end
    def controller_4_destination; end
    def controller_5_destination; end
    def controller_6_destination; end
    def controller_7_destination; end
    def controller_8_destination; end

    def controller_1_depth; end
    def controller_2_depth; end
    def controller_3_depth; end
    def controller_4_depth; end
    def controller_5_depth; end
    def controller_6_depth; end
    def controller_7_depth; end
    def controller_8_depth; end
  end

end
