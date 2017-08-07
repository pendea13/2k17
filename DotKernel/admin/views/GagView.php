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
	//add template for adding gag
	public function showAddGag($templateFile="" )
	{
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'gag/' . $this->templateFile . '.tpl');
	}
	// showing gag by id
	public function showGagById($templateFile='', $articleList)
	{ 
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'gag/' . $this->templateFile . '.tpl');
		foreach ($articleList as $article) {
			foreach ($article as $articleKey => $articleValue) {
			$this->tpl->setVar(strtoupper("GAG_".$articleKey),$articleValue);
			}
		}
	}
	// showing commend list for Gag
	public function showComments($templateFile='', $commentList)
	{
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'gag/' . $this->templateFile . '.tpl');
		$this->tpl->setBlock('tpl_main','comment_list',"comment_list_block");
		foreach ($commentList as $comment) {
			foreach ($comment as $commentKey => $commentValue) {
			$this->tpl->setVar(strtoupper("COMMENT_".$commentKey),$commentValue);
			}
			$this->tpl->parse("comment_list_block", 'comment_list', true);
		}
	}
}