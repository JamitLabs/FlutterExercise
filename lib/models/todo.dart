class ToDo {
  const ToDo({
    required this.id,
    required this.text,
    this.isDone = false,
  });

  final int id;
  final String text;
  final bool isDone;

  /// Creates a new [ToDo] instance with the given values. If a value is `null`,
  /// the corresponding value of this [ToDo] will be used.
  ToDo copyWith({
    int? id,
    String? text,
    bool? isDone,
  }) {
    return ToDo(
      id: id ?? this.id,
      text: text ?? this.text,
      isDone: isDone ?? this.isDone,
    );
  }
}
