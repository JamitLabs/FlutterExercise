# Task 4: Edit and delete ToDo items

Add ways to edit and delete an existing ToDo item. Think about how people will discover and use these actions in the UI.

## Hints

1. Choose how people open the actions. For example:
   - Long-press a card to show a menu with **Edit** and **Delete**.
   - Add separate edit and delete icon buttons to the card.
   - Swipe left to delete and swipe right to edit.
   Consider how discoverable each option is and whether it works on the devices you plan to support.
2. Keep the UI for one item in [`lib/widgets/todo_item.dart`](../lib/widgets/todo_item.dart). Pass action callbacks to it from [`lib/pages/home_page.dart`](../lib/pages/home_page.dart), where the list state lives.
3. For editing, open a form with the item's current text already filled in. Save the changed item with the same ID so its completion state can stay intact.
4. For deleting, remove the chosen item by ID and rebuild the list. Think about whether users need a confirmation or an undo action.
5. Try both actions while a search query or completion filter is active, if you implemented Tasks 2 and 3.

There is no required visual design for these controls. Choose an approach you can explain and test.
