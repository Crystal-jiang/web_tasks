# coding=UTF-8

def new(filename):
  fh = open(filename, 'w')
  fh.write("")
  fh.close()
def add(filename, contents):
  fh = open(filename, 'a')
  fh.write(contents)
  fh.close()

class Writer():

    def __init__(self,title_list,url_list,content_list):
        self.title_list = title_list
        self.url_list = url_list
        self.content_list = content_list

    def write(self):
        # 初始化页面
        new('output.html')

        s = '<html><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>\n'
        add('output.html', s.encode('utf-8'))
        add('output.html', '<body style="margin:50px">'.encode('utf-8'))
        for i in range(len(self.title_list)):
            add('output.html', '<div style="margin-top:20px; padding:20px; border:2px solid #9BCD9B">\n')
            # 乱码处理
            if isinstance(self.title_list[i], unicode):
                add('output.html',
                    '<a href="' + self.url_list[i] + '" style="color:#3ddb9f; text-decoration: none;">'.encode('utf-8'))
                add('output.html', "<h3>".encode('utf-8'))
                add('output.html', self.title_list[i].encode('utf-8'))
                add('output.html', "</h3></a>".encode('utf-8'))
                add('output.html', "\n")
            if isinstance(self.content_list[i], unicode):
                add('output.html', "<p>".encode('utf-8'))
                add('output.html', self.content_list[i].encode('utf-8'))
                add('output.html', "</p>".encode('utf-8'))
                add('output.html', "\n")
            add('output.html', '</div>\n')

        s = "</body></html>"
        add('output.html', s.encode('utf-8'))
        print '已输出成html网页：output.html'

