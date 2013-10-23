package com.philostler.contacts.controller {
	import com.philostler.contacts.models.Contact;
	import com.philostler.contacts.models.ContactsModel;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * Removes a specified Contact from ContactsModel
	 */
	public class RemoveContactCommand extends Command {
		[Inject]
		public var contact:Contact;
		
		[Inject]
		public var model:ContactsModel;
		
		public override function execute():void {
			model.remove(contact);
		}
	}
}