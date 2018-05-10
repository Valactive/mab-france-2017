<?php

	class XMLImporterHelpers {
		static function markdownify($string) {
			require_once(EXTENSIONS . '/xmlimporter/lib/markdownify/markdownify_extra.php');
			$markdownify = new Markdownify(true, MDFY_BODYWIDTH, false);

			$markdown = $markdownify->parseString($string);
			$markdown = htmlspecialchars($markdown, ENT_NOQUOTES, 'UTF-8');
			return $markdown;
		}

		static function dateFlip($string){
			$value = implode('/', array_reverse(explode('/', strtok($string, ' '))));
			return $value;
		}

		static function setActualite($string){
			return "Actualité";
		}
		static function setPublication($string){
			return "Publication";
		}
		public function makeMultilanguage($string)
		{
			//var_dump($string);
		$xml = @simplexml_load_string($string);
		$xml = simplexml_load_string(''.$string.'');
		$result = $xml->xpath('//item');
		//var_dump($result);
		// $output = array();
		 $output['fr'] = $string;
		// $output['en'] = $result[1];
		// $output['fr'] = $result[2];
		// $output['pt'] = $result[3];
		return $output;
		}
	}

