# coding=UTF-8
import requests
import writer
from bs4 import BeautifulSoup

# 爬取简书排行榜
base_url = 'http://jianshu.com'
add_url = '/recommendations/notes'
num = 0

while(True):
    try:
        first_page = requests.request('get', base_url+ add_url).content
        soup = BeautifulSoup(first_page, "lxml")
        # 爬取标题、链接和内容
        title_list = [k.get_text() for k in soup.select(".title")]
        url_list = ['http://www.jianshu.com/' + k['href'] for k in soup.select(".title")]
        content_list = [j.get_text() for j in soup.select(".abstract")]

        # 输出成html文件
        writer = writer.Writer(title_list, url_list, content_list)
        writer.write()

        try:
            # print(soup.select(".ladda-button"))
            add_url = soup.select(".ladda-button")[-1].get("data-url")
        except BaseException as err :
            print err
            break
    except Exception as e:
        print(e)
        break