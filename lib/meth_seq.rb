class Class
  def meth_seq(spec)
    param_spec = {
      # required if nil here
      :num_methods     => nil,    # number of methods to define
      :name_num_start  => 1,      # start number in method name
      :param_num_start => nil,    # FS1R parameter number start
      :param_num_step  => 1,      # parameter number inc amount
      :val_range       => 0..127  # valid parameter value range
    }

    # raise Exception if spec has a missing param
    spec.each {|name, params|
      param_spec.merge params
      params.each {|k, v|
        raise Exception, "#{name}: missing :#{k}" if v.nil?
      }
    }

    spec.each do |meth, params|
      steps     = [params[:param_num_start]]
      step_size = params[:param_num_step]
      (num_methods - 1).times {
        steps << steps.last.to_i + step_size
      }

      name_num = params[:name_num_start]
      steps.each do |param_num|
        define_method(m.gsub(/_n(_|$)/, "_#{name_num}\\1").to_sym) do |v|
          tx param_num, *byte_pair(v)
        end
        name_num += 1
      end
    end
  end
end
