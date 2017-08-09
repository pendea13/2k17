<?php
class Article_View extends View
{
	public function __construct($tpl)
	{
		$this->tpl = $tpl;
		$this->session = Zend_Registry::get('session');
		$this->settings = Zend_Registry::get('settings');
	}

	public function showArticleList($templateFile='', $articleList)
	{ 
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'article/' . $this->templateFile . '.tpl');
		$this->tpl->setBlock('tpl_main','article_list',"article_list_block");
		
		foreach ($articleList as $article) {
			foreach ($article as $articleKey => $articleValue) {
			$this->tpl->setVar(strtoupper("ARTICLE_".$articleKey),$articleValue);
			}
			$this->tpl->parse("article_list_block", 'article_list', true);
		}
	}
	public function showArticleById($templateFile='', $articleList)
	{ 
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'article/' . $this->templateFile . '.tpl');
		$this->tpl->setBlock('tpl_main','comment_form',"comment_form_block");
		var_dump($articleList[0]);
		// exit();
			foreach ($articleList[0] as $articleKey => $articleValue) {
			$this->tpl->setVar(strtoupper("ARTICLE_".$articleKey),$articleValue);
			}
			if (isset($session->user)){
				$this->tpl->parse("comment_form_block", 'comment_form', true);
			} else {
				$this->tpl->parse("comment_form_block", '');
			}
	}
}