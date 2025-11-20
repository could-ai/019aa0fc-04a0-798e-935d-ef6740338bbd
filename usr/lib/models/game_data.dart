class GameMod {
  final String id;
  final String title;
  final String category;
  final String description;
  final String technicalExplanation;
  final String detectionMethod;
  final String riskLevel;
  final String iconName;

  const GameMod({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.technicalExplanation,
    required this.detectionMethod,
    required this.riskLevel,
    required this.iconName,
  });
}

class GameCategory {
  final String id;
  final String name;
  final String imageAsset;
  final List<GameMod> mods;

  const GameCategory({
    required this.id,
    required this.name,
    required this.imageAsset,
    required this.mods,
  });
}
