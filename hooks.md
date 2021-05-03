# Хуки в Git

## Полезные ссылки
  * [git-scm.com: Customizing Git - Git Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)

## Коротко о главном

Хуки в git бывают: client-sidee и server-side.

**Client-side hooks:**
  * **pre-commit** - запускается перед коммитом, в самом начале. То есть даже коммит-мессаджа ещё нет.
  * **prepare-commit-msg** - запускается после формирования дефолтного коммит-мессаджа, но до открытия редактора. То есть здесь можно поправить дефолтный коммит-мессадж.
  * **commit-msg** - вызывается после ввода пользователем коммит-мессаджа.
  * **post-commit** - вызывается в самом конце, после коммита.
  * **applypatch-msg** - используется для проверки/исправления коммит-мессаджа.
  * **pre-applypatch** - вызывается после применения патча на коммит-мессадж, но до коммита.
  * **post-applypatch** - вызывается после выполнения коммита.
  * **pre-rebase**
  * **post-rewrite**
  * **post-checkout**
  * **post-merge**
  * **pre-push**
  * **pre-auto-gc**

**Server-side hookds:**
  * **pre-receive** - 
