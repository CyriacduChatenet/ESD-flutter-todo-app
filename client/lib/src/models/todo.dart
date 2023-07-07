enum TodoState {
  pending,
  inProgress,
  done,
}

class Todo {
  Todo({
    required this.id,
    required this.title,
    this.description,
    required this.state,
  });

  final String id;
  late final String title;
  late final String? description;

  late final TodoState state;

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, description: $description, state: $state}';
  }
}
