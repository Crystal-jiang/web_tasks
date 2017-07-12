require 'yaml'

class Student
  attr_accessor :stu_id
  attr_accessor :stu_name
  attr_accessor :stu_gender
  attr_accessor :stu_age

  def initialize(id, name, gender, age)
    @stu_id=id
    @stu_name=name
    @stu_gender=gender
    @stu_age=age
  end

  # 访问器方法
  def getId
    @stu_id
  end
  def getName
    @stu_name
  end
  def getGender
    @stu_gender
  end
  def getAge
    @stu_age
  end

  # 设置器方法
  def setId(value)
    @stu_id = value
  end
  def setName(value)
    @stu_name = value
  end
  def setGender(value)
    @stu_gender = value
  end
  def setAge(value)
    @stu_age = value
  end

  def showDetail
    puts "id:#{@stu_id} name:#{@stu_name} gender:#{@stu_gender} age:#{@stu_age}"
  end
end

# 写yml文件方法
def writeYmlFile(filename, list)
  t = 0
  hashlist = Array.new
  list.each_index do |t|
    hash = {'id' => list[t].getId, 'name' => list[t].getName,'gender' => list[t].getGender,'age' => list[t].getAge}
    hashlist[t] = hash
  end
  File.open(filename, "wb") {|f| YAML.dump(hashlist, f) }
end

# 读yml文件方法
def readYmlFile(filename)
  list = Array.new
  data = YAML.load_file(filename)
  data.each_index do |t|
    stu = Student.new(data[t]["id"],data[t]["name"],data[t]["gender"],data[t]["age"])
    list[t] = stu
  end
  return list
end

# 初始化
def init(filename)
  # 若文件不存在，则创建100个学生对象并保存进文件
  if(!(File::exists?( filename )))
    i = 0
    num = 100
    list = Array.new
    while i < num  do
          # 随机生成$num个学生信息，id递增
          name = [*('a'..'z'),*('A'..'Z')].shuffle[0..6].join
          gender = ["male","female"].sample
          age = rand(15..20)
          stu = Student.new(i+1,name,gender,age)
          list[i] = stu
          i+=1
    end
    # 将数据写入yml文件
    writeYmlFile(filename, list)
    return list
  else
    # 若student.yml已经存在，则读取文件信息存入内存中
    return readYmlFile(filename)
  end
end

#打印所有记录
def printAll(filename)
  list = readYmlFile(filename)
  list.each do |s|
    s.showDetail
  end
end

# 查找学生记录并返回下标(分别根据姓名和学号)
def searchStuByName(name,list)
  list.each_index do |t|
    if list[t].getName==name
      list[t].showDetail
      return t
    end
  end
  return nil
end
def searchStuById(id, list)
  list.each_index do |t|
    if list[t].getId==id
      list[t].showDetail
      return t
    end
  end
  return nil
end

# 添加学生记录并保存到文件
def addStu(filename, list)
  puts "请输入要插入学生的学号："
  newid = gets.chop.to_i
  #判断是否重复添加(学号不可重复)
  if searchStuById(newid,list)!=nil
    puts "该学生已存在，不能重复添加。"
    return list
  else
    puts "请输入要插入学生的姓名："
    newname = gets.chop
    puts "请输入要插入学生的性别(male/female)："
    newgender = gets.chop
    puts "请输入要插入学生的年龄(15-20)："
    newage = gets.chop.to_i
    stu = Student.new(newid, newname, newgender, newage)
    list.push(stu)
    writeYmlFile(filename, list)
    puts "添加成功。"
    return list
  end
end

# 修改学生记录并保存到文件(根据学号)
def modifyStuById(id, filename, list)
  index = searchStuById(id, list)
  if index!=nil
    puts "请输入新的姓名："
    newname = gets.chop
    puts "请输入新的性别(male/female)："
    newgender = gets.chop
    puts "请输入新的年龄(15-20)："
    newage = gets.chop.to_i
    list[index].setName(newname);
    list[index].setGender(newgender);
    list[index].setAge(newage);
    writeYmlFile(filename, list)
    print "已修改为："
    list[index].showDetail
    puts "修改成功。"
  else
    puts "不存在该学生。"
  end
end

# 删除学生记录并保存到文件(分别根据姓名和学号)
def deleteStuById(id, filename, list)
  index = searchStuById(id, list)
  if index!=nil
    puts "是否要删除此学生？[y/n]"
    val = gets.chop
    if val=="y"
      list.delete_at(index)
      writeYmlFile(filename, list)
      puts "删除成功。"
    elsif val=="n"
      puts "已取消删除。"
    else
      puts "输入错误。"
    end
  end
end
def deleteStuByName(name, filename, list)
  index = searchStuByName(name, list)
  if index!=nil
    puts "是否要删除此学生？[y/n]"
    val = gets.chop
    if val=="y"
      list.delete_at(index)
      writeYmlFile(filename, list)
      puts "删除成功。"
    elsif val=="n"
      puts "已取消删除。"
    else
      puts "输入错误。"
    end
  else
    puts "不存在该学生。"
  end
end

# 排序输出(分别根据学号、年龄、姓名)
def orderById(list)
  list.each_index do |i|
    list.each_index do |j|
      if list[i].getId.to_i < list[j].getId.to_i
        list[i], list[j] = list[j], list[i]
      end
    end
  end
  list.each do |s|
    s.showDetail
  end
end
def orderByName(list)
  list.each_index do |i|
    list.each_index do |j|
      if list[i].getName < list[j].getName
        list[i], list[j] = list[j], list[i]
      end
    end
  end
  list.each do |s|
    s.showDetail
  end
end
def orderByAge(list)
  list.each_index do |i|
    list.each_index do |j|
      if list[i].getAge.to_i < list[j].getAge.to_i
        list[i], list[j] = list[j], list[i]
      end
    end
  end
  list.each do |s|
    s.showDetail
  end
end


filename = "student.yml"
puts "请选择功能：1.插入 2.查询 3.修改 4.删除 5.排序输出 0.退出"
c1 = gets.chop
while c1!="0"
  list = init(filename)#每进行一次修改要重新刷新内存中的数据
  case c1
  when "1"
    addStu(filename, list)
  when "2"
    puts "请选择根据什么查询：1.学号 2.姓名"
    case gets.chop
    when "1"
      puts "请输入要查询学生的学号："
      id = gets.chop.to_i
      searchStuById(id,list)
    when "2"
      puts "请输入要查询学生的姓名："
      name = gets.chop
      searchStuByName(name,list)
    else
      puts "输入错误。"
    end
  when "3"
    puts "请输入要修改学生的学号："
    id = gets.chop.to_i
    modifyStuById(id, filename, list)
  when "4"
    puts "请选择根据什么删除：1.学号 2.姓名"
    case gets.chop
    when "1"
      puts "请输入要删除学生的学号："
      id = gets.chop.to_i
      deleteStuById(id, filename, list)
    when "2"
      puts "请输入要删除学生的姓名："
      name = gets.chop
      deleteStuByName(name,filename, list)
    else
      puts "输入错误。"
    end
  when "5"
    puts "请选择根据什么排序：1.学号 2.姓名 3.年龄"
    case gets.chop
    when "1"
      orderById(list)
    when "2"
      orderByName(list)
    when "3"
      orderByAge(list)
    else
      puts "输入错误。"
    end
  else
    puts "输入错误，请重新输入。"
  end

  puts "请选择功能：1.插入 2.查询 3.修改 4.删除 5.排序输出 0.退出"
  c1 = gets.chop
end
