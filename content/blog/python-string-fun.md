---
title: Python string FUN
tags: python,learn
difficulty: 2
date: 2020-10-04
when: 04 października 2020
excerpt: Kodzenie na stringach, z użyciem praktycznych, a zarazem prostych przykładów 🤏
hide: no
---

## Kodzenie na string'ach

Prędzej czy później (bardziej prędzej 😅) zetkniesz się z potrzebą pracy w kodzie na string'ach. Tutaj skupimy się na możliwościach jakie daje nam Python, bez żadnego dodatkowego kodzenia 👌. Na nasze szczęście Python ma wiele do zaoferowania w kwestii przetwarzania string'ów **out of the box**. Pokusiłbym się nawet o stwierdzenie, że pracę ze string'ami w pythonie da się lubić.  

## Konkatenacja

Jedno z wielu "magicznych" słów w programowaniu, które na początku może wywołać zakłopotanie, a później okazuje się, że **to tylko łączenie ze sobą string'ów aka dodawanie**.  

Najprostszym sposobiem konkatenacji jest użycie "+"  

```python
full_name = 'jimmy' + ' ' + 'choo'
print(full_name)
# jimmy choo
type(full_name)
# <class 'str'>
```

Jak widać na powyższym przykładzie, to tylko dodawanie 👀. Niestety taki sposób nie jest zbyt efektywny, musimy dodawać spację "z palca", dłuższe string'i będą nieczytelne ect.  
Sposób polecam tylko w celu bardzo prostych operacji na string'ach.  

## Formatowanie

Kolejnym trochę lepszym sposobem na pracę ze string'ami jest użycie metody **format** na naszym string'u czyli:  

```python
first_name = 'jimmy'
last_name = 'choo'
full_name = '{} {}'.format(first_name, last_name)
print(full_name)
# jimmy choo
```

Za pomocą "wąsów" definiujemy placeholder'y na dane, które następnie możemy wstawić za pomocą methody **format**. W tym wypadku od lewej wstawimy "jimmy" nastepnie "choo". Dodawania spacji nie potrzebujemy, bo znajduje się ona w naszym "szablonie" string'a. Argumentów do format'a musimy przekazać tyle ile mamy w naszym stringu placeholder'ów.  
**IMPORTANT** - w ten sposób musimy zawsze pamiętać aby nasz string sformatować i przekazać dane dla naszych placeholder'ów ☝️.  

Jest to trochę old school'owy sposób formatowania, ale warto o nim wiedzieć.  

Jak się okazuje do format'a można przekazać dane jako kwarg'i (czyli keyword agrument'y), natomiast w samym template stringu nadać im więcej kontekstu np:  

```python
full_name = '{first_name} {last_name}'.format(first_name='jimmy', last_name='choo')
print(full_name)
# jimmy choo
```  

Można to wykorzystać w ciekawszy sposób poprzez rozpakowywanie słownika 🧠  
(Więcej na temat słowników możesz poczytać tu **[➜ Python dictionary FUN](/blog/python-dictionary-fun)**)

```python
data = {
    'who': 'jimmy choo',
    'where': 'silicon valley'
}

description = '{who} is heading to {where}'.format(**data)
print(description)
# jimmy choo is heading to silicon valley
```

Very cool stuff 🖖 💪  
Ten sposób jest bardzo elastyczny i za razem bardzo potężny jeśli chodzi o formatowanie string'ów.  

## f-string

Od niedawna stringi można formatować "w locie" poprzez **f-string'i**. Jest to bardzo prosty, wygodny i za razem czytelny sposów formatowania.  

```python
first_name = 'jimmy'
last_name = 'choo'
full_name = f'{first_name} {last_name}'
print(full_name)
# jimmy choo
```  

Jedyne co musimy zrobić to dodać **f** przed naszym stringiem i w wąsach możemy "wklejać" do niego wcześniej zadeklarowane zmienne.  
**Pro Tip☝️**  
Jeśli chcemy użyć nawiasu wąsa (curly bracket) wewnątrz naszego string'a z pominięciem go jako placeholder'a na zmienną, robimy to za pomocą "double curly bracket'a" czyli:  

```python
name = 'jimmy'
print(f'{name} needs to grow a {{')
# jimmy needs to grow a {
```  

W ten sposób escape'ujemy currly bracket jako znak specjalny.  
W przeciwnym wypadku otrzymamy error 😤

```python
print(f'{name} needs to grow a {')  
#  File "<stdin>", line 1
# SyntaxError: f-string: expecting '}'
```

## str API - metody, które warto znać (pamiętać o ich istnieniu)

Poza **format'em** opisanym wyżej, string jako obiekt posiada dosyć bogate API. Warto mieć z tyłu głowy istnienie metod opisane poniżej.  

**upper/lower** - upper case'ing oraz lower case'ing string'a  

```python
full_name = 'jiMmy chOo'
print(full_name.lower())
# jimmy choo
print(full_name.upper())
# JIMMY CHOO
```

**lstrip/rstrip/strip** - przycinanie z niepotrzebnych spacji  

```python
full_name = '  jiMmy chOo  '
# celowo zamieniam spacje na kropki w celach demonstracji ;)
print(full_name.lstrip().replace(' ', '.'))
# jiMmy.chOo..
print(full_name.rstrip().replace(' ', '.'))
# ..jiMmy.chOo
print(full_name.strip().replace(' ', '.'))
# jiMmy.chOo
```

**replace** - zamień ciąg znaków w string'u  

```python
full_name = 'Jimmy Choo'
print(full_name.replace('Choo', 'Czu'))
# Jimmy Czu
```

**replace** zamienia wszystkie wystąpienia  

```python
full_name = 'Choo Jimmy Choo'
print(full_name.replace('Choo', 'Czu'))
# Czu Jimmy Czu
```  

Zamiast string'a do zamiany, replace może przyjmować także **regex'a**, ale o tym innym razem 👍  

**find** - znajdź indeks wystąpienia ciągu znaków w stringu  

```python
print('jimmy choo'.find('choo'))
# 6
```

**[:]** - obcinanie string'a - magic syntax - odpowiednik metody **substring** w innych popularnych językach  

```python
full_name = 'jimmy choo'
last_name = full_name[6:]
first_name = full_name[:5]
print(last_name)
# choo
print(first_name)
# jimmy
```  

Czyli dużym skrótem **[od:do]**, jeśli pominiemy parametr to python zaczna od pierwszego znaku "od lewej", oraz ostatniego znaku "do prawej".  
Jeśli podamy oba:  

```python
print('jimmy'[2:4])
# mm
```  

**split** - krojenie string'a z użyciem separatora - wynikem czego jest lista, mniejszych stringów  

```python
products = 'serial,ketchup,mayo'
product_list = products.split(',')
print(products)
# serial,ketchup,mayo
type(products)
# <class 'str'>
print(product_list)
# ['serial', 'ketchup', 'mayo']
type(product_list)
# <class 'list'>
```  

## Happy Hacking 🤖
