require 'spec_helper'

describe Fs1r::Config do
  describe "::device_id" do
    context "set via config file" do
      it "should return FS1R device id from config file"
    end

    context "not set via config file (default value)" do
      it "should return the FS1R device id" do
        Fs1r::Config::device_id.should eql(0x10)
      end
    end

  end

  describe "::output_index" do
    it "should return the MIDI output port index (port number)"
  end

end
