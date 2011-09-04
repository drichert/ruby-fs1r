module Fs1r
  class Base
    def midi_out
      @midi_out ||= UniMIDI::Output[Fs1r::output_index]
    end

    private
      def parameter_change(params)
        midi_out.puts(
          0xF0,             # sysex start
          0x43,             # Yamaha id
          Fs1r::device_id,  # device number
          0x5E,             # model id
          params[:pah],     # parameter address high
          params[:pam],     # parameter address middle
          params[:pal],     # parameter address low
          params[:dvm],     # data value ms 7bit
          params[:dvl],     # data value ls 7bit
          0xF7              # sysex end
        )
      end

      def parameter_request(params)
        midi_out.puts(
          0xF0,             # sysex start
          0x43,             # Yamaha id
          Fs1r::device_id,  # device number
          0x5E,             # model id
          params[:pah],     # parameter address high
          params[:pam],     # parameter address middle
          params[:pal],     # parameter address low
          0xF7              # sysex end
        )
      end
  end
end
