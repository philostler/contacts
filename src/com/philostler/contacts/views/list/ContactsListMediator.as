package com.philostler.contacts.views.list {
	import com.philostler.contacts.models.Contact;
	import com.philostler.contacts.signals.ContactSelectedSignal;
	import com.philostler.contacts.signals.ContactsChangedSignal;
	import com.philostler.contacts.signals.NewContactSignal;
	
	import mx.collections.ArrayCollection;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class ContactsListMediator extends Mediator {
		[Inject]
		public var contactsChangedSignal:ContactsChangedSignal;
		
		[Inject]
		public var contactSelectedSignal:ContactSelectedSignal;

		[Inject]
		public var view:ContactsList;
		
		[Inject]
		public var newContactSignal:NewContactSignal;

		public override function initialize():void {
			contactsChangedSignal.add(onContactsChanged);
			
			view.addContactClicked.add(onAddContactClicked);
			view.contactSelected.add(onContactSelected);
		}
		
		public override function destroy():void {
			contactsChangedSignal.remove(onContactsChanged);
			
			view.addContactClicked.remove(onAddContactClicked);
			view.contactSelected.remove(onContactSelected);
		}
		
		protected function onContactsChanged(contacts:Array):void {
			view.data = new ArrayCollection(contacts);
		}
		
		public function onContactSelected(selected:Contact):void {
			contactSelectedSignal.dispatch(selected);
		}
		
		protected function onAddContactClicked():void {
			newContactSignal.dispatch();
		}
	}
}