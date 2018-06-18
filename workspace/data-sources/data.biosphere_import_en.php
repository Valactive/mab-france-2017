<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourcebiosphere_import_en extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'biosphere-import-en';
    public $dsParamURL = 'https://www.mab-france.org/en/biospheres-import/';
    public $dsParamFORMAT = 'xml';
    public $dsParamXPATH = '/data';
    public $dsParamCACHE = 0;
    public $dsParamTIMEOUT = 6;

    public function __construct($env=NULL, $process_params=true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Biosphere import EN',
            'author' => array(
                'name' => 'Valéry Frisch',
                'website' => 'https://prep.mab-france.org',
                'email' => 'valery.frisch@gmail.com'),
            'version' => 'Symphony 2.7.2',
            'release-date' => '2018-05-10T15:59:38+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}