module Fs1r
  class Base

    def initialize
      midi_out
    end

    def tx(params)
      midi_out.open {|output|
        output.puts(
          0xF0,             # sysex start
          0x43,             # Yamaha id
          Fs1r::device_id,  # device number
          0x5E,             # model id
          params[:pah],     # parameter address high
          params[:pam],     # parameter address middle
          params[:pal],     # parameter address low
          params[:dvm],     # data value most significant 7bit
          params[:dvl],     # data value least significant 7bit
          0xF7              # sysex end
        )
      }
    end

    private
      def midi_out
        @midi_out ||= UniMIDI::Output[Fs1r::output_index]
      end

      # convert input to a pair of bytes
      def byte_pair(n)
        if n.to_s(2).length > 16 || !n.is_a?(Fixnum)
          raise "Input must be 16-bit integer"
        end

        n = "#{0 * (16 - n.to_s(2).length)}#{n.to_s(2)}"

        [n[0..7].to_i(2), n[8..15].to_i(2)]
      end

      # def rx(params)
      #   midi_out.puts(
      #     0xF0,             # sysex start
      #     0x43,             # Yamaha id
      #     Fs1r::device_id,  # device number
      #     0x5E,             # model id
      #     params[:pah],     # parameter address high
      #     params[:pam],     # parameter address middle
      #     params[:pal],     # parameter address low
      #     0xF7              # sysex end
      #   )
      # end
  end
end
