{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 37,
   "id": "5774a450",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "python\n",
      "DataFork\n",
      "Точка\n",
      "Фабрика Решений\n",
      "Alber Blanc\n",
      "АСД Технолоджиз\n",
      "АСД Технолоджиз\n",
      "24 часа ТВ\n",
      "UAB Softeka\n",
      "Hi, Rockits!\n",
      "Симпл Солюшенс\n"
     ]
    }
   ],
   "source": [
    "import requests\n",
    "\n",
    "job_name = input()\n",
    "\n",
    "url = 'https://api.hh.ru/vacancies'\n",
    "#ищем вакансии по Москве\n",
    "par = {'text': job_name, 'area':'1'}\n",
    "resp = requests.get(url, params=par)\n",
    "resp1 = [resp.json()]\n",
    "\n",
    "# считаем среднюю зарплату введенной вакансии в Москве\n",
    "all_sal = 0\n",
    "all_n = 0\n",
    "\n",
    "for j in resp1:\n",
    "    y = j['items']\n",
    "    # объявляем переменную n для подсчета количества итераций цикла, перебирающего зарплаты в вакансиях\n",
    "    n=0\n",
    "    # объявляем переменную sum_sal для подсчета общей суммы зарплат в вакансиях\n",
    "    sum_sal=0\n",
    "    # цикл перебирает вакансии\n",
    "    for i in y:\n",
    "        # проверяем есть ли значения в словаре по ключу salary (есть ли в вакансии данные по зарплате)\n",
    "        if i['salary'] != None:\n",
    "            #записываем значение в переменную s\n",
    "            s = i['salary']\n",
    "            # проверяем есть ли значения по ключу from (есть ли в вакансии данные о минимальной зп)\n",
    "            if s['from'] != None:\n",
    "                # считаем количество обработанных вакансий, в которых указана минимальная ЗП\n",
    "                n += 1\n",
    "                # получаем минимальную ЗП по ключу from\n",
    "                s['from']\n",
    "                #считаем сумму ЗП по вакансиям\n",
    "                sum_sal += s['from']\n",
    "    # добавляем сумму зп по итерации цикла\n",
    "    all_sal += sum_sal\n",
    "    # добавляем сумму n по итерации цикла\n",
    "    all_n += n\n",
    "    # считаем среднюю ЗП\n",
    "av_sal = all_sal / all_n\n",
    "\n",
    "url1 = 'https://api.hh.ru/vacancies'\n",
    "# ищем вакансии по всей России\n",
    "pars = {'text': job_name, 'area': '113', 'only_with_vacancies': True}\n",
    "res = requests.get(url, params=pars)\n",
    "res1 = res.json()\n",
    "\n",
    "vac_urls = []\n",
    "\n",
    "for k in res1['items']:\n",
    "    if k['salary'] != None:\n",
    "            g = k['salary']\n",
    "            if g['to'] != None and g['to'] >= av_sal:\n",
    "                vac_urls.append(k['employer']['name'])\n",
    "print(*vac_urls, sep = '\\n')"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.8.8"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
