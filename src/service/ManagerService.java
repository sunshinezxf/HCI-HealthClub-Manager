package service;

import model.Data;
import model.Manager;

public interface ManagerService {
	public Manager login(String username, String password);

	public Data[] genderSum();

	public Data[] addressSum();

	public Data[] ageSum();

	public int[][] cardSum();

	public int[] coachSum();

	public double[] predict();
}
