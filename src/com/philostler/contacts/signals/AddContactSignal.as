package com.philostler.contacts.signals {
	import com.philostler.contacts.models.Contact;
	
	import org.osflash.signals.Signal;
	
	/**
	 * Signal representing the intention of saving a new contact to the model
	 */
	public class AddContactSignal extends Signal {
		public function AddContactSignal() {
			super(Contact);
		}
	}
}