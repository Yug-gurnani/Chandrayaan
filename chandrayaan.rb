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
      elsif %w[l r].include?(command)
        curr_facing_direction = change_facing_direction(curr_facing_direction, command)
      end
    end
    [curr_position, curr_facing_direction]
  end

  def change_facing_direction(curr_facing_direction, command)
    directions = %w[N E S W]
    curr_facing_direction_index = directions.index(curr_facing_direction)
    if command == 'l'
      new_facing_direction_index = (curr_facing_direction_index - 1) % 4
    elsif command == 'r'
      new_facing_direction_index = (curr_facing_direction_index + 1) % 4
    end
    directions[new_facing_direction_index]
  end
end
