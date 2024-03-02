class Chandrayaan
  def navigate(commands)
    curr_facing_direction = 'N'
    # First position is for east and west (Increment in east and decrement in west)
    # Second position is for north and south (Increment in north and decrement in south)
    # Third position is for up and down (Increment in up and decrement in down)
    curr_position = [0, 0, 0]
    for command in commands
      if command == 'f'
        curr_position[1] += 1
      end
    end
    curr_position
  end
end
