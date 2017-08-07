<?php
$gagView = new Gag_View($tpl);
$gagModel= new Gag();

#$pageTitle = $option->pageTitle->action->{$registry->requestAction};
switch ($registry->requestAction)
{
	default:
	case 'list':
		$page = (isset($registry->request['page']) && $registry->request['page'] > 0) ? $registry->request['page'] : 1;
 		$list= $gagModel->getGagList($page);
 		$gagView->showGagList('gag_list', $list, $page);
		break;
	case 'edit':
		$gag= $gagModel->getGagById($registry->request["id"]);
		$gagView->showGagEdit('gag_edit',$gag);
		break;
	case 'add':
		// adding a new gag action
		$gagView->showAddGag('gag_add');
		if ($_SERVER['REQUEST_METHOD'] === "POST")
				{
					$uploaddir = 'externals/gags/';
					$uploadfile = $uploaddir . basename($_FILES['picture']['name']);
					move_uploaded_file($_FILES['picture']['tmp_name'], $uploadfile);
					$data=['title'=>$_POST["title"],
							'urlimage'=>$registry->configuration->website->params->url.'/'.$uploadfile,
					];
				$gagModel->addGag($data);
				}
		break;
	case 'show':
		$singelGagData=$gagModel->getGagById($registry->request["id"]);
		$commentsList=$gagModel->getComments($registry->request["id"]);
		$gagView->showGagById('complet_gag',$singelGagData);
		$gagView->showComments('complet_gag',$commentsList);
		if ($_SERVER['REQUEST_METHOD'] === "POST")
		{
			$data=['idUser'=>1,
					'content'=>$_POST["comment"],
					'idPost'=>$registry->request["id"]
			];
		$gagModel->addComment($data);
		header('Location: '.$registry->configuration->website->params->url.'/admin/gag/show/id/'.$registry->request["id"]);
		}
		break;
	case 'delete':
		break;
}