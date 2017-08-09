<?php
class Article extends Dot_Model
{

	public function __construct()
	{
		parent::__construct();
	}
	//get the list of articles
	public function getArticleList($page=1)
	{
		$select = $this->db->select()
						   ->from('article');
 		$dotPaginator = new Dot_Paginator($select, $page, $this->settings->resultsPerPage);
		return $dotPaginator->getData();
	}
	// delete an article
	public function deleteArticle($id)
	{
		$this->db->delete('article', 'id = ' . $id);
	}
	public function addArticle($data)
	{
		// add a new atricle with post method

		$this->db->insert('article',$data);
	}
	public function getArticle($id)
	{	
		$select = $this->db->select()
						   ->from('article')
						   ->where('id= ?',$id);
 		// $dotPaginator = new Dot_Paginator($select, $page, $this->settings->resultsPerPage);
		 $result=$this->db->fetchAll($select);
		return $result;

	}
	public function updateArticle($data , $id)
	{
		$this->db->update('article', $data, 'id = '.$id);
	}

}