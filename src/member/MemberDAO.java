package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbcon.DbConnection;
import notice.NoticeBean;

public class MemberDAO {
	
	DbConnection dc = null;
	MemberBean mb =null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	
	public MemberDAO() {
		 dc = new DbConnection();
	}
	
	public MemberBean insertMember(MemberBean mb) {
		try {
			con = dc.getConnection();
			String sql = "insert into member (id,pass,name,email,phone,mobile,address,date) values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,mb.getId());
			pstmt.setString(2,mb.getPass());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4,mb.getEmail());
			pstmt.setString(5,mb.getPhone());
			pstmt.setString(6,mb.getMobile());
			pstmt.setString(7,mb.getAddress());
			pstmt.setTimestamp(8,mb.getDate());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
				
		return mb;
	}
	
	public MemberBean updateMember(MemberBean mb) {
		try {
			con = dc.getConnection();
			String sql = "update member set name=?, mobile=?, phone=?, email=?, address=? where  id= ?";
			pstmt  = con.prepareStatement(sql);
			pstmt.setString(1,mb.getName());
			pstmt.setString(2, mb.getMobile());
			pstmt.setString(3, mb.getPhone());
			pstmt.setString(4, mb.getEmail());
			pstmt.setString(5, mb.getAddress());
			pstmt.setString(6, mb.getId());		
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return mb;		
	}
	
	public void delMember(String  id, String pass) {
		try {
			con = dc.getConnection();
			String sql = "delete from member where id=? and pass=?";
			pstmt  = con.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2, pass);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
	}
	
	public MemberBean getMember(String id) {
		MemberBean mb = null;
		try {
			con = dc.getConnection();
			String sql = "select * from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs =  pstmt.executeQuery();
			if(rs.next()) {
				mb = new MemberBean();
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setPhone(rs.getString("phone"));
				mb.setMobile(rs.getString("mobile"));
				mb.setEmail(rs.getString("email"));
				mb.setAddress(rs.getString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return mb;
	}
	
	public List getMemberList(int startPage, int endPage) {
		MemberBean mb = null;
		List memberList = new ArrayList();
		try {
			con = dc.getConnection();
			String sql = "select * from member order by id asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,startPage-1);
			pstmt.setInt(2,endPage);
			rs =  pstmt.executeQuery();
			while(rs.next()) {
				mb = new MemberBean();
				mb.setId(rs.getString("id"));
				mb.setPass(rs.getString("pass"));
				mb.setName(rs.getString("name"));
				mb.setPhone(rs.getString("phone"));
				mb.setMobile(rs.getString("mobile"));
				mb.setEmail(rs.getString("email"));
				mb.setAddress(rs.getString("address"));
				mb.setDate(rs.getTimestamp("date"));
				memberList.add(mb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return memberList;
	}
	public int getMemberCount() {
		int count = 0;
		try {
			con = dc.getConnection();
			String sql= "select count(*) from member";
			pstmt = con.prepareStatement(sql);
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
	
	public int userChk(String id, String pass) {
		int chk = -1;
		try {
			con = dc.getConnection();
			String sql = "select * from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();			
			if(rs.next()){
				if(pass.equals(rs.getString("pass"))){
					chk = 0;
				}else{
					chk = 1;
				}
			}else{
				chk =-1;
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
	
	public int idChk(String wid) {
		int idChk = -1;
		try {
			con = dc.getConnection();
			String sql = "select id from member where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, wid);
			rs =  pstmt.executeQuery();
			if(rs.next()) {
				idChk = 1;
			}else{
				idChk = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
			if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
			if(con!=null) {try {con.close();}catch(SQLException ex) {}}
		}
		return idChk;
	}
	
}
