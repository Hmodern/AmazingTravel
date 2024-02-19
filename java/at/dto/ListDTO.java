package at.dto;

import java.util.ArrayList;

import at.dao.DBManager;
import at.vo.KeyWordVO;
import at.vo.TourDesVO;

public class ListDTO extends DBManager{
	
	
	public ArrayList<TourDesVO> GetList(int pageNo,String cate,String sort,String key,int perPage) {
		
		ArrayList<TourDesVO> list = new ArrayList<TourDesVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		
			
		sql = "select *,";
		sql += "(select count(*) from likey where no = tourdes.no) as likey, ";
		sql += "(select count(*) from blog_cd where no = tourdes.no) as bcount ";
		
		if( cate.equals("전체 관광지")) {
			
			sql += "from tourdes ";
			if( !key.equals("") ) {
				
				sql += "where name like '%" + key + "%' ";
			}	
			
		}else {
			
			sql += "from tourdes ";
			sql += "where cate = '" + cate + "' ";
			if( !key.equals("") ) {
				
				sql += "and name like '%" + key + "%' ";
			}	
			
		}
		
		
		
		switch(sort) {
		
		case "X":
			sql += "order by no asc ";
			break;
		case "L":
			sql += "order by likey desc ";
			break;
		case "RL":
			sql += "order by likey asc ";
			break;
		case "N":
			sql += "order by bcount desc ";
			break;
		case "RN":
			sql += "order by bcount asc ";
			break;
		}
		int startno = perPage * (pageNo - 1);
		sql += "limit " + startno + "," + perPage;
		
		
		this.RunSelect(sql);
		
		while ( this.GetNext() == true ) {
			TourDesVO vo = new TourDesVO();
			vo.setNo(this.GetValue("no"));
			vo.setName(this.GetValue("name"));
			vo.setPic(this.GetValue("pic"));
			vo.setLikey(this.GetValue("likey"));
			
			list.add(vo);
		}
			
		this.DBClose();
		return list;
	}
	
	public ArrayList<TourDesVO> GetCateWords(String cate) {
			
			ArrayList<TourDesVO> list = new ArrayList<TourDesVO>();
			this.DBOpen();
			
			String sql = "";
			
		
			
			sql  = "select name,bcount from ( ";
			sql += "select name, ";
			sql += "(select count(*) from blog_cd where no = tourdes.no) as bcount ";
			
			if( cate.equals("전체 관광지")) {
				sql	+= "from tourdes ";
				/*
				 * }else if ( cate.equals("기타") ) { sql += "from tourdes where cate not in ";
				 * sql += "( "; 
				 * sql += " '유적지', '박물관/전시관', '드라마세트장', '공원/유원시설', '문화체육시설', '농촌체험시설', '전통시장' "; 
				 * sql += ") ";
				 */
			}else {
				sql	+= "from tourdes ";
				sql += "where cate = '" + cate + "' ";
			}
			sql += ") x ";
			sql += "order by bcount desc ";
			sql += "limit 0,50 ";
			this.RunSelect(sql);
			while( this.GetNext() == true ) {
				TourDesVO vo = new TourDesVO();
				vo.setName(this.GetValue("name"));
				vo.setBcount(this.GetValue("bcount"));
				
				list.add(vo);
			}
			
			this.DBClose();
			return list;
	}
	
	
	  public ArrayList<TourDesVO> GetCateCount() {
		  ArrayList<TourDesVO> list = new ArrayList<TourDesVO>();
		  this.DBOpen();
		  
		  String sql = "";
		  
		  sql = "select cate, count(cate) as ccount from tourdes group by cate ";
		  this.RunSelect(sql);
		  while( this.GetNext() == true ) {
			  TourDesVO vo = new TourDesVO();
			  vo.setCate(this.GetValue("cate"));
			  vo.setCcount(this.GetValue("ccount"));
			  
			  list.add(vo);
		  }
		  
		  this.DBClose();
		return list;
	  }

	  public ArrayList<TourDesVO> GetWDdata(String cate) {
			
			ArrayList<TourDesVO> list = new ArrayList<TourDesVO>();
			this.DBOpen();
			
			String sql = "";
			
		
			
			sql  = "select name,bcount from ( ";
			sql += "select name, ";
			sql += "(select count(*) from blog_cd where no = tourdes.no) as bcount ";
			
			if( cate.equals("전체 관광지")) {
				sql	+= "from tourdes ";
				/*
				 * }else if ( cate.equals("기타") ) { sql += "from tourdes where cate not in ";
				 * sql += "( "; 
				 * sql += " '유적지', '박물관/전시관', '드라마세트장', '공원/유원시설', '문화체육시설', '농촌체험시설', '전통시장' "; 
				 * sql += ") ";
				 */
			}else {
				sql	+= "from tourdes ";
				sql += "where cate = '" + cate + "' ";
			}
			sql += ") x ";
			sql += "order by bcount desc ";
			sql += "limit 0,5 ";
			this.RunSelect(sql);
			while( this.GetNext() == true ) {
				TourDesVO vo = new TourDesVO();
				vo.setName(this.GetValue("name"));
				vo.setBcount(this.GetValue("bcount"));
				
				list.add(vo);
			}
			
			this.DBClose();
			return list;
	}
	  
	  public int GetTotal(String cate,String key)
		{
			this.DBOpen();
			
			String sql = "";
			
			
			sql  = "select count(*) as total  ";
			
			if( cate.equals("전체 관광지")) {
				
				sql += "from tourdes ";
				if( !key.equals("") ) {
					
					sql += "where name like '%" + key + "%' ";
				}	
				
			}else {
				
				sql += "from tourdes ";
				sql += "where cate = '" + cate + "' ";
				if( !key.equals("") ) {
					
					sql += "and name like '%" + key + "%' ";
				}	
				
			}
			
			

			this.RunSelect(sql);
			this.GetNext();				
			int total = Integer.parseInt(this.GetValue("total")); //전체 데이터 갯수
			
			this.DBClose();
			return total;
		}
}
