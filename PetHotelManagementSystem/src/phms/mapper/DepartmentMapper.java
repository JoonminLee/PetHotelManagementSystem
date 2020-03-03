package phms.mapper;

import java.util.List;

import phms.dto.DepartmentDto;

public interface DepartmentMapper {
	public DepartmentDto selectOneDepartment(int dNum);

	public List<DepartmentDto> selectAllDepartment();

	public int insertDepartment(DepartmentDto department);

	public int updateDepartment(DepartmentDto department);

	public int deleteDepartment(int dNum);
}
