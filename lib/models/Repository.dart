class Repository {
  final int id;
  final String name;
  final String fullName;
  final String? description;
  final String owner;
  final String? avatarUrl;
  Repository({
    required this.id,
    required this.name,
    required this.fullName,
    this.description,
    required this.owner,
    this.avatarUrl,

  });
  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      id: json['id'],
      name: json['name'],
      fullName: json['full_name'],
      description: json['description'],
      owner: json['owner']['login'],
      avatarUrl: json['owner']['avatar_url'],

    );
  }
}
