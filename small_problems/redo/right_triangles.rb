def triangle(side, corner)
  case corner
  when :UL
    side.downto(1) do |line|
      puts ("*" * line).ljust(side)
    end
  when :UR
    side.downto(1) do |line|
      puts ("*" * line).rjust(side)
    end
  when :LL
    1.upto(side) do |line|
      puts ("*" * line).ljust(side)
    end
  when :LR
    1.upto(side) do |line|
      puts ("*" * line).rjust(side)
    end
  end
end

triangle(8, :UL)
triangle(3, :UR)
triangle(4, :LL)
triangle(9, :LR)

