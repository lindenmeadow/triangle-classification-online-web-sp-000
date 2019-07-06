class Triangle

  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def valid?
    valid_tri = [(side1 + side2 > side3), (side1 + side3 > side2), (side2 + side3 > side1)]
    [side1, side2, side3].each { |s| valid_tri << false if s <= 0 }
    raise TriangleError if valid_tri.include?(false)
  end

  def kind
    if valid?
      if (@side1 <= 0) || (@side2 <= 0) || (@side3 <= 0)
        raise TriangleError
      elsif (@side1 + @side2 <= @side3) || (@side1 + @side3 <= @side2) || (@side2 + @side3 <= @side1)
        raise TriangleError
      else
        if (@side1 == @side2) && (@side2 == @side3)
          :equilateral
        elsif (@side1 == @side2) || (@side2 == @side3) || (@side1 == @side3)
          :isosceles
        elsif (@side1 != @side2) && (@side2 != @side3) && (@side1 != @side3)
          :scalene
        end
      end
    end
  end
end


class TriangleError < StandardError

end
