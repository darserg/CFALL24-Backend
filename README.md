1. Установить Docker-образ для postgres
2. Запустить postgres в docker
```
   docker run --name AbobaDB -p 5432:5432 -e POSTGRES_PASSWORD=aboba -d postgres
   docker exec -it AbobaDB psql -U postgres
```

```
CREATE DATABASE users;
CREATE DATABASE preference;
CREATE DATABASE question;
\l
```
3. Установить Vapor и ngrok
```shell
brew install vapor
brew install ngrok
```
4. Перейти в папку проекта [API](https://github.com/darserg/CFALL24-Backend/commits/main/)
5. Запустить приложение
```shell
swift run
ngrok http 8080
```
Копируем ссылку с ngrok
6. В веб-приложении нужно зайти в файл [Question.cs](https://github.com/Ezhkin-Kot/CFALL24-Frontend/) [AuthUser.cs](https://github.com/Ezhkin-Kot/CFALL-24-Frontend) и поменять переменную apiUrl на "<ссылка из ngrok>/users" и переменную answersUrl на "<ссылка из ngrok>/questions"
