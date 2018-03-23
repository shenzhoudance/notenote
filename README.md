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
```
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmj2i9fxrj30oo09kq3j.jpg)
