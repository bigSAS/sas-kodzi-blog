---
title: Python od zera pt2 - proste typy danych
tags: python,learn
difficulty: 2
date: 2020-10-03
when: 03 października 2020
excerpt: Podstawowe typy danych, zmienne, oraz jak z nich korzystać ☝️
hide: no
---
---  

## Wstęp czyli na czym polega programowanie ?

Ogólnie można powiedzieć, że programowanie polega na rozwiązywaniu problemów za pomocą komputera.
Aby ułatwić pisanie programów komputerowych powstały języki programowania takie jak **Python** mające na celu ułatwienia programowania 😃. Programując głównie wykonujemy takie czynności jak:  

- **przypisania** ➜ zapisujemy dane różnego typu do **zmiennych**  
- **operacje arytmetyczne** ➜ musimy coś policzyć za pomocą komputera  
- **operacje logiczne** ➜ jeśli dane warunki są spełnione lub nie, wykonujemy kolejne operacje arytmetyczne/logiczne/przypisania  
- **pętle** ➜ używamy aby wykonywać wiele razy te same operacje  
- **deklarowanie funkcji** ➜ nadanie kontekstu operacjom w celu późnieszego wywołania  
- **deklarowanie klas** ➜ własnych typów danych  
- **wywołania** ➜ wywołanie funkcji / metody na obiekcie  

## Podstawowe (prymitywne) typy danych

Aby sprawnie opanować podstawy programowania, musimy zapoznać się z podstawowymi typami danych. Tak naprawdę wszystkie dane na jakich operujemy w programie mają swój **typ**. Typ ma pomóc zrozumieć czym jest dany obiekt i co reprezentuje. Na szczęście implementację większości typów podstawowych mamy dostępną jako globalnie. W celu zapoznania się z nimi wystarczy **python interactive terminal**, oraz dwie funkcje: **print(wypisywanie danych na ekran)** oraz **type(sprawdzenie typu obiektu)**.  
Uruchamiamy python:  

```sh
> python
Python 3.8.5 (tags/v3.8.5:580fbb0, Jul 20 2020, 15:43:08) [MSC v.1926 32 bit (Intel)] on win32
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

## bool

Typ danych reprezentujący prawda/fałsz ma tylko dwie wartości: **True** oraz **False**. Używany w operacjach logicznych.

```sh
>>> type(True)
<class 'bool'>
>>> type(False)
<class 'bool'>
>>> print(True)
True
>>> print(False)
False
>>> print(True == True)
True
>>> print(True == False)
False
>>> print(False == False)
True
```  

## int

Typ danych reprezentujący liczby całkowite. Jego główny cel to operacje arytmetyczne.  

```sh
>>> type(10)
<class 'int'>
>>> print(10)
10
>>> print(10 + 10)
20
>>> print(10 - 9)
1
>>> print(10 / 2)
5.0
```

**🤖Fun fact🤖**  
Aby zwiększyć czytelność większych liczb możemy używać **_**  

```sh
>>> print(10_000_000)
10000000
>>> print(10_000_000 == 10000000)
True
>>> print(10_000 != 5_000) 
True
```

Opertory **==**, oraz **!=** to logiczne porównanie obiektów. Możemy dzięki sprawdzić czy dwa obiekty są identyczne, lub odwrotnie.  

## float

Typ danych reprezentujący liczby zmiennoprzecinkowe. Podobnie jak **int** jest używany we wszelkiego rodzaju objiczeniach

```sh
>>> type(5.51)
<class 'float'>
>>> print(5.5 + 5.50)
11.0
>>> print(10.01 - 10.00)
0.009999999999999787
```

Operacje na float'ach potrafią sprawiać problemy, ale o tym innym razem 😉  

## str

String czyli strumień / łańcuch znaków. Najbardziej zaawansowany z prymitywnych typów danych. Możemy je dodawać, kroić, szukać znaków, zastępować, formatować ect.
Więcej na temat string'ów i operacji na nich możesz **poczytać tu ➜ [python string fun](/blog/python-string-fun)**.  
Typ danych reprezentuje ciąg znaków powszechnie uznawanych za człowieka jako czytelne 👽  
Stringi opakowujemy w quote'y (pojedyncze ' lub podwójne ")

```sh
>>> type("jimmy")
<class 'str'>
>>> print("jimmy")
jimmy
>>> print("jimmy" + "choo")
jimmychoo
```

## None

Szczególny typ danych reprezentujący **nic**. Ma swoje zastosowanie w większości popularnych języków programowania. W pythonie jest to poprostu **None**. Najszczęściej stosowany w celu sprawdzenia czy dany obiekt instnieje lub nie 👀  

```sh
>>> type(None)
<class 'NoneType'>
>>> print("jimmy" == None)
False
>>> print(None == None)
True
```

## Przypisania - zmienne

Powyższe przykłady obrazowały działanie podstawowych typów danych bez przypisań. Interpreter Pythona wywoływał instrukcje, po czym dane zostały utracone.  
W większości przypadków nie chcemy tego ponieważ:  

- Nasz program przeważnie jest bardziej złożony niż dodawanie dwóch liczb 🧠  
- Chcieli byśmy móc dalej użyć wyniku wywołania jakiś instrukcji (np. dodawania)  
- Chcieli byśmy aby nasz program był bardziej czytelny, oraz operacje w nim wykonywane nabrały więcej kontekstu (fajnie wiedzieć co program robi po przeczytaniu kodu 🖖 👌)  

Na szczęście mamy do dyspozycji taki mechanizm jak **przypisania**. Tak naprawdę to definiowanie **zmiennych**, lub nadpisywanie ich zawartości. Przypisania wykonujemy używając znaku **=** czyli np:  

```sh
>>> name = 'jimmy'
>>> print(name)
jimmy
>>> type(name)
<class 'str'>
>>> print('jimmy' == name)
True
>>> print('Jimmy' == name)
False
```

W ten sposób w zmiennej **name** zapisaliśmy typ danych **str** o wartości **jimmy**. Python jest na tyle "mądry", że sam rozpoznaje typ danych jaki przypisujemy do zmiennej, w tym wypadku **str**.  

Mając dane w zmiennej, możemy się do niej odnosić po nazwie jaką jej nadaliśmy. Możemy ją także modyfikować, a nawet zmienić jej typ na inny.  

```sh
>>> name = 'choo'
>>> print(name)
choo
>>> print(name == 'jimmy')
False
>>> name = 5
>>> type(name)
<class 'int'>
```

**Pro Tip☝️**  
Po zadeklarowaniu zmiennej w określonym typie, **lepiej nie nadpisywać jej innym typem** (jak w przykładzie wyżej). Kod traci czytelność i kontekst. Może to być źródłem wielu problemów przy bardziej skomplikowanym programie. Jak przekonasz się w przyszłości programy komputerowe bardzo szybko stają się skomplikowane 😒. Jak widać na powyższym przykładzie **name = 5** nie jest zbyt czytelne, lepiej unikać takich praktyk i zrobić nową zmienną np:  

```sh
>>> age = 5
```

## Praktyczne zastosowanie zmiennych

Załóżmy, że chciałbym wykonać jakieś bardziej zaawansowane obliczenia. Zmienne mogą mi w tym pomóc.  

```sh
>>> my_sum = 10_321 + 13_654
>>> my_multiplier = 5
>>> my_result = my_sum * my_multiplier
>>> print(my_result)
119875
```

Zadeklarowałem trzy zmienne i mogę nimi "sterować".  

```sh
>>> my_multiplier = 55
>>> my_result = my_sum * my_multiplier
>>> print(my_result)
1318625
```

Dopóki nie wyłączę interactive terminal'a mogę używać moich zmiennych do woli 👌 😎.  

## Konwencja

W Pythonie zmienne zawsze definiujemy **z małej litery**. Jeśli nazwa zmiennej składa się z kilku wyrazów to separujemy je **lodash'em** czyli **_** np:  

```sh
full_name = 'jimmy choo'
email_address = 'jimmy@choo.io'  
```  

Zmienne uznawane za **stałe** czyli nie zamierzamy zmieniać ich wartości w przyszłości definiujemy WIELKIMI LITERAMI np:  

```sh
IM_NOT_GONNA_CHANGE_EVER = 'never_ever :)'
```

Jeśli dobrnąłeś do końca, to śmiało możesz przejść dalej 🤖  

```sh
>>> exit()
```

**[➜ Python od zera pt3 - instrukcje warunkowe i pętle](/blog/python-od-zera-pt3-instrukcje-warunkowe-petle)**  