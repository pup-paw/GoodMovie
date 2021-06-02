package cinema;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import functions.MbeanMovie;
import functions.MbeanMovieScreening;
import functions.TicketingBean;

public class DBcinema {
	static  Connection con         = null;
	static  Statement stmt         = null;
	static  ResultSet rs           = null ;

	static String driver= "com.mysql.jdbc.Driver";
	static String URL = "jdbc:mysql://localhost:3306/cinema?useSSL=false" ;

	public static Connection loadConnect()  {
		try {
			// 연결을 닫는다.
			if( stmt != null ) stmt.close();
			if( con != null ) con.close();
		} catch (SQLException ex ) {};  

		// 드라이버 로딩
		try {
			Class.forName(driver);
		} catch ( java.lang.ClassNotFoundException e ) {
			System.err.println("** Driver loaderror in loadConnect: " + e.getMessage() );
			e.printStackTrace();
		}

		try {
			// 연결하기
			con  = DriverManager.getConnection(URL, "root", "onlyroot");
			System.out.println("\n"+URL+"에 연결됨");
		} catch( SQLException ex ) 
		{

			System.err.println("** connection error in loadConnect(): " + ex.getMessage() );
			ex.printStackTrace();
		}
		return con;	   

	}
	public static void connect() {
		try {
			//데이터베이스에 연결
			con = loadConnect();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static void disconnect()  {
		try {
			// 연결을 닫는다.
			if( stmt != null ) stmt.close();
			if( con != null ) con.close();
		} catch (SQLException ex ) {};    
	}

	public static ResultSet selectQuery(String sql) { 
		try {
			// Statement 생성 
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);  
		} catch( SQLException ex ) 	    {
			System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
		}
		return rs;
	}

	public static int updateQuery(String sql) { 
		int count;
		try {
			// Statement 생성 
			stmt = con.createStatement();
			count = stmt.executeUpdate(sql);  
			return count;

		} catch( SQLException ex ) 	    {
			System.err.println("** SQL exec error in updateQuery() : " + ex.getMessage() );
			return 0;
		}	
	}
	
	public static ResultSet selectAllMember() {//member의 모든 정보 불러오기
		String sql = "select * from member;";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}
	
	public static ResultSet insertMember(Member mem) {
		// 주어진 mem을  member 테이블에 삽입하고 삽입된 결과를 테이블에서 검색하여 반화
		String sql = "insert into member values ("+mem.getMemID()+",'"+mem.getMemPW()+"', " 
		+mem.getMemName()+ ", '" + mem.getTelno()+ ", '" + mem.getReCnt()+ ", '" + mem.getTkCnt() +"' ); ";
		System.out.println("   >> SQL : " + sql + "\n");

		int count = updateQuery(sql);

		if (count==1)
			return selectAllMember();
		else
			return null;
	}
	public static ResultSet selectAllMovie() {
	      String sql = "select * from movie;";
	      System.out.println(">>SQL : " + sql + "\n");
	      
	      return selectQuery(sql);
	   }
	   
	   public static ResultSet selectMovie(String mno) {
	      String sql ="select * from movie where mno = \""+mno+"\";";
	      System.out.println(">>>SQL : " +sql+"\n");
	      
	      return selectQuery(sql);
	   }
	   
	   public static ResultSet selectTicketing(String memID) {
	      String sql ="select * from ticketing where memID = \""+memID+"\";";
	      System.out.println(">>>SQL : "+sql+"\n");
	      
	      return selectQuery(sql);
	   }
	   
	   public static ResultSet selectAllMovieScreening() {
	      String sql = "select * from movieScreening;";
	      System.out.println(">>SQL : "+sql+"\n");
	      
	      return selectQuery(sql);
	   }
	   
	   public static ResultSet selectAllTicketing() {
	      String sql = "select * from ticketing";
	      System.out.println(">>>SQL : "+sql+"\n");
	      
	      return selectQuery(sql);
	   }
	   
	   public static ResultSet lookUpMovie(String mno) {
	      String sql = "select memID, scrDate, sno, scrTime, pNum, tknum "
	            + "from ticketing, movieScreening, movie "
	            + "where ticketing.enno = movieScreening.enno "
	            + "and movie.mno = movieScreening.mno "
	            + "and movieScreening.mno = \"" + mno + "\";";
	      
	      return selectQuery(sql);
	   }
	   
	   //관리자에게 Movie 입력받아 insert하기
	   public static ResultSet insertMovie(MbeanMovie mv) {
	      String sql = "insert into movie values ('"+mv.getMno()+"', '"+mv.getTitle()+"'," + 13000 + "," + 10000 + "," + 14000 + ",'"
	            +mv.getGenre()+ "', " + mv.getRuntime() + ", "+ 0.0 +", \""+mv.getStrDate()+"\", \""+mv.getEndDate()+"\","
	            +0+",'"+mv.getSummary() + "','"+mv.getDirector()+ "');";
	      System.out.println(">>SQL : " + sql + "\n");
	      
	      int count = updateQuery(sql);
	      
	      if(count==1)   return selectAllMovie();
	      else   return null;
	   }
	   
	   public static ResultSet insertTicketing(TicketingBean tb) {
	      String sql = "insert into ticketing values ('"+tb.getTknum()+"', '"+tb.getMemID()+"',"+tb.getDiscount()+",'"
	            +tb.getPayMethod()+"', "+tb.getpNum()+","+tb.getTotal()+",\""+tb.getRsvDate()+"\",'"+tb.getEnno()+"','"
	            +tb.getReno()+"','"+tb.getReContent()+"',\""+tb.getRsvDate()+"\","+tb.getScore()+");";
	      System.out.println(">>>SQL : "+sql+"\n");
	      
	      int count = updateQuery(sql);
	      
	      if(count==1) return selectAllTicketing();
	      else return null;
	   }
	   
	   public static String getRandomStr(int size) {
	      if(size > 0) {
	         char[] tmp = new char[size];
	         for(int i=0; i<tmp.length; i++) {
	            int div = (int) Math.floor( Math.random() * 2 );
	            
	            if(div == 0) { // 0이면 숫자로
	               tmp[i] = (char) (Math.random() * 10 + '0') ;
	            }else { //1이면 알파벳
	               tmp[i] = (char) (Math.random() * 26 + 'A') ;
	            }
	         }
	         return new String(tmp);
	      }
	      return "ERROR : Size is required."; 
	   }
	   
	   public static ResultSet selectMovieScreening(String enno) {
	      String sql = "select * from movieScreening where enno = \"" + enno +"\";";
	      System.out.println(">>>SQL : " +sql+"\n");
	      
	      return selectQuery(sql);
	   }
	   
	   public static ResultSet selectScreening(String enno) {
		      String sql = "select * from screening where enno = \"" + enno +"\";";
		      System.out.println(">>>SQL : " +sql+"\n");
		      
		      return selectQuery(sql);
		   }
	   
	   public static ResultSet selectMovieScreening(String mno, java.sql.Date revDate, String tname) {
	      String sql = "select * from movieScreening "
	            + "where mno = \"" + mno + "\" and scrDate = \"" + revDate + "\" and tname = \"" + tname +"\";";
	      System.out.println(">>>SQL : "+sql+"\n");
	      
	      return selectQuery(sql);
	   }
	   
	   public static ResultSet selectMovieScreening(String mno, java.sql.Date revDate, String tname, java.sql.Time scrTime) {
	      String sql = "select * from movieScreening "
	            + "where mno = \"" + mno + "\" and scrDate = \"" + revDate + "\" and tname = \"" + tname + "\" and scrTime = \"" + scrTime + "\";";
	      System.out.println(">>>SQL : "+sql+"\n");
	      
	      return selectQuery(sql);
	   }
	   
	   public static ResultSet insertMovieScreening(MbeanMovieScreening ms) {
	      String sql = "insert into movieScreening values('"+ms.getEnno()+"', '"+ ms.getMno()+
	            "', \""+ms.getScrDate()+"\", \""+ms.getScrTime()+"\", "+ms.getFee()+","+0+",'"
	            +ms.getTname()+"','"+ms.getSno()+"','"+ms.getAdID()+"');";
	      System.out.println(">>>SQL : "+sql+"\n");
	      
	      int count = updateQuery(sql);
	      
	      if(count==1)   return selectAllMovieScreening();
	      else return null;
	   }
	   
	   public static int selectSumpCnt(String enno) {//총예매인원 반환
		   Connection conn = DBcinema.loadConnect();
			int cnt = 0;
			try {
				Statement stmt = conn.createStatement();
		         ResultSet rs = stmt.executeQuery("select sum(pNum) from ticketing where enno='"+enno+"'");
		         rs.next();
		         cnt = rs.getInt("sum(pNum)");
			}catch(Exception e) {
				e.printStackTrace();
			}return cnt;
	   }
	   public static void updatepCnt(String enno, int sumpNum) {//입력받은 enno를 예매한 사람인원수 update해주기
			int count=0;
			Connection conn = DBcinema.loadConnect();
			PreparedStatement pstmt=null;
			//리뷰번호, 리뷰날짜, 리뷰내용, 평점 업데이트 
			String sql = "update moviescreening set pCnt = '"+sumpNum+"' where enno='"+enno+"'";
			try {
				pstmt = conn.prepareStatement(sql);
	        	count = pstmt.executeUpdate(); 	
	        	DBcinema.disconnect();
	     
			}catch (SQLException e) {
				e.printStackTrace();
				  }
		}
	   
	   public static ResultSet selectReContent(String mno) {//리뷰내용 
		      String sql ="select reContent, memID from ticketing, moviescreening where ticketing.enno = moviescreening.enno and mno='"+mno+"'";
		      System.out.println(">>>SQL : " +sql+"\n");
		      
		      return selectQuery(sql);
		   }
	   
	   public static ResultSet selectReContentMem(String memID) {//회원에 따른 리뷰내용 출력
           String sql ="select title, reContent from ticketing, moviescreening, movie "
                 + "where ticketing.enno = moviescreening.enno and movie.mno = moviescreening.mno and memID = '"+memID+"'";
           System.out.println(">>>SQL : " +sql+"\n");
           
           return selectQuery(sql);
        }
	   public static ResultSet selectTicketing(String memID, String enno) {
	         String sql="select * from ticketing where memID = \""+memID+"\" and enno = \""+enno+"\";";
	         System.out.println(">>>SQL : "+sql+"\n");
	         
	         return selectQuery(sql);
	      }
}
