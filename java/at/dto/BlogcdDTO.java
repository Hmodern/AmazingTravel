package at.dto;

import at.dao.DBManager;
import at.vo.BlogcdVO;
import at.vo.TourDesVO;

public class BlogcdDTO extends DBManager{
	
	public BlogcdVO GetTotal() {
		this.DBOpen();
		
		String sql = "";
		
		sql = "select count(*) from blog_cd ";
		this.RunSelect(sql);
		if ( this.GetNext() == false ) {
			this.DBClose();
			return null;
		}
		BlogcdVO vo = new BlogcdVO();
		vo.setCount(this.GetValue("count(*)"));
		this.DBClose();
		return vo;
	}

}
