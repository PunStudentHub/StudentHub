# Punahou Student Hub

---

The Punahou Student Hub is a way for students to get informed about what's happening on campus, regarding announcements, campus events, clubs, the peer learning center, and much much more. The site is live [here.](https://punahoustudenthub.herokuapp.com)

---

### To-Do List

We are always looking for new ideas. If you have one, don't hesitate to contact one of our [admins](https://punahoustudenthub.herokuapp.com/staff)

#### Long-term features
- Club info and contact information, linked with events
- Time management system with scheduler
- Marketplace for people to sell textbooks and other stuff
- Lunch menus


#### Small stuff we want to add and fix
- Better filtering for announcements
- Better date/time input in events
- Put the cycle day / time on the front page

We also have a [blog](https://punahoustudenthub.herokuapp.com/blog) where talk about a variety of things. Please check it out!

---

### Contributing

We're open source, and welcome contributions (if you know Ruby on Rails, which is kinda a pre-requisite)

Steps to install:

0. Install Ruby 2.4.4 and `$ gem install rails`
1. Fork the repository
2. Clone it to your local system
3. Run the following:
 * `$ bundle install`
 * `$ rails db:migrate`
4. Import the sample data
 * `$ rake classyear:load`
 * `$ rake plc:import`
 * `$ rake role:generate`
5. `$ rails server`, then go to http://localhost:3000 in your browser
6. Enjoy!
