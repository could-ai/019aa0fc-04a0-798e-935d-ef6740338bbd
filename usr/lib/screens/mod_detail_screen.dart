import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/game_data.dart';

class ModDetailScreen extends StatelessWidget {
  const ModDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mod = ModalRoute.of(context)!.settings.arguments as GameMod;

    return Scaffold(
      appBar: AppBar(
        title: Text(mod.title.toUpperCase()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, mod),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'How It Works'),
            _buildInfoCard(context, mod.technicalExplanation, Icons.memory),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Detection Methods'),
            _buildInfoCard(context, mod.detectionMethod, Icons.security, isWarning: true),
            const SizedBox(height: 24),
            _buildRiskIndicator(context, mod.riskLevel),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, GameMod mod) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.2),
            Colors.transparent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.science,
            size: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mod.category,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  mod.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String content, IconData icon, {bool isWarning = false}) {
    final color = isWarning ? Colors.orange : Colors.blueGrey;
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                content,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRiskIndicator(BuildContext context, String risk) {
    Color riskColor;
    if (risk.toLowerCase().contains('high')) {
      riskColor = Colors.red;
    } else if (risk.toLowerCase().contains('medium')) {
      riskColor = Colors.orange;
    } else {
      riskColor = Colors.green;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: riskColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: riskColor.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'ACCOUNT RISK LEVEL',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            risk.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: riskColor,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
