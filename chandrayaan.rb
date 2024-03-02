class Chandrayaan
  def navigate(commands)
    curr_facing_direction = 'N'
    # First position is for east and west (Increment in east and decrement in west)
    # Second position is for north and south (Increment in north and decrement in south)
    # Third position is for up and down (Increment in up and decrement in down)
    curr_position = [0, 0, 0]
    commands.each do |command|
      if %w[f b].include?(command)
        curr_position = move_spacecraft(curr_position, command, curr_facing_direction)
      elsif %w[l r u d].include?(command)
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
    elsif command == 'u'
      return 'U'
    elsif command == 'd'
      return 'D'
    end
    directions[new_facing_direction_index]
  end

  def move_spacecraft(position, command, curr_facing_direction)
    # Move the first index if curr_facing_direction if east or west,
    # Move the second index if curr_facing_direction if north or south
    if %w[E W].include?(curr_facing_direction)
      if command == 'f'
        position[0] += 1
      elsif command == 'b'
        position[0] -= 1
      end
    elsif %w[N S].include?(curr_facing_direction)
      if command == 'f'
        position[1] += 1
      elsif command == 'b'
        position[1] -= 1
      end
    end
    position
  end
end
