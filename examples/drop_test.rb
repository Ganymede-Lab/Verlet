require_relative 'lib/verlet' # Loads your new class

# 1. Setup
# Start at x=0, y=100. Velocity is 0. Mass is 1kg.
rock = Verlet::Particle.new(0, 100, 0, 0, 1.0)

dt = 0.1          # Time step (0.1 seconds)
total_time = 0.0  # Keep track of time
gravity = Vector[0, -9.81] # Constant acceleration pointing DOWN

puts "--- DROPPING ROCK ---"
puts "Time | Height (y) | Velocity (y)"

# 2. The Simulation Loop (Run for 20 steps / 2 seconds)
20.times do
  # Step 1: Update Position (The Half-Jump)
  rock.update_position(dt)

  # Step 2: Calculate Force/Acceleration
  # (For this simple test, gravity never changes)
  new_accel = gravity

  # Step 3: Update Velocity (The Catch Up)
  rock.update_velocity(new_accel, dt)

  # Update clock and print
  total_time += dt
  puts "#{total_time.round(1)}s | #{rock.position[1].round(4)}m | #{rock.velocity[1].round(4)} m/s"
end
