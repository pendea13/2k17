{PAGINATION}
<div id="adminList" class="box-shadow">
	<table class="big_table" frame="box" rules="all">
		<thead>
			<tr>
				<th style="text-align: center; width: 20px;"><span>#</span></th>
				<th><span>URL Image</span></th>
				<th><span>Content</span></th>
				<th><span>Creation Date</span></th>
				<th width="300px"><span>Action</span></th>
			</tr>
		</thead>
		<tbody>
		<!-- BEGIN gag_list -->
			<tr>
				<td style="text-align: center;">{GAG_ID}</td>
				<td>{GAG_URLIMAGE}</td>
				<td>{GAG_TITLE}</td>
				<td>{GAG_DATE}</td>
				<td>
					<table class="action_table">
						<tr>
							<td width="20%"><a href="{SITE_URL}/admin/gag/edit/id/{GAG_ID}" title="Edit/Update" class="edit_state">Edit</a></td>
							<td width="25%"><a href="{SITE_URL}/admin/gag/delete/id/{GAG_ID}" title="Delete" class="delete_state">Delete</a></td>
							<td width="25%"><a href="{SITE_URL}/admin/gag/show/id/{GAG_ID}" title="Show Article" class="logins_state">Show</a></td>	
						</tr>
					</table>
				</td>
			</tr>
		<!-- END gag_list -->
		</tbody>
	</table>
</div>
