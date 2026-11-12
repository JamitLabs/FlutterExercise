# Task 3: Filter

Let the user show all, completed, or incomplete ToDo items.

## Hints

1. Start in [`lib/pages/home_page.dart`](../lib/pages/home_page.dart). Represent the three choices with an `enum` or another small set of distinct values.
2. Add a selection control, such as `DropdownButton`, above the list. Store the selected value in `_HomePageState` so changing it rebuilds the list.
3. Apply a condition to each item's `isDone` value: all keeps every item, completed keeps true items, and incomplete keeps false items.
4. If Task 2's search is present, apply both conditions to the same `_todos` list. Clear the search and switch between all three choices to check the result.

Task 3 is optional if time is short.
