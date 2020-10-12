package reply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import dbcon.DbConnection;
import notice.NoticeBean;

public class ReplyDAO {
	
	DbConnection dc =null;
	NoticeBean nb =null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	
	public ReplyDAO() {
		dc = new DbConnection();
	}
	//댓글 get, insert, delete, modify, count
	public void insertreply(ReplyBean rb) {
		try {
			con = dc.getConnection();
			
			String sql2 = "select max(cmtNum) from comment";
			pstmt = con.prepareStatement(sql2);
			rs = pstmt.executeQuery(sql2);
			int num = 0;
			if(rs.next()){
			 	num = rs.getInt("max(cmtNum)")+ 1;
			}
			if(rb.getDepthCmt() == 1){
				String sql =  "insert into comment  (cmtNum, cmtCnt, depthCmt,boardNum,inxCmt ,id ,date,contNum,isDel) values(?,?,?,?,0,?,?,?,'n')";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2,rb.getCmtCnt());
				pstmt.setInt(3, rb.getDepthCmt());
				pstmt.setInt(4, rb.getBoardNum());
				pstmt.setString(5,rb.getId());
				pstmt.setTimestamp(6,rb.getDate());
				pstmt.setInt(7,rb.getContNum());
			}else if(rb.getDepthCmt() == 2){
				String sql =  "insert into comment  (cmtNum, cmtCnt, depthCmt,boardNum,inxCmt ,id ,date,cmtSubNum,contNum,isDel) values(?,?,?,?,0,?,?,?,?,'n')";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2,rb.getCmtCnt());
				pstmt.setInt(3, rb.getDepthCmt());
				pstmt.setInt(4, rb.getBoardNum());
				pstmt.setString(5,rb.getId());
				pstmt.setTimestamp(6,rb.getDate());
				pstmt.setInt(7,rb.getCmtSubNum());
				pstmt.setInt(8,rb.getContNum());
			}
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
	}
	
	public List getreplyListint (int num,int contNum) {
		ReplyBean rb =null;
		//여러개바구니는 저장할 기억장소만들기(배열형태로 자바에 만든 프로그램)
		List replyList= new ArrayList();
		try {
			con = dc.getConnection();
			String sql = "select * from comment where depthCmt =1 and contNum=? and boardNum = ? order by cmtNum desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, contNum);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rb =new ReplyBean();
				rb.setCmtNum(rs.getInt("cmtNum"));
				rb.setCmtCnt(rs.getString("cmtCnt"));
				rb.setDepthCmt(rs.getInt("depthCmt"));
				rb.setBoardNum(rs.getInt("boardNum"));
				rb.setId(rs.getString("id"));
				rb.setCmtSubNum(rs.getInt("cmtSubNum"));
				rb.setContNum(rs.getInt("contNum"));
				rb.setIsDel(rs.getString("isDel"));
				replyList.add(rb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return replyList;
	}

	public List getreReplyListint (int num, int cmtNum) {
		ReplyBean rb =null;
		//여러개바구니는 저장할 기억장소만들기(배열형태로 자바에 만든 프로그램)
		List replyList= new ArrayList();
		try {
			con = dc.getConnection();
			String sql = "select * from comment "
											+ "where depthCmt=2 "
											+ "and cmtSubNum = ? "
											+ "and boardNum =? "
											+ "order by cmtNum ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cmtNum);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rb =new ReplyBean();
				rb.setCmtNum(rs.getInt("cmtNum"));
				rb.setCmtCnt(rs.getString("cmtCnt"));
				rb.setDepthCmt(rs.getInt("depthCmt"));
				rb.setBoardNum(rs.getInt("boardNum"));
				rb.setId(rs.getString("id"));
				rb.setCmtSubNum(rs.getInt("cmtSubNum"));
				rb.setIsDel(rs.getString("isDel"));
				replyList.add(rb);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return replyList;
	}
	
	
	
	public boolean delComment(int cmtNum , String id, int contNum, int depthNum){
		boolean result = false;
		
		try {
			con = dc.getConnection();
			String sql =  "update comment set  isDel='y' where cmtNum =? and contNum=? and depthCmt=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cmtNum);
			pstmt.setInt(2, contNum);
			pstmt.setInt(3, depthNum);
			pstmt.executeUpdate();
			result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return result;
	} 
	
	public boolean delCommentAdmin(int cmtNum, int contNum, int depthNum){
		boolean result = false;
		try {
			con = dc.getConnection();
			String sql =  "delete from comment where cmtNum =? and contNum=? and depthCmt=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cmtNum);
			pstmt.setInt(2, contNum);
			pstmt.setInt(3, depthNum);
			pstmt.executeUpdate();
			result = true;
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return result;
	} 
	
	
	public ReplyBean updateReply(ReplyBean rb){

		try {
			con = dc.getConnection();
			String sql =  "update comment set cmtCnt=? where cmtNum = ? and contNum=? ";				
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rb.getCmtCnt());
			pstmt.setInt(2,rb.getCmtNum());
			pstmt.setInt(3,rb.getContNum());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return rb;		
	} 
	
}
