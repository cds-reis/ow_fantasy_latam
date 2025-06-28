// ignore_for_file: avoid_print // Script outside of Flutter

import 'dart:io';

void main() {
  print('=== Player Score Calculator ===');
  print("This calculator determines a player's score from a match.");

  // Get number of maps
  final numberOfMaps = getNumberOfMaps();

  // Initialize total stats
  var totalKills = 0;
  var totalDeaths = 0;
  var totalHealing = 0;
  var totalDamage = 0;

  // Collect data for each map
  for (var mapNumber = 1; mapNumber <= numberOfMaps; mapNumber++) {
    print('\n--- Map $mapNumber ---');

    final kills = getPlayerStat('kills');
    final deaths = getPlayerStat('deaths');
    final damage = getPlayerStat('damage');
    final healing = getPlayerStat('healing');

    // Add to totals
    totalKills += kills;
    totalDeaths += deaths;
    totalHealing += healing;
    totalDamage += damage;

    // Show map summary
    final killPoints = (kills ~/ 3) * 1;
    final deathPoints = deaths * -1;
    final healingPoints = (healing ~/ 2000) * 0.5;
    final damagePoints = (damage ~/ 2000) * 0.5;
    print('Map $mapNumber Summary:');
    print('  Kills: $kills');
    print('  Kill Points: ${killPoints.toStringAsFixed(2)} points');
    print('  Deaths: $deaths');
    print('  Death Points: ${deathPoints.toStringAsFixed(2)} points');
    print('  Damage: $damage');
    print('  Damage Points: ${damagePoints.toStringAsFixed(2)} points');
    print('  Healing: $healing');
    print('  Healing Points: ${healingPoints.toStringAsFixed(2)} points');
    print(
      '  Score: ${calculatePlayerScore(kills, deaths, healing, damage).toStringAsFixed(2)} points',
    );
  }

  // Calculate final score
  final finalScore = calculatePlayerScore(
    totalKills,
    totalDeaths,
    totalHealing,
    totalDamage,
  );

  // Display results
  print('\n=== FINAL RESULTS ===');
  print('Total Kills: $totalKills');
  print('Total Deaths: $totalDeaths');
  print('Total Damage: $totalDamage');
  print('Total Healing: $totalHealing');
  print('\nFinal Player Score: ${finalScore.toStringAsFixed(2)} points');

  // Show score breakdown
  print('\nScore Breakdown:');
  final killPoints = (totalKills ~/ 3) * 1;
  final deathPoints = totalDeaths * -1;
  final healingPoints = (totalHealing ~/ 2000) * 0.5;
  final damagePoints = (totalDamage ~/ 2000) * 0.5;

  print('  Kills: $totalKills kills = ${killPoints.toStringAsFixed(2)} points');
  print(
    '  Deaths: $totalDeaths deaths = ${deathPoints.toStringAsFixed(2)} points',
  );
  print(
    '  Damage: $totalDamage damage = ${damagePoints.toStringAsFixed(2)} points',
  );
  print(
    '  Healing: $totalHealing healing = ${healingPoints.toStringAsFixed(2)} points',
  );
}

int getNumberOfMaps() {
  while (true) {
    stdout.write('Enter the number of maps in the match: ');
    final input = stdin.readLineSync();

    if (input != null) {
      final numberOfMaps = int.tryParse(input);
      if (numberOfMaps != null && numberOfMaps > 0) {
        return numberOfMaps;
      }
    }

    print('Please enter a valid number.');
  }
}

int getPlayerStat(String statName) {
  while (true) {
    stdout.write('Enter the amount of $statName: ');
    final input = stdin.readLineSync();

    if (input != null) {
      final stat = int.tryParse(input);
      if (stat != null && stat >= 0) {
        return stat;
      }
    }

    print('Please enter a valid non-negative number.');
  }
}

double calculatePlayerScore(int kills, int deaths, int healing, int damage) {
  // For each 3 kills, receive 0.5 points
  final killPoints = (kills ~/ 3) * 1;

  // For each death, receive -0.5 points
  final deathPoints = deaths * -1;

  // For each 2000 healing, receive 0.5 points
  final healingPoints = (healing ~/ 2000) * 0.5;

  // For each 2000 damage, receive 0.5 points
  final damagePoints = (damage ~/ 2000) * 0.5;

  return killPoints + deathPoints + healingPoints + damagePoints;
}
