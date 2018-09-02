<?php

class datasourceeco_acteurs_avec_filtres extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'eco-acteurs-avec-filtres';
    public $dsParamORDER = 'asc';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '12';
    public $dsParamSTARTPAGE = '{$url-numpage}';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamPARAMOUTPUT = array(
        'logo-odd'
        );
    public $dsParamSORT = 'eco-acteur-nom';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '133' => 'Yes',
        '135' => '{$url-odd}',
        '137' => '{$url-biosphere}',
        '151' => '22',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'system:pagination',
        'eco-acteur-nom: all-languages: formatted',
        'eco-acteur-presentation: all-languages: formatted',
        'eco-acteur-publiee',
        'image-a-la-une',
        'logo-odd',
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
            'name' => 'Eco-acteurs avec filtres',
            'author' => array(
                'name' => 'Valéry Frisch',
                'website' => 'http://mab-france.localhost',
                'email' => 'valery.frisch@gmail.com'),
            'version' => 'Symphony 2.7.2',
            'release-date' => '2018-09-02T12:33:13+00:00'
        );
    }

    public function getSource()
    {
        return '17';
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