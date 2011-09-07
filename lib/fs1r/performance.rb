module Fs1r
  module Performance

    # Fs1r::Performance::Common
    class Common < Fs1r::Base

      {
        'name_n' => {
          :num_methods => 11,
          :start_ndx   => 0,
          :val_range   => 32..127
        },
        'controller_n_part_switch' => {
          :num_methods => 8,
          :start_ndx   => 1,
          :val_range   => 0..15
        },
        'controller_n_source_switch_hi' => {
          :num_methods => 8,
          :start_ndx   => 1,
          :val_range   => 0..127
        },
        'controller_n_source_switch_lo' => {
          :num_methods => 8,
          :start_ndx   => 1,
          :val_range   => 0..127
        },
        'controller_n_destination' => {
          :num_methods => 8,
          :start_ndx   => 1,
          :val_range   => 0..47
        },
        'controler_n_depth' => {
          :num_methods => 8,
          :start_ndx   => 1,
          :val_range   => 0..127
        }
      }.each {|meth, params|
        (params[:num_methods] + params[:start_ndx]).times {|n|
          if n >= params[:start_ndx]
            define_method(meth.gsub(/_n(_|$)/, "_#{n}\\1").to_sym) {|v|
              tx n, *byte_pair(v)
            }
          end
        }
      }

      # 0..22
      def category(v)
        tx 0x0E, *byte_pair(v)
      end

      # 0..127
      def volume
        tx 0x10, *byte_pair(v)
      end

      # 1..127
      # c 64
      def pan(v)
        tx 0x11, *byte_pair(v)
      end

      # 0..48
      # 0:  -24
      # 24: unshifted (?)
      # 48: +24
      def note_shift(v)
        tx 0x12, *byte_pair(v)
      end

      # 0..2
      # 0: off
      # 1: pre ins
      # 2: post ins
      def individual_out(v)
        tx 0x14, *byte_pair(v)
      end

      # 0..4
      # 0: off
      # 1-4: part
      def fseq_part(v)
        tx 0x15, *byte_pair(v)
      end

      # 0..1
      # 0: int
      # 1: pre
      def fseq_bank(v)
        tx 0x16, *byte_pair(v)
      end

      # 0..89
      # 0-5: int
      # 6-89: pre
      def fseq_number(v)
        tx 0x17, *byte_pair(v)
      end

      # 0..127
      # 0-4: MIDI Clock
      #   0: 1/4
      #   1: 1/2
      #   2: 1/1
      #   3: 2/1
      #   4: 4/1
      # 5-127: (10.0 - 500.0)
      def fseq_speed_ratio(v)
        tx 0x18, *byte_pair(v)
      end

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


      private
        def tx(pal, dvm, dvl)
          super(
            :pah => 0x10,
            :pam => 0x00,
            :pal => pal,
            :dvm => dvm,
            :dvl => dvl
          )
        end
    end

    # Fs1r::Performance::Effect
    # class Effect < Fs1r::Base

    #   def reverb_parameter_1; end
    #   def reverb_parameter_2; end
    #   def reverb_parameter_3; end
    #   def reverb_parameter_4; end
    #   def reverb_parameter_5; end
    #   def reverb_parameter_6; end
    #   def reverb_parameter_7; end
    #   def reverb_parameter_8; end
    #   def reverb_parameter_9; end
    #   def reverb_parameter_10; end
    #   def reverb_parameter_11; end
    #   def reverb_parameter_12; end
    #   def reverb_parameter_13; end
    #   def reverb_parameter_14; end
    #   def reverb_parameter_15; end
    #   def reverb_parameter_16; end
    #   def reverb_parameter_17; end
    #   def reverb_parameter_18; end
    #   def reverb_parameter_19; end
    #   def reverb_parameter_20; end
    #   def reverb_parameter_21; end
    #   def reverb_parameter_22; end
    #   def reverb_parameter_23; end
    #   def reverb_parameter_24; end

    #   def variation_parameter_1; end
    #   def variation_parameter_2; end
    #   def variation_parameter_3; end
    #   def variation_parameter_4; end
    #   def variation_parameter_5; end
    #   def variation_parameter_6; end
    #   def variation_parameter_7; end
    #   def variation_parameter_8; end
    #   def variation_parameter_9; end
    #   def variation_parameter_10; end
    #   def variation_parameter_11; end
    #   def variation_parameter_12; end
    #   def variation_parameter_13; end
    #   def variation_parameter_14; end
    #   def variation_parameter_15; end
    #   def variation_parameter_16; end
    #   def variation_parameter_17; end
    #   def variation_parameter_18; end
    #   def variation_parameter_19; end
    #   def variation_parameter_20; end
    #   def variation_parameter_21; end
    #   def variation_parameter_22; end
    #   def variation_parameter_23; end
    #   def variation_parameter_24; end
    #   def variation_parameter_25; end
    #   def variation_parameter_26; end
    #   def variation_parameter_27; end
    #   def variation_parameter_28; end
    #   def variation_parameter_29; end
    #   def variation_parameter_30; end
    #   def variation_parameter_31; end
    #   def variation_parameter_32; end

    #   def insertion_parameter_1; end
    #   def insertion_parameter_2; end
    #   def insertion_parameter_3; end
    #   def insertion_parameter_4; end
    #   def insertion_parameter_5; end
    #   def insertion_parameter_6; end
    #   def insertion_parameter_7; end
    #   def insertion_parameter_8; end
    #   def insertion_parameter_9; end
    #   def insertion_parameter_10; end
    #   def insertion_parameter_11; end
    #   def insertion_parameter_12; end
    #   def insertion_parameter_13; end
    #   def insertion_parameter_14; end
    #   def insertion_parameter_15; end
    #   def insertion_parameter_16; end
    #   def insertion_parameter_17; end
    #   def insertion_parameter_18; end
    #   def insertion_parameter_19; end
    #   def insertion_parameter_20; end
    #   def insertion_parameter_21; end
    #   def insertion_parameter_22; end
    #   def insertion_parameter_23; end
    #   def insertion_parameter_24; end
    #   def insertion_parameter_25; end
    #   def insertion_parameter_26; end
    #   def insertion_parameter_27; end
    #   def insertion_parameter_28; end
    #   def insertion_parameter_29; end
    #   def insertion_parameter_30; end
    #   def insertion_parameter_31; end
    #   def insertion_parameter_32; end

    #   private
    #     def parameter_change(params)
    #       super(
    #         :pah => 0x10,
    #         :pam => params[:pam],
    #         :pal => params[:pal],
    #         :dvm => params[:dvm],
    #         :dvl => params[:dvl]
    #       )
    #     end
    #     alias :tx, :parameter_change
    # end

    # # Fs1r::Performance::Part
    # class Part < Fs1r::Base
    #   def note_reserve; end
    #   def bank_number; end
    #   def program_number; end
    #   def rcv_channel_max; end
    #   def rcv_channel; end
    #   def mono_poly_mode; end
    #   def mono_priority; end
    #   def filter_sw; end
    #   def note_shift; end
    #   def detune; end
    #   def voiced_unvoiced_balance; end
    #   def volume; end
    #   def velocity_sense_depth; end
    #   def velocity_sense_offset; end
    #   def pan; end
    #   def note_limit_low; end
    #   def note_limit_high; end
    #   def dry_level; end
    #   def variation_send; end
    #   def reverb_send; end
    #   def insertion_sw; end
    #   def lfo1_rate; end
    #   def lfo1_pitch_mod_depth; end
    #   def lfo1_delay; end
    #   def filter_cutoff_freq; end
    #   def filter_resonance; end
    #   def eg_attack_time; end
    #   def eg_decay_time; end
    #   def eg_release_time; end
    #   def formant; end
    #   def fm; end
    #   def filter_eg_depth; end
    #   def pitch_eg_initial_level; end
    #   def pitch_eg_attack_time; end
    #   def pitch_eg_release_level; end
    #   def pitch_eg_release_time; end
    #   def portamento_switch_mode; end
    #   def portamento_time; end
    #   def pitch_bend_range_high; end
    #   def pitch_bend_range_low; end
    #   def pan_scaling; end
    #   def pan_lfo_depth; end
    #   def velocity_limit_low; end
    #   def velocity_limit_high; end
    #   def expression_low_limit; end
    #   def sustain_rcv_sw; end
    #   def lfo2_rate; end
    #   def lfo2_mod_depth; end

    #   private
    #     def parameter_change(params)
    #       # required params - :pal, :dvm, :dvl

    #       super(
    #         # :part should be 0..3
    #         :pah => "3#{params[:part]}".hex
    #         :pam => 0x00,
    #         :pal => params[:pal],
    #         :dvm => params[:dvm],
    #         :dvl => params[:dvl]
    #       )
    #     end
    #     alias :tx, :parameter_change
    # end
  end

end
