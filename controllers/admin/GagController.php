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
		$gag= $gagModel->getGag($registry->request["id"]);
		$gagView->showGagEdit('gag_edit',$gag);
		break;
	case 'add':
		break;
	case 'show':
		break;
	case 'delete':
		break;
}