$:.unshift File.expand_path(File.dirname(__FILE__))

require 'meth_seq'
require 'yaml'

FS1R_CONFIG = YAML::load_file("#{$:[0]}/../config/config.yml")

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
