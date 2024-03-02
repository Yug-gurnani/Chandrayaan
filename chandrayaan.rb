# frozen_string_literal: true

# Chandrayaan class for controlling the spacecraft
class Chandrayaan
  # For navigating the spacecraft through galaxy
  def navigate(commands)
    curr_facing_direction = 'N'
    # Current facing angle represents if the spacecraft is facing towards upwards or downwards angle
    curr_facing_angle = nil
    curr_position = [0, 0, 0]
    commands.each do |command|
      # In case of forward or backward command
      if %w[f b].include?(command)
        move_spacecraft(curr_position, command, curr_facing_direction, curr_facing_angle)
      # In case of left or right command to change direction
      elsif %w[l r].include?(command)
        curr_facing_direction = change_facing_direction(curr_facing_direction, command)
        # Marking curr_facing_angle as nil so that we know spacecraft has not changed angles
        curr_facing_angle = nil
      # In case of upward or downward command to change angles
      elsif %w[u d].include?(command)
        curr_facing_angle = change_facing_angle(command)
      end
    end
    # Return curr_facing_angle if it is present else return curr_facing_direction
    [curr_position, curr_facing_angle || curr_facing_direction]
  end

  def change_facing_direction(curr_facing_direction, command)
    # Changing direction based on its index and rotating the index if it goes out of bounds
    directions = %w[N E S W]
    direction_change = command == 'l' ? -1 : 1
    curr_facing_direction_index = directions.index(curr_facing_direction)
    new_facing_direction_index = (curr_facing_direction_index + direction_change) % 4
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
    movement_change = command == 'f' ? 1 : -1
    if curr_facing_angle.nil?
      if %w[E W].include?(curr_facing_direction)
        position[0] += movement_change
      elsif %w[N S].include?(curr_facing_direction)
        position[1] += movement_change
      end
    else
      position[2] += movement_change
    end
  end
end
