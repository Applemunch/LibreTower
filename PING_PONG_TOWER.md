# Ping Pong Tower

Ping Pong Tower is a full-game mod branch built directly on top of the complete LibreTower repository.

**Base project:** LibreTower by Applemunch and contributors  
**Branch:** `ping-pong-tower`

All original LibreTower project folders and binary assets remain in the fork: sprites, sounds, rooms, tilesets, fonts, shaders, objects, scripts and platform options.

## Main changes

- The original player physics, dash, running, super-jump, doors, panic/escape system and room progression are preserved.
- The player is rendered as a ping-pong ball while still using LibreTower's collision masks and movement code.
- Selected original `obj_platform` instances become paddle trampolines and automatically bounce the ball.
- Thin vertical original `obj_solid` geometry is rendered as ping-pong nets without replacing the room collision.
- Existing enemies become paddle opponents while retaining their original enemy hierarchy and room placement.
- Enemy contact hurts the ball; dash/full-speed attacks defeat normal paddle enemies.
- Hostile projectiles are rendered as ping-pong balls.
- `agm_5` becomes the final match against **Raquetão**, an 8-HP paddle boss that fires ball projectiles.
- Defeating Raquetão starts a 1:45 Match Point escape.
- The original HUD artwork is preserved and gains tournament stage, score, rally counter and boss health.
- The original title asset remains and receives Ping Pong Tower branding.
- New Game now starts at `tutorial_1` instead of the original test room.
- Save/settings use `PingPongTower.ini` so this mod does not overwrite normal LibreTower settings.

## Controls

The controls remain LibreTower's original controls:

- Arrow keys / gamepad D-pad: movement
- Z / gamepad face button: jump
- X / gamepad face button: dash
- Shift / right shoulder: run
- C / gamepad face button: taunt
- Esc / Start: pause

## Tournament groups

- Tutorial rooms: Training League
- Entrance rooms: Open Qualifiers
- Chateau: Champions Table
- AGM rooms: Neon Rally
- AGM 5: Final Match — Raquetão
- Armory rooms: Robot League
- Secret AGM rooms: Secret Rally

## Run

Open `LibreTower.yyp` in a compatible GameMaker version and run the project from the `ping-pong-tower` branch.

The `main` branch remains the clean fork of upstream LibreTower.
