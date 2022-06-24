class TodoModel {
  late final String id;
  final String description;
  final bool completed;
  TodoModel({
    required this.id,
    required this.description,
    this.completed = false,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'completed': completed,      
      };
  static TodoModel fromJson(Map<String, dynamic> json) =>
      TodoModel(id: json['id'], description: json['description'],completed:json['completed']);
}
