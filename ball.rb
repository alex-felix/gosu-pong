class Ball
  def initialize(window, player1, player2)
    @window = window
    @player1 = player1
    @player2 = player2
    @image = Gosu::Image.new("media/ball.png")

    reset
  end

  def update
    @x += Gosu::offset_x(@angle, 0)
    @y += Gosu::offset_y(@angle, 6)

    if @x <= 0
      @player2.wins
      reset
    elsif (@x - @image.width) >= @window.width
      @player1.wins
      reset
    end



    if @y <= 0
      #collision top of window
      puts "collision top window"
    end
    if @y >= (@window.height - @image.height)
      #collision bottom of window
      puts "collision bottom window"
    end
    if (@y == @player1.y - @image.height) && @x > 50 && @x < 80
       #collision top of left paddle (p1)
       puts "collision with top of left paddle"
    end
    if (@y == @player1.y + 150) && @x > 50 && @x < 80
      #collision bottom of left paddle (p2)
      puts "collision with bot of left paddle"
    end
    if false
      #collision with right side of left paddle (p1)
      puts "collision with right of left paddle"
    end
    if false
      #collision top of right paddle (p2)
      puts "collision top of right paddle"
    end
    if false
      #collision bottom of right paddle (p2)
      puts "collision bot of right paddle"
    end
    if false
      #collision left side of right paddle (p2)
      puts "collision left of right paddle"
    end

    # if (@player2.y > (@y + @image.height)) ||
    #     ((@player2.y + @player2.image.height) < @y)
    #   # Do not touch x
    # else
    #   if (@x + @image.width) >= @player2.x
    #     @angle -= 270
    #   end
    # end

    # if (@player1.y > (@y + @image.height)) ||
    #     ((@player1.y + @player1.image.height) < @y)
    #     # Do not touch x
    # else
    #   if @x <= @player1.x + @image.width
    #     @angle += 270
    #   end
    # end
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def reset
    @x = (@window.width - @image.width) / 2
    @y = (@window.height - @image.height) / 2
    @angle = 70
  end
end
