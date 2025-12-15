require_relative 'lib/verlet'

# --- CONFIGURATION ---
G_CONST = 100.0    # Arbitrary strength of gravity for this simulation
SUN_MASS = 10.0    # Mass of the thing in the middle
DT = 0.01          # Smaller time step for better accuracy

# --- SETUP ---
# Start the planet at x=10, y=0
# Give it a "kick" UP (y-velocity) so it doesn't just crash into the sun
start_pos_x = 10.0
start_pos_y = 20.0
start_vel_x = 0.0
start_vel_y = 30.0 # Try changing this later! (Too slow = crash, Too fast = escape)

planet = Verlet::Particle.new(start_pos_x, start_pos_y, start_vel_x, start_vel_y, 1.0)

puts "--- ORBIT SIMULATION ---"
puts "Time | X Position | Y Position"

# --- THE LOOP ---
# Run for 600 steps (enough for roughly one full circle)
600.times do |i|
  # 1. Update Position
  planet.update_position(DT)

  # 2. Calculate Gravity (The "Inverse Square Law")
  #    Vector pointing from Planet -> Sun is just (-position)
  r_vector = planet.position
  distance = r_vector.magnitude # The distance to (0,0)
  
  #    Avoid dividing by zero if we crash
  if distance < 0.1
    puts "CRASH! Into the sun."
    break
  end

  #    Magnitude of force: F = (G * M) / r^2
  #    Acceleration = Force / mass (but mass is 1, so a = F)
  accel_magnitude = (G_CONST * SUN_MASS) / (distance ** 2)
  
  #    Direction: Unit vector pointing TOWARD the center (negative position)
  accel_direction = r_vector * -1.0 / distance
  
  new_acceleration = accel_direction * accel_magnitude

  # 3. Update Velocity
  planet.update_velocity(new_acceleration, DT)

  # Only print every 10th step so we don't flood the screen
  if i % 5 == 0
    x = planet.position[0]
    indentation = (x * 3.0) + 40

    graph_line = " " * indentation.to_i + "*"

    puts graph_line
  end
end
