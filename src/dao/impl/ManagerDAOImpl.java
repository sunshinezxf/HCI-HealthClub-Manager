package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Data;
import model.Manager;
import dao.BaseDAO;
import dao.ManagerDAO;

public class ManagerDAOImpl implements ManagerDAO {
	BaseDAO baseDAO;

	public BaseDAO getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(BaseDAO baseDAO) {
		this.baseDAO = baseDAO;
	}

	public Manager login(String username, String password) {
		Connection connection = baseDAO.getConnection();
		String sql = "select * from manager where username = ? and password = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		System.out.println(username);
		System.out.println(password);
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			rs.beforeFirst();
			if (rs.next()) {
				Manager manager = new Manager();
				int m_id = rs.getInt(1);
				manager.setM_id(m_id);
				manager.setUsername(username);
				manager.setPassword(password);
				return manager;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closeResultSet(rs);
			baseDAO.closePreparedStatement(ps);
			baseDAO.closeConnection(connection);
		}
		return null;
	}

	public Data[] genderSum() {
		Data[] sum = new Data[2];
		Connection connection = baseDAO.getConnection();
		String sql_1 = "select count(*) from vip where gender = 'male'";
		String sql_2 = "select count(*) from vip where gender = 'female'";
		PreparedStatement ps_1 = null;
		PreparedStatement ps_2 = null;
		ResultSet rs_1 = null;
		ResultSet rs_2 = null;
		try {
			ps_1 = connection.prepareStatement(sql_1);
			ps_2 = connection.prepareStatement(sql_2);
			rs_1 = ps_1.executeQuery();
			rs_1.beforeFirst();
			rs_1.next();
			int t1 = rs_1.getInt(1);
			Data d1 = new Data("Male", t1);
			rs_2 = ps_2.executeQuery();
			rs_2.beforeFirst();
			rs_2.next();
			int t2 = rs_2.getInt(1);
			Data d2 = new Data("Female", t2);
			sum[0] = d1;
			sum[1] = d2;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closeResultSet(rs_1);
			baseDAO.closeResultSet(rs_2);
			baseDAO.closePreparedStatement(ps_1);
			baseDAO.closePreparedStatement(ps_2);
			baseDAO.closeConnection(connection);
		}
		return sum;
	}

	public Data[] addressSum() {
		Data[] sum = new Data[3];
		sum[0] = new Data("China");
		sum[1] = new Data("US");
		sum[2] = new Data("Korea");
		Connection connection = baseDAO.getConnection();
		String sql = "select count(*) from vip where address = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement(sql);
			for (int i = 0; i < 3; i++) {
				ps.setString(1, sum[i].getName());
				rs = ps.executeQuery();
				rs.beforeFirst();
				rs.next();
				sum[i].setData(rs.getDouble(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closeResultSet(rs);
			baseDAO.closePreparedStatement(ps);
			baseDAO.closeConnection(connection);
		}
		return sum;
	}

	public Data[] ageSum() {
		Connection connection = baseDAO.getConnection();
		Data[] sum = new Data[5];
		int i = 10;
		String sql = "select count(*) from vip where age >= ? and age < ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement(sql);
			for (int j = 0; j < 5; j++) {
				ps.setInt(1, i);
				i += 10;
				ps.setInt(2, i);
				rs = ps.executeQuery();
				rs.beforeFirst();
				rs.next();
				Data data = new Data();
				data.setName((i - 10) + "~" + i);
				data.setData(rs.getDouble(1));
				sum[j] = data;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sum;
	}

	public int[][] cardSum() {
		Connection connection = baseDAO.getConnection();
		int[][] data = new int[3][2];
		String sql_1 = "select max(c_id) from card";
		String sql_2 = "select count(*) from card";
		String sql_3 = "select count(*) from card where activated = 1";
		String sql_4 = "select count(*) from card where payed = 1";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement(sql_1);
			rs = ps.executeQuery();
			rs.beforeFirst();
			rs.next();
			int max = rs.getInt(1);
			ps = connection.prepareStatement(sql_2);
			rs = ps.executeQuery();
			rs.beforeFirst();
			rs.next();
			int current = rs.getInt(1);
			data[0][0] = current;
			data[0][1] = max - current;
			ps = connection.prepareStatement(sql_3);
			rs = ps.executeQuery();
			rs.beforeFirst();
			rs.next();
			int activated = rs.getInt(1);
			data[1][0] = activated;
			data[1][1] = current - activated;
			ps = connection.prepareStatement(sql_4);
			rs = ps.executeQuery();
			rs.beforeFirst();
			rs.next();
			int payed = rs.getInt(1);
			data[2][0] = payed;
			data[2][1] = current - payed;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closeResultSet(rs);
			baseDAO.closePreparedStatement(ps);
			baseDAO.closeConnection(connection);
		}
		return data;
	}

	public int[] coachSum() {
		int[] data = new int[3];
		Connection connection = baseDAO.getConnection();
		String sql = "select count(*) from activity where co_no = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement(sql);
			int i = 10000;
			for (int j = 0; j < 3; j++) {
				ps.setString(1, (i + j) + "");
				rs = ps.executeQuery();
				rs.beforeFirst();
				if (rs.next()) {
					data[j] = rs.getInt(1);
				} else {
					data[j] = 0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			baseDAO.closeResultSet(rs);
			baseDAO.closePreparedStatement(ps);
			baseDAO.closeConnection(connection);
		}
		return data;
	}

	public double[] prediction() {
		double[] data = new double[2];
		Connection connection = baseDAO.getConnection();
		String sql_1 = "select count(*) from vip";
		String sql_2 = "select count(*) from activity";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement(sql_1);
			rs = ps.executeQuery();
			rs.beforeFirst();
			rs.next();
			data[0] = rs.getDouble(1) / 6;
			ps = connection.prepareStatement(sql_2);
			rs = ps.executeQuery();
			rs.beforeFirst();
			rs.next();
			data[1] = rs.getDouble(1) / 6;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
}
