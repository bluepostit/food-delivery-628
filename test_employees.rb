require_relative 'app/repositories/employee_repository'

employee_csv = 'data/employees.csv'
repo = EmployeeRepository.new(employee_csv)
p repo
