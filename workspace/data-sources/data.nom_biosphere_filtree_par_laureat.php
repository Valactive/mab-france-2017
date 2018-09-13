<?php

class datasourcenom_biosphere_filtree_par_laureat extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'nom-biosphere-filtree-par-laureat';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'system:id';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        'system:id' => '{$ds-laureat-detail.biosphere-trophee}',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'nom: all-languages: formatted',
        'prefixe-du-nom: all-languages: formatted'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array('$ds-laureat-detail.biosphere-trophee');
    }

    public function about()
    {
        return array(
            'name' => 'Nom Biosphere filtrée par lauréat',
            'author' => array(
                'name' => 'Sophie Taminh',
                'website' => 'http://mab-france.localhost',
                'email' => 'staminh@valactive.com'),
            'version' => 'Symphony 2.7.2',
            'release-date' => '2018-09-13T22:13:34+00:00'
        );
    }

    public function getSource()
    {
        return '8';
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