class Chandrayaan
  def navigate(commands)
    curr_facing_direction = 'N'
    # Current facing angle represents if the spacecraft is facing towards upwards or downwards angle
    curr_facing_angle = nil
    # First position is for east and west (Increment in east and decrement in west)
    # Second position is for north and south (Increment in north and decrement in south)
    # Third position is for up and down (Increment in up and decrement in down)
    curr_position = [0, 0, 0]
    commands.each do |command|
      if %w[f b].include?(command)
        curr_position = move_spacecraft(curr_position, command, curr_facing_direction, curr_facing_angle)
      elsif %w[l r].include?(command)
        curr_facing_direction = change_facing_direction(curr_facing_direction, command)
        curr_facing_angle = nil
      elsif %w[u d].include?(command)
        curr_facing_angle = change_facing_angle(command)
      end
    end
    # Return curr_facing_angle if it is present else return curr_facing_direction
    [curr_position, curr_facing_angle || curr_facing_direction]
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

  def change_facing_angle(command)
    # Give the command only as we have only 2 angles, Up and Down
    command.upcase
  end

  def move_spacecraft(position, command, curr_facing_direction, curr_facing_angle)
    # Move the first index if curr_facing_direction is east or west,
    # Move the second index if curr_facing_direction is north or south
    # Move the third index if curr_facing_angle is present(The spacecraft if facing either upward or downward angle)
    if curr_facing_angle.nil?
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
    elsif command == 'f'
      position[2] += 1
    elsif command == 'b'
      position[2] -= 1
    end
    position
  end
end
