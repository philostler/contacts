package com.philostler.contacts.models {
	/**
	 * Contact value object
	 */
	[Bindable]
	public class Contact {
		public var name:String;
		public var email:String;
		public var phone:String;
		public var address:String;
		
		public function Contact(name:String = null, email:String = null, phone:String = null, address:String = null) {
			this.name = name;
			this.email = email;
			this.phone = phone;
			this.address = address;
		}
	}
}