package com.philostler.contacts.signals {
	import com.philostler.contacts.models.Contact;
	
	import org.osflash.signals.Signal;
	
	public class RemoveContactSignal extends Signal {
		public function RemoveContactSignal() {
			super(Contact);
		}
	}
}