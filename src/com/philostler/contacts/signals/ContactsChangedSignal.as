package com.philostler.contacts.signals {
	import org.osflash.signals.Signal;
	
	/**
	 * Signal representing notification of a change to the the contacts model (added/removed)
	 */
	public class ContactsChangedSignal extends Signal {
		public function ContactsChangedSignal() {
			super(Array);
		}
	}
}