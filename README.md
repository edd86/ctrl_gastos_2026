# Ctrl Gastos

Aplicación Flutter para el control de gastos personales multi-usuario.

## Estado actual

- **Base de datos SQLite** configurada con tablas para usuarios, cuentas y transacciones.
- **Tema Material 3** definido con colores personalizados (modo claro/oscuro).
- **UI inicial** con pantalla de bienvenida pendiente de desarrollo.
- **Capa de dominio** pendiente de implementación.

## Stack tecnológico

| Componente | Elección |
|---|---|
| Framework | Flutter (Material Design 3) |
| Lenguaje | Dart 3.11+ |
| Base de datos | SQLite (sqflite) |
| Estado | Pendiente de definir |

## Esquema de base de datos

- **users**: id, name, last_name, email (único), phone (único), password
- **accounts**: id, name, amount (>= 0), type (bank/cash/saving/investment), currency (USD/EUR/BOB), user_id (FK)
- **transactions**: id, user_id (FK), account_id (FK), amount (> 0), type, description, destination_id (FK nullable)

## Próximos pasos

- [ ] Pantalla de login/registro
- [ ] CRUD de cuentas
- [ ] Registro de transacciones
- [ ] Dashboard con resumen de gastos

## Getting Started

```bash
flutter pub get
flutter run
```
