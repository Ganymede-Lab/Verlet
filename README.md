# Verlet

**A Garage Scientist's Symplectic Integrator**

Verlet is a pure-Ruby physics engine designed for scientific accuracy. Unlike standard game engines that sacrifice precision for frame rate, Verlet uses the **Velocity Verlet** algorithm to ensure energy conservation (symplectic integration).

This makes it ideal for simulating:
* Orbital Mechanics (Keplerian orbits)
* Molecular Dynamics
* N-Body Gravity systems

It was built as part of the **Ganymede Lab** project: *From rusty algebra to Landau & Lifshitz.*

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'verlet', git: '[https://github.com/Ganymede-Lab/Verlet.git](https://github.com/Ganymede-Lab/Verlet.git)'
