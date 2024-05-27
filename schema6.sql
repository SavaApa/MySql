-- Посчитать количество рейсов по каждой модели самолета. Вывести modelname и flightcount.
SELECT a.model_name AS modelname, COUNT(t.id) AS flightcount
FROM airliners a
JOIN trips t ON a.id = t.airliner_id
GROUP BY a.model_name;

-- Вычислить среднюю стоимость билета по классам обслуживания. Вывести serviceclass и averageprice.
SELECT service_class, AVG(price) AS averageprice
FROM tickets
GROUP BY service_class;

-- Определить средний возраст клиентов, сгруппированных по классу обслуживания. Вывести serviceclass и averageage.
SELECT t.service_class, AVG(c.age) AS averageage
FROM tickets t
JOIN clients c ON t.client_id = c.id
GROUP BY t.service_class;

-- Получить общее количество билетов, купленных каждым клиентом. Вывести name и ticket_count.
SELECT c.name, COUNT(t.id) AS ticket_count
FROM clients c
JOIN tickets t ON c.id = t.client_id
GROUP BY c.name;

-- Определить количество рейсов, отправленных из каждого аэропорта. Вывести departure и departure_count.
SELECT departure, COUNT(id) AS departure_count
FROM trips
GROUP BY departure;

-- Вычислить общий доход от продажи билетов для каждой страны производителя самолетов. Вывести country и total_sum.
SELECT a.country, SUM(t.price) AS total_sum
FROM airliners a
JOIN trips t ON a.id = t.airliner_id
JOIN tickets tk ON t.id = tk.trip_id
GROUP BY a.country;
