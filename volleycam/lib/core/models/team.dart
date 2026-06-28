class Team {
  final String id;
  final String name;
  final String? logoPath;

  const Team({
    required this.id,
    required this.name,
    this.logoPath,
  });
}