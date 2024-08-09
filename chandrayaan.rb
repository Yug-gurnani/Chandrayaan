# frozen_string_literal: true

# Chandrayaan class for controlling the spacecraft
class Chandrayaan
  DIRECTIONS = %w[N E S W].freeze
  COMMANDS = {
    'f' => :forward,
    'b' => :backward,
    'l' => :left,
    'r' => :right,
    'u' => :up,
    'd' => :down
  }.freeze

  def initialize
    @curr_position = [0, 0, 0]
    @curr_facing_direction = 'N'
    # Current facing angle represents if the spacecraft is facing towards upwards or downwards angle
    @curr_facing_angle = nil
  end

  # For navigating the spacecraft through galaxy
  def navigate(commands)
    @curr_position = [0, 0, 0]
    commands.each do |command|
      handle_command(command)
    end
    # Return curr_facing_angle if it is present else return curr_facing_direction
    [@curr_position, @curr_facing_angle || @curr_facing_direction]
  end

  private

  def handle_command(command)
    send(COMMANDS[command])
  end

  def forward
    move_spacecraft(1)
  end

  def backward
    move_spacecraft(-1)
  end

  def left
    change_facing_direction(-1)
  end

  def right
    change_facing_direction(1)
  end

  def up
    @curr_facing_angle = 'U'
  end

  def down
    @curr_facing_angle = 'A'
  end

  def change_facing_direction(direction_change)
    # Changing direction based on its index and rotating the index if it goes out of bounds
    curr_facing_direction_index = DIRECTIONS.index(@curr_facing_direction)
    new_facing_direction_index = (curr_facing_direction_index + direction_change) % 4
    # Marking curr_facing_angle as nil so that we know spacecraft has not changed angles
    @curr_facing_angle = nil
    @curr_facing_direction = DIRECTIONS[new_facing_direction_index]
  end

  def move_spacecraft(movement_change)
    # Move the first index if curr_facing_direction is east or west,
    # Move the second index if curr_facing_direction is north or south
    # Move the third index if curr_facing_angle is present(The spacecraft if facing either upward or downward angle)
    if @curr_facing_angle
      @curr_position[2] += movement_change
    else
      axis = %w[E W].include?(@curr_facing_direction) ? 0 : 1
      @curr_position[axis] += movement_change
    end
  end
end
