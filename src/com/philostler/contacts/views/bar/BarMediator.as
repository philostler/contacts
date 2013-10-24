package com.philostler.contacts.views.bar {
	import com.philostler.contacts.models.Contact;
	import com.philostler.contacts.signals.AddContactSignal;
	import com.philostler.contacts.signals.ContactsChangedSignal;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class BarMediator extends Mediator {
		[Inject]
		public var view:Bar;

		[Inject]
		public var addContactSignal:AddContactSignal;
		
		[Inject]
		public var contactsChangedSignal:ContactsChangedSignal;

		public override function initialize():void {
			contactsChangedSignal.add(onContactsChanged);
			
			view.addExampleContactClicked.add(onAddExampleContactClicked);
		}
		
		public override function destroy():void {
			contactsChangedSignal.remove(onContactsChanged);
			
			view.addExampleContactClicked.remove(onAddExampleContactClicked);
		}
		
		protected function onAddExampleContactClicked():void {
			addContactSignal.dispatch(new Contact(
				"Phil Ostler",
				"philostler@gmail.com",
				"01234567890",
				"Cornwall"));
		}
		
		protected function onContactsChanged(contacts:Array):void {
			view.contactCount = contacts.length;
		}
	}
}