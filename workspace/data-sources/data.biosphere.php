<?php

class datasourcebiosphere extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'biosphere';
    public $dsParamORDER = 'desc';
    public $dsParamPAGINATERESULTS = 'no';
    public $dsParamLIMIT = '20';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamPARAMOUTPUT = array(
        'logo-officiel',
        'biosphere-logo'
        );
    public $dsParamSORT = 'system:id';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '124' => '{$nom}',
        '45' => 'yes',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'nom: all-languages: formatted',
        'prefixe-du-nom: all-languages: formatted',
        'biosphere-presentation: all-languages: formatted',
        'carte-territoire',
        'logo-officiel',
        'biosphere-logo',
        'dossier-presse',
        'illustration-territoire',
        'nombre-communes',
        'biosphere-nb-habitants',
        'biosphere-superficie',
        'biosphere-region',
        'biosphere-departement',
        'biosphere-annee-creation',
        'biosphere-annee-renouvellement',
        'biosphere-adresse: formatted',
        'biosphere-telephone',
        'biosphere-mail',
        'biosphere-adresse-2: formatted',
        'biosphere-telephone-2',
        'mail2',
        'biosphere-nom-site-web',
        'biosphere-lien-site-web',
        'biosphere-nom-site-web-2',
        'biosphere-lien-site-web-2',
        'biosphere-page-facebook',
        'biosphere-lien-instagram',
        'biosphere-auteur',
        'classe'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Biosphere',
            'author' => array(
                'name' => 'Sophie Taminh',
                'website' => 'http://mab-france.localhost',
                'email' => 'staminh@valactive.com'),
            'version' => 'Symphony 2.7.2',
            'release-date' => '2018-09-09T18:05:26+00:00'
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