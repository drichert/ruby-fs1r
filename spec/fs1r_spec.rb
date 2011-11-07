require 'spec_helper'

describe Fs1r do
  describe "::VERSION" do
    it "should be a valid SemVer version string" do
      Fs1r::VERSION.should match(/^(\d+\.){2}\d+([a-z](\w+)?)?$/)
    end
  end
end
