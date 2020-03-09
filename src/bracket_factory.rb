class BracketFactory

  def initialize(str)
    @str = str
  end

  def find_missing_brackets
    raise "Please enter a valid bracket string" if @str == nil
    bees = @str.split('').each_index.select{ |char| @str.split('')[char] == "B"}
    bees.reverse!
    for x in bees do
      @str = @str.split('').insert(x-1,'(').join() if @str.split('')[x-1] != "("
      @str = @str.split('').insert(x+1,')').join() if @str.split('')[x+1] != ")"
    end
    self.add_missing_curl
  end

  def add_missing_curl
    box = @str.split("(B)")
    box[0] = "[{" if box[0] == "{"
    box[-1] = "}]" if box[-1] == "}"
    box = box.each_with_index{|char,index| box[index]="}{" if char == "{"}
    box = box.each_with_index{|char,index| box[index]="}{" if char == "}"}
    p box.join("(B)")
  end
end
