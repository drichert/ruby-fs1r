require 'rspec'
require 'fs1r'

RSpec.configure do |cfg|
  #cfg.color_enabled = true
  #cfg.formatter     = "documentation"
end

def sysex(params = {})
  [:pah, :pam, :pal, :dvm, :dvl].each {|param|
    raise Exception, "missing #{param} param" if params[param].nil?
  }

  [
    0xF0,
    0x43,
    Fs1r::device_id, # device number
    0x5E,            # model id
    params[:pah],    # parameter address high
    params[:pam],    # parameter address middle
    params[:pal],    # parameter address low
    params[:dvm],    # data value most significant 7bit
    params[:dvl],    # data value least significant 7bit
    0xF7
  ]
end
