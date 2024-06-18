# OdinBook

## Introduction

This project is a significant milestone where I showcase my proficiency in building Rails applications, modeling data, and working with forms. The goal is to create a social media site clone, such as Facebook, Twitter, Myspace, or Threads. While the styling and front-end are optional, I focus mostly on implementing the core backend features like users, profiles, posts, following, and liking.

## Assignment

Build a functional social media site with the following features:

- User authentication with Devise
- User profiles with profile pictures
- Ability to follow other users
- Create, like, and comment on posts
- Display posts with content, author, comments, and likes
- Index pages for posts and users
- Welcome emails for new users

Extra Credit:

- Image uploads for posts
- Use Active Storage for profile pictures
- Polymorphic associations for posts
- Enhanced styling

## Features

### Core Features

1. **User Authentication**:

   - Use Devise for user authentication.
   - Users must sign in to access the site.

2. **User Profiles**:

   - Users can create profiles with a profile picture.
   - Display profile information, profile photo, and user posts on the profile page.

3. **Posts**:

   - Users can create text posts.
   - Users can like and comment on posts.
   - Display post content, author, comments, and likes.
   - Index page for posts showing recent posts from the user and their followed users.

4. **Following**:

   - Users can send follow requests to other users.
   - Index page for users with buttons to follow/unfollow users.

5. **Mailers**:
   - Send a welcome email to new users using the letter_opener gem for development.

### Extra Credit Features

- **Image Posts**: Allow posts to include images via URL or upload.
- **Active Storage**: Enable users to upload profile photos.
- **Polymorphic Associations**: Allow posts to be either text or photos while maintaining likes and comments.
- **Styling**: Enhance the visual appeal with CSS and HTML.

## Getting Started

### Data Architecture

1. **Plan Your Models and Associations**:

   - Users, Profiles, Posts, Likes, Comments, Follow Requests, etc.

2. **Set Up the Rails App**:
   - Create a new PostgreSQL Rails app:
     ```bash
     rails new odinbook --database=postgresql
     ```
   - Initialize the Git repository and update the README with a link to this page.

### Development Steps

1. **User Authentication**:

   - Add Devise to your Gemfile and set up Devise for user authentication.
   - Configure routes and views for user sign-up, login, and profile management.

2. **User Profiles**:

   - Generate a Profile model and associate it with the User model.
   - Implement profile picture upload using Active Storage.

3. **Posts and Comments**:

   - Generate Post and Comment models.
   - Set up associations between Users, Posts, and Comments.
   - Implement CRUD actions for posts and comments.

4. **Following System**:

   - Generate a FollowRequest model.
   - Implement functionality for sending, accepting, and declining follow requests.
   - Display follower/following lists on user profiles.

5. **Mailers**:
   - Set up Action Mailer for sending welcome emails.
   - Use letter_opener gem to test emails in development.
   <!--
6. **Testing**:

   - Write integration tests to ensure pages load correctly.
   - Write unit tests for models and associations.
   - Use Guard to run tests continuously. -->

7. **Styling and Deployment**:
   - Style the application using CSS and HTML.
   - Deploy the application to a hosting provider.
   - Set up an email provider for sending real emails in production.

## Conclusion

This project is a comprehensive test of your Rails skills, covering everything from authentication to complex model associations. By completing this project, i have a solid understanding of building a full-featured web application and a great addition to your portfolio.

Thank you for joining me on this journey!
