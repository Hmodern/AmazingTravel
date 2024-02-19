package at.vo;

public class BlogcdVO {
	
	private String dno;
	private String no;
	private String title;
	private String blogger;
	private String bdate;
	private String contents;
	private String link;
	private String count;
	
	public BlogcdVO() {
		
		dno 		= "";
		no 			= "";
		title 		= "";
		blogger 	= "";
		bdate 		= "";
		contents 	= "";
		link 		= "";
		count 		= "";
	}

	

	

	public String getDno() 		{ return dno; 		}
	public String getNo() 		{ return no; 		}
	public String getTitle() 	{ return title; 	}
	public String getBlogger() 	{ return blogger; 	}
	public String getBdate() 	{ return bdate; 	}
	public String getContents() { return contents; 	}
	public String getLink() 	{ return link; 		}
	public String getCount() 	{ return count; 	}

	public void setDno(String dno) 				{ this.dno = dno; 			}
	public void setNo(String no) 				{ this.no = no; 			}
	public void setTitle(String title) 			{ this.title = title; 		}
	public void setBlogger(String blogger) 		{ this.blogger = blogger; 	}
	public void setBdate(String bdate) 			{ this.bdate = bdate; 		}
	public void setContents(String contents) 	{ this.contents = contents; }
	public void setLink(String link) 			{ this.link = link; 		}
	public void setCount(String count) 			{ this.count = count; 		}
	
	

}
