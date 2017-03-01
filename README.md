# review_redirect
review redirect with csv

## Installation
execute:
```bash
$ bundle
```

edit example.csv:

|original_domain      |  original_path  |  redirect_domain          |  redirect_path  |
|---------------------|-----------------|---------------------------|-----------------|
|https://example.com  |       /a/       |  https://www.example.com  |  /b/            |

start script:
```bash
$ bundle exec ruby main.rb
```

example output:
```bash
>>> WRONG <<<
original_url: https://example.com/a/
redirect_url: https://www.example.com/b/
status: 404 Not Found
csv_line: 2
>>>>>><<<<<<
```
