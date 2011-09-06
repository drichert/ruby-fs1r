$:.unshift File.expand_path(File.dirname(__FILE__))

require 'yaml'

FS1R_CONFIG = YAML::load_file("#{$:[0]}/../config/config.yml")

# http://blog.jayfields.com/2008/02/ruby-dynamically-define-method.html
class Class
  def def_each(*method_names, &block),
    method_names.each do |method_name|
      define_method method_name do
        instance_exec method_name, &block
      end
    end
  end
end

require 'unimidi'

module Fs1r
  autoload :Base,        'fs1r/base'
  autoload :Voice,       'fs1r/voice'
  autoload :Performance, 'fs1r/performance'
  autoload :Fseq,        'fs1r/fseq'
  autoload :System,      'fs1r/system'

  def self.device_id
    FS1R_CONFIG['device_id']
  end

  def self.output_index
    FS1R_CONFIG['output_index']
  end

end
