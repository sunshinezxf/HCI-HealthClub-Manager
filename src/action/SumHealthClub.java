package action;

import service.ManagerService;

@SuppressWarnings("serial")
public class SumHealthClub extends BaseAction {
	private ManagerService managerService;

	public ManagerService getManagerService() {
		return managerService;
	}

	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	public String execute() throws Exception {
		int[][] card = managerService.cardSum();
		request.setAttribute("card", card);
		int[] coach = managerService.coachSum();
		request.setAttribute("coach", coach);
		double[] predict = managerService.predict();
		request.setAttribute("predict", predict);
		return "success";
	}
}
