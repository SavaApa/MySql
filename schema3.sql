-- Повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, для Human Resources 20% 
-- и для IT 35%. Записать данные в новое временное поле new_salary. Поле создавать не нужно, используем AS. 
SELECT 
    CASE 
        WHEN department = 'sales' THEN salary * 1.20
        WHEN department = 'finance' THEN salary * 1.15
        WHEN department = 'shipping' THEN salary * 1.10
        WHEN department = 'marketing' THEN salary * 1.25
        WHEN department = 'Human Resources' THEN salary * 1.20
        WHEN department = 'IT' THEN salary * 1.35
        ELSE salary
    END AS new_salary
FROM empl.employees;

-- Создать поле new_salary типа numeric(7, 2)
ALTER TABLE empl.employees
ADD COLUMN new_salary NUMERIC(7, 2);

-- Заполнить поле: повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, 
-- для Human Resources 20% и для IT 35%.
UPDATE empl.employees
SET new_salary = CASE 
                    WHEN department = 'Sales' THEN salary * 1.20
                    WHEN department = 'Finance' THEN salary * 1.15
                    WHEN department = 'Shipping' THEN salary * 1.10
                    WHEN department = 'Marketing' THEN salary * 1.25
                    WHEN department = 'Human Resources' THEN salary * 1.20
                    WHEN department = 'IT' THEN salary * 1.35
                    ELSE salary
                END;
                
-- Вывести из таблицы employees firstname как username, lastname как surname и новое поле fullname, 
-- которое состоит из имени и фамилии сотрудников.
SELECT 
    first_name AS username, 
    last_name AS surname, 
    CONCAT(first_name, ' ', last_name) AS fullname 
FROM empl.employees;

-- Вывести новое временное поле commission, которое будет null, если зарплата сотрудника меньше 3000, будет 10, 
-- если зарплата меньше 6000, будет 15, если зарплата меньше 9000, и будет 20, если зарплата больше/равно 9000.
SELECT 
    first_name AS username, 
    last_name AS surname, 
    salary,
    CASE
        WHEN salary < 3000 THEN NULL
        WHEN salary < 6000 THEN 10
        WHEN salary < 9000 THEN 15
        ELSE 20
    END AS commission
FROM empl.employees;

-- Создать новое поле commission и соответственно заполнить.
ALTER TABLE empl.employees
ADD COLUMN commission INT;

UPDATE empl.employees
SET commission = 
    CASE
        WHEN salary < 3000 THEN NULL
        WHEN salary < 6000 THEN 10
        WHEN salary < 9000 THEN 15
        ELSE 20
    END;

-- Создать поле finalsalary и заполнить формулой salary + salary * commission / 10. 
-- Проверить commission на null, так чтобы в случае неопределенности finalprice принимал значение salary
ALTER TABLE empl.employees
ADD COLUMN finalsalary NUMERIC(10, 2);

UPDATE empl.employees
SET finalsalary = 
    CASE
        WHEN commission IS NULL THEN salary
        ELSE salary + salary * commission / 10
    END;
    
-- Вывести поле email в нижнем регистре.
SELECT LOWER(email) AS email FROM empl.employees;

-- Создать новое поле chk_email типа varchar(128).
ALTER TABLE empl.employees
ADD COLUMN chk_email VARCHAR(128);

-- Заполнить поле chkemail. Если длина email меньше 3, значением chkemail будет 'Введите больше символов', если длина email больше/равно 3 и меньше 7,  
-- значением chkemail будет 'Кол/во символов совпадает', если длина email больше/равно 7,  значением chkemail будет 'Введите меньше символов'.
UPDATE empl.employees
SET chk_email = 
    CASE
        WHEN LENGTH(email) < 3 THEN 'Введите больше символов'
        WHEN LENGTH(email) >= 3 AND LENGTH(email) < 7 THEN 'Кол/во символов совпадает'
        ELSE 'Введите меньше символов'
    END;