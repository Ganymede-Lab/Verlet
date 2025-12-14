# frozen_string_literal: true

require_relative "verlet/version"
require 'matrix'# Vector support

module Verlet
  class Particle
    attr_accessor :position, :velocity, :acceleration, :mass

    def initialize(x, y, vx, vy, mass = 1.0)
      #position and velocity stored as Vectors
      @position = Vector[x, y]
      @velocity = Vector[vx, vy]
      @mass = mass

      # Acceleration starts at zero until forces are calculated
      @acceleration = Vector[0, 0]
    end
    
    # Half peek
    # r_new = r+ v*dt + 0.5*a*dt^2
    def update_position(dt)
      @position = @position + (@velocity * dt) + (@acceleration * 0.5 * (dt**2))
    end

    # Catch up
    # v_new = v + 0.5 * (a + a_new) * dt
    def update_velocity(new_acceleration, dt)
      @velocity = @velocity + ((@acceleration + new_acceleration) * 0.5 * dt)

      # the next loop will require the new acceleration be set as the old acceleration
      @acceleration = new_acceleration
    end
  end
end
