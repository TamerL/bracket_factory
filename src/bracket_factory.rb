class BracketFactory

  def initialize(str)
    @str = str
  end

  def find_bees_add_brackets
    raise "Please enter a valid bracket string" if @str == nil || !(@str.split('').uniq.sort - "()B[]{}".split('')).empty?
    @bees = @str.split('').each_index.select{ |char| @str.split('')[char] == "B"}
    @bees.reverse!
    self.add_missing_brackets
  end

  def add_missing_brackets
    # let's fix the B brackets first by adding any missing () around the B
    for x in @bees do
      @str = @str.split('').insert(x+1,')').join() if @str.split('')[x+1] != ")"
      @str = @str.split('').insert(x,'(').join() if @str.split('')[x-1] != "("
    end
    # let's now fix the boxes by adding {} AND/OR [] if needed, let's remove B
    box = @str.split("(B)")
    # There is a pattern of errors, we will search for it and fix it if found
    box[0] = "[{" if box[0] == "{"
    box[-1] = "}]" if box[-1] == "}"
    box = box.each_with_index{|char,index| box[index]="}{" if char == "{"}
    box = box.each_with_index{|char,index| box[index]="}{" if char == "}"}
    return box.join("(B)")
  end
end

# puts "Hi!\nI am the brackets factory, Please insert your package and I will fix
# it with the needed brackets:"
# x = gets.chomp()
# string = BracketFactory.new(x)
# puts "I have added the missing brackets:" + string.find_bees_add_brackets
