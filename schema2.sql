-- Найти всех ИТ работников с зарплатой выше 12000:
SELECT * FROM my_schema.employees 
WHERE department = 'IT' AND salary > 12000;

-- Повысить зарплату работников отдела Human Resources в 5 раз:
UPDATE my_schema.employees 
SET salary = salary * 5
WHERE department = 'Human Resources';

-- Найти работников отдела Marketing с зарплатой ниже 2850:
SELECT * FROM my_schema.employees WHERE department = 'Marketing' AND salary < 2850;

-- У руководителя родились близнецы Лаура и Адам, в честь праздника он решил повысить зарплату работников с именами Лаура и Адам в 10 раз:-- 
UPDATE my_schema.employees 
SET salary = salary * 10 
WHERE first_name IN ('Laura', 'Adam');

-- Diana Lorentz вышла замуж и поменяла фамилию на King:
UPDATE my_schema.employees 
SET last_name = 'King' 
WHERE first_name = 'Diana' AND last_name = 'Lorentz';

-- Всех работников отдела Sales уволили. Удалите работников Sales из таблицы:
DELETE FROM my_schema.employees 
WHERE department = 'Sales';

-- John Russell перевели в отдел Marketing и повысили зарплату на 5000:
UPDATE my_schema.employees 
SET department = 'Marketing', salary = salary + 5000 
WHERE first_name = 'John' AND last_name = 'Russell';

-- После праздника руководитель протрезвел и уменьшил зарплаты работников с именами Лаура и Адам в 10 раз:
UPDATE my_schema.employees 
SET salary = salary / 10 
WHERE first_name IN ('Laura', 'Adam');

-- Laura Bissot поменяла свой email на BISSOTLAURA:
UPDATE my_schema.employees
SET email = 'BISSOTLAURA' 
WHERE first_name = 'Laura' AND last_name = 'Bissot';

-- Diana King развелась и поменяла фамилию обратно на Lorentz. И в честь развода руководитель повысил ее зарплату на 2000:
UPDATE my_schema.employees 
SET last_name = 'Lorentz', salary = salary + 2000 
WHERE first_name = 'Diana' AND last_name = 'King';