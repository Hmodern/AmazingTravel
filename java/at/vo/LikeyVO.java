package at.vo;

public class LikeyVO {
	
	private String serial;
	private String pushed_ip;
	private String no;
	private String pdate;
	
	
	public LikeyVO() {
		
		serial 		= "";
		pushed_ip 	= "";
		no 			= "";
		pdate 		= "";
	}


	public String getSerial() 		{ return serial;	}
	public String getPushed_ip() 	{ return pushed_ip;	}
	public String getNo() 			{ return no;		}
	public String getPdate() 		{ return pdate;		}

	public void setSerial(String serial) 		{ this.serial = serial; 		}
	public void setPushed_ip(String pushed_ip) 	{ this.pushed_ip = pushed_ip; 	}
	public void setNo(String no) 				{ this.no = no; 				}
	public void setPdate(String pdate) 			{ this.pdate = pdate; 			}
	
	
	
	

}
