require 'spec_helper'

describe Class do
  before do
    @meth_spec = {
      :good => {
        # All params
        'good_n' => {
          :num_methods     => 3,
          :name_num_start  => 7,
          :param_num_start => 0x12,
          :param_num_step  => 2,
          :val_range       => 0..48
        },
        # Required params only
        'good_req_n' => {
          :param_num_start => 0x0D
        }
      },
      :good_single => {
        'good_single_n' => {
          :param_num_start => 0x01
        }
      },
      :bad => {
        # Missing required param
        'bad_n' => {}
      }
    }
  end

  describe "#meth_seq" do
    context "when sequence spec is valid" do
      before do
        @meth_spec = {
          # All params
          'good_n' => {
            :num_methods     => 3,
            :name_num_start  => 7,
            :param_num_start => 0x12,
            :param_num_step  => 2,
            :val_range       => 0..48
          },
          # Required params only
          'good_req_n' => {
            :param_num_start => 0x0D
          },
          :good_single => {
            'good_single_n' => {
              :param_num_start => 0x01
            }
          },
        }

        @klass = Object.const_set 'Klass', Class.new
        @klass.class_eval do
          meth_seq @meth_specs[:good]
        end

        @obj_sans_extras = Object.new
        @obj_with_extras = @klass.new
      end

      it "should define instance methods" do
        with    = @obj_with_extras.methods.length
        without = @obj_sans_extras.methods.length

        with.should be > without
      end
    end

    context "when sequence spec is invalid" do
      before do
        @meth_spec =
          :bad => {
            # Missing required param
            'bad_n' => {}
          }
        }
      end
    end
  end
end
