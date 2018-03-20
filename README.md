# ChosenForEvo
Плагин для поиска по длинным селектам в админке EvolutionCMS

## О плагине
Основано на Chosen https://github.com/harvesthq/chosen/releases

## Установка
1. Скопировать папку assets в корень сайта.
2. Создать новый плагин и вставить туда код:

```php
/**
 * ChosenForEvo
 *
 * Plugin that makes long, unwieldy select boxes much more user-friendly.
 *
 * @category    plugin
 * @version     1.0
 * @author      media_kot
 * @internal    @events OnDocFormRender
 * @internal    @properties &config=config;textarea;"select#template" :{ }
 * @reportissues https://github.com/mediakot/ChosenForEvo
 * @internal    @modx_category Manager and Admin
 * @documentation Chosen jQuery plugin https://harvesthq.github.io/chosen/
 */

$css = "<link rel='stylesheet' href='".$modx->config['site_url']."assets/plugins/chosenforevo/chosen.css'>";
$js = $modx->config['site_url'].'assets/plugins/chosenforevo/chosen.jquery.min.js';

$config = stripslashes($config);

if ($modx->event->name == 'OnDocFormRender'){
	$script = <<<EOT
	<script src="{$js}"></script>
	<script>
		\$j("head").append("{$css}");
			var config = {
			  {$config}
			}
		for (var selector in config) {
			 \$j(selector).chosen(config[selector]);
		}
	</script>
EOT;
	$modx->event->output($script);
}
```

3. Поставить галочку «Анализировать DocBlock» и сохранить.

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

