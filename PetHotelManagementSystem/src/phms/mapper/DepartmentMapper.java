package phms.mapper;

import java.util.List;

import phms.dto.DepartmentDto;

public interface DepartmentMapper {
	public DepartmentDto selectOneDepartment(String dName);

	public List<DepartmentDto> selectAllDepartment();

	public int insertDepartment(DepartmentDto department);

	public int updateDepartment(DepartmentDto department);

	public int deleteDepartment(String dName);
}
