---
title: Python od zera pt1 - jak zacząć ?
tags: python,learn
difficulty: 1
date: 2020-10-02
when: 02 października 2020
excerpt: Jak rozpocząć przygodę z programowaniem w Python'ie
hide: no
---
Chciałbyś rozpocząć przygodę z programowaniem, ale nie wiesz jaki język wybrać, od czego zacząć? Jesteś przytłoczony informacjami z internetu, zagubiony 🥺😵? Być może, szukasz alternatywnego języka programowania aby uniknąc statycznego typowania i "ceremonii", chcesz mieć więcej elastyczności w implementacji?  
Mam nadzieję, że uda mi się cie przekonać do python'a języka, który pokochały miliony ludzi i obecnie jest nr 2 językiem używanym przez programistów wg statystyk na GitHub'ie 🥳  

## Dlaczego python ?

Kilka mocnych argumentów przemawia za python'em jako "go to language" jeśli chodzi o naukę programowania min.:  

1. Jest językiem dojrzałym i przeszedł próbę czasu (**fun fact**: python jest starszym językiem niż Java 🤯).  
2. Prosty w instalacji.  
3. Prosty w uruchamianiu - prosty program w pythonie może zostać uruchomiony z pojedynczego pliku **.py**  
4. Posiada ogromne community i popularność na stackoverflow.
5. Posiada mnóstwo przystępnych tutoriali.
6. Większość popularnych bibliotek z pypi ma bardzo przystępne "doki", napisane dla ludzi, a nie inżynierów IT.
7. Pozwala na elastyczność implementacji (można zacząć od prostych funkcji i programowania proceduralnego, nie trzeba odrazu "wskakiwać na OOP").  
8. Powszechnie używany w Data Sience w tym Machine Learning.
9. Stawia na czytelność, nie złożoność.
10. Dużo ofert pracy.  
List goes on 🤖 (10 wystarczy 😁)  

## Zanim zaczniemy - hello world w wydaniu python'a  

```python
# hello.py
if __name__ == "__main__":
    print('Hello World!')
```

Uruchamiamy go poprzez:  

```sh
>python hello.py
Hi there!
```

`if __name__ == "__main__":` to konwenja main funkcji programu w wydaniu python'a, o tym innym razem 😉.  
Żadnego sdk, kompilowania, deklarowania klas/funkcji itd, poprostu działa 🤯.  
**Fun fact**: Możemy "bawić" się pythonem poprzez interactive terminal poprostu go uruchamiając czyli:  

```sh
>python
Python 3.8.5 (tags/v3.8.5:580fbb0, Jul 20 2020, 15:43:08) [MSC v.1926 32 bit (Intel)] on win32
Type "help", "copyright", "credits" or "license" for more information.
>>> print('hi there!')
hi there!
>>>exit()
```

Bardzo przydatne jeśli chcemy coś poprostu policzyć/sprawdzić etc.  

## Instalacja python'a

Aby zainstalować python, należy ze strony **[www.python.org/downloads/](https://www.python.org/downloads/)** pobrać dystrybucję na posiadany system operacyjny i zainstalować jak każdą inną aplikację na komputerze 🤖.  
**Hint**: Podczas instalacji (Windows) warto pamiętać aby zaznaczyć checkbox "**add python to PATH**" - pozwoli to używać pythona poprzez komendę **python** w cmd/sh 😊  
Jeśli przeoczymy ten krok, zawsze można dodać folder z **python.exe** do PATH ręcznie (google pomoże 😁)

Aby sprawdzić czy python zainstallował nam się poprawnie w cmd możemy wpisać:  

```sh
python --version
Python 3.8.5
```  

Polecam zainstalować wersję **3.8+** 👍  

Gratulacje! Udało się zainstalować python'a, możesz śmiało kontynuować naukę 👌 
**[➜ pt2 - proste typy danych](/blog/python-od-zera-pt2-proste-typy-danych)**
