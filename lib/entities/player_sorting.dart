enum PlayerSorting {
  totalPoints('Total Points'),
  roundPoints('Round Points'),
  priceAsc('Price Asc'),
  priceDesc('Price Desc')
  // mostSelected('Most Selected')
  ;

  const PlayerSorting(this.title);

  final String title;
}
