# Task 2: Search

Add a search bar that filters the ToDo list as the user types.

## Hints

1. Start in [`lib/pages/home_page.dart`](../lib/pages/home_page.dart). Place a `TextField` above the list in the page body. If you use a `Column`, give the `ListView` room with `Expanded`.
2. Use `onChanged` to store the current query in `_HomePageState` and rebuild the visible list.
3. Filter `_todos` when building the list. Keep the original list intact so clearing the query shows every item again.
4. Compare the item text and query in lowercase if the search should ignore capitalization. `contains` handles partial matches.
5. Try an empty query, a partial match, different capitalization, and a query with no matches.

If you choose a `TextEditingController` instead of `onChanged`, dispose of it with the widget's state.
