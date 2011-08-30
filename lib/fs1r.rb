$:.unshift File.dirname(__FILE__)

require 'unimidi'

module Fs1r
  autoload :Base,        'fs1r/base'
  autoload :Voice,       'fs1r/voice'
  autoload :Performance, 'fs1r/performance'
  autoload :Fseq,        'fs1r/fseq'
  autoload :System,      'fs1r/system'

  self.base_path; File.dirname __FILE__; end
end
