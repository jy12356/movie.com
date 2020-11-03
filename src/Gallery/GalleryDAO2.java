package Gallery;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbcon.DbConnection;
import notice.NoticeBean;
	
public class GalleryDAO2 {
	
		DbConnection dc = null;
		GalleryBean gb =null;
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs =null;
		
		public GalleryDAO2() {
			dc = new DbConnection();
		}
		
		//Gallery
		
		public int getGalleryCount(String search) {
			int count = 0;
			if(search == null) {
				search ="";
			}
			try {
				con = dc.getConnection();
				String sql2= "select count(*) from movie where title like ?";
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setString(1, "%"+search+"%");
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
		
		
		public GalleryBean insertNotice(GalleryBean gb){
			try {
				con = dc.getConnection();
				
				String sql2 = "select max(num) from movie";
				pstmt = con.prepareStatement(sql2);
				rs = pstmt.executeQuery(sql2);
				int num = 0;
				if(rs.next()){
				 	num = rs.getInt("max(num)")+ 1;
				}
				String sql =  "insert into movie  ("
															+ "num,title, pass, thumImg, genre, spectator, runtime,"
															+ "openDate, director, cast, grade, depTitle, content, recommend"
															+ ") "
												+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,0)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, gb.getTitle());
				pstmt.setString(3, gb.getPass());
				pstmt.setString(4, gb.getThumImg());
				pstmt.setString(5, gb.getGenre());
				pstmt.setInt(6, gb.getSpectator());
				pstmt.setString(7, gb.getRuntime());
				pstmt.setString(8,  gb.getOpenDate());
				pstmt.setString(9, gb.getDirector());
				pstmt.setString(10, gb.getCast());
				pstmt.setDouble(11, gb.getGrade());
				pstmt.setString(12, gb.getDepTitle());
				pstmt.setString(13, gb.getContent());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
				if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
				if(con!=null) {try {con.close();}catch(SQLException ex) {}}
			}
			
			return gb;		
		} 
		
		public GalleryBean getGallery(int num) {

			try {
				con = dc.getConnection();
				String sql= "select * from movie where num =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					gb =new GalleryBean();
					gb.setNum(rs.getInt("num"));
					gb.setTitle(rs.getString("title"));
					gb.setPass(rs.getString("pass"));
					gb.setThumImg(rs.getString("thumImg"));
					gb.setGenre(rs.getString("genre"));
					gb.setSpectator(rs.getInt("spectator"));
					gb.setRuntime(rs.getString("runtime"));
					gb.setOpenDate(rs.getString("openDate"));
					gb.setDirector(rs.getString("director"));
					gb.setCast(rs.getString("cast"));
					gb.setGrade(rs.getDouble("grade"));
					gb.setDepTitle(rs.getString("deptitle"));
					gb.setContent(rs.getString("content"));
					gb.setRecommend(rs.getInt("recommend"));
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
				if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
				if(con!=null) {try {con.close();}catch(SQLException ex) {}}
			}
			return gb;
		}
		public List getGalleryList(int startPage, int endPage,String search) {
			GalleryBean gb =null;
			if(search ==  null) {
				search = "";
			}
			//여러개바구니는 저장할 기억장소만들기(배열형태로 자바에 만든 프로그램)
			List galleryList= new ArrayList();
			try {
				con = dc.getConnection();
				String sql = "select m.num, m.title, m.thumImg, g.gName genre, m.spectator, m.runtime, m.openDate, m.director, m.cast, "
						+ " m.grade, m.depTitle, m.content, m.recommend, m.pass "
						+ "from movie m join genre g on m.genre=g.gCode where m.title like ? "
						+ "order by recommend desc, title asc  limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+ "%");
				pstmt.setInt(2,startPage-1);
				pstmt.setInt(3,endPage);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					gb = new GalleryBean();
					gb.setNum(rs.getInt("num"));
					gb.setTitle(rs.getString("title"));
					gb.setThumImg(rs.getString("thumImg"));
					gb.setOpenDate(rs.getString("openDate"));
					gb.setGenre(rs.getString("genre"));
					gb.setRecommend(rs.getInt("recommend"));
					galleryList.add(gb);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
				if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
				if(con!=null) {try {con.close();}catch(SQLException ex) {}}
			}
			return galleryList;
		}
		
		public GalleryBean updateGallery(GalleryBean gb){
			try {
				con = dc.getConnection();
				String sql =  "update movie set "
														+ "title=?, content=?,thumImg=?,"
														+ "genre=?,spectator=?,runtime=?, "
														+ "openDate=?,director=?,cast=?,grade=?,"
														+ "depTitle=?,content=?"
														+ "where num = ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, gb.getTitle());
				pstmt.setString(2,gb.getContent());
				pstmt.setString(3,gb.getThumImg());
				pstmt.setString(4,gb.getGenre());
				pstmt.setInt(5,gb.getSpectator());
				pstmt.setString(6, gb.getRuntime());
				pstmt.setString(7, gb.getOpenDate());
				pstmt.setString(8, gb.getDirector());
				pstmt.setString(9, gb.getCast());
				pstmt.setDouble(10, gb.getGrade());
				pstmt.setString(11, gb.getDepTitle());
				pstmt.setString(12, gb.getContent());
				pstmt.setInt(13, gb.getNum());
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) {try {rs.close();}catch(SQLException ex) {}}
				if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
				if(con!=null) {try {con.close();}catch(SQLException ex) {}}
			}
			return gb;		
		} 
		
		public void delGallery(int num){
			
			try {
				con = dc.getConnection();
				String sql =  "delete from movie where num =?";
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
		
		public int numChk(int num, String pass) {
			int chk = -1;
			try {
				con = dc.getConnection();
				String sql= "select pass from movie where num =?";
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
		
		public int recommendChk(String id, int num) {
			int chk = 0;
			try {
				con = dc.getConnection();
				String sql= "select id from recomendChk where id=? and boardNum =? and rocommendYN='y'";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,id);
				pstmt.setInt(2,num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					chk = 1;
				}else {
					chk = 0;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
				if(con!=null) {try {con.close();}catch(SQLException ex) {}}
			}
			return chk;
		}
		
		public void recommendChkInsert(int num, String id) {
			
			try {
				con = dc.getConnection();
				String sql = "insert  into recomendChk (id, boardNum, rocommendYN)  values (?, ?,'y')";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,id);
				pstmt.setInt(2,num);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
				if(con!=null) {try {con.close();}catch(SQLException ex) {}}
			}
		}
		
		public void recommend(int num) {

			try {
				con = dc.getConnection();
				String sql= "update movie set recommend = recommend+1 where num =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,num);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) {try {pstmt.close();}catch(SQLException ex) {}}
				if(con!=null) {try {con.close();}catch(SQLException ex) {}}
			}
		}
		
		
}
