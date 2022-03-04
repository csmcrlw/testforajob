import requests

job_name = input()

url = 'https://api.hh.ru/vacancies'
#ищем вакансии по Москве
par = {'text': job_name, 'area':'1'}
resp = requests.get(url, params=par)
resp1 = [resp.json()]

# считаем среднюю зарплату введенной вакансии в Москве
all_sal = 0
all_n = 0

for j in resp1:
    y = j['items']
    # объявляем переменную n для подсчета количества итераций цикла, перебирающего зарплаты в вакансиях
    n=0
    # объявляем переменную sum_sal для подсчета общей суммы зарплат в вакансиях
    sum_sal=0
    # цикл перебирает вакансии
    for i in y:
        # проверяем есть ли значения в словаре по ключу salary (есть ли в вакансии данные по зарплате)
        if i['salary'] != None:
            #записываем значение в переменную s
            s = i['salary']
            # проверяем есть ли значения по ключу from (есть ли в вакансии данные о минимальной зп)
            if s['from'] != None:
                # считаем количество обработанных вакансий, в которых указана минимальная ЗП
                n += 1
                # получаем минимальную ЗП по ключу from
                s['from']
                #считаем сумму ЗП по вакансиям
                sum_sal += s['from']
    # добавляем сумму зп по итерации цикла
    all_sal += sum_sal
    # добавляем сумму n по итерации цикла
    all_n += n
    # считаем среднюю ЗП
av_sal = all_sal / all_n

url1 = 'https://api.hh.ru/vacancies'
# ищем вакансии по всей России
pars = {'text': job_name, 'area': '113', 'only_with_vacancies': True}
res = requests.get(url, params=pars)
res1 = res.json()

vac_urls = []

for k in res1['items']:
    if k['salary'] != None:
            g = k['salary']
            if g['to'] != None and g['to'] >= av_sal:
                vac_urls.append(k['employer']['name'])
print(*vac_urls, sep = '\n')
