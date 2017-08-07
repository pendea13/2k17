<?php
class Gag_View extends View
{

	public function __construct($tpl)
	{
		$this->tpl = $tpl;
		$this->settings = Zend_Registry::get('settings');
		$this->session = Zend_Registry::get('session');
	}
	public function showGagList($templateFile='', $gagList , $page)
	{ 
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'gag/' . $this->templateFile . '.tpl');
		$this->tpl->paginator($gagList['pages']);
		$this->tpl->setVar('PAGE', $page);
		$this->tpl->setVar('ACTIVE_URL', '/admin/user/activate/');
		$this->tpl->setBlock('tpl_main','gag_list',"gag_list_block");
		
		foreach ($gagList['data'] as $gag) {
			foreach ($gag as $gagKey => $gagValue) {
			$this->tpl->setVar(strtoupper("GAG_".$gagKey),substr($gagValue,0,50));
			}
			$this->tpl->parse("gag_list_block", 'gag_list', true);
		}
	}
	public function showGagEdit($templateFile='', $gagList)
	{ 
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'gag/' . $this->templateFile . '.tpl');
		foreach ($gagList as $gag) {
			foreach ($gag as $gagKey => $gagValue) {
			$this->tpl->setVar(strtoupper("GAG_".$gagKey),$gagValue);
			}
		}
	}
}