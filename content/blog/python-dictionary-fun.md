---
title: Python dictionary FUN
tags: [python, learn]
difficulty: 2
date: 2020-10-25
when: 25 października 2020
excerpt: Kodzenie na słownikach, z użyciem praktycznych przykładów 🤏
hide: yes
---

## Czym jest dict aka słownik aka hashmap'a?

Typ **dict** nie jest już prymitywnym typem danych. Na początku może wydawać się enigmatyczny, natomiast w praktyce jest świetny do pracy z kodem. Dodatkowo cały python oparty jest o słowniki, co za tym idzie -> warto z nich korzystać :) 
Sam słownik to mapa kluczy, które są wskaźnikiem do wartości do tych właśnie kluczy przypisanych.
Czyli mogę sobie powiedzieć np, że mam słownik dla państw. Kluczami będą dwu-literowe kody, natomiast wartościamy pełne nazwy.

```python
countries = {
    'PL': 'Poland',
    'EN': 'England',
    'FR': 'France'
}
```

Słownik definiujemy w klamrach aka **curly brackets**. Elementy słownika oddzielamy przecinkami, natomiast klucze i wartości (key: value) dwukropkiem. Jeśli znasz taki format danych jak JSON to wygląda bardzo znajomo prawda? Ale o tym później :)

Pusty słownik możemy zadeklarować na dwa sposoby  

```python
# curly brackets
mydict = {}
# jako instancja typu dict
myotherdict = dict()
```

**Klucz zawsze jest string'iem, natomiast wartość może być dowolnego typu (np str, int, bool itd albo kolejnym słownikiem). Ogólnie dowolnym typem danych**  

```python
jimmy = {
    'first_name': 'jim',
    'last_name': 'choo',
    'age': 33,
    'address': {
        'street': 'sezamee street',
        'building': 999
    }
}
```

Fun stuff :)
Jak widać słownik może przechowywać zarówno płaskie jak i zagnieżdzone struktury.  

## Operacje na słowniku

OK fajnie to wygląda, ale jak takim słownikiem operować? Na szczęście dict ma proste i łatwe do zapamiętania API.  

### Odczyt po kluczu

Podstawowym sposobem odczytania danych jest podanie klucza w nawiasach kwadratowych  

```python
print(jimmy['last_name'])
>>> 'choo'
# możesz zagnieżdżać klucze jeśli wartość jest kolejnym słownikiem
print(jimmy['address']['street'])
>>> 'sezamee street'
```

Jeśli podamy niepoprawny klucz otrzymamy **KeyError**  

```python
print(jimmy['birthdate'])
>>> KeyError ...  

```

### Odczyt z użyciem metody get

```python
print(jimmy.get('last_name')
>>> 'choo'
```

Jeśli np nie jesteśmy pewni, czy słownik posiada dany klucz, jako drugi parametr do get możemy podać wartość, która ma być zwrócona jeśli klucz nie zostanie znaleziony  

```python
print(jimmy.get('height', 180)
>>> 180
```

Pozwala to uniknąć zbędnej obsługi błędów w naszym programie, jeśli np możemy przyjąć jakąś defaultową wartość :)  

### Dodanie nowego klucza: wartości

Analogicznie do odczytu używamy nawiasów kwadratowych  

```python
jimmy['birthdate'] = '01-01-1999'
print(jimmy['birthdate'])
>>> '01-01-1999'
```

**Musisz pamiętać, że jeśli klucz już istnieje to wartość zostanie nadpisana. Czyli nadpisywanie wartości po kluczu odbywa się identycznie jak dodawanie nowych**  

### Usunięcie klucza (wraz z wartością)

Możesz zdjąć element ze słownika metodą **pop**  

```python
jimmys_age = jimmy.pop('age')
print(jimmys_age)
>>> 33
jimmy['age']
>>> KeyError ...
```

Ewentualnie poprostu usunąć  

```python
del jimmy['first_name']
print(jimmy['first_name'])
>>> KeyError ...

```
### Lista (set) kluczy

Klucze jako set (klucze są unikalne) **potwierdzic to!** stringów możesz odczytać za pomocą metody **keys**

```python
print(jimmy.keys())
>>> ['last_name', ..., 'birthdate']
```

Co za tym idzie możesz w prosty sposób sprawdzić czy słownik posiada klucz

```python
print('birthdate'in jimmy.keys())
>>> True
print('hobby'in jimmy.keys())
>>> False
```

### Lista elementów

Elementy słownika możesz odczytac za pomocą metody **items**

```python
print(jimmy.items())
>>> ...
```

**Możesz w bardzo prosty sposób iterować się po elementach słownika**

```python
for key, value in jimmy.items():
    print(f'{key} -> {value}')
>>> ...
```

Z racji tego, że element słownika to tuple'a z dwoma elementami, możemy je od razu rozpakować do dwóch zmiennych w pętli for :) cool :)

### Złączenie (merge'owanie) słowników

Możesz łączyć słowniki ze sobą

```python
# todo
```

... info dla tych samych kluczy -> sa nadpisywane z prawej na lewo

## Praktyczne zastosowanie

Python pozwala na przyjemne i zarazem praktyczne zastosowanie słowników. Dodatkowo oszczędzenie sobie ceremoniałów, które często występują w innych, przeważnie statycznie typowanych językach ;)

### Zapisanie danych z dict'a do JSON'a

Python posiada obsługę dla json w stdlib!

```python
import json

jimmy_json = json.dumps(jimmy)
print(jimmy_json)
>>> ...
```

### Odczyt danych z JSON string'a do dict'a

```python
import json

shoes_json = '''
[
  {
    "model": "jordan zeros",
    "size": 12
  },
  {
    "model": "nike shox",
    "size": 10
  }
]
'''
shoes = json.loads(shoes_json)
print(shoes[0].get('model')
>>> 'jordan zeros'
```

Jak możesz się domyśleć ma to wiele praktycznego zastosowania przy przetwarzaniu danych w JSON (również innych formatów danych) jako słownik
Cool ! :)

## Podsumowanie

Gratulacje! Dzisiaj dowiedziałeś się jak używać słowników, oraz stosować je w praktyce do pracy z danymi:)
Jeśli intersuje cię bardziej tematyka słowników polecam talk Raymond'a Hettinger'a na temat słowników -> https:...
