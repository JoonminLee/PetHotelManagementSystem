package phms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phms.dto.EmployeeDto;
import phms.mapper.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;

	public EmployeeDto selectOneEmp(int eNum) {
		return employeeMapper.selectOneEmp(eNum);
	}

	public List<EmployeeDto> selectAllEmp() {
		return employeeMapper.selectAllEmp();
	}

	public int insertEmp(EmployeeDto employee) {
		return employeeMapper.insertEmp(employee);
	}

	public int updateEmp(EmployeeDto employee) {
		return employeeMapper.updateEmp(employee);
	}
	
	public int deleteEmp(int eNum) {
		return employeeMapper.deleteEmp(eNum);
	}

}
