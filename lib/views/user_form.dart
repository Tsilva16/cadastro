import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Usuario'),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid){
                _form.currentState!.save();
              Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration:InputDecoration(labelText:'Nome'),
                validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return'Ocorreu um erro';
                  }
                  if(value.trim().length < 5){
                    return 'Nome muito pequeno. Minimo 5 letras';
                  }
                  return null;
                },
                onSaved: (value){
                  print(value);
                },
              ),
              TextFormField(
                decoration:InputDecoration(labelText:'E-mail'),
              ),
              TextFormField(
                decoration:InputDecoration(labelText:'URL do Avatar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}