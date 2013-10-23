package com.philostler.contacts.signals {
	import com.philostler.contacts.models.Contact;
	
	import org.osflash.signals.Signal;
	
	/**
	 * Signal representing the intention of removing a contact from the model
	 */
	public class RemoveContactSignal extends Signal {
		public function RemoveContactSignal() {
			super(Contact);
		}
	}
}