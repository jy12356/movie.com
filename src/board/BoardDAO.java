package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import dbcon.DbConnection;
import member.MemberDAO;
import notice.NoticeBean;
import reply.ReplyBean;


public class BoardDAO {
	
	DbConnection dc =null;

	NoticeBean nb =null;
	Connection con = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs =null;

	public BoardDAO() {
		dc = new DbConnection();
	}
	public BoardBean insertBoard(BoardBean bb){
		
				
		try {
			con = dc.getConnection();
			String sql2 = "select max(num) from board";
			pstmt = con.prepareStatement(sql2);
			rs = pstmt.executeQuery(sql2);
			int num = 0;
			if(rs.next()){
			 	num = rs.getInt("max(num)")+ 1;
			}
		
			String sql =  "insert into board  (num,title, writer, pass, content,date,modifyDate,readcount) values(?,?,?,?,?,?,?,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getTitle());
			pstmt.setString(3,bb.getWriter());
			pstmt.setString(4,bb.getPw());
			pstmt.setString(5,bb.getContent());
			pstmt.setTimestamp(6,bb.getDate());
			pstmt.setTimestamp(7,bb.getModifyDate());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return bb;		
	} 
	
	public BoardBean getBoard(int num) {
		BoardBean bd =null;
		
		try {
			con = dc.getConnection();
			String sql= "select * from board where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bd =new BoardBean();
				bd.setNum(rs.getInt("num"));
				bd.setTitle(rs.getString("title"));
				bd.setPw(rs.getString("pass"));
				bd.setReadcount(rs.getInt("readcount"));
				bd.setWriter(rs.getString("writer"));
				bd.setContent(rs.getString("content"));
				bd.setDate(rs.getTimestamp("date"));
				bd.setModifyDate(rs.getTimestamp("modifyDate"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return bd;
	}
	
	public List getBoardList(int startPage, int endPage, String search) {
		BoardBean bb =null;
		if(search ==  null) {
			search = "";
		}
		//여러개바구니는 저장할 기억장소만들기(배열형태로 자바에 만든 프로그램)
		List boardList= new ArrayList();
		try {
			con = dc.getConnection();
			String sql = "select * from board where title like ? order by num desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, "%"+search+ "%");
			pstmt.setInt(2,startPage-1);
			pstmt.setInt(3,endPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bb =new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setTitle(rs.getString("title"));
				bb.setPw(rs.getString("pass"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setWriter(rs.getString("writer"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setModifyDate(rs.getTimestamp("modifyDate"));
				boardList.add(bb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return boardList;
	}
	
	
	public int getBoardCount() {
		int count = 0;
		try {
			con = dc.getConnection();
			String sql2= "select count(*) from board";
			pstmt2 = con.prepareStatement(sql2);
			rs = pstmt2.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}	 			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt2!=null) {try {pstmt2.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return count;
	}
	
	public void paging(int pageSize, int startPage, int endPage, int count) {
		try {
			con = dc.getConnection();
			String sqlList = "select * from board order by num desc limit ?,?";
			pstmt = con.prepareStatement(sqlList);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		
	} 
	
	
	public int numChk(int num, String pass) {
		int chk = -1;
		try {
			Connection con = dc.getConnection();
			String sql= "select pass from board where num =?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("pass").equals(pass)) {
					chk = 1;
				}else {
					chk = -1;
				}
				System.out.println(chk);
			}else {
				chk = 0;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return chk;
	}
	
	public BoardBean updateBoard(BoardBean bb){

		try {
			Connection con = dc.getConnection();
			String sql =  "update board set title=?, content=?,modifyDate=? where num = ? ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bb.getTitle());
			pstmt.setString(2,bb.getContent());
			pstmt.setTimestamp(3,bb.getModifyDate());
			pstmt.setInt(4, bb.getNum());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bb;		
	} 
	
	public void updateBoardReadcount(int num){

		try {
			Connection con = dc.getConnection();
			String sql =  "update board set readcount=readcount+1 where num = ? ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}		
	} 
	
	public void delBoard(int num){
		
		try {
			Connection con = dc.getConnection();
			String sql =  "delete from board where num =?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	} 

}
