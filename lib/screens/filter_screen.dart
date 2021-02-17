import 'package:flutter/material.dart';
import 'package:imj_recipes/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  'Gluten-Free', 'Only include Gluten-Free Meal.', _glutenFree,
                  (newValue) {
                setState(() {
                  setState(() {
                    _glutenFree = newValue;
                  });
                });
              }),
              buildSwitchListTile(
                  'Vegetarian', 'Only include Vegetarian Meal.', _vegetarian,
                  (newValue) {
                setState(() {
                  setState(() {
                    _vegetarian = newValue;
                  });
                });
              }),
              buildSwitchListTile('Vegan', 'Only include Vegan Meal.', _vegan,
                  (newValue) {
                setState(() {
                  setState(() {
                    _vegan = newValue;
                  });
                });
              }),
              buildSwitchListTile('Lactose-Free',
                  'Only include Lactose-Free Meal.', _lactoseFree, (newValue) {
                setState(() {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
