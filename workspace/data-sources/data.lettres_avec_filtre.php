<?php

class datasourcelettres_avec_filtre extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'lettres-avec-filtre';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '{$url-numpage}';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'numero';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '161' => 'yes',
        '163' => 'regexp: {$url-annee}',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'system:pagination',
        'titre',
        'numero',
        'url-version-web',
        'publie',
        'image-a-la-une',
        'date',
        'edito',
        'pdf',
        'tribune-a'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Lettres avec filtre',
            'author' => array(
                'name' => 'Sophie Taminh',
                'website' => 'http://mab-france.localhost',
                'email' => 'staminh@valactive.com'),
            'version' => 'Symphony 2.7.2',
            'release-date' => '2018-10-23T05:13:27+00:00'
        );
    }

    public function getSource()
    {
        return '21';
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