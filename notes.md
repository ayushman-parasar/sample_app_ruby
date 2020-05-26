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