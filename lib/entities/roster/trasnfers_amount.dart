extension type const TransfersAmount(int value) {
  static const TransfersAmount zero = TransfersAmount(0);

  bool hasSpace(int amountOfChanges) => value >= amountOfChanges;
}
