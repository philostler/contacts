package com.philostler.contacts.signals {
	import com.philostler.contacts.models.Contact;
	
	import org.osflash.signals.Signal;
	
	public class ContactSelectedSignal extends Signal {
		public function ContactSelectedSignal() {
			super(Contact);
		}
	}
}