import 'package:flutter/material.dart';
import 'package:fotmob/database/match_dummy.dart';
import 'package:fotmob/utils/colors.dart';

class MatchDetailPage extends StatelessWidget {
  final int matchId;

  const MatchDetailPage({super.key, required this.matchId});

  @override
  Widget build(BuildContext context) {
    final matchData = matchList.firstWhere(
      (match) => match['match_id'] == matchId,
      orElse: () => {},
    );

    if (matchData.isEmpty) {
      return const Scaffold(
        backgroundColor: AppColors.black,
        body: Center(
          child: Text(
            "Pertandingan tidak ditemukan",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackGray,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Detail Pertandingan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${matchData['league']} - ${matchData['season']}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${matchData['stadium']} - ${matchData['date']} - ${matchData['time']}",
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTeamColumn(matchData['home_team']),
                const SizedBox(width: 20),
                Text(
                  "${matchData['home_team']['score']} - ${matchData['away_team']['score']}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                _buildTeamColumn(matchData['away_team']),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: matchData['events'].length,
                itemBuilder: (context, index) {
                  var event = matchData['events'][index];
                  return ListTile(
                    leading: Icon(
                      event['type'] == 'goal'
                          ? Icons.sports_soccer
                          : Icons.warning,
                      color: Colors.white,
                    ),
                    title: Text(
                      "${event['minute']}' - ${event['player']}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      event['team'],
                      style: const TextStyle(color: Colors.white70),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamColumn(Map<String, dynamic> team) {
    return Column(
      children: [
        Image.asset(team['logo'], width: 50, height: 50),
        const SizedBox(height: 5),
        Text(
          team['name'],
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}
