<?php
class Article extends Dot_Model
{
 
	public function __construct()
	{
		parent::__construct();
	}
	public function getArticlesInfo()
	{
		$select = $this->db->select()
						->from('article');
		return $this->db->fetchAll($select);
	}
	public function getArticleContentById( $articleId)
	{	$select=$this->db->select()
						->from('article')
						->where('id = ?', $articleId);
		$result=$this->db->fetchAll($select);
		return $result;
	}
}