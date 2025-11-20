import 'package:flutter/material.dart';
import 'package:couldai_user_app/data/mock_repository.dart';
import 'package:couldai_user_app/models/game_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MOD KNOWLEDGE BASE'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              // Show info dialog
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: MockRepository.games.length,
        itemBuilder: (context, index) {
          final category = MockRepository.games[index];
          return _buildGameCategoryCard(context, category);
        },
      ),
    );
  }

  Widget _buildGameCategoryCard(BuildContext context, GameCategory category) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          category.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.videogame_asset, color: Colors.white70),
        ),
        children: category.mods.map((mod) {
          return ListTile(
            contentPadding: const EdgeInsets.only(left: 32, right: 16, bottom: 8),
            leading: Icon(
              _getIconData(mod.iconName),
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              mod.title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              mod.category,
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: mod,
              );
            },
          );
        }).toList(),
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'crosshair':
        return Icons.gps_fixed;
      case 'eye':
        return Icons.remove_red_eye;
      case 'trending_down':
        return Icons.trending_down;
      case 'diamond':
        return Icons.diamond;
      case 'flash_on':
        return Icons.flash_on;
      default:
        return Icons.code;
    }
  }
}
