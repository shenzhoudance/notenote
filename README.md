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

```
app/controllers/notes_controller.rb
---
class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]

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
    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
  		@note.destroy
  		redirect_to notes_path
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
= link_to "cancel", note_path
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
= link_to "cancel", note_path
---
app/views/notes/show.html.haml
---
%h1= @note.title
%p= @note.content

=link_to "home", root_path(@note)
=link_to "edit", edit_note_path(@note)
=link_to "all notes", notes_path

=link_to "Delete", note_path(@note), method: :delete, data: { confirm: "Are you sure?" }

---
```
```
https://getbootstrap.com/docs/4.0/components/buttons/
http://localhost:3000/notes
---
rails server

git status
git add .
git commit -m "add edit & destroy notes"
git push origin model_note
```
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmskhfc9ej31bu0jin25.jpg)
![image](https://ws3.sinaimg.cn/large/006tKfTcgy1fpmsiy0r8oj30ou0hi753.jpg)
![image](https://ws1.sinaimg.cn/large/006tKfTcgy1fpmsj4bbunj30us0fw3zg.jpg)
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmsjafk5nj30pk0acwf7.jpg)

```
git checkout -b devise
gem 'devise', '~> 4.4', '>= 4.4.3'
bundle install
---
rails generate devise:install
rails g devise:views
rails g devise User
rake db:migrate
---
rails server
http://localhost:3000/users/sign_up
---
```
![image](https://ws2.sinaimg.cn/large/006tKfTcgy1fpmt5ajxdvj316g0kkmyq.jpg)

```
rails g migration add_user_id_to_notes user_id:integer
rake db:migrate
```
```
rails c
@note = Note.first
@note = Note.last
exit
```
![image](https://ws1.sinaimg.cn/large/006tKfTcgy1fpmtqk6u51j31jw0i4448.jpg)
```
app/models/note.rb
---
class Note < ApplicationRecord
  belongs_to :user
end
---
app/models/user.rb
---
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :notes
end
---
app/controllers/notes_controller.rb
---
def new
  @note = current_user.notes.build
end

def create
  @note = current_user.notes.build(note_params)
```
```
git status
git add .
git commit -m "add user belongs"
git push origin devise
```
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmtuxj8y4j31cc0py7ag.jpg)

```
app/controllers/notes_controller.rb
---
def index
  @notes = Note.where(user_id: current_user)
end
---
rails c
2.3.1 :001 > @note = Note.first
2.3.1 :002 > @note.user_id = 1
2.3.1 :003 > @note.save
2.3.1 :004 > exit
---
```
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmuf34cm1j30om090aau.jpg)
![image](https://ws1.sinaimg.cn/large/006tKfTcgy1fpmufuak54j31ji0dk784.jpg)
![image](https://ws1.sinaimg.cn/large/006tKfTcgy1fpmuemhdbbj30te0f675d.jpg)
```
git status
git add .
git commit -m "change index to show only current users notes"
```
```
config/routes.rb
---
Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :notes
  authenticated :user do
    root 'notes#index', as: "authenticated_root"
  end
end
---
app/controllers/notes_controller.rb
---
before_action :find_note, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!
```
# 如果用户没有登录，就需要放回登录页面；
```
git status
git add .
git commit -m "change root based on if user_signed_in?"
```
![image](https://ws3.sinaimg.cn/large/006tKfTcgy1fpmv79zvooj31go0mwjx0.jpg)

```
git checkout -b scss
http://necolas.github.io/normalize.css/
app/assets/stylesheets/normalize.css.scss
---
/*! normalize.css v3.0.2 | MIT License | git.io/normalize */

/**
 * 1. Set default font family to sans-serif.
 * 2. Prevent iOS text size adjust after orientation change, without disabling
 *    user zoom.
 */

html {
  font-family: sans-serif; /* 1 */
  -ms-text-size-adjust: 100%; /* 2 */
  -webkit-text-size-adjust: 100%; /* 2 */
}

/**
 * Remove default margin.
 */

body {
  margin: 0;
}

/* HTML5 display definitions
   ========================================================================== */

/**
 * Correct `block` display not defined for any HTML5 element in IE 8/9.
 * Correct `block` display not defined for `details` or `summary` in IE 10/11
 * and Firefox.
 * Correct `block` display not defined for `main` in IE 11.
 */

article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
main,
menu,
nav,
section,
summary {
  display: block;
}

/**
 * 1. Correct `inline-block` display not defined in IE 8/9.
 * 2. Normalize vertical alignment of `progress` in Chrome, Firefox, and Opera.
 */

audio,
canvas,
progress,
video {
  display: inline-block; /* 1 */
  vertical-align: baseline; /* 2 */
}

/**
 * Prevent modern browsers from displaying `audio` without controls.
 * Remove excess height in iOS 5 devices.
 */

audio:not([controls]) {
  display: none;
  height: 0;
}

/**
 * Address `[hidden]` styling not present in IE 8/9/10.
 * Hide the `template` element in IE 8/9/11, Safari, and Firefox < 22.
 */

[hidden],
template {
  display: none;
}

/* Links
   ========================================================================== */

/**
 * Remove the gray background color from active links in IE 10.
 */

a {
  background-color: transparent;
}

/**
 * Improve readability when focused and also mouse hovered in all browsers.
 */

a:active,
a:hover {
  outline: 0;
}

/* Text-level semantics
   ========================================================================== */

/**
 * Address styling not present in IE 8/9/10/11, Safari, and Chrome.
 */

abbr[title] {
  border-bottom: 1px dotted;
}

/**
 * Address style set to `bolder` in Firefox 4+, Safari, and Chrome.
 */

b,
strong {
  font-weight: bold;
}

/**
 * Address styling not present in Safari and Chrome.
 */

dfn {
  font-style: italic;
}

/**
 * Address variable `h1` font-size and margin within `section` and `article`
 * contexts in Firefox 4+, Safari, and Chrome.
 */

h1 {
  font-size: 2em;
  margin: 0.67em 0;
}

/**
 * Address styling not present in IE 8/9.
 */

mark {
  background: #ff0;
  color: #000;
}

/**
 * Address inconsistent and variable font size in all browsers.
 */

small {
  font-size: 80%;
}

/**
 * Prevent `sub` and `sup` affecting `line-height` in all browsers.
 */

sub,
sup {
  font-size: 75%;
  line-height: 0;
  position: relative;
  vertical-align: baseline;
}

sup {
  top: -0.5em;
}

sub {
  bottom: -0.25em;
}

/* Embedded content
   ========================================================================== */

/**
 * Remove border when inside `a` element in IE 8/9/10.
 */

img {
  border: 0;
}

/**
 * Correct overflow not hidden in IE 9/10/11.
 */

svg:not(:root) {
  overflow: hidden;
}

/* Grouping content
   ========================================================================== */

/**
 * Address margin not present in IE 8/9 and Safari.
 */

figure {
  margin: 1em 40px;
}

/**
 * Address differences between Firefox and other browsers.
 */

hr {
  -moz-box-sizing: content-box;
  box-sizing: content-box;
  height: 0;
}

/**
 * Contain overflow in all browsers.
 */

pre {
  overflow: auto;
}

/**
 * Address odd `em`-unit font size rendering in all browsers.
 */

code,
kbd,
pre,
samp {
  font-family: monospace, monospace;
  font-size: 1em;
}

/* Forms
   ========================================================================== */

/**
 * Known limitation: by default, Chrome and Safari on OS X allow very limited
 * styling of `select`, unless a `border` property is set.
 */

/**
 * 1. Correct color not being inherited.
 *    Known issue: affects color of disabled elements.
 * 2. Correct font properties not being inherited.
 * 3. Address margins set differently in Firefox 4+, Safari, and Chrome.
 */

button,
input,
optgroup,
select,
textarea {
  color: inherit; /* 1 */
  font: inherit; /* 2 */
  margin: 0; /* 3 */
}

/**
 * Address `overflow` set to `hidden` in IE 8/9/10/11.
 */

button {
  overflow: visible;
}

/**
 * Address inconsistent `text-transform` inheritance for `button` and `select`.
 * All other form control elements do not inherit `text-transform` values.
 * Correct `button` style inheritance in Firefox, IE 8/9/10/11, and Opera.
 * Correct `select` style inheritance in Firefox.
 */

button,
select {
  text-transform: none;
}

/**
 * 1. Avoid the WebKit bug in Android 4.0.* where (2) destroys native `audio`
 *    and `video` controls.
 * 2. Correct inability to style clickable `input` types in iOS.
 * 3. Improve usability and consistency of cursor style between image-type
 *    `input` and others.
 */

button,
html input[type="button"], /* 1 */
input[type="reset"],
input[type="submit"] {
  -webkit-appearance: button; /* 2 */
  cursor: pointer; /* 3 */
}

/**
 * Re-set default cursor for disabled elements.
 */

button[disabled],
html input[disabled] {
  cursor: default;
}

/**
 * Remove inner padding and border in Firefox 4+.
 */

button::-moz-focus-inner,
input::-moz-focus-inner {
  border: 0;
  padding: 0;
}

/**
 * Address Firefox 4+ setting `line-height` on `input` using `!important` in
 * the UA stylesheet.
 */

input {
  line-height: normal;
}

/**
 * It's recommended that you don't attempt to style these elements.
 * Firefox's implementation doesn't respect box-sizing, padding, or width.
 *
 * 1. Address box sizing set to `content-box` in IE 8/9/10.
 * 2. Remove excess padding in IE 8/9/10.
 */

input[type="checkbox"],
input[type="radio"] {
  box-sizing: border-box; /* 1 */
  padding: 0; /* 2 */
}

/**
 * Fix the cursor style for Chrome's increment/decrement buttons. For certain
 * `font-size` values of the `input`, it causes the cursor style of the
 * decrement button to change from `default` to `text`.
 */

input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
  height: auto;
}

/**
 * 1. Address `appearance` set to `searchfield` in Safari and Chrome.
 * 2. Address `box-sizing` set to `border-box` in Safari and Chrome
 *    (include `-moz` to future-proof).
 */

input[type="search"] {
  -webkit-appearance: textfield; /* 1 */
  -moz-box-sizing: content-box;
  -webkit-box-sizing: content-box; /* 2 */
  box-sizing: content-box;
}

/**
 * Remove inner padding and search cancel button in Safari and Chrome on OS X.
 * Safari (but not Chrome) clips the cancel button when the search input has
 * padding (and `textfield` appearance).
 */

input[type="search"]::-webkit-search-cancel-button,
input[type="search"]::-webkit-search-decoration {
  -webkit-appearance: none;
}

/**
 * Define consistent border, margin, and padding.
 */

fieldset {
  border: 1px solid #c0c0c0;
  margin: 0 2px;
  padding: 0.35em 0.625em 0.75em;
}

/**
 * 1. Correct `color` not being inherited in IE 8/9/10/11.
 * 2. Remove padding so people aren't caught out if they zero out fieldsets.
 */

legend {
  border: 0; /* 1 */
  padding: 0; /* 2 */
}

/**
 * Remove default vertical scrollbar in IE 8/9/10/11.
 */

textarea {
  overflow: auto;
}

/**
 * Don't inherit the `font-weight` (applied by a rule above).
 * NOTE: the default cannot safely be changed in Chrome and Safari on OS X.
 */

optgroup {
  font-weight: bold;
}

/* Tables
   ========================================================================== */

/**
 * Remove most spacing between table cells.
 */

table {
  border-collapse: collapse;
  border-spacing: 0;
}

td,
th {
  padding: 0;
}
```
```
app/assets/stylesheets/global.css.scss
---
$dark_gray: #2B2E2E;
$light_gray: #C0C1C1;
$green: #33CD99;

@mixin bold_font {
	font-family: "Brandon Grotesque","Helvetica Neue", Helvetica, sans-serif;
	font-weight: bold;
	text-transform: uppercase;
}

* {
	box-sizing: border-box;
	-webkit-font-smoothing: antialiased;
}

body {
	padding-top: 4.5rem;
	font-family: "Open Sans", "Helvetica Neue", Helvetica, sans-serif;
}

.wrapper {
	width: 80%;
	margin: 0 auto;
}

.wrapper_with_padding {
	width: 80%;
	margin: 0 auto;
	padding: 3.5rem 0;
}

.clearfix:before, .clearfix:after {
	content: " ";
	display: table;
}

.clearfix:after {
	clear: both;
}

button, .button {
	border: none;
	outline: none;
	background: $green;
	padding: 1rem 3.5rem;
	border-radius: 2rem;
	a {
		color: white;
		text-decoration: none;
	}
}

.button {
	color: white;
	margin: 2rem 0;
}

a {
	color: $green;
	text-decoration: none;
	&:hover {
		color: $dark_gray;
	}
}

header {
	background: $dark_gray;
	position: fixed;
	top: 0;
	width: 100%;
	padding: 1.75rem 0;
	border-bottom: 7px solid $green;
	.header_inner {
		width: 90%;
		margin: 0 auto;
		#logo {
			display: inline-block;
			width: 10rem;
			float: left;
		}
		nav {
			float: right;
			a {
				text-decoration: none;
				color: white;
				font-size: 1.1rem;
				line-height: 1.5;
				margin-left: 1rem;
				&:hover {
					color: $green;
				}
			}
		}
	}
}

footer {
	background: $dark_gray;
	width: 100%;
	padding: 2rem 0;
	color: white;
	text-align: center;
	@include bold_font;
	p {
		margin: 0;
		font-size: .85rem;
	}
}

input[type="text"], input[type="email"], input[type="password"], textarea {
	width: 100%;
	margin-bottom: 1rem;
	border: 1px solid $light_gray;
	border-radius: .4rem;
}

input[type="text"], input[type="email"], input[type="password"] {
	height: 40px;
}

textarea {
	min-height: 200px;
}
```
```

```
![image](https://ws2.sinaimg.cn/large/006tKfTcgy1fpmwawsa0ej30vg0c4t9t.jpg)
![image](https://ws2.sinaimg.cn/large/006tKfTcgy1fpmwb72mkaj30ta0q6q4i.jpg)
![image](https://ws2.sinaimg.cn/large/006tKfTcgy1fpmwbdvzsij31kw0jbwfy.jpg)

```
app/views/layouts/application.html.haml
---
!!!
%html
%head
	%title NoteNote | Online Notebook Application
	= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true
	= javascript_include_tag 'application', 'data-turbolinks-track' => true
	= csrf_meta_tags
%body
	%header
		.header_inner
			= link_to "NoteNote", root_path, id: "logo"
			%nav
				- if user_signed_in?
					= link_to "New Note", new_note_path
					= link_to "Sign Out", destroy_user_session_path, method: :delete
				- else
					= link_to "Log In", new_user_session_path
	%p.notice= notice
	%p.alert= alert

	= yield
---
```
![image](https://ws3.sinaimg.cn/large/006tKfTcgy1fpmwmqedg5j31kw09udhi.jpg)
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmwmih1dqj31kw0ij0ut.jpg)

```
https://ged.com/
---
#banner
	.banner_content
		%h1 NoteNote
		%p 你的在线笔记本。再也不要忘记一个主意。
		%button= link_to "Sign Up", new_user_registration_path
#testimonial
	.wrapper
		%p.quote “最棒的笔记本应用程序”
		%p.name - 肖威
#callouts
	.callout_inner
		.wrapper
			.callout
				%h2 Notes
				%p Viral Echo Park Intelligentsia tattooed, craft beer organic authentic polaroid tousled mlkshk church-key. Fanny pack Banksy vegan  authentic Helvetica.

			.callout
				%h2 Notes
				%p Viral Echo Park Intelligentsia tattooed, craft beer organic authentic polaroid tousled mlkshk church-key. Fanny pack Banksy vegan  authentic Helvetica.

			.callout
				%h2 Notes
				%p Viral Echo Park Intelligentsia tattooed, craft beer organic authentic polaroid tousled mlkshk church-key. Fanny pack Banksy vegan  authentic Helvetica.
#bottom_cta
	.wrapper
		%h2 For Realz!
		%p I want you to sign up... If you don’t. I will find you!
		%button= link_to "点击注册!!!", new_user_registration_path

%footer
	%p &copy; SuperxSchool.com
```
```
app/views/notes/_form.html.haml
---
= simple_form_for @note do |f|
 = f.input :title
 = f.input :content
 = f.button :submit
---
app/views/notes/edit.html.haml
---
.wrapper_with_padding
	%h1 Edit Note

	= render 'form'

	= link_to "Cancel", note_path
---
app/views/notes/index.html.haml
---
.wrapper_with_padding
	#notes.clearfix
		- unless @notes.blank?
			- @notes.each do |note|
				%a{ href: (url_for [note])}
					.note
						%p.title= note.title
						%p.date= time_ago_in_words(note.created_at)
		- else
			%h2 Add a Note
			%p It appears you haven't created any notes yet... Lets fix that. Why don't you go ahead and create a new note.
			%button= link_to "New Note", new_note_path
---
app/views/notes/new.html.haml
---
.wrapper_with_padding
	%h1 Add A Note

	= render 'form'
---
app/views/notes/show.html.haml
---
.wrapper_with_padding
	#note_show
		%h1.title= @note.title
		%p= simple_format(@note.content)

		.buttons
			= link_to "Edit", edit_note_path(@note), class: "button"
			= link_to "Delete", note_path(@note), method: :delete, data: { confirm: "Are you sure?" }, class: "button"
---
```
```
git status
git add .
git commit -m "add all css stylesheet_link_tag"

```
![image](https://ws1.sinaimg.cn/large/006tKfTcgy1fpmyeqfjj1j31kw0q9nf2.jpg)
![image](https://ws3.sinaimg.cn/large/006tKfTcgy1fpmyejkifhj31kw0jxtog.jpg)
![image](https://ws4.sinaimg.cn/large/006tKfTcgy1fpmye1owejj31kw0i8jt4.jpg)
