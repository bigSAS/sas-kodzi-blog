---
title: Python + pytest - czyli jak ułatwić sobie życie w testowaniu
tags: [python, pytest, testing]
difficulty: 2
date: 2020-10-14
when: 14 października 2020
excerpt: Testy jednostkowe, oraz jak je implementować z użyciem python + pytest
hide: no
---

![python + pytest](/img/onceugo/main.png)  

## Dlaczego pytest ?

Skoro Python to i pytest 🙃 👍. Można śmiało powiedzieć, że pytest to najbardziej popularna i wszechstronna biblioteka pomagająca testowanie oprogramowanie dostępna dla python'a.  
O wszystkich ficzerach możesz śmiało poczytać na oficjalnej stronie z dokumentacją [**➜ tutaj**](https://docs.pytest.org/en/stable/contents.html). Ja postaram się skupić na według mnie najważniejszych, a za razem wymaganych aby "wycisnąć" z niego jak najwięcej 🧠.  

## Instalacja

Instalujemy jak każdy inny lib do virtualenv'a.  
Jeśli nie jesteś zaznajomiony z pakietem **venv** [**➜ tutaj dowiesz się o nim więcej**](/blog/python-virtualenv-quickstart).  

```sh
(env) > pip install pytest
```

Gotowe! Możesz kożystać z **pytest**. Warto wiedzieć, że można go używać zarówno jako programu jak i modułu.  

Jako program

```sh
(env) > pytest mytests.py
```

Jako modułu

```sh
(env) > python -m pytest mytests.py
```

W tym artykule używać będziemy go jako programu 🤖.  

## Pierwsze testy (mini projekt)

OK tworzymy nowy folder **pytest-fun**. Poczym robimy venv'a i instalujemy pytest.  

```sh
> mkdir pytest-fun
> cd pytest-fun
pytest-fun> python -m venv env
pytest-fun> env\Scripts\activate
(env) pytest-fun> pip install pytest
```

Tworzymy także dwa foldery, jeden będzie pakietem, drugi poprostu folderem na testy (o tym dlaczego foldery z testami nie potrzebują __init__.py opowiem później).  

```sh
(env) pytest-fun> mkdir libs
(env) pytest-fun> mkdir tests
(env) pytest-fun> cd libs
(env) pytest-fun/libs> echo "" > __init__.py
```

OK możemy otworzyć projekt w jakimś edytorze aby ułatwić sobie pracę. W moim przypadku to **vscode**.
Struktura folderów powinna być następująca:  

```sh
+--- env
+--- libs
|   +--- __init__.py
+--- tests
```

Dodajmy plik **libs/math.py** a w nim kilka dwie proste funkcje.  

```python
# libs/math.py

def add(a: int, b: int) -> int:
    return a + b

def sub(a: int, b: int) -> int:
    return a - b
```

Wiem ... rozwiązujemy poważne problemy informatycznie 🧠. Funkcje są trywialne na potrzeby demonstracji 👀. Poprostu przyjmijmy, że to funkcjonalności naszego programu i chcemy na nich zrobić unit testy.  

Tworzymy plik **tests/test_math.py**  

```python
# tests/test_math.py
from libs.math import add, sub


def test_adding():
    assert add(1, 1) == 2

def test_sub():
    assert sub(1, 1) == 0
```

## Testujemy 🖖

```sh
(env) pytest-fun> pytest
========================= test session starts ========================
platform win32 -- Python 3.8.5, pytest-6.1.1, py-1.9.0, pluggy-0.13.1
rootdir: D:\code\python\pytest-fun
collected 2 items

test_math.py ..                                                  [100%]
========================= 2 passed in 0.02s ===========================
```

Cool stuff 👀 Nasze dwa pierwsze unit testy, a w raz z nimi bardzo satysfakcjonujące kropki, po jednej dla testu, który wykonał się poprawnie.  

Postaram się wyjaśnić co się zadziało. Zauważ, że nie ma żadnego pliku konfiguracyjnego, żadnych dodatkowych parametrów. Uruchomiłeś pytest, a on wykrył testy i je uruchomił. Nie ma nawet importu z pytest w pliku z testami 🙃.  
Otóż pytest wykonuje **test discovery** oczywiście możemy wskazać jako argument folder/plik, w którym ma szukać testów np:  

```sh
(env) pytest-fun> pytest tests/
```

W tym przypadku efekt będzie identyczny, ponieważ mamy tylko jeden plik i w nim dwa testy. Pytest szuka funkcji zaczynających się od **test_** (można tym sterować - jest to opisane w dokumentacji, na razie trzymamy się konwencji wymyślonej przez twórców). Między innymi dlatego folderów z testami nie traktujemy jako moduły pythonowe. Pytest sam "ogarnia" gdzie są testy. Jak się możesz domyślić po discovery następuje uruchomienie testów 🤖. Jeśli testy przejdą poprawnie program zwraca exit code 0. Czyli wszystko OK.  

Dodajmy kolejny test, który celowo nie przechodzi.  

```python
# tests/test_math_not_so_smart.py
from libs.math import add


def test_i_cant_count_right():
    assert add(1, 1) == 0
```

Uruchamiamy testy, tym razem z parametrem **-v** (verbose), żeby otrzymać więcej informacji na temat przebiegu testów.  

```sh
(env) pytest-fun> pytest -v
==================== test session starts ====================
platform win32 -- Python 3.8.5, pytest-6.1.1, py-1.9.0,
pluggy=====-0.13.1 
-- d:\code\python\pytest-fun\env\scripts\python.exe
cachedir: .pytest_cache\pytest-fun> pytest -v
rootdir: D:\code\python\pytest-fun
collected 3 items

test_math.py::test_adding PASSED                          [ 33%]
test_math.py::test_sub PASSED                             [ 66%]
test_math_not_so_smart.py::test_i_cant_count_right FAILED [100%]

========================= FAILURES ==========================
__________________ test_i_cant_count_right __________________

    def test_i_cant_count_right():
>       assert add(1, 1) == 0
E       assert 2 == 0
E         +2
E         -0

test_math_not_so_smary.py:5: AssertionError
================== short test summary info ==================
FAILED test_math_not_so_smary.py::test_i_cant_count_right
================ 1 failed, 2 passed in 0.15s ================
```

Jeśli chcielibyśmy uruchomić tylko plik z popsutym testem możemy to zrobić:  

```sh
(env) pytest-fun> pytest -v tests/test_math_not_so_smart.py
```

Możemy uruchomić nawet tylko ten test, który chcemy:  

```sh
(env) pytest-fun> pytest -v tests/test_math_not_so_smart.py::test_i_cant_count_right
```

Napraw test i możemy przejść dalej 🙂  

## Markery

Kiedy kodu przybywa, a z tym testów i mamy już średni/duży projekt, wtedy uruchamianie testów z pliku/plików może być uciążliwe. Na szczęście testy można dekorować **markerami**.  
Jedyne co musimy zrobić to dodać dekorator do funkcji testowej  

```python
# tests/test_math.py
import pytest
from libs.math import add, sub


@pytest.mark.math
@pytest.mark.adding
def test_adding():
    assert add(1, 1) == 2


@pytest.mark.math
@pytest.mark.subbing
def test_sub():
    assert sub(1, 1) == 0
```

Teraz możemy uruchamiać pytest z parametrem **-m**.   

```sh
# uruchom testy posiadające marker "math"
(env) pytest-fun> pytest -v -m "math"
```

```sh
# uruchom testy posiadające markery "math" i "subbing"
(env) pytest-fun> pytest -v -m "math and subbing"
```

```sh
# uruchom testy posiadające markery "adding" albo "subbing"
(env) pytest-fun> pytest -v -m "adding or subbing"
```

Discovery będzie wyszukiwało testy spełniające kryteria markerów. Cool stuff 👀. Nie potrzebujemy plików z definicjami suiteów itd. Wystarczy, że w trakcie definiowania testów przyjmiemy konwencję markowania i automatycznie organizujemy swoje testy 👌  

Definicje markerów możemy trzymać w pliku pytest.ini (bez niej będziemy mieli warningi przy uruchomieniach testów)  

```sh
# pytest.ini

[pytest]
markers =
    math: advanced mathematics ;)
    adding: adding functions tests
    subbing: subtraction functions tests
```

Pomoże nam to także w przypadku kiedy nie możemy zdecydować jakie dać markery, w pytest.ini będziemy mieli ich opisy.  

Markery wraz z opisami (własne oraz wbudowane w pytest) możemy sprawdzić komendą:  

```sh
(env) pytest-fun> pytest --markers
```

## Dependency injection (conftest oraz pytest.fixture)

W pewnym momencie (średni/większy projekt) może się okazać, że zaczynamy mieć dużo testów, a co za tym przeważnie idzie:  

- Setup/teardown  
- Współdzielone dane  
- Parametryzację (środowiska/elementy konfiguracyjne)  

Pytest got you covered 😎. Dependency injection zostało bardzo bardzo "sprytnie" wkomponowane w struktury projektu.  
Więcej na temat zaawansowanego użycia możesz oczywiście poczytać w dokumentacji.  Na razie jedyne co trzeba wiedzieć to że w dowolnym miejscu projektu (począwszy od root folderu) możesz definiować pliki **conftest.py**  
Natomiast w tych plikach możemy definiować funkcje i dekorować je **@pytest.fixture()**. Mogą one być deklarowane w scope sesji (jedno wywołanie na całą sesję) lub w scope funkcji (wywołanie per funkcja, która danego fixture używa).  

Załóżmy, że chciałbym aby moje unit testy za każdym razem przy wywołaniu dostawały liczbę z zakresu 0 - 100 (tak wiem ... trywialny przykład 😏)  

```python
# conftest.py
import pytest


@pytest.fixture(scope='function')
def random_int() -> int:
    """ Random int number from 0 to 100 """
    return randrange(0, 100)
```

Teraz w dowolnym teście mogę użyć fixture **random_int** jako parametr 🤖  

```python
# tests/test_math.py
...

@pytest.mark.math
@pytest.mark.adding
def test_adding(random_int: int):
    expected = 1 + random_int
    assert add(1, random_int) == expected

```

Sprawdzamy działanie  

```sh
(env) pytest-fun> pytest -v -m "math and subbing"
==================== test session starts =====================
tests/test_math.py::test_adding PASSED                  [100%]
============== 1 passed, 2 deselected in 0.07s ===============
```

Jak możesz się domyślić jest o wiele bardziej cool przypadków, w których się może przydać.  
Na temat samego mechanizmu ważne na razie jest to, że jeśli w **conftest.py** zdefiniujesz funkcję odekorowaną **@pytest.fixture** - wtedy możesz wynik jej wywołania wstrzykiwać do dowolnego testu. Jedyne co musisz znać to nazwę funkcji (IDE wykrywają fixture'y i je podpowiadają 😁).  
Jest to prosty, a zarazem bardzo potężny mechanizm, który warto znać i należy używać. Bardziej praktyczne przykłady przedstawię w kolejnym wpisie na temat testów E2E z użyciem selenium 🧠.

## Parametryzacja iteracji

OK testy, które zrobiliśmy nie są może skomplikowane, ale na pewno jest ich za mało. Mam na myśli za mało iteracji, nie za mało definicji. Co w przypadku jeśli chciałbym nasz test dodawania przepuścić przez większą ilość danych testowych. Oczywiście nie chcę powielać testu i robić bałaganu w projekcie 👀  
Otóż mamy do dyspozycji jeden z wbudowanych markerów **@pytest.mark.parametrize(argnames, argvalues)** (btw mogłeś go zauważyć przy listowaniu markerów z cmd). Pozwala on w "magiczny" sposób przekazywać parametry do naszej funkcji testowej. Refaktornijmy więc nasz test dodawania 🤏  

```python
# tests/test_math.py
...

@pytest.mark.math
@pytest.mark.adding
@pytest.mark.parametrize("a", [1, 2, 3])
def test_adding(random_int: int, a: int):
    expected = a + random_int
    assert add(a, random_int) == expected
```

Sprawdźmy

```sh
(env) pytest-fun> pytest -v -m "math and subbing"
==================== test session starts =====================
tests/test_math.py::test_adding[1] PASSED                [ 25%]
tests/test_math.py::test_adding[2] PASSED                [ 50%]
tests/test_math.py::test_adding[3] PASSED                [ 75%]
============== 3 passed, 2 deselected in 0.07s ===============
```

W dekoratorze @pytest.mark.parametrize jako pierwszy parametr podalismy nazwę parametru, jaki chcemy wstrzyknąć do testu czyli **a**, natomiast jako drugi listę wartości, a za tym ilość iteracji dla naszego testu.

Oczywiście możemy definiować więcej parametrów. Oddzielamy je przecinkiem, natomiast lista parametrów staje się wtedy listą dwu wymiarową.   


```python
# tests/test_math.py
...

@pytest.mark.math
@pytest.mark.subbing
@pytest.mark.parametrize("a, b, expected", [
    [1, 1, 0],
    [2, 1, 1],
    [3, 0, 3]
])
def test_sub(a: int, b: int, expected: int):
    assert sub(a, b) == expected
```

Sprawdźmy

```sh
(env) pytest-fun> pytest -v -m "math and subbing"
==================== test session starts =====================
tests/test_math.py::test_sub[1-1-0] PASSED               [ 25%]
tests/test_math.py::test_sub[2-1-1] PASSED               [ 50%]
tests/test_math.py::test_sub[3-0-3] PASSED               [ 75%]
============== 3 passed, 5 deselected in 0.07s ===============
```

Fun fun stuff 🤙  

## Podsumowanie

OK dzisiaj poznałeś pytest i jak z niego korzystać w sposób podstawowy, a za razem właściwy. Oczywiście gorąco zachęcam do poczytania dokumentacji, jest naprawde przystępna nawet dla początkucjących 🙃.  

Link do projektu: [**https://github.com/bigSAS/python-pytest-example-unit-testing**](https://github.com/bigSAS/python-pytest-example-unit-testing)  
