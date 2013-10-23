package com.philostler.contacts.utils {
	import com.adobe.crypto.MD5;
	
	import mx.utils.StringUtil;

	/**
	 * Utilities for accessing Gravatar's image service
	 * <p>
	 * TODO: This is a quick and dirty implementation relying on Image#source auto loading
	 * an image when given a URL. Ideally would be refactored into a service.
	 */
	public class GravatarUtils {
		private static const URL:String = "http://www.gravatar.com/avatar/{0}?d=mm&s={1}";

		/**
		 * Generates a Gravatar URL for a specified email address and desired size
		 * 
		 * @param email Email address
		 * @param size Desired image size (image will be square) in pixels
		 * @return Gravatar URL
		 * @see http://en.gravatar.com/site/implement/hash
		 * @see http://en.gravatar.com/site/implement/images
		 */
		public static function urlFromEmail(email:String, size:Number = 64):String {
			var md5:String = MD5.hash(StringUtil.trim(email).toLowerCase());

			return StringUtil.substitute(URL, md5, size.toString());
		}
	}
}