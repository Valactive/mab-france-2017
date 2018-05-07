<?php

require_once(EXTENSIONS . '/xmlimporter/lib/class.xmlimporter.php');

class XMLImporterActualitesImport extends XMLImporter {
    public function about()
    {
        return array(
            'name' => 'Actualites import',
            'author' => array(
                'name' => 'Valéry Frisch',
                'email' => 'valery.frisch@gmail.com'
            ),
            'description' => '',
            'file' => __FILE__,
            'created' => '2018-01-24T14:47:26+00:00',
            'updated' => '2018-05-07T12:52:45+00:00',
            'version' => 'XML Importer 3.0'
        );
    }

    public function options()
    {
        return array(
            'can-update' => 'yes',
            'fields' => array(
                0 => array(
                    'field' => '13',
                    'xpath' => 'titre/text()',
                    'php' => ''
                ),
                1 => array(
                    'field' => '14',
                    'xpath' => 'statut/item/text()',
                    'php' => ''
                ),
                2 => array(
                    'field' => '15',
                    'xpath' => 'date/date/start/text()',
                    'php' => 'XMLImporterHelpers::dateFlip'
                ),
                3 => array(
                    'field' => '16',
                    'xpath' => 'publie/text()',
                    'php' => ''
                ),
                4 => array(
                    'field' => '17',
                    'xpath' => 'auteur/item/@id',
                    'php' => ''
                ),
                5 => array(
                    'field' => '18',
                    'xpath' => 'texte/.',
                    'php' => ''
                ),
                6 => array(
                    'field' => '19',
                    'xpath' => 'nom-du-document-joint/text()',
                    'php' => ''
                ),
                7 => array(
                    'field' => '20',
                    'xpath' => 'document-joint/filename/text()',
                    'php' => ''
                ),
                8 => array(
                    'field' => '28',
                    'xpath' => '.',
                    'php' => 'XMLImporterHelpers::setActualite'
                ),
            ),
            'included-elements' => '/data/actualites-import/data/actualites-pour-import/entry',
            'namespaces' => NULL,
            'source' => 'actualites_import',
            'timeout' => '60',
            'section' => '6',
            'unique-field' => '13'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }
}
