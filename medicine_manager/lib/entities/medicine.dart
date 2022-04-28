class Medicine {
  Medicine(
      {required this.name,
      required this.description,
      required this.quantity,
      required this.expirationDate,
      required this.scheduleHour,
      required this.values,
      required this.scheduledQuantity});

  String name;
  String description;
  String quantity;
  String expirationDate;
  String scheduleHour;
  List<bool> values;
  String scheduledQuantity;
}
