<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourceactualites_import extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'actualites-import';
    public $dsParamURL = 'http://mab-france.localhost/actualite-xml/';
    public $dsParamFORMAT = 'xml';
    public $dsParamXPATH = '*';
    public $dsParamCACHE = 1;
    public $dsParamTIMEOUT = 6;

    public function __construct($env=NULL, $process_params=true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Actualites-import',
            'author' => array(
                'name' => 'Valéry Frisch',
                'website' => 'http://mab-france-new.localhost',
                'email' => 'valery.frisch@gmail.com'),
            'version' => 'Symphony 2.7.0',
            'release-date' => '2018-01-24T15:42:46+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}