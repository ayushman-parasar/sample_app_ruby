## Notes

rails generate controller StaticPages home help
here home and help are actions and StaticPages can be written in snake_casing 

### undoing things
to undo genration use rails destroy controller StaticPages home help
to undo migration -->

-- single migration : rails db:roadblock

-- to go to beginning : rails db:migrate VERSION=0

*** routes file is responsible for implementing the router  that defines correspondence between URLS and the web pages ***

### Testing

In
other words, a test like test "should get home" 
```
do 
  get static_pages_home_url
  assert_response :success
end

```
***says*** “Let’s test the Home page by issuing a GET request to the Static Pages
home URL and then making sure we receive a ‘success’ status code  (200 code) in re-
sponse.”


To include stylesheets we use a function call
```
stylesheet_link_tag 'application', media:'all', 'data-turbolinks-track':'reload'

```
***same as***

```
stylesheet_link_tag('application', media:'all', 'data-turbolinks-track':'reload')

```
***same as***
```
<% =stylesheet_link_tag('application', {media:'all', 'data-turbolinks-track':'reload'}) %>

```
Here <i>application</i> is the string indicating the path to the stylesheet
and the hash with two elements indicates the media type and tells Rails to use turbolink feature

***NOTE: when hashes are last argument parenthesis are optional*** 

```
<%= link_to image_tag("rails.svg", alt:"Rails Logo", width:"200"), "https://rubyonrails.org" %>

```
In the  above code the image_tag helper function when called will look automatically in the ***app/assets/images/  directory*** using the asset pipeline
It is same as

```
<img alt="Rails logo" width="200px" src="/assets/rails-<long string>.svg">

``` 
in the browser.Here assets directory common to all assets (images, JavaScript, CSS, etc.).

bootstrap use:
for using bootstrap we need to install bootstrap-sass gem file 
require bootstrap-sprockets and bootstrap in the scss file

### Using Patials
partials start with _ (underscore)
gle call to a Rails helper called render :
<%= render 'layouts/shim' %> looks for a file app/views/layouts/_shim.html.erb

## Asset Pipeline

### Rails asset pipeline automatically uses SASS to process files .scss extension

|asset directories|manifest files|preprocessor engines

asset directories:
-app/assets: assets specific to the present application

manifest file:
-is used to tell Rails how to combine all the assets into a single file
-Sprockets:
  Sprockets is a Ruby library for compiling and serving web assets. Sprockets allows to organize an application’s JavaScript files into smaller more manageable chunks that can be distributed over a number of directories and files. It provides structure and practices on how to include assets in our projects.

  Using directives at the start of each JavaScript file, Sprockets can determine which files a JavaScript file depends on. When it comes to deploying your application, Sprockets then uses these directives to turn your multiple JavaScript files into a single file for better performance**

*** In particular, the asset pipeline combines all the application stylesheets into one CSSfile ( application.css ) and then minifies it to remove the unnecessary spac-
ing and indentation that bloats file size. ***

### Named Routes

get "static_pages#home"

To get named routes :

get "/home" to:"static_pages#home" --> creates named routes as
- home_path("/") and 
- home_url("localhost:3000/")

the common convention of using the _path
form except when doing redirects, where we’ll use the _url form. (This is be-
cause the HTTP standard technically requires a full URL after redirects, though
in most browsers it will work either way.)