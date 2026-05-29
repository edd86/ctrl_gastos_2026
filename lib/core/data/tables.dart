List<String> tables = [
  '''CREATE TABLE users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    phone TEXT UNIQUE,
    password TEXT NOT NULL
  )''',
  '''CREATE TABLE accounts(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    amount REAL DEFAULT 0.0 CHECK(amount >= 0),
    type TEXT NOT NULL CHECK(type IN('bank', 'cash', 'saving', 'investment')),
    currency TEXT NOT NULL CHECK(currency IN('USD', 'EUR', 'BOB')),
    user_id INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
  )''',
  '''CREATE TABLE transactionss(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    account_id INTEGER NOT NULL, 
    amount REAL NOT NULL CHECK(amount > 0),
    type TEXT NOT NULL CHECK(type IN('transfer', 'deposit', 'cash', 'income', 'expense')),
    description TEXT,
    destination_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (account_id) REFERENCES accounts(id),
    FOREIGN KEY (destination_id) REFERENCES accounts(id)
    )''',
];
