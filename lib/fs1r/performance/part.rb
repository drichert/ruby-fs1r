module Fs1r
  module Performance
    class Part < Fs1r::Base
      def note_reserve; end
      def bank_number; end
      def program_number; end
      def rcv_channel_max; end
      def rcv_channel; end
      def mono_poly_mode; end
      def mono_priority; end
      def filter_sw; end
      def note_shift; end
      def detune; end
      def voiced_unvoiced_balance; end
      def volume; end
      def velocity_sense_depth; end
      def velocity_sense_offset; end
      def pan; end
      def note_limit_low; end
      def note_limit_high; end
      def dry_level; end
      def variation_send; end
      def reverb_send; end
      def insertion_sw; end
      def lfo1_rate; end
      def lfo1_pitch_mod_depth; end
      def lfo1_delay; end
      def filter_cutoff_freq; end
      def filter_resonance; end
      def eg_attack_time; end
      def eg_decay_time; end
      def eg_release_time; end
      def formant; end
      def fm; end
      def filter_eg_depth; end
      def pitch_eg_initial_level; end
      def pitch_eg_attack_time; end
      def pitch_eg_release_level; end
      def pitch_eg_release_time; end
      def portamento_switch_mode; end
      def portamento_time; end
      def pitch_bend_range_high; end
      def pitch_bend_range_low; end
      def pan_scaling; end
      def pan_lfo_depth; end
      def velocity_limit_low; end
      def velocity_limit_high; end
      def expression_low_limit; end
      def sustain_rcv_sw; end
      def lfo2_rate; end
      def lfo2_mod_depth; end

      private
        def parameter_change(params)
          # required params - :pal, :dvm, :dvl

          super(
            # :part should be 0..3
            :pah => "3#{params[:part]}".hex
            :pam => 0x00,
            :pal => params[:pal],
            :dvm => params[:dvm],
            :dvl => params[:dvl]
          )
        end
        alias :tx, :parameter_change
  end
end
