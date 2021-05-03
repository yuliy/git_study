<!--ts-->
* [Хуки в Git](./hooks.md#хуки-в-git)
   * [Полезные ссылки](./hooks.md#полезные-ссылки)
   * [Коротко о главном](./hooks.md#коротко-о-главном)
<!--te-->

# Хуки в Git

## Полезные ссылки
  * [git-scm.com: 8.3 Customizing Git - Git Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
  * [git-scm.com: 8.4 Customizing Git - An Example Git-Enforced Policy
](https://git-scm.com/book/en/v2/Customizing-Git-An-Example-Git-Enforced-Policy#_an_example_git_enforced_policy)

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

**Server-side hooks:**
  * **pre-receive** - вызывается перед пушем однократно.
  * **update** - вызывается перед пушем на каждый бранч.
  * **post-receive** - вызывается в самом конце.

<!-- foo v=6-->
