package com.philostler.contacts.utils {
	import com.adobe.crypto.MD5;
	
	import mx.utils.StringUtil;

	public class GravatarUtils {
		private static const URL:String = "http://www.gravatar.com/avatar/{0}?d=mm&s={1}";

		public static function urlFromEmail(email:String, size:Number = 64):String {
			var md5:String = MD5.hash(StringUtil.trim(email).toLowerCase());

			return StringUtil.substitute(URL, md5, size.toString());
		}
	}
}