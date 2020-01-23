def bracket_factory(str)
  raise "Please enter a valid bracket string" if str == nil
  @brackets = { 0 => '[]' , 1 => '{}' , 2 => '()'}
  close = []
  str.split('').each_with_index do |char,ind|
    if ['[','(','['].include?(char)
      close << [char,ind]
    elsif [']',')','}'].include?(char)
      return '['+str if close.length == 0
      recent = close.pop
      if char != @brackets.find {|key,val| val.include?(recent.first)}[1].split('').last
        if weight(char) < weight(recent.first)
          return str.insert(ind,@brackets[weight(recent.first)].split('').last)
        else
          return str.insert(recent.last+1,@brackets[weight(char)].split('').first)
        end
      end
    end
  end
end

  def weight (char)
    return @brackets.find {|key,val| val.include?(char)}[0]
  end
