# Sorcery

An open source remake/remaster initially of the classic CRPG Wizardry, Proving Grounds of the Mad Overlord, then hopefully of the Sequels II (The Diamond Knight), III (Legacy of Llylgamyn), and V (Heart of the Maelstrom). Currently under heavy development with a release hopefully later in 2025.

~~Written using SFML, TGUI, and C++.~~

Written using ImGui/SDL2/OpenGL and C++
<br>(*Note that some re-engineering is currently in progress to move to a more flexible/easier-to-use UI stack This should not affect the aimed release date of late 2025!<p>For daily updates and progress on that see the [sdl/imgui branch](https://github.com/davemoore22/sorcery/tree/sdl/imgui)*)

**(Updated 16th August 2025)**

![](/promo/screen7.png)
![](/promo/screen25.png)
![](/promo/screen23.png)
![](/promo/screen20.png)
![](/promo/screen18.png)
![](/promo/screen15.png)

## Progress Update

* ~~Load/Save/New Game~~ (DONE)
* ~~Town/Castle Menus~~ (DONE)
* ~~Character Creation~~ (DONE)
* ~~Character Editing~~ (DONE)
* ~~Party/Expedition Management~~ (DONE)
* ~~Maze Generation and Navigation~~ (DONE)
* ~~Dungeon Features~~ (DONE)
* ~~Automapping~~ (DONE)
* ~~Keyboard/Mouse/Gamepad Control~~ (DONE)
* ~~Context-Sensitive-Help~~ (DONE)
* ~~Gilgamesh's Tavern~~ (DONE)
* ~~Adventurer's Inn~~ (DONE)
* ~~Levelling up/Changing Class~~ (DONE)
* ~~Temple~~ (DONE)
* ~~Wipe Handling~~ (DONE)
* ~~Dungeon Events~~ (DONE)
* ~~Compendium~~ (DONE)
* **Inventory and Item Manipulation (DOING)**
* **Special Item Powers and Handling (DOING)**
* **Boltac's Equipment Shop (DOING)**
* Creatures and NPCs (TO DO)
* Magic and Combat (TO DO)
* Victory Handling (TO DO)
* Strict (Legacy) Mode (TO DO)
* Achivements (TO DO)
* Optional Textured/Rendered 3D View (TO DO)

## Wishlist

* Sequels (II, III, V)
* Procedurally-Generated Infinite Content (like Diablo)
* Modding
* Plugin/3D Graphics

## What next? (as of August 2025)

Currently adding Item Usage/Invocation, as well as buying, selling, uncursing, and identifying at Boltac's. Normal inventory management has been mosty completed!

Initially I am planning to remake Wizardry 1, then adding 2 and 3, and then subsequently providing infinite procedurally-generated content like that of Diablo for example. In the meantime, check out Snarfu's bugfix and recompilation of the original Wizardry for Apple II at <https://github.com/snafaru>.

## Compilation

I'm currently developing solely on Linux (Ubuntu 24) so compilation instructions are currently Linux-specific. Windows instructions and releases will of course be supported at a later date.

Full compilation instructions for Linux are in the [doc/COMPILE](/doc/COMPILE) file. C++23 compiler support is required (currently using GCC 14.2).

### Quick Build (Ubuntu 24.04)

```bash
# Install build dependencies
sudo apt install build-essential cmake pkg-config git \
    libsdl2-dev libsdl2-image-dev libglew-dev libgl1-mesa-dev \
    libglm-dev libjsoncpp-dev libsqlite3-dev libfmt-dev uuid-dev \
    libavcodec-dev libavformat-dev libavdevice-dev libavfilter-dev \
    libswscale-dev libswresample-dev libavutil-dev

# Clone ImGui and addons (not included in repo)
mkdir -p ext
git clone --depth 1 https://github.com/ocornut/imgui ext/imgui
git clone --depth 1 https://github.com/cfillion/imgui-toggle ext/imgui_toggle
git clone --depth 1 https://github.com/Flix01/imgui_sugar ext/imgui_sugar
git clone --depth 1 https://github.com/dalerank/imspinner ext/imgui_spinner

# Download stb_image header
mkdir -p ext/stb
wget -O ext/stb/stb_image.h https://raw.githubusercontent.com/nothings/stb/master/stb_image.h

# Build
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build -j$(nproc)

# Binary is at: build/sorcery
```

### Runtime Dependencies

To run the game on another Linux system, install these runtime packages:

```bash
sudo apt install libsdl2-2.0-0 libglew2.2 libgl1 libjsoncpp25 \
    libsqlite3-0 libfmt9 uuid-runtime \
    libavcodec60 libavformat60 libavutil58 libswscale7 libswresample4
```

Then copy the `build/sorcery` binary along with the `cfg/`, `dat/`, `gfx/`, `vfx/`, and `doc/` directories to the target system.

All code is released under the GPL - see the [doc/LICENSE](/doc/LICENSE) file for full details.

## Contact and Help

All comments and criticism and help welcome. You can find me as *Typhon* on the C++ Help and DungeonCrawlers.org Discord Servers, or my email address is on the Splash Screen of the Game.

## Credits

Graphics used (all free/open source) are by:

* とり夫 - <https://www.pixiv.net/en/users/5887541>
* Nicolae Berbece - <https://thoseawesomeguys.com/prompts/>
* Justin Nichol - <https://opengameart.org/users/justin-nichol>
* Various - <https://game-icons.net/>

Game font is based upon the DOS Wizardry V font.

## Videos

Watch some (older) gameplay:

[![Compendium Browsing](https://img.youtube.com/vi/TSj7Rw3l3Iw/maxresdefault.jpg)](https://youtu.be/TSj7Rw3l3Iw)
[![Entering the Dungeon](https://img.youtube.com/vi/AQ9LhK0ta8A/maxresdefault.jpg)](https://youtu.be/AQ9LhK0ta8A)
[![Dungeon Events](https://img.youtube.com/vi/RG25iYrPBlg/maxresdefault.jpg)](https://youtu.be/RG25iYrPBlg)

See other gameplay videos at <https://www.youtube.com/channel/UCEkmGGFyxu5vH6xAHej3Dag>

## Screenshots

![](/promo/screen1.png)
![](/promo/screen24.png)
![](/promo/screen22.png)
![](/promo/screen16.png)
![](/promo/screen21.png)
![](/promo/screen17.png)
![](/promo/screen5.png)
![](/promo/screen14.png)
![](/promo/screen8.png)
![](/promo/screen13.png)
![](/promo/screen12.png)
![](/promo/screen11.png)
![](/promo/screen9.png)
![](/promo/screen10.png)
![](/promo/screen6.png)
![](/promo/screen2.png)
![](/promo/screen3.png)
![](/promo/screen4.png)
