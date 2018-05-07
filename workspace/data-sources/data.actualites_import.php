<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourceactualites_import extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'actualites-import';
    public $dsParamURL = 'https://www.mab-france.org/actualite-xml/';
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
            'version' => 'Symphony 2.7.2',
            'release-date' => '2018-05-07T12:51:34+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}