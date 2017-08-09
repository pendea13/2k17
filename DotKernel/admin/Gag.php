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
	// i have modified method name form getGag to getGagById
	public function getGagById($id)
	{	
		$select = $this->db->select()
						   ->from('post')
						   ->where('id= ?',$id);
 		// $dotPaginator = new Dot_Paginator($select, $page, $this->settings->resultsPerPage);
		$result=$this->db->fetchAll($select);
		return $result;

	}
	//get the comment by the gag id
	public function getComments($gagId)
	{
		$select=$this->db->select()
						->from('comment')
						->where('idPost = ?', $gagId);
		$result=$this->db->fetchAll($select);
		return $result;
	}
	// add a new Gag with post method
	public function addGag($data)
	{

		$this->db->insert('post',$data);
	}
	// add a new comment for an atricle with post method
	public function addComment($data)
	{

		$this->db->insert('comment',$data);
	}
	public function updateGag($data , $id)
	{
		$this->db->update('post', $data, 'id = '.$id);
	}
	public function deleteGag($id)
	{
		$this->db->delete('post', 'id = ' . $id);
	}
}