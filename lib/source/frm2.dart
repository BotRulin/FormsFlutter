import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MyForm2 extends StatefulWidget 
{
  const MyForm2({Key? key}) : super(key: key);

  @override
  State<MyForm2> createState() 
  {
    return _MyForm2();
  }
}

class _MyForm2 extends State<MyForm2> {
  final _formKey = GlobalKey<FormBuilderState>();
  String league = '';
  String club = '';
  List<String> clubes = [];

  @override
  void initState() 
  {
    league = _allLeagues.first;
    club = _allClubsSpain.first;
    clubes = _allClubsSpain;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: <Widget>
        [
          const SizedBox(height: 20),
          FormBuilderDropdown<String>
          (
            name: 'Football League',
            decoration: const InputDecoration
            (
              label: Text('Football League'),
            ),
            initialValue: league,
            onChanged: (value) 
            {
              setState(() 
              {
                league = value ?? '';
                club = '';
                changeLeagues();
              });
            },
            items: _allLeagues
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
          ),
          const SizedBox(height: 10),
          FormBuilderDropdown<String>
          (
            name: 'club',
            decoration: const InputDecoration
            (
              label: Text('Clubes'),
            ),
            initialValue: club,
            items: clubes
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
          ),
          const SizedBox(height: 10),
          MaterialButton
          (
            color: Theme.of(context).colorScheme.secondary,
            child: const Text
            (
              "Enviar",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () 
            {
              _formKey.currentState!.saveAndValidate();
              debugPrint(_formKey.currentState?.instantValue.toString() ?? '');
            },
          ),
        ],
      ),
    );
  }

  void changeLeagues() 
  {
    switch (league) 
    {
      case 'La Liga':
        clubes = _allClubsSpain;
        break;
      case 'Premier League':
        clubes = _allClubsEngland;
        break;
      default:
        clubes = [];
    }
  }
}

const _allLeagues = 
[
  'La Liga',
  'Premier League',
];

const _allClubsSpain = 
[
  'Real Madrid',
  'Barcelona',
  'Atletico Madrid',
  'Sevilla',
  'Real Sociedad',
  'Villarreal',
  'Real Betis',
  'Athletic Bilbao',
  'Celta Vigo',
  'Granada',
  'Valencia',
  'Levante',
  'Cadiz',
  'Osasuna',
  'Getafe',
  'Alaves',
  'Elche',
  'Huesca',
  'Eibar',
];

const _allClubsEngland = 
[
  'Manchester City',
  'Manchester United',
  'Leicester City',
  'Chelsea',
  'West Ham United',
  'Liverpool',
  'Tottenham Hotspur',
  'Everton',
  'Arsenal',
  'Leeds United',
  'Aston Villa',
  'Newcastle United',
  'Wolverhampton Wanderers',
  'Crystal Palace',
  'Southampton',
  'Burnley',
  'Brighton & Hove Albion',
  'Fulham',
  'West Bromwich Albion',
  'Sheffield United',
];
