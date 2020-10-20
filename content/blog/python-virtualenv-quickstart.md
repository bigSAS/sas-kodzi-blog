---
title: Python venv 1on1
tags: [python, venv, development]
difficulty: 2
date: 2020-09-30
when: 30 września 2020
excerpt: Wirtualne środowisko oraz dlaczego powinieneś go używać
hide: no
---

Zakładam, że masz zainstalowany python na komputerze globalnie i potrafisz z niego korzystać na poziomie postawowym 🖖  

We współczesnym świecie programowania pisanie wszystkiego "od zera" nie jest zbyt efektywne. Przeważnie okazuje się, że problem, z którym się zmagasz został już przez kogoś rozwiązany i możesz po niego sięgnąc z **[pypi.org](https://pypi.org/)** czyli Python Package Index.  Biblioteki są utrzymywane i rozwijane, co za tym idzie wersjonowane. Niestety posiadanie różnych wersji pakietów/bibliotek w obrębie jednego systemu operacyjnego nie jest dobrym pomysłem 😵.  

Za dobrą praktykę uznawane jest zakładanie **wirtualnych środowisk python'a** na potrzeby projektu/repozytorium. Na nasze szczęście python 3+ posiada wbudowany moduł, który w prosty sposób umożliwia te zagadnienie rozwiązać. Moduł o nazwie **venv**.  

Jeśli instalowałeś już cokolwiek z pypi wiesz, że wystarczy użyć komendy

```sh
pip install <nazwa-pakietu>
```  

Lub jeśli chcemy określoną wersję

```sh
pip install <nazwa-pakietu>==<wersja.pakietu>
```  

Niestety wtedy pakiety instalowane są globalnie, czyli tam gdzie znajduje się twój python. W przypadku kilku wersji pakietu można napotkać spore problemy z doprowadzeniem niektórych rzeczy do uruchamialności 😓  

Rozwiązaniem jest użycie venv'a. Załóżmy, że chcę rozpocząć nowy projekt od zera i będę potrzebować popularnej biblioteki **requests**. Jedyne co muszę zrobić to wykonać kilka operacji z cmd 🤖  

Tworzę folder na projekt i wchodzę do niego  

```sh
D:\code\blog>mkdir venv1n1
D:\code\blog>cd venv1n1
```

Następnie tworzę venv'a  

```sh
D:\code\blog\venv1n1>python -m venv env
```

Parametr **-m** oznacza moduł, **venv** to nazwa modułu, natomiast **env** to nazwa/path naszego wirtualnego środowiska. Z racji tego, że komendę wywołałem w folderze **venv1n1/** zostanie utworzony folder **venv1n1/env/**, który będzie posiadał oddzielną pustą instalację pythona pod mój projekt.  

**Important** - jeśli zamierzasz trzymać projekt w repozytorium, pamiętaj aby **zawsze dodać folder z virtualnym środowiskiem do .gitignore !☝️**  

Ok, stworzyłem środowisko ale jak mam tam instalować pakiety 🤔? Przecież `pip install` instaluje je globalnie. Jedyne o czym trzeba pamiętać to **aktywować środowisko** i w nim wywoływać te same komendy instalacyjne co zawsze 🧠  

Aby aktywować środowisko musimy:  

Windows  

```sh
D:\code\blog\venv1n1>env\Scripts\activate
```

Linux\MacOS  

```sh
path/to/my/venv1n1>. env\scripts\activate
```  

Jeśli wykonałem wszystko poprawnie nazwa środowiska powinna pojawić się na początku prompt'a w terminalu.  

```sh
(env) D:\code\blog\venv1n1>
```

Oznacza to, że każda operacja związana z python'em będzie kierowana do instalacji znajdującej się w **venv1n1/env/**  
Instalujemy **requests**  

```sh
(env) D:\code\blog\venv1n1>pip install requests
Collecting requests
  Downloading requests-2.24.0-py2.py3-none-any.whl (61 kB)
     |████████████████████████████████| 61 kB 1.1 MB/s
Collecting chardet<4,>=3.0.2
  Downloading chardet-3.0.4-py2.py3-none-any.whl (133 kB)
     |████████████████████████████████| 133 kB 3.3 MB/s
Collecting urllib3!=1.25.0,!=1.25.1,<1.26,>=1.21.1
  Downloading urllib3-1.25.10-py2.py3-none-any.whl (127 kB)
     |████████████████████████████████| 127 kB ...
Collecting certifi>=2017.4.17
  Using cached certifi-2020.6.20-py2.py3-none-any.whl (156 kB)
Collecting idna<3,>=2.5
  Using cached idna-2.10-py2.py3-none-any.whl (58 kB)
Installing collected packages: chardet, urllib3, certifi, idna, requests
Successfully installed certifi-2020.6.20 chardet-3.0.4 idna-2.10 requests-2.24.0 urllib3-1.25.10
WARNING: You are using pip version 20.1.1; however, version 20.2.3 is available.
You should consider upgrading via the 'd:\code\blog\venv1n1\env\scripts\python.exe -m pip install --upgrade pip' command.
```

Sprawdzamy instalację  

```sh
(env) D:\code\blog\venv1n1>pip freeze
certifi==2020.6.20
chardet==3.0.4
idna==2.10
requests==2.24.0
urllib3==1.25.10
```  

Komenda **pip freeze** listuje wszyskie biblioteki zainstalowane w aktywnym środowisku python'a czyli w naszym przypadku z naszego **env**.  

Jeśli chcemy wersjonować/przechowywać informacje na temat tego jakie biblioteki są wymagane dla naszego projektu, możemy je w prosty sposób zapisać do pliku tekstowego  

```sh
(env) D:\code\blog\venv1n1>pip freeze > requirements.txt
```  

Następnie jeśli chcemy zainstalować wszystkie biblioteki potrzebne do uruchomienia naszego projektu (powiedzmy na innym komputerze, lub na potrzeby CI/CD)  

```sh
(env) sciezka\do\projektu>pip install -r requirements.txt
```

Gotowe 🤖 Od dziś nie muszę instalować bibliotek, globanie 👀. Dodatkowo jeśli będę miał problemy z env'em, to mogę go poprostu usunąć/przeinstalować/zdebugować 👍  
