app.edit_profile_url
app.edit_profile_path

app.publisher_url(id: 1)

app.url_for(app.edit_profile_path)

app.url_for(controller: :profiles, action: :edit)

app.url_for(controller: :profiles, action: :edit, id: 1234, detailed: 'true')

helper.link_to('edit profile', app.edit_profile_path)

link_to('profile link', controller: :profiles, action: :edit, id: 1234, detailed: 'true')

helper.time_ago_in_words(Time.current + 3.days)

helper.number_with_delimiter 123412341234, delimiter: '@'
