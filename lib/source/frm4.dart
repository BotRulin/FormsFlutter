import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class MyForm4 extends StatefulWidget 
{
  const MyForm4({Key? key}) : super(key: key);

  @override
  State<MyForm4> createState() 
  {
    return _MyForm4();
  }
}

class _MyForm4 extends State<MyForm4> 
{
  final _formKey = GlobalKey<FormBuilderState>();
  List<String> _options = 
  [
    'M08',
    'M13',
    'ABP',
  ];

  @override
    Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: <Widget>
        [
          Text('Selecciona una de las opciones'),
          FormBuilderCheckboxGroup
          (
            name: 'options',
            options: _options
            .map((option) => FormBuilderFieldOption(value: option))
            .toList(),
          ),
          SizedBox(height: 20),
          ElevatedButton
          (
            onPressed: () 
            {
              if (_formKey.currentState!.saveAndValidate()) 
              {
                print(_formKey.currentState!.value);
              }
            },
            child: Text('Enviar'),
          ),
        ],
      ),
    );
  }
}