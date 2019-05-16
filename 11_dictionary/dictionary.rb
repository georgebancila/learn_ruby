class Dictionary
  def initialize
    @entries = {}
  end

  def entries
    @entries
  end

  def add(item)
    if item.is_a?(Hash)
      @entries.merge!(item)
    else
      @entries.merge!(item => nil)
    end
  end

  def keywords
    @entries.keys.sort
  end

  def include?(key)
    @entries.key?(key)
  end

  def find(key)
    res = {}
    @entries.each do |k,v|
      if k.start_with?(key)
        res[k] = v
      end
    end
    res
  end

  def printable
    res = []
    @entries.keys.sort.each do |k|
      res << "[#{k}] \"#{@entries[k]}\""
    end
    res.join("\n")
  end
end
