package com.philostler.contacts {
	import com.philostler.contacts.controller.RemoveContactCommand;
	import com.philostler.contacts.controller.AddContactCommand;
	import com.philostler.contacts.models.ContactsModel;
	import com.philostler.contacts.signals.ContactSelectedSignal;
	import com.philostler.contacts.signals.ContactsChangedSignal;
	import com.philostler.contacts.signals.NewContactSignal;
	import com.philostler.contacts.signals.RemoveContactSignal;
	import com.philostler.contacts.signals.AddContactSignal;
	import com.philostler.contacts.views.bar.Bar;
	import com.philostler.contacts.views.bar.BarMediator;
	import com.philostler.contacts.views.details.ContactDetails;
	import com.philostler.contacts.views.details.ContactDetailsMediator;
	import com.philostler.contacts.views.list.ContactsList;
	import com.philostler.contacts.views.list.ContactsListMediator;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	public class ContactsConfig implements IConfig {
		[Inject]
		public var commandMap:ISignalCommandMap;

		[Inject]
		public var injector:IInjector;
		
		[Inject]
		public var mediatorMap:IMediatorMap;

		public function configure():void {
			// Commands
			commandMap.map(AddContactSignal).toCommand(AddContactCommand);
			commandMap.map(RemoveContactSignal).toCommand(RemoveContactCommand);
			
			// Non-command triggering Signals
			injector.map(ContactsChangedSignal).asSingleton();
			injector.map(ContactSelectedSignal).asSingleton();
			injector.map(NewContactSignal).asSingleton();
			
			// Models
			injector.map(ContactsModel).asSingleton();
			
			// Services
			// N/A
			
			// Views
			mediatorMap.map(Bar).toMediator(BarMediator);
			mediatorMap.map(ContactsList).toMediator(ContactsListMediator);
			mediatorMap.map(ContactDetails).toMediator(ContactDetailsMediator);
		}
	}
}