import 'package:couldai_user_app/models/game_data.dart';

class MockRepository {
  static const List<GameCategory> games = [
    GameCategory(
      id: 'fps_tactical',
      name: 'Tactical Shooters',
      imageAsset: 'assets/tactical.jpg',
      mods: [
        GameMod(
          id: 'aim_assist',
          title: 'Aim Assistance Logic',
          category: 'Input Manipulation',
          description: 'Automated cursor movement towards targets.',
          technicalExplanation: 'These mods typically read memory addresses containing entity coordinates (X, Y, Z) and calculate the angle required for the local player\'s view to intersect with the target entity. They then simulate mouse input or write directly to the view angle memory addresses.',
          detectionMethod: 'Heuristic analysis of mouse movement patterns (perfect straight lines, inhuman reaction times) and memory integrity scans.',
          riskLevel: 'High',
          iconName: 'crosshair',
        ),
        GameMod(
          id: 'wall_esp',
          title: 'ESP / Wall Rendering',
          category: 'Rendering',
          description: 'Visualizing entities through solid obstacles.',
          technicalExplanation: 'Extra Sensory Perception (ESP) works by hooking into the game\'s rendering loop (e.g., DirectX or OpenGL). It iterates through the entity list in memory, projects their 3D coordinates to 2D screen space, and draws an overlay box or skeleton on top of the game frame.',
          detectionMethod: 'Screenshot analysis (BitBlt hooks) and checking for unauthorized overlays or code injection into the rendering pipeline.',
          riskLevel: 'Medium',
          iconName: 'eye',
        ),
      ],
    ),
    GameCategory(
      id: 'battle_royale',
      name: 'Battle Royale',
      imageAsset: 'assets/br.jpg',
      mods: [
        GameMod(
          id: 'recoil_script',
          title: 'Recoil Compensation',
          category: 'Scripting',
          description: 'Automatically countering weapon recoil patterns.',
          technicalExplanation: 'Scripts (often Lua or Python external macros) move the mouse cursor down in a specific pattern that mirrors the weapon\'s recoil spray. Unlike memory hacks, these often run externally and just simulate hardware input.',
          detectionMethod: 'Pattern matching on input timing and consistency. Statistical analysis of spray control variance.',
          riskLevel: 'Low to Medium',
          iconName: 'trending_down',
        ),
        GameMod(
          id: 'loot_esp',
          title: 'Item/Loot ESP',
          category: 'Data Reading',
          description: 'Highlighting high-tier loot locations.',
          technicalExplanation: 'Reads the object manager in the game\'s memory heap to identify item classes. It filters for specific "Legendary" or "High Tier" IDs and renders their location on screen.',
          detectionMethod: 'Memory scanning and integrity checks.',
          riskLevel: 'Medium',
          iconName: 'diamond',
        ),
      ],
    ),
    GameCategory(
      id: 'arena_shooter',
      name: 'Arena Shooters',
      imageAsset: 'assets/arena.jpg',
      mods: [
        GameMod(
          id: 'trigger_bot',
          title: 'Trigger Bot',
          category: 'Automation',
          description: 'Automatically firing when crosshair is over an enemy.',
          technicalExplanation: 'Monitors the "crosshair ID" or performs a raycast check in memory. If the entity under the crosshair matches an enemy team ID, it sends a "Mouse Down" event instantly.',
          detectionMethod: 'Reaction time analysis (0ms reactions are impossible for humans) and input stream monitoring.',
          riskLevel: 'High',
          iconName: 'flash_on',
        ),
      ],
    ),
  ];
}
