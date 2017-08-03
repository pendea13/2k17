<?php
$articleView = new Article_View($tpl);
$articleModel= new Article();

$pageTitle = $option->pageTitle->action->{$registry->requestAction};
switch ($registry->requestAction)
{
	default:
	case 'list':
	 	$page = (isset($registry->request['page']) && $registry->request['page'] > 0) ? $registry->request['page'] : 1;
 		$list= $articleModel->getArticleList($page);
 		$articleView->showArticleList('article_list', $list, $page);

	break;

	case 'edit':
		$article= $articleModel->getArticle($registry->request["id"]);
		$articleView->showEditArticle('edit_article',$article);
		if ($_SERVER['REQUEST_METHOD'] === "POST")
				{
					$data=['content'=>$_POST["content"],
					];
				$articleModel->updateArticle($data,$registry->request["id"]);
				header('Location: '.$registry->configuration->website->params->url.'/admin/article/list');
				}

	break;

	case 'add':
		$articleView->showAddArticle('add_article');
		if ($_SERVER['REQUEST_METHOD'] === "POST")
				{
					$data=['content'=>$_POST["content"],
					];
				$articleModel->addArticle($data);
				}
	break;

	case 'delete':
		$articleModel->deleteArticle($registry->request["id"]);
		header('Location: '.$registry->configuration->website->params->url.'/admin/article/list');
	break;

	case 'show':
		$article= $articleModel->getArticle($registry->request["id"]);
 		$articleView->showArticle('article',$article);

	break;
}