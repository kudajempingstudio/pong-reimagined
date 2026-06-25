# Game Design Document (GDD) — Pong Reimagined

## 1. Game Overview

**Working Title:** Pong Reimagined  
**Genre:** Arcade / Sports / Casual  
**Platform:** PC (Windows/macOS/Linux), Web, and Mobile (optional adaptation)  
**Target Audience:** Casual players, retro game fans, beginner game dev learners  
**Game Mode:** Single-player, Local Multiplayer  
**Estimated Session Length:** 2–10 minutes per match

### High Concept
Pong Reimagined is a modern take on the classic Pong formula. Two paddles face each other on opposite sides of the arena, bouncing a ball back and forth. Players score by making the ball pass the opponent’s paddle. The game preserves the simplicity of the original Pong while allowing room for polish, game feel, difficulty tuning, and optional modern features such as power-ups, visual themes, and progression.

### Core Pillars
1. **Simple to learn** — players understand the rules in seconds.
2. **Responsive and satisfying** — paddle movement and ball physics must feel tight.
3. **Competitive replayability** — every rally should feel tense and skill-based.
4. **Expandable design** — the base game works as classic Pong, but can be extended with modes and modifiers.

---

## 2. Vision & Goals

### Vision Statement
Create a clean, polished Pong game that captures the timeless fun of the original while serving as a solid foundation for future arcade mechanics, modern visuals, and gameplay variations.

### Design Goals
- Deliver a **playable core loop quickly**.
- Make controls feel **snappy and fair**.
- Ensure the game works well both as:
  - a **finished small arcade game**, and
  - a **learning project / starter game project** for further expansion.
- Support at least:
  - **1 Player vs AI**
  - **2 Players local multiplayer**
- Keep the MVP scope tight and realistic.

### Non-Goals (for MVP)
- Online multiplayer
- Deep progression systems
- Complex narrative or worldbuilding
- Large number of unlockables
- Heavy physics simulation beyond arcade needs

---

## 3. Core Gameplay

## 3.1 Core Loop
The main gameplay loop is:

1. Match starts.
2. Ball launches from the center.
3. Players move paddles vertically to intercept the ball.
4. Ball bounces off paddles and top/bottom walls.
5. If a player misses the ball, the opponent scores a point.
6. Ball resets to center.
7. Match continues until a win condition is met.
8. End screen shows winner and options to replay or return to menu.

## 3.2 Player Actions
Each player can:
- Move paddle **up**
- Move paddle **down**
- Pause the game
- Navigate menu / restart match

## 3.3 Win Condition
Default match rules:
- First player to reach **10 points** wins the match.

Optional configurable rules:
- First to 5 / 7 / 10 / 15 points
- Best of 3 rounds
- Timed mode (highest score before timer ends)

---

## 4. Rules

## 4.1 Arena Rules
- The playfield is a rectangular arena.
- Each player controls one paddle.
- The ball starts in the center after each point.
- Ball bounces off:
  - top wall
  - bottom wall
  - paddles
- Ball does **not** bounce off left/right goal boundaries. Crossing those boundaries results in a score.

## 4.2 Scoring Rules
- If the ball exits the **left side**, the **right player** scores.
- If the ball exits the **right side**, the **left player** scores.
- After a score:
  - score UI updates
  - a short pause occurs
  - the ball resets and launches again

## 4.3 Ball Reflection Rules
To keep gameplay skill-based and interesting:
- The bounce angle changes depending on where the ball hits the paddle.
- Hitting the paddle near the center produces a flatter bounce.
- Hitting near the top/bottom edge produces a steeper bounce.

Optional advanced rule:
- Ball speed increases slightly after each paddle hit, up to a maximum speed.

---

## 5. Game Modes

## 5.1 Classic Duel
**Mode Type:** Local multiplayer  
Two human players play against each other on the same device.

## 5.2 Solo vs AI
**Mode Type:** Single-player  
One player competes against an AI-controlled paddle.

AI difficulty options:
- Easy
- Normal
- Hard

## 5.3 Optional Future Modes
Not part of MVP, but planned as extensions:
- **Power-Up Mode** — temporary buffs/debuffs appear in the arena
- **Endless Rally Challenge** — survive as long as possible
- **Tournament Ladder** — defeat a sequence of AI opponents
- **Chaos Pong** — arena hazards, multiple balls, speed shifts
- **Wall Mode** — one player keeps the ball alive against a scoring wall

---

## 6. Controls

## 6.1 Keyboard Controls (PC)
### Player 1
- **W** = Move Up
- **S** = Move Down

### Player 2
- **Up Arrow** = Move Up
- **Down Arrow** = Move Down

### Global
- **Esc / P** = Pause
- **Enter / Space** = Confirm / Restart on result screen

## 6.2 Mobile Controls (Optional)
If mobile version is created:
- Left side of screen = Player 1 drag zone
- Right side of screen = Player 2 drag zone
- Single-player mobile version can use drag or hold-to-move controls

---

## 7. Player Experience Goals

The player should feel:
- **Immediate clarity**: “I know exactly what to do.”
- **Tension** during long rallies.
- **Satisfaction** from accurate paddle placement and difficult returns.
- **Competitive excitement** when scores are close.
- **“One more match” replayability** because matches are short and readable.

---

## 8. Mechanics & Systems

## 8.1 Paddle System
### Paddle Attributes
- Position (X, Y)
- Width / Height
- Movement speed
- Input source (Player 1 / Player 2 / AI)
- Collision bounds

### Paddle Behavior
- Paddle can only move vertically.
- Paddle cannot leave the arena bounds.
- Paddle movement should feel immediate, not floaty.

### Tuning Variables
- Paddle speed
- Paddle height
- Paddle acceleration (if used)
- Input smoothing (if any)

## 8.2 Ball System
### Ball Attributes
- Position
- Direction vector
- Current speed
- Minimum speed
- Maximum speed

### Ball Behavior
- Ball launches from center after a short delay.
- Ball travels continuously until a point is scored.
- Ball bounces off paddles and arena walls.
- Ball angle changes based on paddle contact point.
- Ball may gradually speed up to increase intensity.

### Ball Reset
After a point:
- ball returns to center
- velocity resets to base speed or slightly randomized launch angle
- launch direction alternates or randomizes for fairness

## 8.3 AI System
### AI Goal
Track the ball and position the AI paddle to return it.

### AI Behavior by Difficulty
**Easy**
- Slower reaction time
- Limited paddle speed
- May intentionally miss difficult shots

**Normal**
- Reasonable tracking speed
- Moderate reaction delay
- Fair challenge for casual players

**Hard**
- Fast tracking
- High paddle speed
- Better anticipation, but still not perfect

### AI Fairness Rules
To avoid frustration, AI should not be frame-perfect. Introduce:
- reaction delay
- max movement speed
- optional prediction error

## 8.4 Match Flow System
States:
1. Main Menu
2. Mode Select
3. Match Intro / Countdown
4. In Match
5. Point Scored Pause
6. Match End
7. Pause Menu

---

## 9. Difficulty & Balancing

## 9.1 Balancing Goals
- Easy should be beatable by new players
- Normal should feel fair and engaging
- Hard should require consistent paddle control and positioning

## 9.2 Main Tuning Variables
- Ball base speed
- Ball max speed
- Paddle size
- Paddle speed
- Score required to win
- AI reaction delay
- AI movement speed
- Serve delay after scoring

## 9.3 Recommended MVP Defaults
- Match point target: **10**
- Paddle speed: **medium-fast**
- Ball initial speed: **moderate**
- Ball speed increase per paddle hit: **small**
- Max ball speed: **capped for readability**

---

## 10. Level / Arena Design

## 10.1 MVP Arena
A single clean arena:
- Dark background
- Center dashed line
- Two paddles
- Ball
- Score UI at top
- Optional glow / retro visual effect

## 10.2 Visual Readability Priorities
- Ball must always be clearly visible
- Paddle edges should be readable against the background
- Score should be visible at a glance
- No visual effect should obscure ball trajectory

## 10.3 Optional Future Arena Variants
- Neon retro arena
- Minimal monochrome arena
- Sci-fi hologram arena
- Wooden tabletop / air hockey inspired arena
- Arena with moving obstacles (non-MVP)

---

## 11. UI / UX

## 11.1 Main Menu
Buttons:
- Play
- Solo vs AI
- Local Multiplayer
- Options
- Quit

## 11.2 In-Game HUD
Display:
- Left player score
- Right player score
- Pause indicator (when paused)

Optional:
- current difficulty
- current rally speed

## 11.3 Pause Menu
Options:
- Resume
- Restart Match
- Back to Main Menu

## 11.4 Match End Screen
Display:
- Winner
- Final score
- Replay button
- Return to menu button

---

## 12. Audio Design

## 12.1 Audio Goals
Audio should reinforce game feel and readability.

## 12.2 Sound Effects
Required sounds:
- Paddle hit
- Wall bounce
- Score point
- Menu click
- Match win / end

### Sound Style
Recommended style:
- clean arcade blips
- retro electronic hits
- short, punchy, readable feedback

## 12.3 Music
MVP music direction:
- optional looping retro arcade track in menus and matches
- should not overpower sound effects

Optional approach:
- music in menu only
- no music during gameplay for a more competitive feel

---

## 13. Visual Direction

## 13.1 Art Style
For MVP, use a **minimal arcade style**:
- simple rectangular paddles
- clean circular or square ball
- readable score font
- subtle screen effects if desired

## 13.2 Visual Inspirations
- Classic Pong
- Atari-style minimal arcade games
- Neon arcade reinterpretations
- Modern minimalist UI

## 13.3 VFX
Optional lightweight effects:
- small flash on paddle hit
- screen shake on score
- trail behind fast-moving ball
- score pulse animation

---

## 14. Technical Design Notes

## 14.1 Core Systems Needed
- Input system
- Paddle controller system
- Ball movement and collision system
- Score system
- Match state manager
- UI manager
- Audio manager
- AI controller

## 14.2 Recommended Scene / State Structure
Example scene structure:
- **Boot**
- **Main Menu**
- **Game**
- **Result Overlay** (or result state inside Game scene)

## 14.3 Suggested Data / Config Objects
Possible configurable data:
- Match settings
- AI difficulty parameters
- Paddle config
- Ball config
- UI text / localization strings
- Audio references

---

## 15. MVP Scope

## 15.1 MVP Features
The MVP should include:

### Core Gameplay
- Paddle movement for 2 sides
- Ball movement and bouncing
- Score system
- Match win condition
- Ball reset after score

### Modes
- 1 Player vs AI
- 2 Player local multiplayer

### UI
- Main menu
- In-game score display
- Pause menu
- Match result screen

### Audio / Polish
- Basic sound effects
- Basic visual polish
- Difficulty selection for AI

## 15.2 Out of Scope for MVP
- Online multiplayer
- Cosmetics / skins
- Progression / unlocks
- Power-up mode
- Tournament mode
- Achievements
- Spectator mode
- Advanced analytics / stats history

---

## 16. Post-MVP Roadmap

## Phase 2
- Better visual polish
- Arena themes / skins
- More AI personalities
- Configurable match rules
- Controller / gamepad support

## Phase 3
- Power-ups
- Multiple balls mode
- Survival / challenge mode
- Training mode
- Replay / highlights system

## Phase 4
- Online multiplayer
- Ranked mode
- Leaderboards
- Seasonal events / cosmetic rewards

---

## 17. Risks & Design Considerations

## 17.1 Main Risks
1. **Gameplay feels too flat**
   - Mitigation: use variable bounce angles and gradual speed increase.

2. **AI feels unfair**
   - Mitigation: add reaction delay, speed caps, and error margin.

3. **Matches become repetitive too quickly**
   - Mitigation: keep rallies fast, add difficulty tuning, and consider post-MVP modifiers.

4. **Controls feel sluggish**
   - Mitigation: prioritize responsiveness over realism.

## 17.2 Design Priorities
If tradeoffs are needed, prioritize:
1. Control responsiveness
2. Ball readability
3. Fair and fun bounce behavior
4. Quick restart / low friction UX
5. Visual polish after gameplay is solid

---

## 18. Success Criteria

The MVP is successful if:
- A player can understand the rules in under 30 seconds.
- Matches feel responsive and fair.
- Solo mode is fun across at least 3 AI difficulties.
- Local multiplayer works reliably.
- A full match can be completed without major bugs.
- The game is polished enough to be shared publicly as a portfolio or learning project.

---

## 19. Sample Development Milestones

## Milestone 1 — Core Prototype
- Paddle movement
- Ball movement
- Wall bounce
- Paddle collision
- Score detection

## Milestone 2 — Playable Match
- Match reset flow
- Win condition
- HUD score
- Restart loop

## Milestone 3 — Single Player
- AI paddle
- Difficulty tuning
- Menu flow

## Milestone 4 — Polish Pass
- Audio
- UI improvements
- Visual effects
- Better balancing
- Bug fixes

---

## 20. Appendix

## 20.1 Example Tunable Variables Table

| Variable | Description | Example Value |
|---|---|---:|
| `paddleSpeed` | Paddle vertical movement speed | 500 |
| `paddleHeight` | Paddle height | 120 |
| `ballStartSpeed` | Initial ball speed | 350 |
| `ballMaxSpeed` | Maximum ball speed | 800 |
| `ballSpeedIncreasePerHit` | Speed gain after paddle collision | 15 |
| `scoreToWin` | Match win target | 10 |
| `serveDelaySeconds` | Delay before ball relaunch | 1.0 |
| `aiEasyReactionDelay` | AI easy response delay | 0.25 |
| `aiNormalReactionDelay` | AI normal response delay | 0.12 |
| `aiHardReactionDelay` | AI hard response delay | 0.05 |

## 20.2 Short One-Sentence Pitch
**Pong Reimagined** is a polished arcade sports game where players battle in fast-paced paddle duels, deflecting an increasingly dangerous ball to outscore their opponent.

