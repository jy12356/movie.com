package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbcon.DbConnection;

public class NoticeDAO {

	DbConnection dc = null;
	NoticeBean nb =null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	
	public NoticeDAO() {
		dc = new DbConnection();
	}
	
	//notice
	public NoticeBean insertNotice(NoticeBean nb){
				
		try {
			con = dc.getConnection();
			
			String sql2 = "select max(num) from notice";
			pstmt = con.prepareStatement(sql2);
			rs = pstmt.executeQuery(sql2);
			int num = 0;
			if(rs.next()){
			 	num = rs.getInt("max(num)")+ 1;
			}
		
			String sql =  "insert into notice  (num,title, writer, pass, content,fileName1,fileName2,date,modifyDate,readcount) values(?,?,?,?,?,?,?,?,?,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, nb.getTitle());
			pstmt.setString(3,nb.getWriter());
			pstmt.setString(4,nb.getPw());
			pstmt.setString(5,nb.getContent());
			pstmt.setString(6,nb.getFile1());
			pstmt.setString(7,nb.getFile2());
			pstmt.setTimestamp(8,nb.getDate());
			pstmt.setTimestamp(9,nb.getModifyDate());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return nb;		
	} 
	
	public NoticeBean getNotice(int num) {
		NoticeBean nb =null;
		
		try {
			con = dc.getConnection();
			String sql= "select * from notice where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				nb =new NoticeBean();
				nb.setNum(rs.getInt("num"));
				nb.setTitle(rs.getString("title"));
				nb.setPw(rs.getString("pass"));
				nb.setReadcount(rs.getInt("readcount"));
				nb.setWriter(rs.getString("writer"));
				nb.setContent(rs.getString("content"));
				nb.setDate(rs.getTimestamp("date"));
				nb.setModifyDate(rs.getTimestamp("modifyDate"));
				nb.setFile1(rs.getString("fileName1"));
				nb.setFile2(rs.getString("fileName2"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return nb;
	}
	public List getNoticeList(int startPage, int pageSize, String search) {
		NoticeBean nb =null;
		if(search ==  null) {
			search = "";
		}
		//여러개바구니는 저장할 기억장소만들기(배열형태로 자바에 만든 프로그램)
		List noticeList= new ArrayList();
		try {
			con = dc.getConnection();
			String sql = "select * from notice where title like ? order by num desc  limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, "%"+search+ "%");
			pstmt.setInt(2,startPage-1);
			pstmt.setInt(3,pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				nb =new NoticeBean();
				nb.setNum(rs.getInt("num"));
				nb.setTitle(rs.getString("title"));
				nb.setPw(rs.getString("pass"));
				nb.setReadcount(rs.getInt("readcount"));
				nb.setWriter(rs.getString("writer"));
				nb.setContent(rs.getString("content"));
				nb.setDate(rs.getTimestamp("date"));
				nb.setModifyDate(rs.getTimestamp("modifyDate"));
				noticeList.add(nb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return noticeList;
	}
	
	
	public int getNoticeCount(String search) {
		int count = 0;
		if(search == null) {
			search ="";
		}
		try {
			con = dc.getConnection();
			String sql= "select count(*) from notice where title like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search + "%");
			System.out.println(pstmt);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return count;
	}
	
	
	public int numChk(int num, String pass) {
		int chk = -1;
		try {
			con = dc.getConnection();
			String sql= "select pass from notice where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("pass").equals(pass)) {
					chk = 1;
				}else {
					chk = -1;
				}
			}else {
				chk = 0;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return chk;
	}
	
	public NoticeBean updateNotice(NoticeBean nb){

		try {
			con = dc.getConnection();
			String sql =  "update notice set title=?, content=?,modifyDate=?,fileName1=?,fileName2=? where num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nb.getTitle());
			pstmt.setString(2,nb.getContent());
			pstmt.setTimestamp(3,nb.getModifyDate());
			pstmt.setString(4,nb.getFile1());
			pstmt.setString(5,nb.getFile2());
			pstmt.setInt(6, nb.getNum());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return nb;		
	} 
	
	public void updateNoticeReadcount(int num){

		try {
			con = dc.getConnection();
			String sql =  "update notice set readcount=readcount+1 where num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}	
	} 
	
	public void delNotice(int num){
		
		try {
			con = dc.getConnection();
			String sql =  "delete from notice where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
	} 
	
	
	
	
	
}
