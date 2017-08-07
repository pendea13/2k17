<?php
class Gag extends Dot_Model
{

	public function __construct()
	{
		parent::__construct();
	}
	public function getGagList($page=1)
	{
		$select = $this->db->select()
						   ->from('post');
 		$dotPaginator = new Dot_Paginator($select, $page, $this->settings->resultsPerPage);
		return $dotPaginator->getData();
	}
	public function getGag($id)
	{	
		$select = $this->db->select()
						   ->from('post')
						   ->where('id= ?',$id);
 		// $dotPaginator = new Dot_Paginator($select, $page, $this->settings->resultsPerPage);
		$result=$this->db->fetchAll($select);
		return $result;

	}
}