class Class
  def meth_seq(spec)
    spec.each do |meth, params|
      (params[:num_methods] + params[:start_ndx]).times do |n|
        if n >= params[:start_ndx]
          define_method(meth.gsub(/_n(_|$)/, "_#{n}\\1").to_sym) do |v|
            tx n, *byte_pair(v)
          end
        end
      end
    end
  end
end
