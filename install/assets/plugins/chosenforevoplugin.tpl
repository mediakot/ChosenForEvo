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
 * @internal    @installset base, sample
 * @internal    @modx_category Manager and Admin
 * @license     http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @reportissues https://github.com/mediakot/Chosen
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