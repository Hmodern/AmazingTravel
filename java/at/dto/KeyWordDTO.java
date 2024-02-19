package at.dto;

import java.util.ArrayList;

import at.dao.DBManager;
import at.vo.KeyWordVO;

public class KeyWordDTO extends DBManager{
	
	public ArrayList<KeyWordVO> getCKey(String no) {
		ArrayList<KeyWordVO> list = new ArrayList<KeyWordVO>();
		this.DBOpen();
		
		String sql = "";
		
		sql = "select * from keyword ";
		sql += "where no = " + no + " order by kcount desc ";
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

}
