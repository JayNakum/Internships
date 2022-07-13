import 'package:flutter/material.dart';

/// A row to display all the applied filters.
class AppliedFilters extends StatelessWidget {
  final Map<String, bool> _filters;
  const AppliedFilters(this._filters, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <FilterButton>[
      if (_filters.values.any((value) => value))
        const FilterButton(name: 'Filters'),
      for (final filter in _filters.entries)
        if (filter.value) FilterButton(name: filter.key),
    ]);
  }
}

/// When the user is searching, this widget will be displayed.
/// It has the buttons to add filters to the search results.
class AddFilters extends StatefulWidget {
  const AddFilters({
    required this.filters,
    required this.applyFilter,
    Key? key,
  }) : super(key: key);

  final Map<String, bool> filters;
  final Function(String) applyFilter;

  @override
  State<AddFilters> createState() => _AddFiltersState();
}

class _AddFiltersState extends State<AddFilters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Apply Filters:',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.green,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: Wrap(
            children: [
              for (final filter in widget.filters.entries)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.applyFilter(filter.key);
                    });
                  },
                  child: FilterButton(
                    name: filter.key,
                    isApplied: filter.value,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// This class is the UI and styling of a filter.
class FilterButton extends StatelessWidget {
  final String name;
  final bool isApplied;
  const FilterButton({
    required this.name,
    this.isApplied = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(
          color: isApplied ? Colors.green : Colors.grey,
          width: 1.0,
        ),
      ),
      child: Text(
        name,
        style: isApplied
            ? const TextStyle(
                color: Colors.green,
                fontSize: 12,
              )
            : const TextStyle(
                fontSize: 12,
              ),
      ),
    );
  }
}
