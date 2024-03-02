class Chandrayaan
  def navigate(commands)
    curr_facing_direction = 'N'
    # First position is for east and west (Increment in east and decrement in west)
    # Second position is for north and south (Increment in north and decrement in south)
    # Third position is for up and down (Increment in up and decrement in down)
    curr_position = [0, 0, 0]
    commands.each do |command|
      if command == 'f'
        curr_position[1] += 1
      elsif command == 'b'
        curr_position[1] -= 1
      elsif command == 'l'
        curr_facing_direction = 'W'
      elsif command == 'r'
        curr_facing_direction = 'E'
      end
    end
    [curr_position, curr_facing_direction]
  end
end
