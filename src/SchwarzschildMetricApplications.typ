//
// Copyright 2025 Brad Garn
//

#import "utils.typ" : *

#pagebreak()
== The Schwarzschild Metric Applications

=== Time Dilation

Consider two stationary clocks in the Schwarzschild geometry, located at fixed radii $r_1$ and $r_2$:

$
& x_1^𝜇 (𝜏_1) &&= ( c t_1(𝜏_1), r_1, 𝜃_0, 𝜑_0 ) \
& x_2^𝜇 (𝜏_2) &&= ( c t_2(𝜏_2), r_2, 𝜃_0, 𝜑_0 )
$

Using previously computed $B(r)$ gives the rate of change of coordinate time $(c t)$ with respect to proper time:

$ dv((c t), 𝜏) = c sqrt( 1 / (1 - (2 G M) / (c^2 r)) ) $

The rate of change of coordinate time $t$ with respect to proper time:

$ dv(t, 𝜏) = 1 / sqrt(1 - (2 G M) / (c^2 r)) $

Or the rate of change of proper time with respect to coordinate time:

$ dot(𝜏) = dv(𝜏, t) = sqrt(1 - (2 G M) / (c^2 r)) $

Given a coordinate time interval $𝛥 t$, we can compute the proper time interval $𝛥 𝜏$:

$ 𝛥 𝜏 = integral_(t = t_0)^(t_0 + 𝛥 t) dot(𝜏) dd(t) $

Because in this case $dot(𝜏)$ is constant with respect to $t$:

$
& &&= dot(𝜏) integral_(t = t_0)^(t_0 + 𝛥 t) dd(t) \
& &&= dot(𝜏) bar_(t_0)^(t_0 + 𝛥 t) \
& &&= dot(𝜏) 𝛥 t
$

Compute the difference in elapsed proper times between two radii:

$
& 𝛥 𝜏_(21) &&:= 𝛥 𝜏_2 - 𝛥 𝜏_1 \
& &&= dot(𝜏)_2 𝛥 t - dot(𝜏)_1 𝛥 t \
& &&= (dot(𝜏)_2 - dot(𝜏)_1) 𝛥 t \
& &&= (dot(𝜏)_2 - dot(𝜏)_1) (𝛥 𝜏_1 / dot(𝜏)_1) \
& &&= (dot(𝜏)_2 / dot(𝜏)_1 - 1) 𝛥 𝜏_1 \
& &&= ( sqrt(1 - (2 G M) / (c^2 r_2)) / sqrt(1 - (2 G M) / (c^2 r_1)) - 1 ) 𝛥 𝜏_1 \
& &&= ( sqrt( (1 - (2 G M) / (c^2 r_2)) / (1 - (2 G M) / (c^2 r_1)) ) - 1 ) 𝛥 𝜏_1
$

#let G = 6.67430e-11 // m^3 kg^-1 s-2
#let c = 299792458 // m/s
#let sunMass = 1.989e30 // kg
#let sunRadius = 695700000 // m
#let earthMass = 5.97219e24 // kg
#let earthRadius = 6.371e6 // m
#let earthOrbitRadius = 149597870700 //m

#let schwarzschildRadius(m) = (2 * G * m) / calc.pow(c, 2)
#let schwarzschildFactor(m, r) = 1 - (schwarzschildRadius(m) / r)
#let tauDotStationary(m, r) = calc.sqrt(schwarzschildFactor(m, r))
#let deltaTau21(tauDot2, tauDot1, deltaTau1) = (tauDot2 / tauDot1 - 1) * deltaTau1

//--------------------------------------------------------------------------------------------------
// Display table of time dilation
#let dilationTable(
    caption: none,              // caption for the table
    mass: none,                 // The mass of the central gravitational body (in kg)
    r1: none,                   // Time dilations computed compared to a clock at this radius (in meters)
    locations: (),              // Array of dictionaries, each with a .name and .radius (in meters)
    radius_header: [Radius],    // The header for the "radius" column
    radius_transform: r => r    // A transform for the "radius" column data
) = {
  let td1 = tauDotStationary(mass, r1)
  let day = 86400.0
  let year = 365.25 * day
  figure(
    caption: caption,
    table(
      columns: (1.5fr, 1.2fr, 1.8fr, 1.2fr, 1.2fr),
      inset: 7pt,
      align: (left, right, right, right, right),
      stroke: none,
      table.hline(),
      table.header(
        [Name], radius_header, [$dot(𝜏)_2$], [$𝛥 𝜏_(21)$ (1d)], [$𝛥 𝜏_(21)$ (1y)]
      ),
      table.hline(stroke: 0.5pt),
      ..locations.map(loc => {
        let r2 = loc.radius
        let td2 = tauDotStationary(mass, r2)
        (
          loc.name,
          fmt(radius_transform(r2), digits: 0, commas: true),
          fmt(td2, digits: 14),
          if r2 == r1 [] else { formatSecondsAuto(deltaTau21(td2, td1, day)) },
          if r2 == r1 [] else { formatSecondsAuto(deltaTau21(td2, td1, year)) },
        )
      }).flatten(),
      [Infinity],
      [$∞$],
      fmt(1, digits: 14),
      formatSecondsAuto(deltaTau21(1.0, td1, day)),
      formatSecondsAuto(deltaTau21(1.0, td1, year)),
      table.hline(),
    )
  )
}

$ R_s = (2 G M) / c^2 $
is called the Schwarzschild radius.
It's the key scaling parameter in Schwarzschild geometry.
For Earth, its value is:
$ R_earth = (2 G M_earth) / c^2 = #fmt(schwarzschildRadius(earthMass) * 1000) "mm" $

This would be the radius of the event horizon of a black hole with the mass of earth.

The following table shows the gravitational time dilation caused by the earth relative to a clock at sea level ($r_1$)
These do not take into account the time dilation caused by the velocity of the clocks.
It's as if the clocks are "hovering" at the given altitude.
The next section will account for the velocity of the clocks.

#let earth_locations = (
  // all in meters
  (name: "Dead Sea", radius: earthRadius - 430),
  (name: "Death Valley", radius: earthRadius - 86),
  (name: "Sea Level", radius: earthRadius),
  (name: "1 meter", radius: earthRadius + 1),
  (name: "Chandler, AZ", radius: earthRadius + 370),
  (name: "Mount Everest", radius: earthRadius + 8848),
  (name: "Passenger Jet", radius: earthRadius + 10000),
  (name: "ISS Orbit", radius: 6.78e6),
  (name: "GPS Orbit", radius: 2.656e7),
  (name: "Geosynchronous", radius: 4.2164e7),
  (name: "Moon Orbit", radius: 3.844e8),
)

#dilationTable(
  caption: [Earth Gravitational time dilation relative to Sea Level $(r_1)$.],
  mass: earthMass,
  r1: earthRadius,
  locations: earth_locations,
  radius_header: [Alt (m)],
  radius_transform: r => r - earthRadius // display altitude relative to earth surface
)



For the sun, the Schwarzschild radius is:
$ R_sun = (2 G M_sun) / c^2 = #fmt(schwarzschildRadius(sunMass) / 1000) "km" $

This table show the time dilation caused by the sun relative to a clock "hovering" at the radius of the earth's orbit $(r_1)$.

#let sunOrbits = (
  // all in meters
  (name: "Sun Surface", radius: 695700000),
  (name: "Mercury",     radius: 57909050000),
  (name: "Venus",       radius: 108208000000),
  (name: "Earth",       radius: earthOrbitRadius), // Exactly 1 AU
  (name: "Mars",        radius: 227939200000),
  (name: "Jupiter",     radius: 778570000000),
  (name: "Saturn",      radius: 1433530000000),
  (name: "Uranus",      radius: 2872460000000),
  (name: "Neptune",     radius: 4495060000000),
)

#dilationTable(
  caption: [Sun Gravitational time dilation relative to Earth Orbit $(r_1)$],
  mass: sunMass,
  r1: earthOrbitRadius,
  locations: sunOrbits,
  radius_header: [Radius (km)],
  radius_transform: r => r / 1000 // convert to km for display
)