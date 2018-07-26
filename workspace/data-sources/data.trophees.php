<?php

class datasourcetrophees extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'trophees';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '10';
    public $dsParamSTARTPAGE = '{$page}';
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
        '143' => 'Yes',
        '145' => '{$url-odd}',
        '150' => '{$url-biosphere}',
        '152' => '{$s-rubrique}',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'system:pagination',
        'trophee-nom: all-languages: formatted',
        'trophee-presentation: all-languages: formatted',
        'trophee-publie',
        'image-a-la-une',
        'logo-odd',
        'anne-trophee',
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
            'name' => 'Trophées',
            'author' => array(
                'name' => 'Valéry Frisch',
                'website' => 'https://prep.mab-france.org',
                'email' => 'valery.frisch@gmail.com'),
            'version' => 'Symphony 2.7.2',
            'release-date' => '2018-07-25T14:41:51+00:00'
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