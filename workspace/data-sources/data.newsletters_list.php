<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourcenewsletters_list extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'newsletters-list';
    public $dsParamURL = 'https://mab-france.org/fr/rss/actualites/';
    public $dsParamFORMAT = 'xml';
    public $dsParamXPATH = '/rss/channel/item';
    public $dsParamCACHE = 0;
    public $dsParamTIMEOUT = 6;

    public $dsParamNAMESPACES = array(
        'atom' => 'http://www.w3.org/2005/Atom',
    );

    public function __construct($env=NULL, $process_params=true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Newsletters list',
            'author' => array(
                'name' => 'Valéry Frisch',
                'website' => 'http://mab-france-new.localhost',
                'email' => 'valery.frisch@gmail.com'),
            'version' => 'Symphony 2.7.2',
            'release-date' => '2018-02-14T15:19:04+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}