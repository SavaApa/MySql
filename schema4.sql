-- Вывести имя и фамилию сотрудника и название его департамента
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- Вывести имя и фамилию и название департамента только тех сотрудников, которые работают в IT, Marketing или IT Support
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name IN ('IT', 'Marketing', 'IT Support');

-- Вывести имя, фамилию и город сотрудников, которые работают в Seattle или Toronto:
SELECT e.first_name, e.last_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city IN ('Seattle', 'Toronto');

-- Выведите названия департаментов, в которых менеджеры зарабатывают больше 10000
SELECT d.department_name
FROM departments d
JOIN employees e ON d.manager_id = e.employee_id
WHERE e.salary > 10000;

-- Вывести имя, фамилию и зарплату тех сотрудников, которые работают в городах Oxford и San Francisco:
SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city IN ('Oxford', 'San Francisco');

-- Вывести имя, фамилию и город сотрудника:
SELECT e.first_name, e.last_name, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;