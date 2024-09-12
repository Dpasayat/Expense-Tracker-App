import 'package:expense_tracker/widgets/expences_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoved,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoved;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(expenses[index]),
              background: Container(
                alignment: Alignment.centerRight,
                color: Theme.of(context).colorScheme.error,
                margin: Theme.of(context).cardTheme.margin,
                child: Container(
                    padding: const EdgeInsets.all(16),
                    child: const Icon(Icons.delete)),
              ),
              onDismissed: (dirextion) {
                onRemoved(expenses[index]);
              },
              child: ExpenseItem(expenses[index]),
            ));
  }
}
