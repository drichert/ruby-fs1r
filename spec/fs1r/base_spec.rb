require 'spec_helper'

describe Fs1r::Base do
  let(:fs1r_base) { Fs1r::Base.new }

  before(:each) do
    UniMIDI::Output.stub(:[]).and_return(
      double(UniMIDI::AlsaRawMIDIAdapter::Output)
    )
  end

  describe "#initialize" do
    it "assigns MIDI output to @midi_out" do
      fs1r_base.instance_variable_get(:@midi_out).should_not be_nil
    end

  end

  describe "#tx" do
    let(:valid_params) {{
      :pah => 0x11,
      :pam => 0x22,
      :pal => 0x33,
      :dvm => 0x44,
      :dvl => 0x55
    }}

    let(:valid_sysex) {[
      0xF0,
      0x43,
      Fs1r::device_id,
      0x5E,
      an_instance_of(Fixnum),
      an_instance_of(Fixnum),
      an_instance_of(Fixnum),
      an_instance_of(Fixnum),
      an_instance_of(Fixnum),
      0xF7
    ]}

    it "transmits a sysex message" do
      midi_out = fs1r_base.instance_variable_get(:@midi_out)
      midi_out.should_receive(:open).and_yield(midi_out)
      midi_out.should_receive(:puts).with(*valid_sysex)

      fs1r_base.tx(valid_params)
    end

  end
end
