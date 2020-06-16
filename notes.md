# Notes

rails generate controller StaticPages home help
here home and help are actions and StaticPages can be written in snake_casing

### Bundler

- Bundler finds out all the versions of the gems (listed in the gem list) that can work together.
- Bundler's resolver uses a lot of tricks and shortcuts to priortize which gem version to use first
- After finding the versions that work together, Bundler records the exact versions of every gem into another file, named Gemfile.lock.
<br><i>This lock file is what makes it possible to install the exact same versions on to every machine that runs this application, whether that machine belongs to a developer, a production server, or a CI server.</i>

Bundler works in two seperate steps-->
1.bunlde install
  - Read the Gemfile and (.lock if there)
  - Makes a list of every version of every gem you want
  - If needed, find gem versions allowed by the Gemfile that work together
  - If found, write down those versions in the lock for future installs
  - Install gem as needed untill every gem in the lock is installed

2. bundle exec
  It is just setting up Ruby to load gems that are already installed and
  it doesn't install gems if any are missing
  - Read the Gemfile (and lock, if it's there)
  - If needed, find gem versions allowed by the Gemfile that work together
  - If found, write down those versions in the lock for future installs
  - Remove any existing gems from the $LOAD_PATH array
  - Add each gem version listed in the lock file to the $LOAD_PATH

*** refernce is from 2015: https://www.cloudcity.io/blog/2015/07/10/how-bundler-works-a-history-of-ruby-dependency-management/  ***

- When to use bundle exec? 
<br>
whenever you want to execute a script using the gems in the script gemfile rather than the sytem-wide gemfile you have

### undoing things

to undo genration use rails destroy controller StaticPages home help
to undo migration -->

-- single migration : rails db:roadblock

-- to go to beginning : rails db:migrate VERSION=0

**_ routes file is responsible for implementing the router that defines correspondence between URLS and the web pages _**

### Testing

In
other words, a test like test "should get home"

```
do
  get static_pages_home_url
  assert_response :success
end

```

**_says_** “Let’s test the Home page by issuing a GET request to the Static Pages
home URL and then making sure we receive a ‘success’ status code (200 code) in re-
sponse.”

To include stylesheets we use a function call

```
stylesheet_link_tag 'application', media:'all', 'data-turbolinks-track':'reload'

```

**_same as_**

```
stylesheet_link_tag('application', media:'all', 'data-turbolinks-track':'reload')

```

**_same as_**

```
<% =stylesheet_link_tag('application', {media:'all', 'data-turbolinks-track':'reload'}) %>

```

Here <i>application</i> is the string indicating the path to the stylesheet
and the hash with two elements indicates the media type and tells Rails to use turbolink feature

**_NOTE: when hashes are last argument parenthesis are optional_**

```
<%= link_to image_tag("rails.svg", alt:"Rails Logo", width:"200"), "https://rubyonrails.org" %>

```

In the above code the image*tag helper function when called will look automatically in the \*\*\_app/assets/images/ directory*\*\* using the asset pipeline
It is same as

```
<img alt="Rails logo" width="200px" src="/assets/rails-<long string>.svg">

```

in the browser.Here assets directory common to all assets (images, JavaScript, CSS, etc.).

bootstrap use:
for using bootstrap we need to install bootstrap-sass gem file
require bootstrap-sprockets and bootstrap in the scss file

### Using Patials

partials start with \_ (underscore)
gle call to a Rails helper called render :
<%= render 'layouts/shim' %> looks for a file app/views/layouts/\_shim.html.erb

## Asset Pipeline

### Rails asset pipeline automatically uses SASS to process files .scss extension

|asset directories|manifest files|preprocessor engines

asset directories:
-app/assets: assets specific to the present application

manifest file:
-is used to tell Rails how to combine all the assets into a single file
-Sprockets:
Sprockets is a Ruby library for compiling and serving web assets. Sprockets allows to organize an application’s JavaScript files into smaller more manageable chunks that can be distributed over a number of directories and files. It provides structure and practices on how to include assets in our projects.

Using directives at the start of each JavaScript file, Sprockets can determine which files a JavaScript file depends on. When it comes to deploying your application, Sprockets then uses these directives to turn your multiple JavaScript files into a single file for better performance\*\*

**_ In particular, the asset pipeline combines all the application stylesheets into one CSSfile ( application.css ) and then minifies it to remove the unnecessary spac-
ing and indentation that bloats file size. _**

### Named Routes

get "static_pages#home"

To get named routes :

get "/home" to:"static_pages#home" --> creates named routes as

- home_path("/") and
- home_url("localhost:3000/")

the common convention of using the \_path
form except when doing redirects, where we’ll use the \_url form. (This is be-
cause the HTTP standard technically requires a full URL after redirects, though
in most browsers it will work either way.)

### routes
Now when a user visits http://localhost:3000/articles then Rails will read config/routes.rb and Rails will start looking for any pattern matching /articles.
in config/routes if we have
```
  get "/articles" ,to:"articles#list"
```
Then Rails will see articles#list. Here Rails will split that string into two parts - articles & list. articles means invoke controller named ArticlesController and list means in that controller invoke action named list.