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
public class Reviews {
	/**
	 * @param reviewId
	 * @param customerId
	 * @param blogId
	 * @param contents
	 * @param datePost
	 * @param userName
	 */
	public Reviews(String reviewId, String customerId, String blogId, String contents, String datePost,
			String userName) {
		super();
		this.reviewId = reviewId;
		this.customerId = customerId;
		this.blogId = blogId;
		this.contents = contents;
		this.datePost = datePost;
		this.userName = userName;
	}
	/**
	 * @param reviewId
	 * @param customerId
	 * @param blogId
	 * @param contents
	 * @param datePost
	 */
	
	public Reviews() {}
	/**
	 * @return the reviewId
	 */
	public String getReviewId() {
		return reviewId;
	}
	/**
	 * @param reviewId the reviewId to set
	 */
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	/**
	 * @return the customerId
	 */
	public String getCustomerId() {
		return customerId;
	}
	/**
	 * @param customerId the customerId to set
	 */
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
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
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	private String reviewId;
	private String customerId;
	private String blogId;
	private String contents;
	private String datePost;
	private String userName;

}
