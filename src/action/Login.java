package action;

import model.Manager;
import service.ManagerService;

@SuppressWarnings("serial")
public class Login extends BaseAction{
	private String username;
	private String password;
	private ManagerService managerService;
	
	public ManagerService getManagerService() {
		return managerService;
	}

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	public String execute() throws Exception {
		String login_username = username;
		String login_password = password;
		Manager m = managerService.login(login_username, login_password);
		if (m==null) {
			return "failure";
			} else {
			return "success";
		}
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
