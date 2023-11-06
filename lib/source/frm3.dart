import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class MyForm3 extends StatefulWidget {
  const MyForm3({Key? key}) : super(key: key);

  @override
  State<MyForm3> createState() {
    return _MyForm3();
  }
}

class _MyForm3 extends State<MyForm3> {
  final _formKey = GlobalKey<FormBuilderState>();
  String _selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView
    (
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: <Widget>[
            FormBuilderChoiceChip
            (
              name: 'Plataforma de Videojuegos',
              decoration: InputDecoration(labelText: 'Plataforma de Videojuegos'),
              options: 
              [
                FormBuilderChipOption(value: 'PlayStation', child: Text('PlayStation')),
                FormBuilderChipOption(value: 'Xbox', child: Text('Xbox')),
                FormBuilderChipOption(value: 'Nintendo', child: Text('Nintendo')),
              ],
              onChanged: (value) 
              {
                setState(() 
                {
                  _selectedOption = value.toString();
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton
            (
              onPressed: () 
              {
                showAboutDialog
                (
                  context: context, 
                  applicationName: _selectedOption, 
                );
              },
              child: const Text('Muestra la plataforma seleccionada')  ,
            ),
          ],
        ),
      ),
    );
  }
}