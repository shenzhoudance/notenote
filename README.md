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

```
git checkout -b gem
---
https://rubygems.org/
gem 'haml', '~> 5.0', '>= 5.0.4'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'simple_form', '~> 3.5', '>= 3.5.1'
bundle install
---
app/views/welcome/index.html.haml
---
%h1 欢迎来到才华横溢的世界
app/assets/stylesheets/application.css.scss
---
@import "bootstrap-sprockets";
@import "bootstrap";
---
app/assets/javascripts/application.js
---
//= require bootstrap-sprockets
//= require turbolinks
---
rails generate simple_form:install --bootstrap
rails server
---
git status
git add .
git commit -m "add bootstrap & edit welcome"
git push origin gem
```
![image](https://ws1.sinaimg.cn/large/006tKfTcgy1fpmjit8mt9j31am0o6n25.jpg)
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmjn37s5oj31is11q7e0.jpg)
![image](https://ws1.sinaimg.cn/large/006tKfTcgy1fpmjklzxi6j30kc078dgf.jpg)
```
git checkout -b model_note
rails g model Note title:string content:text
rake db:migrate
git status
git add .
git commit -m "add generate note model"
git push origin model_note
```
![image](https://ws2.sinaimg.cn/large/006tKfTcgy1fpmjvvf6vrj31ga0zo46y.jpg)
![image](https://ws1.sinaimg.cn/large/006tKfTcgy1fpmjwuz61ij31gc0gatc9.jpg)

```
rails g contreller Notes
---
config/routes.rb
---
Rails.application.routes.draw do
  root 'welcome#index'
  resources :notes
end
---
app/controllers/notes_controller.rb
---
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def note_params
  end

  def find_note
  end
end
---
rake routes
```
![image](https://ws2.sinaimg.cn/large/006tKfTcgy1fpmk31p8lkj319e0ckmzr.jpg)
![image](https://ws2.sinaimg.cn/large/006tKfTcgy1fpmkc8qtxmj319a0lm0vy.jpg)
![image](https://ws3.sinaimg.cn/large/006tKfTcgy1fpmkcevx94j311a0kmgqh.jpg)

```
git status
git add .
git commit -m "add root & controller note"
git push origin model_note
```
![image](https://ws2.sinaimg.cn/large/006tKfTcgy1fpmkezzm8vj31e00twjyf.jpg)

```
app/views/notes/_form.html.haml
---
= simple_form_for @note do |f|
 = f.input :title
 = f.input :content
 = f.button :submit
---
app/views/notes/edit.html.haml
app/views/notes/index.html.haml
app/views/notes/new.html.haml
---
%h1 才华横溢的领域

= render 'form'
---
app/views/notes/show.html.haml

---
rails server
http://localhost:3000/notes/new
```
![image](https://ws3.sinaimg.cn/large/006tKfTcgy1fpmkl00avpj30xw07maau.jpg)

```
class NotesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new（notes_params）
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:title, :content)
  end

  def find_note
  end
end
```
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpml8we4otj31kw0d040g.jpg)
![image](https://ws1.sinaimg.cn/large/006tKfTcgy1fpmqkbqakij31b40ewwg6.jpg)
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmqk3cus1j31840fedi7.jpg)
```
app/controllers/notes_controller.rb
---
class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :deestroy]

  def index
    @notes = Note.all.order("created_at DESC")
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
    redirect_to @note
    else
    render 'new'
   end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:title, :content)
  end

  def find_note
    @note = Note.find(params[:id])
  end
end
---
app/views/notes/_form.html.haml
---
= simple_form_for @note do |f|
 = f.input :title
 = f.input :content
 = f.button :submit
---
app/views/notes/edit.html.haml
---
%h1 Edit Note

= render 'form'
---
app/views/notes/index.html.haml
---
- @notes.each do |note|
  %h2= link_to note.title, note
  %p= time_ago_in_words(note.created_at)
---
app/views/notes/new.html.haml
---
%h1 New Note

= render 'form'
---
app/views/notes/show.html.haml
---
%h1= @note.title
%p= @note.content

=link_to "home", root_path(@note)
=link_to "edit", edit_note_path(@note)
=link_to "all notes", notes_path
---
```
![image](https://ws1.sinaimg.cn/large/006tKfTcgy1fpmrifwdbvj30sm0fcjs1.jpg)
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmrin2peyj30pa09sgm2.jpg)
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmritpi53j30vu0bcwf0.jpg)

```
git status
git add .
git commit -m "add views"
git push origin model_note
```
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmrldbnbdj31dw0mcgrb.jpg)
