package at.vo;

public class TourDesVO {
	
	private String no;
	private String name;
	private String pic;
	private String cate;
	private String outline;
	private String info;
	private String likey;
	private String count;
	private String bcount;
	private String ccount;
	
	public TourDesVO() {
		
		no 		= "";
		name 	= "";
		pic 	= "";
		cate 	= "";
		outline = "";
		info 	= "";
		likey 	= "";
		count 	= "";
		bcount 	= "";
		ccount 	= "";
	}

	public String getNo() 		{ return no; 		}
	public String getName() 	{ return name; 		}
	public String getPic() 		{ return pic; 		}
	public String getCate() 	{ return cate; 		}
	public String getOutline() 	{ return outline; 	}
	public String getInfo() 	{ return info; 		}
	public String getLikey() 	{ return likey; 	}
	public String getCount() 	{ return count; 	}
	public String getBcount() 	{ return bcount; 	}
	public String getCcount() 	{ return ccount; 	}
	

	public void setNo(String no) 			{ this.no = no; 			}
	public void setName(String name) 		{ this.name = name; 		}
	public void setPic(String pic) 			{ this.pic = pic; 			}
	public void setCate(String cate) 		{ this.cate = cate; 		}
	public void setOutline(String outline) 	{ this.outline = outline; 	} 
	public void setInfo(String info) 		{ this.info = info; 		}
	public void setLikey(String likey) 		{ this.likey = likey; 		}
	public void setCount(String count) 		{ this.count = count; 		}
	public void setBcount(String bcount) 	{ this.bcount = bcount; 	}
	public void setCcount(String ccount) 	{ this.ccount = ccount; 	}
	
	
	

}
