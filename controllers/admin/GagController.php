<?php
$gagView = new Gag_View($tpl);
$gagModel= new Gag();

$pageTitle = $option->pageTitle->action->{$registry->requestAction};
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
		if ($_SERVER['REQUEST_METHOD'] === "POST") {	
			$data=['title'=>$_POST["title"],
					];
			$gagModel->updateGag($data,$registry->request["id"]);
			$registry->session->message['txt'] = $option->infoMessage->gagUpdate;
			$registry->session->message['type'] = 'info';
			header('Location: '.$registry->configuration->website->params->url.'/admin/gag/list');
			exit;
		}
		$gagView->showGagEdit('gag_edit',$gag);
		break;
	case 'add':
		// adding a new gag action
		if ($_SERVER['REQUEST_METHOD'] === "POST")
				{
					$uploaddir = 'externals/gags/';
					$uploadfile = $uploaddir . basename($_FILES['picture']['name']);
					move_uploaded_file($_FILES['picture']['tmp_name'], $uploadfile);
					$data=['title'=>$_POST["title"],
							'urlimage'=>$registry->configuration->website->params->url.'/'.$uploadfile,
					];
				$gagModel->addGag($data);
				$registry->session->message['txt'] = $option->infoMessage->gagAdd;
				$registry->session->message['type'] = 'info';
				header('Location: '.$registry->configuration->website->params->url.'/admin/gag/list');
				exit;
				}
		$gagView->showAddGag('gag_add');
		break;
	case 'show':
		$singelGagData=$gagModel->getGagById($registry->request["id"]);
		$commentsList=$gagModel->getCommentByArticleId($registry->request["id"]);
		if ($_SERVER['REQUEST_METHOD'] === "POST")
		{
			 if (array_key_exists('id', $_POST)) {
                        $comment = [
                                'content' => $_POST['comment']
                                ];
                        $gagModel->editCommentById($comment, $_POST['id']);
						header('Location: '.$registry->configuration->website->params->url.'/admin/gag/show/id/'.$registry->request["id"]);
                    } else {
						$data=['idUser'=>1,
						'content'=>$_POST["comment"],
						'idPost'=>$registry->request["id"],
						'parent_id'=>$_POST['parent_id']
						];
						$gagModel->addComment($data);
						header('Location: '.$registry->configuration->website->params->url.'/admin/gag/show/id/'.$registry->request["id"]);
                    }                    
        }

	
		$gagView->showGagById('complet_gag',$singelGagData);
		$gagView->showComments('complet_gag',$commentsList);
		break;
	case 'delete':
		if($_SERVER['REQUEST_METHOD'] === "POST")
		{
			
			
			if ('on' == $_POST['confirm'])
			{
				// delete gag
				$gagModel->deleteGag($registry->request['id']);
				$registry->session->message['txt'] = $option->infoMessage->gagDelete;
				$registry->session->message['type'] = 'info';
			}
			else
			{
				$registry->session->message['txt'] = $option->errorMessage->gagDeleteFail;
				$registry->session->message['type'] = 'error';
			}
			header('Location: '.$registry->configuration->website->params->url. '/' . $registry->requestModule . '/' . $registry->requestController. '/list/');
			exit;
		}
		if (!$registry->request['id'])
		{
			header('Location: '.$registry->configuration->website->params->url. '/' . $registry->requestModule . '/' . $registry->requestController. '/list/');
			exit;
		}
		$data = $gagModel->getGagById($registry->request['id']);
		// delete page confirmation
		$gagView->showGagById('delete_gag', $data);
		break;
	case 'delete-comment':
		if($_SERVER['REQUEST_METHOD'] === "POST")
		{
			
			
			if ('on' == $_POST['confirm'])
			{
				// delete gag
				$gagModel->deleteComment($registry->request['id']);
				$registry->session->message['txt'] = $option->infoMessage->gagDelete;
				$registry->session->message['type'] = 'info';
			}
			else
			{
				$registry->session->message['txt'] = $option->errorMessage->gagDeleteFail;
				$registry->session->message['type'] = 'error';
			}
			header('Location: '.$registry->configuration->website->params->url. '/' . $registry->requestModule . '/' . $registry->requestController. '/list/');
			exit;
		}
		if (!$registry->request['id'])
		{
			header('Location: '.$registry->configuration->website->params->url. '/' . $registry->requestModule . '/' . $registry->requestController. '/list/');
			exit;
		}
		$data = $gagModel->getCommentById($registry->request['id']);
		// delete page confirmation
		$gagView->showComment('delete_comment', $data);
		break;
	case 'like':
		if (isset($_POST['id'])||!empty($_POST['id']))
		{
				$like=$gagModel->getLike($_POST['id'],1);
				// var_dump($like);
				// exit();
				if (isset($like)) 
				{
						if($like['like']=='1')
						{
							$editLike=['like'=>'0'];
						}
						$gagModel->editLike($editLike,$like['id']);
						$result=['success'=>"true",
								"id"=>1];
				} 
				else 
				{

						$data=['id_post'=>$_POST['id'],
								'id_user'=>1,
								'like'=>"1",
								];
						$gagModel->addLikeOrDislikeGag($data);
						$result=['success'=>"true",
								"id"=>1];
				 	 }
		}
		echo Zend_Json::encode($result);
		exit;
		break;
}