# Pine Ridge Rally

A top-down rally racing game in a single HTML file — no dependencies, no build step.
Open `index.html` in a browser and race.

You drive the Audi Sport quattro S1 against five AI cars over 3 laps of a gravel
forest stage.

## Features

- Gravel handling model: lateral-grip drifting, handbrake for hairpins, braking
  unsettles the car (pendulum effect)
- **Wet corners** (marked blue on the minimap): darker ground, half the lateral
  grip, weaker brakes
- **Mud spray**: cars on wet ground trail a spray plume — sit in it and mud cakes
  your windscreen (more cars ahead, more mud) and makes steering twitchy; offset
  your line to dodge the plume. Mud clears gradually once the road is dry.
  AI cars caught in *your* plume get the same handicap for a few seconds.
- Waypoint AI with per-driver skill, wet-aware braking, and stuck recovery
- Skid marks, dust, camera lookahead with speed zoom, minimap, results table
- WebAudio engine drone (toggle with M)

## Controls

| Input | Action |
| --- | --- |
| ↑ / W | Throttle |
| ↓ / S | Brake / reverse |
| ← → / A D | Steer |
| Space | Handbrake |
| M | Engine sound on/off |
| R | Restart race |

**Gamepad** (standard mapping): left stick / d-pad steer, RT throttle (or A),
LT brake (or B), X handbrake, Start confirms menus / restarts. Touch controls
appear automatically on mobile.

## Debug

Run `window.AUTOPILOT = true` in the console to let the AI drive the player car.
