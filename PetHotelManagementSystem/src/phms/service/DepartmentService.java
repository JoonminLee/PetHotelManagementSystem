package phms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import phms.dto.DepartmentDto;
import phms.mapper.DepartmentMapper;
@Service
public class DepartmentService {
	@Autowired
	DepartmentMapper departmentMapper;
	
	public DepartmentDto selectOneDepartment(String dName) {
		return departmentMapper.selectOneDepartment(dName);
	}
	public List<DepartmentDto> selectAllDepartment() {
		return departmentMapper.selectAllDepartment();
	}

	public int insertDepartment(DepartmentDto department) {
		return departmentMapper.insertDepartment(department);
	}

	public int updateDepartment(DepartmentDto department) {
		return departmentMapper.updateDepartment(department);
	}

	public int deleteDepartment(String dName) {
		return departmentMapper.deleteDepartment(dName);
	}
}
