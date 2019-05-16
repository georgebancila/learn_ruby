# frozen_string_literal: true

class XmlDocument

  def initialize(indents = false)
    @indents = indents
    @level = 0
  end

  def hello(attr = nil)
    if !attr.nil?
      tag = 'hello ' + build_attr(attr)
      tag_it(tag)
    elsif block_given?
      tag_it_full(yield, 'hello')
    else
      tag_it('hello')
    end
  end

  def send(tag)
    tag_it(tag)
  end

  def goodbye
    if block_given?
      @level += 1 if @indents
      tag_it_full(yield, 'goodbye')
    else
      tag_it('goodbye')
    end
  end

  def come_back
    if block_given?
      @level += 1 if @indents
      tag_it_full(yield, 'come_back')
    else
      tag_it('come_back')
    end
  end

  def ok_fine(attr = nil)
    if !attr.nil?
      @level += 1 if @indents
      tag = 'ok_fine ' + build_attr(attr)
      tag_it(tag)
    else
      tag_it('ok_fine')
    end
  end

  private

  def tag_it(text)
    if @indents
      tabs = get_tabs
      @level -= 1
      tabs + "<#{text}/>\n"
    else
      "<#{text}/>"
    end
  end

  private

  def tag_it_full(text, tag_name)
    if @indents
      tabs = get_tabs
      @level -= 1
      "#{tabs}<#{tag_name}>\n#{text}#{tabs}</#{tag_name}>\n"
    else
      "<#{tag_name}>#{text}</#{tag_name}>"
    end
  end

  private

  def build_attr(attr)
    "#{attr.keys.first.to_s}=\'#{attr[attr.keys.first]}\'"
  end

  private

  def get_tabs
    return '' unless @level.positive?

    c = 0
    tabs = ''
    while c < @level
      c += 1
      tabs += "  "
    end
    tabs
  end
end