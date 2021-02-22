# study_git
Мои заметки по ходу изучения VCS Git.

## Как быстро познакомиться с git
[youtube: Git. Большой практический выпуск](https://www.youtube.com/watch?v=SEvR78OhGtw)

## Для более углублённого изучения
  * Pro Git
    * [en](https://git-scm.com/book/en/v2)
    * [ru](https://git-scm.com/book/ru/v2)
    * там же можно скачать pdf-версию книги

## Мои заметки
[CookBook](./cookbook.md)

## CookBook

### Как создать ветку?
```bash
git branch mybranch
git checkout mybranch

# или то же самое одной командой
git checkout -b mybranch
```

### Как удалить ветку?
```bash
git checkout master
git pull origin master
git branch -D mybranch
```

### Как сделать, чтобы текущая ветка включила все свежие изменения из мастера?
Т.е. есть такое:
```
            origin/master
            V
A---B---C---D
     \--E---F
            ^
            mybranch
```
Хотим сделать так:
```
            origin/master
            V
A---B---C---D
             \--E---F
                    ^
                    mybranch
```
Для этого, находясь в mybranch,  делаем:
```bash
git pull --rebase origin master
```

### Как поменять историю коммитов в ветке?
Эта команда будет интерактивно ребейзить последние 3 коммита:
```bash
git rebase -i HEAD^^^
```

```HEAD^^^``` - это от какого коммита ребейзим. Кол-во "крышечек" - кол-во коммитом назад от указанного. В данном случае - последние 3 коммита от HEAD (включая HEAD). Можно указать хеш коммита.

### Как "насильно" переместить указатель бранча на определенный коммит?
```bash
git co branch
git reset --hard <commit>
```

### Как запушить в репу ветку с новой историей?
```bash
git push --force origin <branch>:<branch>
```
