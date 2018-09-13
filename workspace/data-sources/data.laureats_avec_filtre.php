<?php

class datasourcelaureats_avec_filtre extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'laureats-avec-filtre';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '12';
    public $dsParamSTARTPAGE = '{$url-numpage}';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamPARAMOUTPUT = array(
        'logo-odd'
        );
    public $dsParamSORT = 'system:id';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '143' => 'yes',
        '145' => '{$url-odd}',
        '146' => '{$url-annee}',
        '150' => '{$url-biosphere}',
        '152' => '2187',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'system:pagination',
        'laureat-nom: all-languages: formatted',
        'laureat-presentation: all-languages: formatted',
        'image-a-la-une',
        'logo-odd',
        'biosphere-trophee'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Lauréats avec filtre',
            'author' => array(
                'name' => 'Valéry Frisch',
                'website' => 'http://mab-france.localhost',
                'email' => 'valery.frisch@gmail.com'),
            'version' => 'Symphony 2.7.2',
            'release-date' => '2018-09-13T17:23:51+00:00'
        );
    }

    public function getSource()
    {
        return '18';
    }

    public function allowEditorToParse()
    {
        return true;
    }

    public function execute(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);

        try {
            $result = parent::execute($param_pool);
        } catch (FrontendPageNotFoundException $e) {
            // Work around. This ensures the 404 page is displayed and
            // is not picked up by the default catch() statement below
            FrontendPageNotFoundExceptionHandler::render($e);
        } catch (Exception $e) {
            $result->appendChild(new XMLElement('error',
                General::wrapInCDATA($e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile())
            ));
            return $result;
        }

        if ($this->_force_empty_result) {
            $result = $this->emptyXMLSet();
        }

        if ($this->_negate_result) {
            $result = $this->negateXMLSet();
        }

        return $result;
    }
}