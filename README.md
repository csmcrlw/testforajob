# testforajob
Выполненное ТЗ по работе с API hh.ru

В данном проекте я попробовала реализовать поиск вакансий, у которых минимальная зарплата больше средней по Москве. Для этого сначала выполняемм запрос, результат которого - данные о доступных вакансиях, далее в цикле мы вычисляем среднюю зарплату на основании полученных данных. Следующий запрос к API - вакансии по той же специальности, но уже по всей России. В цикле мы сравниваем минимальную зарплату, предлагаемую в вакансиях, со средней по Москве, и отбираем названия компаний с подходящими нам условиями.
