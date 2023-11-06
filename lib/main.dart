import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form1_expositootinraul_s2am/code_page.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'source/frm1.dart';
import 'source/frm2.dart';
import 'source/frm3.dart';
import 'source/frm4.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget 
{
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) 
  {
    return const MaterialApp
    (
      title: 'Raul Exposito Otin S2AM',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: 
      [
        FormBuilderLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: FormBuilderLocalizations.supportedLocales,
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget 
{
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return CodePage
    (
      title: 'Forms Raul Exposito Otin S2AM',
      child: ListView
      (
        children: <Widget>
        [
          ListTile
          (
            title: const Text('Form 1'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () 
            {
              Navigator.of(context).push
              (
                MaterialPageRoute
                (
                  builder: (context) 
                  {
                    return const CodePage
                    (
                      title: 'Form 1',
                      child: MyForm1(),
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Form 2'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push
              (
                MaterialPageRoute
                (
                  builder: (context) 
                  {
                    return const CodePage
                    (
                      title: 'Form 2',
                      child: MyForm2(),
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Form 3'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Form 3',
                      child: MyForm3(),
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile
          (
            title: const Text('Form 4'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () 
            {
              Navigator.of(context).push
              (
                MaterialPageRoute(
                  builder: (context) 
                  {
                    return const CodePage
                    (
                      title: 'Form 4',
                      child: MyForm4(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}