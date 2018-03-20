# ChosenForEvo
Плагин для поиска по длинным селектам в админке EvolutionCMS

## О плагине
Основано на Chosen https://github.com/harvesthq/chosen/releases

## Установка
 1.Скачать zip.
 2.Установить через Extras

## Документация

В конфигурации  заполнить поле «Config». Для примера там установлено "select#template" :{ } (Между фигурными скобками пробел). Плагин будет применен к любым селектам.
Первый параметр: селектор селекта (класс, ид, и т.д). Второй параметр: опции.

Чтобы применить к селектам в multiTV: ```"select.mtv_link" :{ }```

###Опции

Перечисляются через запятую.

disable_search_threshold: n – отключить поиск, если меньше n документов, пример: disable_search_threshold: 10.

no_results_text: "text"  – Текст, если ничего не найдено no_results_text: "Ничего не найдено".

allow_single_deselect: true – Разрешить пустое значение.

case_sensitive_search: true – Регистрозависимый поиск.

Страница с другими опциями Chosen https://harvesthq.github.io/chosen/options.html

