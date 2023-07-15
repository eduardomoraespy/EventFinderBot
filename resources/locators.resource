*** Variables ***

&{eventbrite}
...    url=https://www.eventbrite.com/signin/?referrer=%2F
...    home=https://www.eventbrite.com/
...    user_email=id:email
...    user_pwd=id:password
...    btn_login=xpath://button[@data-automation="signin-submit-button"]
...    btn_go_to_site=xpath://button[text()="Go to Log in"]
...    input_populan_in=xpath://*[@id="locationPicker"]
...    tab_all=xpath://*[@id="tab0"]/button
...    btn_view_more=xpath://div[@class="eds-g-cell eds-g-cell-6-12 eds-g-cell-sw-4-12"]/a
...    link=xpath://a[@class="see-more-link eds-link--neutral eds-text--right eds-g-cell eds-g-cell-3-12 eds-show-up-sm"]
