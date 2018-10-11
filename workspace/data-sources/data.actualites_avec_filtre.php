<?php

class datasourceactualites_avec_filtre extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'actualites-avec-filtre';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '{$url-numpage}';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamPARAMOUTPUT = array(
        'logo-odd',
        'type-de-publication',
        'biosphere'
        );
    public $dsParamSORT = 'date';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '16' => 'yes',
        '123' => '{$url-odd}',
        '26' => '{$url-type-publi}',
        '130' => '{$url-biosphere}',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'system:pagination',
        'titre',
        'texte: formatted',
        'publie',
        'image-a-la-une',
        'logo-odd',
        'date',
        'type-de-publication',
        'biosphere'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Actualités avec filtre',
            'author' => array(
                'name' => 'Sophie Taminh',
                'website' => 'http://mab-france.localhost',
                'email' => 'staminh@valactive.com'),
            'version' => 'Symphony 2.7.2',
            'release-date' => '2018-10-10T14:10:46+00:00'
        );
    }

    public function getSource()
    {
        return '6';
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