student类：  
  id--学生学号(学号唯一，不可重复添加)  
  name--学生姓名  
  gender--学生性别  
  age--学生年龄  

方法(所有的文件保存读取均为YAML格式)：
  writeYmlFile(filename, list)----------将list中的数据写入地址为filename的文件中  
  readYmlFile(filename)-----------------从地址为filename的的文件中读信息并返回  
  init(filename)------------------------初始化，若本地已存在地址为filename的文件，则从文件中读取信息返回，若不存在则随机生成信息后保存至地址为filename的文件中并返回  
  printAll(filename)--------------------从地址为filename的的文件中读信息并打印全部    
  searchStuById(id, list)---------------根据学生学号找学生记录并返回对应下标  
  searchStuByName(name,list)------------根据学生姓名查找学生记录并返回对应下标  
  addStu(filename, list)----------------请求用户输入要添加的学生信息，查重，若不重复则保存至文件  
  modifyStuById(id, filename, list)-----根据学号查找并修改学生信息，修改保存至文件  
  deleteStuById(id, filename, list)-----根据学号查找并删除学生信息，删除保存至文件  
  deleteStuByName(name, filename, list)-根据姓名查找并删除学生信息，删除保存至文件  
  orderById(list)-----------------------根据学号排序并打印学生信息(排序不保存至文件)  
  orderByName(list)---------------------根据姓名排序并打印学生信息(排序不保存至文件)  
  orderByAge(list)----------------------根据年龄排序并打印学生信息(排序不保存至文件)  
