module Fs1r
  module Performance
    class Common < Fs1r::Base

      # 0..22
      def category(v)
        tx 0x0E, *byte_pair(v)
      end

      # 0..127
      def volume(v)
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

      def method_missing(meth, *args, &block)
        if meth =~ /^name_(\d+)$/
          self.class.class_eval {|args|
          }
        end
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
  end
end
