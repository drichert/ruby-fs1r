module Fs1r
  module Performance
    class Effect < Fs1r::Base

      def reverb_type; end
      def reverb_pan; end
      def reverb_return; end

      def variation_type; end
      def variation_pan; end
      def variation_return; end
      def send_variation_to_reverb; end

      def insertion_type; end
      def insertion_pan; end
      def send_insertion_to_reverb; end
      def send_insertion_to_variation; end
      def insertion_level; end

      def eq_low_gain; end
      def eq_low_frequency; end
      def eq_low_q; end
      def eq_low_shape; end
      def eq_mid_gain; end
      def eq_mid_frequency; end
      def eq_mid_q; end
      def eq_high_gain; end
      def eq_high_frequency; end
      def eq_high_q; end
      def eq_high_shape; end

      def method_missing(meth, *args, &block)
        unless respond_to? meth
          if /^reverb_parameter_(?<n>\d+)$/ =~ meth
            if (1..24) === n.to_i
              raise NameError, "Reverb parameter number out of range"
            end

            self.class.send(
              :define_method,
              "reverb_parameter_#{n}".to_sym
            ) {|arg|
              tx 0x00, 0x50 + (n.to_i - 1), *byte_pair(v)
            }
            # Call method after defining it

          elsif /^variation_parameter_(?<n>\d+)$/ =~ meth
            if (1..32) === n.to_i
              raise NameError, "Variation parameter number out of range"
            end

            self.class.send(
              :define_method,
              "variation_parameter_#{n}".to_sym
            ) {|arg|
              # ...
            }
            # Call method after defining it

          elsif /^insertion_parameter_(?<n>\d+)$/ =~ meth
            if (1..32) === n.to_i
              raise NameError, "Insertion parameter number out of range"
            end

            self.class.send(
              :define_method,
              "insertion_parameter_#{n}".to_sym
            ) {|arg|
              # ...
            }
            # Call method after defining it

          else
            super
          end
        end
      end

      private
        def tx(pam, pal, dvm, dvl)
          super(
            :pah => 0x10,
            :pam => pam,
            :pal => pal,
            :dvm => dvm,
            :dvl => dvl
          )
        end
    end
  end
end
