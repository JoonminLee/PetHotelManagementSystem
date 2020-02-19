package phms.mapper;

import java.util.List;

import phms.dto.EmployeeDto;

public interface EmployeeMapper {
	public EmployeeDto selectOneEmp(int eNum);
	
	public List<EmployeeDto> selectAllEmp();
	
	public int insertEmp(EmployeeDto employee);
	
	public int updateEmp(EmployeeDto employee);
	
	public int deleteEmp(int eNum);
}
