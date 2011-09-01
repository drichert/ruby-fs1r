module Fs1r
  module Performance
    class Common < Fs1r::Base
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

    class Effect < Fs1r::Base
      def parameter_change(params)
        super(
          :pah => 0x10,
          :pam => params[:pam],
          :pal => params[:pal],
          :dvm => params[:dvm],
          :dvl => params[:dvl]
        )
      end

      def reverb_parameter_1; end
      def reverb_parameter_2; end
      def reverb_parameter_3; end
      def reverb_parameter_4; end
      def reverb_parameter_5; end
      def reverb_parameter_6; end
      def reverb_parameter_7; end
      def reverb_parameter_8; end
      def reverb_parameter_9; end
      def reverb_parameter_10; end
      def reverb_parameter_11; end
      def reverb_parameter_12; end
      def reverb_parameter_13; end
      def reverb_parameter_14; end
      def reverb_parameter_15; end
      def reverb_parameter_16; end
      def reverb_parameter_17; end
      def reverb_parameter_18; end
      def reverb_parameter_19; end
      def reverb_parameter_20; end
      def reverb_parameter_21; end
      def reverb_parameter_22; end
      def reverb_parameter_23; end
      def reverb_parameter_24; end

      def variation_parameter_1; end
      def variation_parameter_2; end
      def variation_parameter_3; end
      def variation_parameter_4; end
      def variation_parameter_5; end
      def variation_parameter_6; end
      def variation_parameter_7; end
      def variation_parameter_8; end
      def variation_parameter_9; end
      def variation_parameter_10; end
      def variation_parameter_11; end
      def variation_parameter_12; end
      def variation_parameter_13; end
      def variation_parameter_14; end
      def variation_parameter_15; end
      def variation_parameter_16; end
      def variation_parameter_17; end
      def variation_parameter_18; end
      def variation_parameter_19; end
      def variation_parameter_20; end
      def variation_parameter_21; end
      def variation_parameter_22; end
      def variation_parameter_23; end
      def variation_parameter_24; end
      def variation_parameter_25; end
      def variation_parameter_26; end
      def variation_parameter_27; end
      def variation_parameter_28; end
      def variation_parameter_29; end
      def variation_parameter_30; end
      def variation_parameter_31; end
      def variation_parameter_32; end

      def insertion_parameter_1; end
      def insertion_parameter_2; end
      def insertion_parameter_3; end
      def insertion_parameter_4; end
      def insertion_parameter_5; end
      def insertion_parameter_6; end
      def insertion_parameter_7; end
      def insertion_parameter_8; end
      def insertion_parameter_9; end
      def insertion_parameter_10; end
      def insertion_parameter_11; end
      def insertion_parameter_12; end
      def insertion_parameter_13; end
      def insertion_parameter_14; end
      def insertion_parameter_15; end
      def insertion_parameter_16; end
      def insertion_parameter_17; end
      def insertion_parameter_18; end
      def insertion_parameter_19; end
      def insertion_parameter_20; end
      def insertion_parameter_21; end
      def insertion_parameter_22; end
      def insertion_parameter_23; end
      def insertion_parameter_24; end
      def insertion_parameter_25; end
      def insertion_parameter_26; end
      def insertion_parameter_27; end
      def insertion_parameter_28; end
      def insertion_parameter_29; end
      def insertion_parameter_30; end
      def insertion_parameter_31; end
      def insertion_parameter_32; end

    end
  end

end
