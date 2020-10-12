package reply;
import java.sql.Timestamp;

public class ReplyBean {
	
	private String id;
	private int cmtNum;
	private String cmtCnt ;
	private int depthCmt;
	private int boardNum;
	private int inxCmt;
	private Timestamp date;
	private int cmtSubNum;
	private int contNum;
	private String isDel;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCmtNum() {
		return cmtNum;
	}
	public void setCmtNum(int cmtNum) {
		this.cmtNum = cmtNum;
	}
	public String getCmtCnt() {
		return cmtCnt;
	}
	public void setCmtCnt(String cmtCnt) {
		this.cmtCnt = cmtCnt;
	}
	public int getDepthCmt() {
		return depthCmt;
	}
	public void setDepthCmt(int depthCmt) {
		this.depthCmt = depthCmt;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getInxCmt() {
		return inxCmt;
	}
	public void setInxCmt(int inxCmt) {
		this.inxCmt = inxCmt;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getCmtSubNum() {
		return cmtSubNum;
	}
	public void setCmtSubNum(int cmtSubNum) {
		this.cmtSubNum = cmtSubNum;
	}

	public int getContNum() {
		return contNum;
	}
	public void setContNum(int contNum) {
		this.contNum = contNum;
	}

	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
}
