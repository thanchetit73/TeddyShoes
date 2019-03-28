/**
*Project name: TeddyShoes2
*Version : 1.0
*Created date : 3 thg 3, 2019
*Description: Create by MyPC
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.bean;

/**
 * @author MyPC
 *
 */
public class Blogs {
	/**
	 * @param blogId
	 * @param title
	 * @param contents
	 * @param image
	 * @param customer_Id
	 * @param datePost
	 * @param describe
	 */
	public Blogs(String blogId, String title, String contents, String image, String customer_Id, String datePost,
			String describe) {
		super();
		this.blogId = blogId;
		this.title = title;
		this.contents = contents;
		this.image = image;
		this.customer_Id = customer_Id;
		this.datePost = datePost;
		this.describe = describe;
	}
	/**
	 * @param blogId
	 * @param title
	 * @param contents
	 * @param image
	 * @param customer_Id
	 * @param datePost
	 */
	
	public Blogs() {}
	/**
	 * @return the blogId
	 */
	public String getBlogId() {
		return blogId;
	}
	/**
	 * @param blogId the blogId to set
	 */
	public void setBlogId(String blogId) {
		this.blogId = blogId;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the contents
	 */
	public String getContents() {
		return contents;
	}
	/**
	 * @param contents the contents to set
	 */
	public void setContents(String contents) {
		this.contents = contents;
	}
	/**
	 * @return the image
	 */
	public String getImage() {
		return image;
	}
	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		this.image = image;
	}
	/**
	 * @return the customer_Id
	 */
	public String getCustomer_Id() {
		return customer_Id;
	}
	/**
	 * @param customer_Id the customer_Id to set
	 */
	public void setCustomer_Id(String customer_Id) {
		this.customer_Id = customer_Id;
	}
	/**
	 * @return the datePost
	 */
	public String getDatePost() {
		return datePost;
	}
	/**
	 * @param datePost the datePost to set
	 */
	public void setDatePost(String datePost) {
		this.datePost = datePost;
	}
	/**
	 * @return the describe
	 */
	public String getDescribe() {
		return describe;
	}
	/**
	 * @param describe the describe to set
	 */
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	private String blogId;
	private String title;
	private String contents;
	private String image;
	private String customer_Id;
	private String datePost;
	private String describe;

}
