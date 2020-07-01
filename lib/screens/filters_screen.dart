import 'package:flutter/material.dart';
import 'package:meal_app/screens/my_drawer_screen.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters-screen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(
    this.currentFilters,
    this.saveFilters,
  );

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegitrian = false;
  var _vegan = false;
  var _lactosFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegitrian = widget.currentFilters['vegetrian'];
    _vegan = widget.currentFilters['vegan'];
    _lactosFree = widget.currentFilters['lactos'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String subTitle,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(subTitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawerScreen(),
      appBar: AppBar(
        title: Text('Your filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactos': _lactosFree,
                'vegan': _vegan,
                'vegetrian': _vegitrian,
              };

              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals!',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegitrian',
                  'Only include Vegitrian meals!',
                  _vegitrian,
                  (newValue) {
                    setState(() {
                      _vegitrian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals!',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactos-free',
                  'Only include lactos-free meals!',
                  _lactosFree,
                  (newValue) {
                    setState(() {
                      _lactosFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
