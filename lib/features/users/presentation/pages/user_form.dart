import 'package:ctrl_gastos/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

const double _fieldSpacing = 25;

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulario de Usuario')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextField(
                  labelText: 'Nombres',
                  controller: _nameController,
                  hintText: 'Ej: Juan Carlos',
                  prefixIcon: Icon(Icons.person),
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: _fieldSpacing),
                CustomTextField(
                  labelText: 'Apellidos',
                  controller: _lastNameController,
                  hintText: 'Ej: Caballero Torrez',
                  prefixIcon: Icon(Icons.person),
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: _fieldSpacing),
                CustomTextField(
                  labelText: 'Email',
                  controller: _emailController,
                  hintText: 'Ej: email@extend.com',
                  prefixIcon: Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: _fieldSpacing),
                CustomTextField(
                  labelText: 'Phone',
                  controller: _phoneController,
                  hintText: 'Ej: 60660006',
                  prefixIcon: Icon(Icons.phone),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: _fieldSpacing),
                CustomTextField(
                  labelText: 'Contraseña',
                  controller: _passwordController,
                  hintText: 'Ej: ********',
                  prefixIcon: Icon(Icons.password),
                  keyboardType: TextInputType.visiblePassword,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Guardar Usuario'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/* id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    phone TEXT UNIQUE,
    password TEXT NOT NULL */