# Task 1: ToDo item UI

Show every ToDo item as a card. Strike through its text when the checkbox is checked.

## Hints

1. Start in [`lib/widgets/todo_item.dart`](../lib/widgets/todo_item.dart). The `ToDoItem` widget already receives the item and builds its text and checkbox.
2. Wrap the existing row in a Flutter `Card` so every item uses the same presentation.
3. The checkbox already reads `todo.isDone` and calls `onIsDoneChanged`. Use that same value to choose the `Text` widget's decoration: `TextDecoration.lineThrough` when true and `TextDecoration.none` when false.
4. Check both states in the running app. Toggling the checkbox should update the text immediately, and the card should remain visible in either state.

The presentation screenshot is a visual example; matching its exact spacing and colors is optional.
