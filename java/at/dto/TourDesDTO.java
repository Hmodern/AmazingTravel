package at.dto;

import java.util.ArrayList;

import at.dao.DBManager;
import at.vo.KeyWordVO;
import at.vo.TourDesVO;

public class TourDesDTO extends DBManager {
	
	public TourDesVO ReadTourDes(String no) {
		this.DBOpen();
		
		String sql = "";
		
		sql = "select name, pic, outline, info, ";
		sql += "(select count(*) from blog_cd where no = tourdes.no) as bcount ";
		sql += "from tourdes ";
		sql += "where no = " + no;
		
		this.RunSelect(sql);
		if ( this.GetNext() == false ) {
			
			this.DBClose();
			return null;
		}
		
		TourDesVO vo = new TourDesVO();
		
		vo.setName(this.GetValue("name"));
		vo.setPic(this.GetValue("pic"));
		vo.setOutline(this.GetValue("outline"));
		vo.setInfo(this.GetValue("info"));
		vo.setBcount(this.GetValue("bcount"));
			
		
		
		this.DBClose();
		return vo;
	}
	
	public ArrayList<KeyWordVO> getKey(String no) {
		ArrayList<KeyWordVO> list = new ArrayList<KeyWordVO>();
		this.DBOpen();
		
		String sql = "";
		
		sql = "select * from keyword ";
		sql += "where no = " + no + " order by kcount desc ";
		sql += "limit 0,5";
		this.RunSelect(sql);
		while( this.GetNext() == true ) {
			KeyWordVO vo = new KeyWordVO();
			vo.setKeyword(this.GetValue("keyword"));
			vo.setKcount(this.GetValue("kcount"));
			
			list.add(vo);
		}
		
		
		this.DBClose();
		return list;
	}

	public TourDesVO GetTotal() {
		this.DBOpen();
		
		String sql = "";
		
		sql = "select count(*) from tourdes ";
		this.RunSelect(sql);
		if ( this.GetNext() == false ) {
			this.DBClose();
			return null;
		}
		TourDesVO vo = new TourDesVO();
		vo.setCount(this.GetValue("count(*)"));
		this.DBClose();
		return vo;
	}
}
