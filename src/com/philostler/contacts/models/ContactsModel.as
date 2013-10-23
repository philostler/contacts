package com.philostler.contacts.models {
	import com.philostler.contacts.signals.ContactSelectedSignal;
	import com.philostler.contacts.signals.ContactsChangedSignal;
	
	import mx.collections.ArrayCollection;

	public class ContactsModel {
		[Inject]
		public var contactsChangedSignal:ContactsChangedSignal;

		[Inject]
		public var contactSelectedSignal:ContactSelectedSignal;
		
		protected var _contacts:ArrayCollection = new ArrayCollection();
		protected var _selectedIndex:uint;
		
		public function get selected():Contact {
			return _contacts.getItemAt(_selectedIndex) as Contact;
		}

		public function set selected(value:Contact):void {
			_selectedIndex = _contacts.getItemIndex(value);
			
			contactSelectedSignal.dispatch(selected);
		}
		
		public function add(contact:Contact):void {
			_contacts.addItem(contact);
			dispatchContactsUpdated();
		}
		
		public function remove(contact:Contact):void {
			_contacts.removeItemAt(_contacts.getItemIndex(contact));
			dispatchContactsUpdated();
		}
		
		protected function dispatchContactsUpdated():void {
			contactsChangedSignal.dispatch(_contacts.toArray());
		}
	}
}