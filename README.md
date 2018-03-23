# 才华横溢 notenote 案例 11

```
cd workspace
rail new notenote
cd notenote
git int
git status
git add .
git commit -m "initial commit"
rails server
http://localhost:3000/
```
![image](https://ws2.sinaimg.cn/large/006tKfTcly1fplskuqtwtj30ym0r8tqx.jpg)

```
git checkout -b welcome
rails g controller Welcome index
rails server
---
Rails.application.routes.draw do
  root 'welcome#index'
end
---
git status
git add .
git commit -m "add welcome & index"
git push origin welcome
```
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmj2i9fxrj30oo09kq3j.jpg)
![image](https://ws2.sinaimg.cn/large/006tKfTcgy1fpmj4i60xtj31ao0vgahi.jpg)

# 上传效果图片：
![image](https://ws1.sinaimg.cn/large/006tKfTcgy1fpmj76rc5wj31kw0ksdk5.jpg)
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmj7126ncj31820mijuc.jpg)
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmj6uysyzj319s0p279a.jpg)
![image](https://ws3.sinaimg.cn/large/006tKfTcgy1fpmj6o1ycdj318q0o2n2d.jpg)
