package com.philostler.contacts.signals {
	import com.philostler.contacts.models.Contact;
	
	import org.osflash.signals.Signal;
	
	public class SaveContactSignal extends Signal {
		public function SaveContactSignal() {
			super(Contact);
		}
	}
}