class AttrAccessorObject
  def initialize
    @name = 'me too'
    @prop = "uh oh"
  end


  def self.my_attr_accessor(*names)
    names.each do |ins_var|
      define_method(ins_var) do
        instance_variable_get("@#{ins_var}")
      end
      define_method("#{ins_var}=") do |value|
        instance_variable_set("@#{ins_var}", value)
      end
    end

  end
end
