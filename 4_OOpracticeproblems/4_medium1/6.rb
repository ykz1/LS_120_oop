class Computer
  attr_accessor :template

  def create_template
    # this directly instantiates / sets @template
    @template = "template 14231"
  end

  def show_template
    # this calls @template getter; note: getters don't require self but setters do
    template
  end
end



class Computer
  attr_accessor :template

  def create_template
    # this calls #template setter to instantiate / set @template
    self.template = "template 14231"
  end

  def show_template
    # this calls @template getter
    self.template
  end
end