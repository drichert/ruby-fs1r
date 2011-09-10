require 'spec_helper'

describe Class do
  describe "#meth_seq" do
    context "when sequence spec is valid" do
      before do
        @klass = Class.new
        @klass.class_eval do
          meth_seq({
            'good_n' => {
              :num_methods     => 3,
              :name_num_start  => 7,
              :param_num_start => 0x12,
              :param_num_step  => 2,
              :val_range       => 0..48
            }
          })
        end

        @obj_sans_extras = Object.new
        @obj_with_extras = @klass.new

        @new_methods = @obj_with_extras.methods - @obj_sans_extras.methods
      end

      it "should define :num_methods instance methods" do
        @new_methods.length.should == 3
      end

      it "should define a method that contains :name_num_start as first in sequence" do
        @new_methods.grep(/^good_\d+$/).sort.first =~ /_(\d+)(_|$)/
        $1.should == '7'
      end

      it "should define a method that contains (:name_num_start + (:num_methods - 1)) as last in sequence" do
        @new_methods.grep(/^good_\d+$/).sort.last =~ /_(\d+)(_|$)/
        $1.should == '9'
      end
    end

    context "when sequence spec is invalid" do
      before do
        @meth_spec = {
          :bad => {
            # Missing required param
            'bad_n' => {}
          }
        }
      end
    end
  end
end
