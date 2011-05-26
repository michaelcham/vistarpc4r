module VistaRPC4r
class RPCResponse
  attr_accessor :type, :value, :error_message

  SINGLE_VALUE = 1
  GLOBAL_INSTANCE = 2
  ARRAY = 3
  GLOBAL_ARRAY=4
  WORD_PROCESSING=5

  def initialize(value=nil, type=nil)
    if value.nil?
      @type = SINGLE_VALUE
      @value = nil
    elsif value.class == String
      @value = value
      @type = SINGLE_VALUE
    elsif value.class == Array
      @value = value
      @type = ARRAY
    elsif !type.nil?
      @value = value
      @type = type
    end
    @error_message = nil
  end
  
  def to_s
    sb = String.new
    if !@error_message.nil?
      sb << "ERROR: "
      sb << @error_message
    elsif @value.nil?
      sb << "No value or error"
    elsif @value.class == Array 
      sb = "ARRAY:" + value.join("|")
    elsif @value.class == String
      sb = "STRING:" + value.to_s
    else 
      sb << "Unknown value type"
    end
    return sb
  end
end

end
