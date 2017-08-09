<?php
class Article_View extends View
{

	public function __construct($tpl)
	{
		$this->tpl = $tpl;
		$this->settings = Zend_Registry::get('settings');
		$this->session = Zend_Registry::get('session');
	}
	public function showArticleList($templateFile='', $articleList , $page)
	{ 
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'article/' . $this->templateFile . '.tpl');
		$this->tpl->paginator($articleList['pages']);
		$this->tpl->setVar('PAGE', $page);
		$this->tpl->setVar('ACTIVE_URL', '/admin/user/activate/');
		$this->tpl->setBlock('tpl_main','article_list',"article_list_block");
		
		foreach ($articleList['data'] as $article) {
			foreach ($article as $articleKey => $articleValue) {
			$this->tpl->setVar(strtoupper("ARTICLE_".$articleKey),substr($articleValue,0,50));
			}
			$this->tpl->parse("article_list_block", 'article_list', true);
		}
	}

	public function showAddArticle($templateFile="" )
	{
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'article/' . $this->templateFile . '.tpl');
	}
	public function showArticle($templateFile='', $articleList)
	{ 
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'article/' . $this->templateFile . '.tpl');
		foreach ($articleList as $article) {
			foreach ($article as $articleKey => $articleValue) {
			$this->tpl->setVar(strtoupper("ARTICLE_".$articleKey),$articleValue);
			}
		}
	}
	public function showEditArticle($templateFile='', $articleList)
	{ 
		if ($templateFile != '') $this->templateFile = $templateFile;
		$this->tpl->setFile('tpl_main', 'article/' . $this->templateFile . '.tpl');
		foreach ($articleList as $article) {
			foreach ($article as $articleKey => $articleValue) {
			$this->tpl->setVar(strtoupper("ARTICLE_".$articleKey),$articleValue);
			}
		}
	}
}