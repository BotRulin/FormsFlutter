import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class MyForm1 extends StatefulWidget 
{
  const MyForm1({Key? key}) : super(key: key);

  @override
  State<MyForm1> createState() 
  {
    return _MyForm1();
  }
}

class _MyForm1 extends State<MyForm1> 
{
  final _formKey = GlobalKey<FormBuilderState>();

  @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FormBuilder
            (
              key: _formKey,
              child: Column
              (
                children: <Widget>
                [
                  FormBuilderTextField
                  (
                    name: 'nombre',
                    decoration: InputDecoration(labelText: 'Nombre'),
                    validator: FormBuilderValidators.required(),
                  ),
                  FormBuilderTextField
                  (
                    name: 'email',
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: FormBuilderValidators.email(),
                  ),
                  FormBuilderTextField
                  (
                    name: 'password',
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: FormBuilderValidators.compose
                    (
                      [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),
                        FormBuilderValidators.maxLength(15),
                      ],
                    ),
                  ),
                  FormBuilderDateTimePicker
                  (
                    name: 'fecha_nacimiento',
                    inputType: InputType.date,
                    decoration: InputDecoration(labelText: 'Fecha de nacimiento'),
                    validator: FormBuilderValidators.required(),
                  ),
                  FormBuilderCheckbox
                  (
                    name: 'mayor_edad',
                    title: Text('Marca la casilla si eres mayor de edad'),
                    initialValue: false,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton
                  (
                    onPressed: () 
                    {
                      Navigator.of(context).pop();
                    },
                    child: Text('Enviar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
