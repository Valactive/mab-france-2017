<?php

	Class extension_lang_french extends Extension {

		/**
		 * Extension information
		 */

		public function about() {
			return array(
				'name' => 'Language: French',
				'type' => 'Localisation',
				'version' => '1.2',
				'release-date' => '2012-08-30',
				'author' => array(
					'name' => 'Pierre Bertet / Grégoire Dierendonck',
					'website' => 'http://pierrebertet.net/',
					'email' => 'bonjour@pierrebertet.net'
				),
				'description' => 'French translation for the Symphony backend',
				'compatibility' => array(
					'2.0.0' => false,
					'2.0.1' => false,
					'2.0.2' => false,
					'2.0.3' => false,
					'2.0.4' => false,
					'2.0.5' => false,
					'2.0.6' => false,
					'2.0.7' => true,
					'2.0.8' => true,
					'2.3' => true,
				)
			);
		}

	}