module MethSeq
  def meth_seq(spec)
    param_spec = {
      # required if nil here
      :num_methods     => 1,      # number of methods to define
      :name_num_start  => 1,      # start number in method name
      :param_num_start => nil,    # FS1R parameter number start
      :param_num_step  => 1,      # parameter number inc amount
      :val_range       => 0..127  # valid parameter value range
    }

    spec.each do |meth, params|
      # raise Exception if spec has a missing param
      params = param_spec.merge params
      params.each {|k, v|
        raise Exception, "#{meth}: missing :#{k}" if v.nil?
      }

      steps     = [params[:param_num_start]]
      step_size = params[:param_num_step]
      (params[:num_methods] - 1).times {
        steps << steps.last + step_size
      }

      name_num = params[:name_num_start]
      steps.each do |param_num|
        define_method(meth.gsub(/_n(_|$)/, "_#{name_num}\\1").to_sym) do |v|
          tx param_num, *byte_pair(v)
        end
        name_num += 1
      end
    end
  end
end

class Class
  include MethSeq
end

# class X
#   meth_seq({
#     'name_n' => {
#       :num_methods     => 100,
#       :param_num_start => 200
#     }
#   })
# end
# puts X.new.methods.grep /name/
