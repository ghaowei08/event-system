class Table {
  String id;
  String name;
  double radius;
  List<String> seatIds;

  Table({
    required this.id,
    required this.name,
    this.radius = 100,
    required this.seatIds,
  });
}
