package com.philostler.contacts.views.details {
	import com.philostler.contacts.models.Contact;
	import com.philostler.contacts.signals.ContactSelectedSignal;
	import com.philostler.contacts.signals.NewContactSignal;
	import com.philostler.contacts.signals.RemoveContactSignal;
	import com.philostler.contacts.signals.AddContactSignal;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class ContactDetailsMediator extends Mediator {
		[Inject]
		public var view:ContactDetails;
		
		[Inject]
		public var addContactSignal:AddContactSignal;
		
		[Inject]
		public var contactSelectedSignal:ContactSelectedSignal;
		
		[Inject]
		public var newContactSignal:NewContactSignal;
		
		[Inject]
		public var removeContactSignal:RemoveContactSignal;

		public override function initialize():void {
			contactSelectedSignal.add(onContactSelected);
			newContactSignal.add(onNewContact);
			
			view.deleteContactClicked.add(onDeleteContactClicked);
			view.saveContactClickedAndValidated.add(onSaveContactClickedAndValidated);
		}
		
		public override function destroy():void {
			contactSelectedSignal.remove(onContactSelected);
			newContactSignal.remove(onNewContact);
			
			view.deleteContactClicked.remove(onDeleteContactClicked);
			view.saveContactClickedAndValidated.remove(onSaveContactClickedAndValidated);
		}
		
		protected function onContactSelected(contact:Contact):void {
			view.data = contact;
			view.isUnsavedContact = false;
			view.visible = true;
		}
		
		protected function onDeleteContactClicked(contact:Contact):void {
			removeContactSignal.dispatch(contact);
			
			onNewContact();
		}
		
		protected function onSaveContactClickedAndValidated(contact:Contact):void {
			addContactSignal.dispatch(contact);
		}
		
		protected function onNewContact():void {
			view.data = new Contact();
			view.isUnsavedContact = true;
			view.visible = true;
		}
	}
}