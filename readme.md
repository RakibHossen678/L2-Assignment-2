# 📘 What are the `LIMIT` and `OFFSET` Clauses Used For?

আমরা `LIMIT` এবং `OFFSET` ক্লজ ব্যবহার করে থাকি মূলত **পেজিনেশনের** জন্য ।  
`LIMIT` এবং `OFFSET` ক্লজ এর মাধ্যমে আমরা ডাটাবেজ থেকে কতগুলো রো কুয়েরি করে নিয়ে আসতে পারি ।

আমাদের ডাটাবেজ এ যখন অনেকগুলো ডাটা থাকে তখন আমরা `LIMIT` এবং `OFFSET` ক্লজ ব্যবহার করে নির্দিষ্ট সংখ্যক ডাটা কুয়েরি করে নিয়ে আসি যাতে:

- ডাটাবেজ এর উপর চাপ কম করে ✅
- ডাটা কুয়েরি করতে সময় কম লাগে ⏱️

---

### 🔹 `LIMIT`

👉 `LIMIT` দ্বারা বুঝায় আমরা ডাটাবেজ থেকে **কতগুলো ডাটা কুয়েরি করে নিয়ে আসব** ।

---

### 🔹 `OFFSET`

👉 `OFFSET` দ্বারা বুঝায় আমরা **কততম রো থেকে ডাটা কুয়েরি করে নিয়ে আসব** ।

---

### 🧪 উদাহরণ:

```sql

SELECT * FROM users

LIMIT 10 OFFSET 10;

```

উপরের উদাহরণে আমরা দেখেতে পাচ্ছি যে users টেবিল থেকে ডাটা কুয়েরি করে নিয়ে আসা হচ্ছে । উপরের উদাহরণে যেহেতু `LIMIT` 10 `OFFSET` 10 সেহেতু আমরা এ কুয়েরির মাধ্যমে 10 টি রো আউটপোট হিসেবে পাবো প্রথম 10 বাদে অর্থাৎ, এটি 11 থেকে 20 নম্বর রো পর্যন্ত ফলাফল দিবে ।

# 🔍 Explain the Purpose of the `WHERE` Clause in a `SELECT` Statement

`WHERE` ক্লজ একটি postgreSQL এর একটি খুবই গুরুত্বপূর্ণ ক্লজ যা আমরা `SELECT` স্টেটমেন্টের সাথে ব্যবহার করি। এর মাধ্যমে আমরা ডাটাবেজ থেকে নির্দিষ্ট কোনো শর্ত এর মাধ্যমে ডাটা কুয়েরি করে নিয়ে আসি।

আমাদের ডাটাবেজে অনেকগুলো রো থাকতে পারে, কিন্তু আমরা সব ডাটা দেখতে চাই না। আমরা চাই নিদিষ্ট কোন শর্তের মাধ্যমে ডাটা কুয়েরি করে নিয়ে আসতে । যেমনঃ

Student টেবিলে আমরা চাই শুধুমাত্র যার রোল 1 তার ডাটা কুয়েরি করে নিয়ে আসতে বা যারা পাশ করছে তাদের ডাটা কুয়েরি করে নিয়ে আসতে।

```sql

SELECT * FROM Student WHERE roll = 1;

```

```sql

SELECT * FROM Student WHERE result = 'pass';

```

employees টেবিলে আমরা চাই শুধুমাত্র যাদের ডিপার্টমেন্ট সেলস তাদের ডাটা কুয়েরি করে নিয়ে আসতে বা যাদের বেতন ২৫০০০ এর বেশি তাদের ডাটা কুয়েরি করে নিয়ে আসতে বা যাদের বেতন ১০০০০ থেকে ২০০০০০ এর মাধ্যে তাদের ডাটা কুয়েরি করে নিয়ে আসতে।

```sql

SELECT * FROM employees
WHERE department = 'Sales';

```

```sql

SELECT * FROM employees
WHERE salary > 250000;

```

```sql

SELECT * FROM employees
WHERE salary 100000 AND 200000;

```

# What is the difference between the VARCHAR and CHAR data types?

`VARCHAR` এবং `CHAR` — PostgreSQL বা যেকোনো রিলেশনাল ডাটাবেজে এই দুটি ডেটাটাইপ স্ট্রিং বা টেক্সট ডেটা সংরক্ষণ করার জন্য ব্যবহৃত হয়। তবে এদের মধ্যে কিছু গুরুত্বপূর্ণ পার্থক্য আছে যেগুলো জানলে আমরা বুঝতে পারবো কোন পরিস্থিতিতে কোনটি ব্যবহার করা উচিত।

## VARCHAR

`VARCHAR` মানে হলো Variable Length Character। এটি এমন একটি ডেটাটাইপ যেখানে স্ট্রিং এর দৈর্ঘ্য পরিবর্তনশীল হতে পারে। আমরা যখন `VARCHAR(n)` ব্যবহার করি, তখন এর মানে হলো সর্বোচ্চ n সংখ্যক ক্যারেক্টার রাখা যাবে।

```sql
CREATE TABLE employees (
  name VARCHAR(50)
);
```

## CHAR

`CHAR` মানে হলো Fixed Length Character। আমরা যখন `CHAR(n)` ব্যবহার করি, তখন প্রতিটি ইনপুট ডাটা বাধ্যতামূলকভাবে n ক্যারেক্টার জায়গা নিবে, যদিও ডাটা ছোট হয়।

```sql
CREATE TABLE students (
  grade CHAR(5)
);
```

# Explain the Primary Key and Foreign Key concepts in PostgreSQL

`Primary Key` এবং `Foreign Key` PostgreSQL ডাটাবেজে দুইটি খুবই গুরুত্বপূর্ণ কনসেপ্ট। এই দুটি কনসেপ্ট রিলেশনাল ডাটাবেজ ডিজাইনে টেবিলগুলোর মধ্যে সম্পর্ক তৈরি করতে এবং ডাটার ইন্টেগ্রিটি (সঠিকতা) বজায় রাখতে সাহায্য করে।

আমরা যখন একটি টেবিলে ইউনিকভাবে কোনো রেকর্ড আইডেন্টিফাই করতে চাই, তখন আমরা Primary Key ব্যবহার করি। আর যখন একটি টেবিলের কোনো কলাম অন্য টেবিলের Primary Key কে রেফার করে, তখন সেটাকে `Foreign Key` বলা হয়

# primary key

`Primary Key` এমন একটি কলাম বা একাধিক কলাম নিয়ে গঠিত হয়, যেটি প্রতিটি রোকে ইউনিকভাবে শনাক্ত করে। এটি কখনোই NULL হতে পারে না এবং একটি টেবিলে শুধুমাত্র একটি `Primary Key` থাকতে পারে।

```sql
CREATE TABLE Student (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  roll INT,
  result VARCHAR(10)
);
```

# foreign key

`Foreign Key` হলো এমন একটি কলাম, যেটি অন্য একটি টেবিলের Primary Key কে রেফার করে। এর মাধ্যমে দুইটি টেবিলের মধ্যে সম্পর্ক তৈরি হয়।

```sql
CREATE TABLE Class (
  class_id SERIAL PRIMARY KEY,
  class_name VARCHAR(100)
  student_id INT,
  FOREIGN KEY (student_id) REFERENCES Student(student_id)
);
```

# How can you modify data using UPDATE statements?

`UPDATE` হলো PostgreSQL-এর একটি খুবই গুরুত্বপূর্ণ স্টেটমেন্ট, যার মাধ্যমে আমরা ডাটাবেজে বিদ্যমান ডেটা পরিবর্তন করতে পারি। যখন আমরা কোনো টেবিলে কোনো রো-এর ভ্যালু আপডেট করতে চাই, তখন `UPDATE` স্টেটমেন্ট ব্যবহার করা হয়।

আমরা শুধু যেই রো পরিবর্তন করতে চাই, সেই রোকে টার্গেট করতে WHERE ক্লজ ব্যবহার করি। নাহলে সব রো আপডেট হয়ে যাবে।

```sql
UPDATE Student
SET result = 'fail'
WHERE roll = 1;
```

```sql
UPDATE employees
SET salary = salary + 5000
WHERE department = 'Sales';
```
