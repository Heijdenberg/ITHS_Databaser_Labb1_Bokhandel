# Bookstore Database – DB Lab 1

This repository contains a relational database for a small bookstore, created as part of a database assignment. 

The main focus of the project is:

- Clean relational modelling and **3rd normal form (3NF)**
- Proper use of **primary keys**, **foreign keys**, and **constraints**
- Using **T-SQL** (SQL Server) with **views** and **stored procedures**
- Simple reporting and business logic (sales statistics, stock movement between stores)

---

## Repository structure

```text
.
├── Sql/          # T-SQL scripts (tables, views, procedures, seed data)
├── img/          # Diagrams (Miro conceptual model, SSMS schema)
└── README.md     # This file
```

### Diagrams

- **Miro diagram** – high-level conceptual / ER model used during early design.
<img src="https://raw.githubusercontent.com/Heijdenberg/ITHS_Databaser_Labb1_Bokhandel/refs/heads/master/img/bookstore-miro.png"/>

- **SSMS diagram** – physical schema as implemented in SQL Server, showing tables, PK/FK relations and cardinalities.
<img src="https://raw.githubusercontent.com/Heijdenberg/ITHS_Databaser_Labb1_Bokhandel/refs/heads/master/img/bookstore-ssms.png"/>

---

## Technology

- **Database:** Microsoft SQL Server  
- **Query language:** T-SQL  
- **Tools:** SQL Server Management Studio (SSMS)  
- **Naming:** Table and column names are in **Swedish**, documentation and comments are in **English**.

---

## Database design overview

> Table names are shown as they appear in the SQL scripts (Swedish), with an English explanation.

### Core entities

- **`[Förlag]`** – *Publishers*  
  - `Id` as primary key  
  - `Namn` for the publisher name

- **`[Böcker]`** – *Books*  
  - `ISBN` (13 digits, validated with a CHECK constraint) – primary key  
  - `Titel`, `Språk`, `Pris`, `Utgivningsdatum`  
  - `Förlag` – foreign key to `[Förlag]([Id])`

- **`[Författare]`** – *Authors*  
  - `Id` as primary key  
  - `Förnamn`, `Efternamn`

- **(Optional junction)** `BöckerFörfattare` – *Book–Author*  
  - Junction table between `[Böcker]` and `[Författare]`  
  - Supports many-to-many: one book with multiple authors, one author with multiple books

### Stores and inventory

- **`[Butiker]`** – *Stores / Shops*  
  - Basic info about each physical bookstore

- **`[LagerSaldo]`** – *Inventory per store and book*  
  - Links `[Butiker]` and `[Böcker]`  
  - Contains `Antal` – how many copies of a given book are available in a given store

### Customers and sales

- **`[Kunder]`** – *Customers*  
  - Customer details (name, contact info, etc.)

- **`[Försäljningar]`** – *Sales / Orders*  
  - One row per sale  
  - Contains `OrderDatum`, references to store and customer

- **`[FörsäljningsDetaljer]`** – *Order lines / Sales details*  
  - One row per book in a sale  
  - Includes `ISBN`, `Antal` (quantity), and price at time of sale  
  - Foreign keys to both `[Böcker]` and `[Försäljningar]`

The design keeps **redundancy low** and aims for **3NF**:

- No repeating groups
- All non-key attributes depend on the key, the whole key, and nothing but the key
- Many-to-many relationships (e.g. Books–Authors) are handled via dedicated junction tables

---

## Views

### `vw_BockerForraManadenAgg`

Aggregates how many copies of each book were sold **during the previous calendar month**.

- Joins:
  - `[FörsäljningsDetaljer]` – order lines
  - `[Böcker]` – to get book titles
  - `[Försäljningar]` – to filter on `OrderDatum`
- Filters:
  - `OrderDatum` between the first day of the previous month and the first day of the current month
- Output:
  - `ISBN`, `Titel`, and `TotaltAntalSåld` (total quantity sold)

Example usage:

```sql
select *
from [vw_BockerForraManadenAgg]
order by [TotaltAntalSåld] desc;
```

---

## Stored procedures

### `FlyttaBok`

A stored procedure that moves stock of a specific book from one store to another.

**Parameters (example):**

- `@ISBN char(13)` – the book to move  
- `@FrånButikId int` – source store  
- `@TillButikId int` – destination store  
- `@AntalSomSkaFlyttas int = 1` – quantity to move (default 1)

**Key behaviour:**

- Validates that `@AntalSomSkaFlyttas > 0`  
- Reads current stock for the book in `LagerSaldo` for the source store  
- Ensures there is **enough stock** to move; otherwise throws an error  
- Uses a **transaction**:
  - Decreases `LagerSaldo` for the source store
  - Increases `LagerSaldo` for the destination store  
- Uses `TRY...CATCH` and `THROW` to provide meaningful error messages

This procedure is business logic implemented inside the database, including:

- Input validation  
- Transaction handling  
- Error handling in T-SQL

---


## Notes

This is primarily a **learning project** for database design and T-SQL:

- Relational modelling and normalisation  
- Constraints and referential integrity  
- Views and stored procedures  
- Basic reporting and business logic inside the database
