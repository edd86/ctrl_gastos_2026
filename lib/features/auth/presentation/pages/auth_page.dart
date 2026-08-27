import 'package:ctrl_gastos/core/routes/app_routes.dart';
import 'package:ctrl_gastos/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:ctrl_gastos/features/auth/domain/entities/auth_info_entity.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                'Bienvenido a Ctrl Gastos',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: isObscure,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 35),
              ElevatedButton(
                child: Text('Iniciar sesión', style: TextStyle(fontSize: 18)),
                onPressed: () async {
                  final repo = AuthRepoImpl();
                  final authInfo = AuthInfoEntity(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  try {
                    final isAuthenticated = await repo.login(authInfo);
                    if (isAuthenticated) {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Credenciales incorrectas')),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${e.toString()}')),
                    );
                  }
                },
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.userForm);
                },
                child: Text('Registrarse', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
