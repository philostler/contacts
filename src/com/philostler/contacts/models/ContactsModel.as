package com.philostler.contacts.models {
	import com.philostler.contacts.signals.ContactSelectedSignal;
	import com.philostler.contacts.signals.ContactsChangedSignal;
	
	import mx.collections.ArrayCollection;
	import mx.events.CollectionEvent;

	/**
	 * Contacts model
	 */
	public class ContactsModel {
		[Inject]
		public var contactsChangedSignal:ContactsChangedSignal;

		[Inject]
		public var contactSelectedSignal:ContactSelectedSignal;
		
		protected var _contacts:ArrayCollection = new ArrayCollection();
		protected var _selectedIndex:uint;
		
		public function ContactsModel() {
			_contacts.addEventListener(CollectionEvent.COLLECTION_CHANGE, onContactsCollectionChange);
		}
		
		public function get selected():Contact {
			return _contacts.getItemAt(_selectedIndex) as Contact;
		}

		public function set selected(value:Contact):void {
			_selectedIndex = _contacts.getItemIndex(value);
			
			contactSelectedSignal.dispatch(selected);
		}
		
		public function add(contact:Contact):void {
			_contacts.addItem(contact);
		}
		
		public function remove(contact:Contact):void {
			_contacts.removeItemAt(_contacts.getItemIndex(contact));
		}

		protected function onContactsCollectionChange(event:CollectionEvent):void {
			contactsChangedSignal.dispatch(_contacts.toArray());
		}
	}
}