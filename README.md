# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


 新建项目&配置相关环境
 ```
 rails new master_rails_by_actions --skip-bunble --skip-puma --skip-turbolinks

 bundled install

 rails db:create

 rails server -p 3003
 # 浏览器访问是否成功
 http://localhost:3003/

 # Gemfile添加
 gem 'bootstrap-sass'
 gem 'font-awesome-rails'
 gem 'sorcery'
 
 # 安装
 rails g  sorcery:install

 rails generate sorcery:install user_activation reset_password  remember_me --only-submodules

 ```


编写 User 模型
rails g controller welcome

从 model 开始

用户注册和登录功能的开发

Model 部分
```
class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :password, :password_confirmation

  validates_presence_of :email, massage: "email cannot be nil!"
  validates :email, uniqueness: true

  validates_presence_of :password,massage: "password cannot be empty" 
    if: :need_validate_password
  validates_presence_of :password_confirmation, ,massage: "Password confirmation cannot be empty"
    if: :need_validate_password
  validates_confirmation_of :password, massage: "password inconsistency"
    if: :need_validate_password
  validates_length_of :password,massage: "The minimum password is 6 digits", minimum: 6
    if: :need_validate_password

  private
  def need_validate_password
    self.new_record? || 
    (!self.password.nil? || !self.password_confirmation.nil?)
  end


end

```

设置路由
```
Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :sessions
end
```

controller
users
```
class UsersController < ActionController

	def new
	end

	def create
	end

end
```
session
```
class SessionsController < ActionController

	def new
	end

	def create
	end

end
```


view











