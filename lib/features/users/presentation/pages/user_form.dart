import 'package:ctrl_gastos/core/widgets/custom_text_field.dart';
import 'package:ctrl_gastos/features/users/data/repo_impl/user_repo_impl.dart';
import 'package:ctrl_gastos/features/users/domain/entities/user_entity.dart';
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
  bool _isObscure = true;

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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: _fieldSpacing),
                CustomTextField(
                  labelText: 'Apellidos',
                  controller: _lastNameController,
                  hintText: 'Ej: Caballero Torrez',
                  prefixIcon: Icon(Icons.person),
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese sus apellidos';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: _fieldSpacing),
                CustomTextField(
                  labelText: 'Email',
                  controller: _emailController,
                  hintText: 'Ej: email@extend.com',
                  prefixIcon: Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su correo electrónico';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: _fieldSpacing),
                CustomTextField(
                  labelText: 'Phone',
                  controller: _phoneController,
                  hintText: 'Ej: 60660006',
                  prefixIcon: Icon(Icons.phone),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su número de teléfono';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: _fieldSpacing),
                CustomTextField(
                  labelText: 'Contraseña',
                  controller: _passwordController,
                  hintText: 'Ej: ********',
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isObscure,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su contraseña';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  child: Text('Guardar Usuario'),
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Por favor complete todos los campos correctamente',
                          ),
                        ),
                      );
                    }
                    final userInfo = UserEntity(
                      name: _nameController.text,
                      lastName: _lastNameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      password: _passwordController.text,
                    );
                    final userRepo = UserRepoImpl();
                    final isCreated = await userRepo.createUser(userInfo);
                    if (isCreated) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Usuario creado exitosamente')),
                      );
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error al crear el usuario')),
                      );
                    }
                  },
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