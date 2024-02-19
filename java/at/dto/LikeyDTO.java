package at.dto;

import at.dao.DBManager;
import at.vo.LikeyVO;

public class LikeyDTO extends DBManager{

	public boolean Likey(LikeyVO vo) {
		this.DBOpen();
		
		String sql = "";
		
		sql = "select * from likey ";
		sql += "where no = " + vo.getNo() + " and ";
		sql += "pushed_ip = '" + vo.getPushed_ip() + "' ";
		this.RunSelect(sql);
		
		if( this.GetNext() == false ) {
			
			//좋아요가 안눌려 있을때
			sql = "insert into likey (pushed_ip,no) ";
			sql += "values ( ";
			sql += "'" + vo.getPushed_ip() + "', ";
			sql += vo.getNo()  + ") ";
			this.RunCommand(sql);
			this.DBClose();
			return true;
		}
			
		//좋아요가 눌려있을때
		sql = "delete from likey where ";
		sql	+= "pushed_ip = '" + vo.getPushed_ip() + "' ";
		sql	+= "and no = " + vo.getNo() + " ";
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
		
		
	}
	
	public LikeyVO getIp(String no, String ip) {
		this.DBOpen();
		
		String sql = "";
		
		sql = "select * from likey ";
		sql += "where no = " + no + " and ";
		sql += "pushed_ip = '" + ip + "' ";
		this.RunSelect(sql);
		if (this.GetNext() == false) {
			
			this.DBClose();
			return null;
		}
		LikeyVO vo = new LikeyVO();
		vo.setPushed_ip(this.GetValue("pushed_ip"));
		
		this.DBClose();
		return vo;
	}
}
