<?php

use Hubzero\Content\Migration\Base;

// No direct access
defined('_HZEXEC_') or die();

/**
 * Migration script for installing default content for the Radiam component
 **/
class Migration20191125000002ComRadiam extends Base
{
	/**
	 * Up
	 **/
	public function up()
	{
		if ($this->db->tableExists('#__radiam_radconfigs'))
		{
			$query = "INSERT INTO `#__radiam_radconfigs` (`id`, `configname`, `configvalue`, `created`, `created_by`, `state`)
					VALUES (1,'radiam_host_url', 'https://radiam.somewhere.edu/', '2019-11-26 13:05:21', 1001, 1);";
			$this->db->setQuery($query);
			$this->db->query();
		}
		if ($this->db->tableExists('#__radiam_radprojects'))
		{
			$query = "INSERT INTO `#__radiam_radprojects` (`id`, `project_id`, `radiam_project_uuid`, `radiam_user_uuid`, `radiam_token`, `created`, `created_by`, `state`)
					VALUES (1, '1', '456-789', '555-324', 'token-34', '2019-11-26 13:05:21', 1001, 1);";
			$this->db->setQuery($query);
			$this->db->query();
		}
	}

	/**
	 * Down
	 **/
	public function down()
	{
		if ($this->db->tableExists('#__radiam_radconfigs'))
		{
			$query = "DELETE FROM `#__radiam_radconfigs`";
			$this->db->setQuery($query);
			$this->db->query();
		}
	}
}
