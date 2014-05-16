package service.impl;

import service.ManagerService;
import model.Data;
import model.Manager;
import dao.ManagerDAO;

public class ManagerServiceImpl implements ManagerService {
	private ManagerDAO managerDAO;

	public ManagerDAO getManagerDAO() {
		return managerDAO;
	}

	public void setManagerDAO(ManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}

	public Manager login(String username, String password) {
		return managerDAO.login(username, password);
	}

	public Data[] genderSum() {
		return managerDAO.genderSum();
	}

	public Data[] addressSum() {
		return managerDAO.addressSum();
	}

	public Data[] ageSum() {
		return managerDAO.ageSum();
	}

	public int[][] cardSum() {
		return managerDAO.cardSum();
	}

	public int[] coachSum() {
		return managerDAO.coachSum();
	}

	public double[] predict() {
		return managerDAO.prediction();
	}

}
