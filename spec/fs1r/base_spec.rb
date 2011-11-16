require 'spec_helper'

describe Fs1r::Base do
  describe "#initialize" do
    before(:each) do
      UniMIDI::Output.stub(:[]).and_return(
        double(UniMIDI::AlsaRawMIDIAdapter::Output)
      )
    end

    it "assigns MIDI output to @midi_out" do
      fs1r = Fs1r::Base.new
      fs1r.instance_variable_get(:@midi_out).should_not be_nil
    end

  end

  describe "#tx" do
    it "transmits a sysex message"
  end
end
