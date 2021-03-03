**toc:**
<!--ts-->
  * [Получение справки](#получение-справки)
  * [Как создать ветку?](#как-создать-ветку)
  * [Как удалить ветку?](#как-удалить-ветку)
  * [Как сделать, чтобы текущая ветка включила все свежие изменения из мастера?](#как-сделать-чтобы-текущая-ветка-включила-все-свежие-изменения-из-мастера)
  * [Как поменять историю коммитов в ветке?](#как-поменять-историю-коммитов-в-ветке)
  * [Как "насильно" переместить указатель бранча на определенный коммит?](#как-насильно-переместить-указатель-бранча-на-определенный-коммит)
  * [Как запушить в репу ветку с новой историей?](#как-запушить-в-репу-ветку-с-новой-историей)
  * [Как интерактивно переводить в staged?](#как-интерактивно-переводить-в-staged)
  * [Как применить к текущей ветке 1 коммит из другой ветки?](#как-применить-к-текущей-ветке-1-коммит-из-другой-ветки)
  * [Как закомиченные изменения в modified?](#как-закомиченные-изменения-в-modified)
<!--te-->

# CookBook

## Получение справки
Есть 3 разных способа получить справку:
```bash
git help <verb>
git <verb> --help
man git-<verb>
```

Можно также получить сокращённую справку:
```bash
git <verb> -h
```


## Как создать ветку?
```bash
git branch mybranch
git checkout mybranch

# или то же самое одной командой
git checkout -b mybranch
```


## Как удалить ветку?
```bash
git checkout master
git pull origin master
git branch -D mybranch
```


## Как сделать, чтобы текущая ветка включила все свежие изменения из мастера?
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


## Как поменять историю коммитов в ветке?
Эта команда будет интерактивно ребейзить последние 3 коммита:
```bash
git rebase -i HEAD^^^
```

```HEAD^^^``` - это от какого коммита ребейзим. Кол-во "крышечек" - кол-во коммитом назад от указанного. В данном случае - последние 3 коммита от HEAD (включая HEAD). Можно указать хеш коммита.

Как именно делать изменения истории, понятно из появляющегося текстового сообщения. Пример:
```bash
pick 9ca4005 Update README.md
pick d3f70f6 Add cookbook.md
pick 10c2a31 Interactive rebase howto

# Rebase 03bf1b5..10c2a31 onto 03bf1b5 (3 commands)
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup <commit> = like "squash", but discard this commit's log message
# x, exec <command> = run command (the rest of the line) using shell
# b, break = stop here (continue rebase later with 'git rebase --continue')
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
# .       create a merge commit using the original merge commit's
# .       message (or the oneline, if no original merge commit was
# .       specified). Use -c <commit> to reword the commit message.
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
# However, if you remove everything, the rebase will be aborted.
#
```

Что здесь важно знать:
  * Если хочешь удалить коммит из истории - удаляешь соответствующую строчку.
  * Если хочешь оставить - не трогаешь строчку.
  * Меняешь порядок строчек - меняется порядок коммитов.
  * Коммит можно смёржить с соседним коммитом. Для этого в строчке, которую хотим сержить, заменяем pick на fixup (или просто f).
  * Commit message можно переименовать. Для этого заменяем pick на reword (или просто r). Сам текст при этом можно будет изменить после сохранения этого файла. Откроется отдельно окно.


## Как "насильно" переместить указатель бранча на определенный коммит?
```bash
git co branch
git reset --hard <commit>
```


## Как запушить в репу ветку с новой историей?
```bash
git push --force origin <branch>
```

Такой пуш требуется всегда, когда требуется изменить историю в ветке. То без ```--force``` можно только, если мы добавляем коммиты сверху к истории.

## Как интерактивно переводить в staged?
```bash
git add -p
```

Довольно удобная опция. git небольшими порциями показывает diff и предоставляет возможность по каждой порции принять решение - брать в stated или проигнорировать.

## Как применить к текущей ветке 1 коммит из другой ветки?
```bash
git cherry-pick <commit-hash>
```
Эта команда продублирует (локально в staged) указанный коммит с тем же commit-message.

## Как закомиченные изменения в modified?
```bash
git reset <commit-hash>
```

Или например так для последнего коммита:
```bash
git reset HEAD^
```
