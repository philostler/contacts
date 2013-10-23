package com.philostler.contacts.controller {
	import com.philostler.contacts.models.Contact;
	import com.philostler.contacts.models.ContactsModel;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * Adds a specified Contact to ContactsModel
	 */
	public class AddContactCommand extends Command {
		[Inject]
		public var contact:Contact;
		
		[Inject]
		public var model:ContactsModel;
		
		public override function execute():void {
			model.add(contact);
		}
	}
}