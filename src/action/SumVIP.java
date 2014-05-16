package action;

import model.Data;
import service.ManagerService;

@SuppressWarnings("serial")
public class SumVIP extends BaseAction {
	private ManagerService managerService;

	public ManagerService getManagerService() {
		return managerService;
	}

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	public String execute() throws Exception {
		Data[] gender = managerService.genderSum();
		request.setAttribute("gender", gender);
		Data[] address = managerService.addressSum();
		request.setAttribute("address", address);
		Data[] age = managerService.ageSum();
		request.setAttribute("age", age);
		return "success";
	}
}
