import 'package:flutter/material.dart';
import 'package:meals_app/components/main_drawer.dart';
import 'package:meals_app/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem glutén',
                  'Exibe apenas refeições sem glutén',
                  widget.settings.isGlutenFree,
                      (value) => setState(() {
                    widget.settings.isGlutenFree = value;
                  }),
                ),
                _createSwitch(
                  'Sem lactose',
                  'Exibe apenas refeições sem lactose',
                  widget.settings.isLactoseFree,
                      (value) => setState(() {
                    widget.settings.isLactoseFree = value;
                  }),
                ),
                _createSwitch(
                  'Veganas',
                  'Exibe apenas refeições veganas',
                  widget.settings.isVegan,
                      (value) => setState(() {
                    widget.settings.isVegan = value;
                  }),
                ),
                _createSwitch(
                  'Vegetarianas',
                  'Exibe apenas refeições vegetarianas',
                  widget.settings.isVegetarian,
                      (value) => setState(() {
                    widget.settings.isVegetarian = value;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Cria os swistches apresentados na tela
  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        // Método acionado ao alterar o switch
        onChanged(
            value); // Método que cada switch disparou para este _createSwicth
        widget.onSettingsChanged(
            widget.settings); // Método que fará a atualização do estado da lista no escopo da main
      },
    );
  }
}
