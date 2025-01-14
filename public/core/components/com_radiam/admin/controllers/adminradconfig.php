<?php
namespace Components\Radiam\Admin\Controllers;

use Hubzero\Component\AdminController;
use Components\Radiam\Models\RadConfig;
use Request;
use Notify;
use Route;
use Lang;
use App;

/**
 * Radiam controller for RadConfig
 * 
 * Accepts an array of configuration values to the constructor. If no config 
 * passed, it will automatically determine the component and controller names.
 * Internally, sets the $database, $user, $view, and component $config.
 * 
 * Executable tasks are determined by method name. All public methods that end in 
 * "Task" (e.g., displayTask, editTask) are callable by the end user.
 * 
 * View name defaults to controller name with layout defaulting to task name. So,
 * a $controller of "One" and a $task of "two" will map to:
 *
 * /{component name}
 *     /{client name}
 *         /views
 *             /one
 *                 /tmpl
 *                     /two.php
 */
class Adminradconfig extends AdminController
{
	/**
	 * Execute a task
	 *
	 * @return  void
	 */
	public function execute()
	{
		// Here we're equating the task 'add' to 'edit'. When examing
		// this controller, you should not find any method called 'addTask'.
		// Instead, we're telling the controller to execute the 'edit' task
		// whenever a task of 'add' is called.
		$this->registerTask('add', 'edit');
		$this->registerTask('apply', 'save');
		$this->registerTask('publish', 'state');
		$this->registerTask('unpublish', 'state');

		// Call the parent execute() method. Important! Otherwise, the
		// controller will never actually execute anything.
		parent::execute();
	}

	/**
	 * Display a list of entries
	 *
	 * @return  void
	 */
	public function displayTask()
	{
		// Get some incoming filters to apply to the entries list
		//
		// The Request::getState() method makes it easy to retain values of 
		// certain variables across page accesses. This makes development much 
		// simpler because we no longer has to worry about losing variable values 
		// if it is left out of a form. The best example is that the form will
		// retain the proper filters even after navigating to the edit entry form
		// and back.
		$filters = array(
			'search' => urldecode(Request::getState(
				$this->_option . '.' . $this->_controller . '.search',
				'search',
				''
			)),
			'state' => urldecode(Request::getState(
				$this->_option . '.' . $this->_controller . '.state',
				'state',
				-1
			)),
			// Get sorting variables
			'sort' => Request::getState(
				$this->_option . '.' . $this->_controller . '.sort',
				'filter_order',
				'id'
			),
			'sort_Dir' => Request::getState(
				$this->_option . '.' . $this->_controller . '.sortdir',
				'filter_order_Dir',
				'ASC'
			)
		);

		// Get our model
		// This is the entry point to the database and the 
		// table of radconfigs we'll be retrieving data from
		$record = RadConfig::all();

		if ($filters['state'] >= 0)
		{
			$record->whereEquals('state', $filters['state']);
		}

		if ($search = $filters['search'])
		{
			$record->whereLike('configname', $search);
		}

		$rows = $record
			->ordered('filter_order', 'filter_order_Dir')
			->paginated();

		// Output the view
		$this->view
			->set('filters', $filters)
			->set('rows', $rows)
			->display();
	}

	/**
	 * Show a form for editing an entry
	 *
	 * @param   object  $row
	 * @return  void
	 */
	public function editTask($row=null)
	{
		// This is a flag to disable the main menu. This makes sure the user
		// doesn't navigate away while int he middle of editing an entry.
		// To leave the form, one must explicitely call the "cancel" task.
		Request::setVar('hidemainmenu', 1);

		// If we're being passed an object, use it instead
		// This means we came from saveTask() and some error occurred.
		// Most likely a missing or incorrect field.
		//
		// If not object passed, then we're most likely creating a new
		// record or editing one for the first time.
		if (!is_object($row))
		{
			// Grab the incoming ID and load the record for editing
			//
			// IDs can come arrive in two formts: single integer or 
			// an array of integers. If it's the latter, we'll only take 
			// the first ID in the list.
			$id = Request::getVar('id', array(0));
			if (is_array($id) && !empty($id))
			{
				$id = $id[0];
			}

			// Load the record
			$row = RadConfig::oneOrNew($id);
		}

		// Output the view
		// 
		// Make sure we load the edit view.
		// This is for cases where saveTask() might encounter a data
		// validation error and fall through to editTask(). Since layout 
		// is auto-assigned the task name, the layout will be 'save' but
		// saveTask has no layout!
		$this->view
			->set('row', $row)
			->setLayout('edit')
			->display();
	}

	/**
	 * Save an entry
	 *
	 * @return  void
	 */
	public function saveTask()
	{
		// [SECURITY] Check for request forgeries
		//
		// We're currently only checking POST, so if someone tries
		// to access this task via a querystring (... &task=delete&id[]=1)
		// it will be denied. This helps ensure the deletion process is
		// *only* coming in through the submitted edit form.
		Request::checkToken();

		// Incoming
		$fields = Request::getVar('fields', array(), 'post', 'none', 2);

		// Initiate the model and bind the incoming data to it
		$row = RadConfig::oneOrNew($fields['id'])->set($fields);

		// Validate and save the data
		//
		// If save() returns false for any reason, we pass the error
		// message from the model to the controller and fall through
		// to the edit form. We pass the existing model to the edit form
		// so it can repopulate the form with the user-submitted data.
		if (!$row->save())
		{
			foreach ($row->getErrors() as $error)
			{
				Notify::error($error);
			}

			return $this->editTask($row);
		}

		// Notify the user that the record was saved.
		Notify::success(Lang::txt('COM_RADIAM_ENTRY_SAVED'));

		if ($this->getTask() == 'apply')
		{
			// Display the edit form. This will happen if the user clicked
			// the "save" or "apply" button.
			return $this->editTask($row);
		}

		// Are we redirecting?
		// This will happen if a user clicks the "save & close" button.
		//
		// cancelTask is already defined in the base AdminController class
		// and simply redirects to the default view of the controller
		// so we just call it instead of repeating App::redirect()
		$this->cancelTask();
	}

	/**
	 * Delete one or more entries
	 *
	 * @return  void
	 */
	public function removeTask()
	{
		// [SECURITY] Check for request forgeries
		//
		// We're currently only checking POST, so if someone tries
		// to access this task via a querystring (... &task=delete&id[]=1)
		// it will be denied. This helps ensure the deletion process is
		// *only* coming in through the main listing, which submits a form.
		Request::checkToken();

		// Incoming
		//
		// We're expecting an array of incoming IDs from the
		// entries listing. But, we'll force the data into an
		// array just to be extra sure.
		$ids = Request::getVar('id', array());
		$ids = (!is_array($ids) ? array($ids) : $ids);

		// Do we actually have any entries?
		if (count($ids) > 0)
		{
			$removed = 0;

			// Loop through all the IDs
			foreach ($ids as $id)
			{
				$entry = RadConfig::oneOrFail(intval($id));

				// Delete the entry
				//
				// NOTE: It's generally preferred to use the model to delete
				// entries instead of direct SQL statements as the model will
				// typically take care of associated data and clean up after itself.
				if (!$entry->destroy())
				{
					// If the deletion process fails for any reason, we'll take the 
					// error message passed from the model and assign it to the message
					// handler to be displayed by the template after we redirect back
					// to the main listing.
					Notify::error($entry->getError());
					continue;
				}

				$removed++;
			}
		}

		if ($removed)
		{
			Notify::success(Lang::txt('COM_RADIAM_ENTRIES_DELETED'));
		}

		// Set the redirect URL to the main entries listing.
		$this->cancelTask();
	}

	/**
	 * Sets the state of one or more entries
	 *
	 * @return  void
	 */
	public function stateTask()
	{
		// [SECURITY] Check for request forgeries
		//
		// Unlike deleteTask() above, we're allowing requests from both
		// GET and POST. This allows us to have single click "toggle" buttons
		// on the entries list as well as handle checkboxes+toolbar button presses
		// which submit a form. This is a little less secure but state change
		// is fairly innocuous.
		Request::checkToken(['get', 'post']);

		$state = $this->getTask() == 'publish' ? 1 : 0;

		// Incoming
		//
		// We're expecting an array of incoming IDs from the
		// entries listing. But, we'll force the data into an
		// array just to be extra sure.
		$ids = Request::getVar('id', array(0));
		$ids = (!is_array($ids) ? array($ids) : $ids);

		// Do we actually have any entries?
		if (count($ids) < 1)
		{
			// No entries found, so go back to the entries list with
			// a message scolding the user for not selecting anything.
			Notify::warning(Lang::txt('COM_RADIAM_SELECT_ENTRY_TO', $this->_task));

			return $this->cancelTask();
		}

		// Loop through all the IDs
		$success = 0;
		foreach ($ids as $id)
		{
			// Load the entry and set its state
			$row = RadConfig::oneOrNew(intval($id))->set(array('state' => $state));

			// Store the changes
			if (!$row->save())
			{
				// If the save() process fails for any reason, we'll take the 
				// error message passed from the model and assign it to the message
				// handler to be displayed by the template after we redirect back
				// to the main listing.
				Notify::error($row->getError());
				continue;
			}

			// Here, we're countign the number of successful state changes
			// so we can display that number in a message when we're done.
			$success++;
		}

		if ($success)
		{
			// Get the appropriate message for the task called. We're
			// passing in the number of successful state changes so it
			// can be displayed in the message.
			switch ($this->getTask())
			{
				case 'publish':
					$message = Lang::txt('COM_RADIAM_ITEMS_PUBLISHED', $success);
				break;
				case 'unpublish':
					$message = Lang::txt('COM_RADIAM_ITEMS_UNPUBLISHED', $success);
				break;
				case 'archive':
					$message = Lang::txt('COM_RADIAM_ITEMS_ARCHIVED', $success);
				break;
			}

			Notify::success($message);
		}

		// Set the redirect URL to the main entries listing.
		$this->cancelTask();
	}
}
