# Pokemon Text Based Java Edition (pokemon-tbje)
![title_img.png](resources/title_img.png)

**A terminal-based Pokémon battle game, written in Java, complete with 241 species, faithful game mechanics, adjustable difficulty, dynamic AI, procedurally generated opponents, random wild encounters, competitive battles, and custom graphics.**

## Deploy via Docker (build → export → offline server → run)

**1. Build the image** (on a machine with internet access + Docker):
```bash
docker compose -f docker-compose.build.yml build
```

**2. Export the image** for transfer to an offline server:
```bash
docker save pokemon-tbje_pokemon:latest | gzip > pkmn.tar.gz
```

**3. Copy `pkmn.tar.gz` to the offline server** (e.g. via `scp`, USB drive, etc.), then load it:
```bash
gunzip pkmn.tar.gz
docker load -i pkmn.tar
```

**4. Run the game** on the offline server:
```bash
docker compose -f docker-compose.yml run --rm --user "$(id -u):$(id -g)" pokemon
```
Saves persist to `./saves` on the host (mounted as a volume).

## Build & Run Locally (without Docker)
Requires Java 25 and Maven.
```bash
git clone https://github.com/zachMahan64/pokemon-tbje.git
cd pokemon-tbje
mvn clean package
java -jar target/pokemon_tbje-1.0.jar
```
Optional alias for quick launching (edit the path to match your clone location):
```bash
echo 'alias pkm="cd ~/<path/to>/pokemon-tbje/ && java -jar target/pokemon_tbje-1.0.jar"' >> ~/.bashrc
source ~/.bashrc
pkm
```

## Running a Release .jar
Download the jar from the Releases section, ensure Java 25 is installed, then:
```bash
cd <path/to/your/jar>
java -jar target/pokemon_tbje-1.0.jar
```

## Terminal Tips
- Terminal size: at least ~70 rows x 120 columns
- Font size < 14.0, line spacing 1.0, monospaced font (crucial for correct graphics proportions)
- Works best on Mac/Linux terminals; on Windows, try MSYS2 to avoid character-spacing issues

## Features
- 241 Pokémon with stats, types, evolutions, moves, and sprites
- Real battle mechanics: type matchups, stat changes, status effects, weather
- Smart AI trained via custom in-engine ML multi-threaded simulation, with adjustable difficulty
- Full single-player campaign: gym leaders, wild encounters, Team Rocket, Colosseum, Elite Four
- Economy: bank, loans, stocks, gold assets, and a casino with playable mini-games
- Terminal UI using Unicode + ANSI escape strings, with dot-matrix sprite art
- Background music & sound effects via JavaFX
- Save file system to track all progress

## AI Engine
- Analyzes matchups in real-time based on game state and 30+ engine parameters
- Trained with a statistical (1-prop z-test) parameter-tweaking algorithm
- Scores moves/switches and gives live recommendations & win-probability simulations
- Difficulty scales trainer optimality: `PROFESSIONAL` rarely blunders, `EASY` is near-random

## Notes
- Assets (MP3s/sprites) are YouTube-sourced/dot-art-generated and used for educational purposes only; all rights belong to their owners.
- This was a first large coding project — parts of the codebase are rough but have been refactored over time.
- Project is on hold, but may be revisited in the future.

## Screenshots
![battle_sim_demo.png](resources/battle_sim_demo.png)
^ match-up analysis interface (and our shiny charizard)
![map.png](resources/map.png)
^ map view
![move_ratings_demo.png](resources/move_ratings_demo.png)
^ move rating interface
![rocketopolis.png](resources/rocketopolis.png)
^ the largest city in the game
![south_kanto_sea.png](resources/south_kanto_sea.png)
^ route 19, a water route along the sea
![squirtle_vs_celebi.ong.png](resources/squirtle_vs_celebi.ong.png)
^ lvl 5 squirtle vs lvl 40 celebi
![the_colosseum_outside.png](resources/the_colosseum_outside.png)
^ outside of the battle colosseum
![the_colosseum_demo.png](resources/the_colosseum_demo.png)
^ inside the colosseum — a battle rush where opponent parties scale with yours
![play_menu.png](resources/play_menu.png)
^ play menu — badges, level cap, reputation, in-game date, and difficulty
![tyranitar_vs_venusaur.png](resources/tyranitar_vs_venusaur.png)
^ tyranitar vs venusaur
![vaughan_distric_gyn.png](resources/vaughan_distric_gyn.png)
^ gym exterior
![viridian_city_gym.png](resources/viridian_city_gym.png)
^ another gym exterior
![blastoise_vs_dragonite.png](resources/blastoise_vs_dragonite.png)
^ blastoise vs dragonite
![giovanni.png](resources/giovanni.png)
^ Giovanni, one of the hardest gym leaders
![party_selection_screen.png](resources/party_selection_screen.png)
^ switching party members mid-battle
![pikachu_last_hope.png](resources/pikachu_last_hope.png)
^ last pokemon standing, indicated by `oxxxxx`
![pokedex.png](resources/pokedex.png)
^ the pokedex menu
![pokedex_list.png](resources/pokedex_list.png)
^ pokedex list — red is uncaught, green is caught
![mew_pkdx.png](resources/mew_pkdx.png)
^ pokedex entry for mew
![secret_shop.png](resources/secret_shop.png)
^ an unassuming hot dog stand that doubles as a pokemon black market
