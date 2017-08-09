<?php
$session = Zend_Registry::get('session');
$articleView = new Article_View($tpl);
$articleModel= new Article();
// all actions MUST set  the variable  $pageTitle
$pageTitle = $option->pageTitle->action->{$registry->requestAction};
switch ($registry->requestAction)
{
	default:
	case 'list':
		// call showPage method to view the home page
		$data=$articleModel->getArticlesInfo();
		$articleView->showArticleList('articles_list',$data);
	break;
	case 'show_article':
		$data=$articleModel->getArticleContentById($registry->request["id"]);
		$articleView->showArticleById('show_article',$data);
		break;
}