<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourcenewsletter_list extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'newsletter-list';
    public $dsParamURL = 'https://www.mab-france.org/workspace/campaigns.php';
    public $dsParamFORMAT = 'xml';
    public $dsParamXPATH = '/Campaigns/Campaign';
    public $dsParamCACHE = 5;
    public $dsParamTIMEOUT = 6;

    public function __construct($env=NULL, $process_params=true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Newsletter list',
            'author' => array(
                'name' => 'Valéry Frisch',
                'website' => 'http://mab-france.localhost',
                'email' => 'valery.frisch@gmail.com'),
            'version' => 'Symphony 2.7.2',
            'release-date' => '2018-07-29T09:53:49+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}