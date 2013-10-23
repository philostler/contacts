package com.philostler.contacts.signals {
	import com.philostler.contacts.models.Contact;
	
	import org.osflash.signals.Signal;
	
	/**
	 * Signal representing notification of a contact being selected by the user
	 */
	public class ContactSelectedSignal extends Signal {
		public function ContactSelectedSignal() {
			super(Contact);
		}
	}
}