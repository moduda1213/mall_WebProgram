package vo;

public class Users {
	private String usersId; //���̵� ,�̸���
	private String usersPw; //���
	private String usersCheck; //����Ȯ���� ���� ���θ� �ƴ� �ܾ�
	private String usersName; // ���� �̸�
	private String usersWithdrawal;
	
	public String getUsersId() {
		return usersId;
	}
	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}
	public String getUsersPw() {
		return usersPw;
	}
	public void setUsersPw(String usersPw) {
		this.usersPw = usersPw;
	}
	public String getUsersCheck() {
		return usersCheck;
	}
	public void setUsersCheck(String usersCheck) {
		this.usersCheck = usersCheck;
	}
	public String getUsersName() {
		return usersName;
	}
	public void setUsersName(String usersName) {
		this.usersName = usersName;
	}
	public String getUsersWithdrawal() {
		return usersWithdrawal;
	}
	public void setUsersWithdrawal(String user_withdrawal) {
		this.usersWithdrawal = user_withdrawal;
	}
	
}
