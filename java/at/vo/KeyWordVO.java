package at.vo;

public class KeyWordVO {
	
	private String no;
	private String keyword;
	private String kcount;
	private String cate;
	
	public KeyWordVO() {
		
		no 		= "";
		keyword = "";
		kcount 	= "";
		cate 	= "";
	}

	public String getNo() 		{ return no;		}
	public String getKeyword() 	{ return keyword; 	}
	public String getKcount() 	{ return kcount;	}
	public String getCate() 	{ return cate; 		}

	public void setNo(String no) 			{ this.no = no;				}
	public void setKeyword(String keyword) 	{ this.keyword = keyword;	}
	public void setKcount(String kcount) 	{ this.kcount = kcount;		}
	public void setCate(String cate) 		{ this.cate = cate; 		}
	
	

}
