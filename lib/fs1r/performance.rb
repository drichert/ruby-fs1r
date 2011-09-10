module Fs1r
  module Performance

    # Fs1r::Performance::Common
    class Common < Fs1r::Base

      meth_seq({
        'name_n' => {
          :num_methods     => 12,      # number of methods to generate
          :name_num_start  => 0,       # method name index
          :param_num_start => 0x00,    # parameter number start point
          :val_range       => 32..127  # input value range
        },
        'controller_n_part_switch' => {
          :num_methods     => 8,
          :param_num_start => 0x28,
          :val_range       => 0..15
        },
        'controller_n_source_switch_hi' => {
          :num_methods     => 8,
          :param_num_start => 0x30,
          :param_num_step  => 2,
          :val_range       => 0..127
        },
        'controller_n_source_switch_lo' => {
          :num_methods     => 8,
          :param_num_start => 0x31,
          :param_num_step  => 2,
          :val_range       => 0..127
        },
        'controller_n_destination' => {
          :num_methods     => 8,
          :param_num_start => 0x40,
          :val_range       => 0..47
        },
        'controler_n_depth' => {
          :num_methods     => 8,
          :param_num_start => 0x48,
          :val_range       => 0..127
        }
      })

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
      # 5-127: (10.0 - 500.0)
      def fseq_speed_ratio(v)
        tx 0x18, *byte_pair(v)
      end

      # 0..4
      # 0: 1/4
      # 1: 1/2
      # 2: 1/1
      # 3: 2/1
      # 4: 4/1
      def midi_clock(v)
        tx 0x19, *byte_pair(v)
      end

      # 0..127
      def fseq_start_step_offset_hi(v)
        tx 0x1A, *byte_pair(v)
      end

      # 0..127
      def fseq_start_step_offset_lo(v)
        tx 0x1B, *byte_pair(v)
      end

      # 0..127
      def fseq_start_step_of_loop_point_hi(v)
        tx 0x1C, *byte_pair(v)
      end

      # 0..127
      def fseq_start_step_of_loop_point_lo(v)
        tx 0x1D, *byte_pair(v)
      end

      # 0..127
      def fseq_end_step_of_loop_point_hi(v)
        tx 0x1E, *byte_pair(v)
      end

      # 0..127
      def fseq_end_step_of_loop_point_lo(v)
        tx 0x1F, *byte_pair(v)
      end

      # 0..1
      # 0: one way
      # 1: round
      def fseq_loop_mode(v)
        tx 0x20, *byte_pair(v)
      end

      # 1..2
      # 1: scratch
      # 2: fseq
      def fseq_play_mode(v)
        tx 0x21, *byte_pair(v)
      end

      # 0..7
      def fseq_velocity_sensitivity_for_tempo(v)
        tx 0x22, *byte_pair(v)
      end

      # 0..1
      def fseq_formant_pitch_mode(v)
        tx 0x23, *byte_pair(v)
      end

      # 0..1
      # 0: first
      # 1: all
      def fseq_key_on_trigger(v)
        tx 0x24, *byte_pair(v)
      end

      # 0..99
      def fseq_formant_sequence_delay(v)
        tx 0x26, *byte_pair(v)
      end

      # 0..127
      # -64 - +63
      def fseq_level_level_velocity_sensitivity
        tx 0x27, *byte_pair(v)
      end

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
    class Effect < Fs1r::Base

      meth_seq({
        'reverb_parameter_n' => {
          :num_methods     => 24,
          :param_num_start => 0x50
        },
        'variation_parameter_n' => {
          :num_methods     => 24,
          :param_num_start => 68
        }
      })


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

      private
        def parameter_change(params)
          super(
            :pah => 0x10,
            :pam => params[:pam],
            :pal => params[:pal],
            :dvm => params[:dvm],
            :dvl => params[:dvl]
          )
        end
        alias :tx, :parameter_change
    end

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
