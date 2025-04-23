import 'package:flutter/material.dart';
import 'package:fotmob/database/match_dummy.dart';
import 'package:fotmob/utils/colors.dart';
import 'package:fotmob/utils/route_animations.dart';
import 'match_detail.dart';

class AllMatchesPage extends StatelessWidget {
  const AllMatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: matchList.length,
                itemBuilder: (context, index) {
                  final match = matchList[index];
                  final homeTeam = match['home_team'];
                  final awayTeam = match['away_team'];
                  final matchId = match['match_id'];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          createSlideRoute(MatchDetailPage(matchId: matchId)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blackGray,
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    homeTeam['name'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    homeTeam['logo'],
                                    width: 30,
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              children: [
                                const Text(
                                  "Full Time",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  "${homeTeam['score'].toString()} - ${awayTeam['score'].toString()}",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    awayTeam['logo'],
                                    width: 30,
                                    height: 30,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    awayTeam['name'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
