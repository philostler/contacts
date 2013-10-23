package com.philostler.contacts.views.bar {
	import com.philostler.contacts.signals.ContactsChangedSignal;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class BarMediator extends Mediator {
		[Inject]
		public var view:Bar;
		
		[Inject]
		public var contactsChangedSignal:ContactsChangedSignal;

		public override function initialize():void {
			contactsChangedSignal.add(onContactsChanged);
		}
		
		public override function destroy():void {
			contactsChangedSignal.remove(onContactsChanged);
		}
		
		protected function onContactsChanged(contacts:Array):void {
			view.contactCount = contacts.length;
		}
	}
}