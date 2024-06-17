<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.ConnectionProviderClass" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Post Details</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Source+Code+Pro:wght@400;500&display=swap" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Epilogue:wght@400;700&display=swap" />
    <link rel="stylesheet" href="styles.css" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

    <style>
        .breadcrumb {
            background: none;
            padding: 0;
        }
        .breadcrumb-item + .breadcrumb-item::before {
            content: ">";
        }
        .post-container {
            display: flex;
            flex-wrap: wrap;
            margin: 20px 0;
            max-width: 1200px;
            margin: 0 auto;
        }
        .post-image {
            flex: 1 1 50%;
            max-width: 50%;
            padding: 10px;
        }
        .post-image img {
            width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .post-content {
            flex: 1 1 50%;
            max-width: 50%;
            padding: 10px;
        }
        .post-content h1 {
            font-family: 'Epilogue', sans-serif;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
        .post-content p {
            font-family: 'Source Code Pro', monospace;
            font-size: 1.2rem;
            color: #555;
        }
        .post-date {
            font-family: 'Source Code Pro', monospace;
            font-size: 1rem;
            color: #999;
            margin-bottom: 10px;
        }
        .post-footer {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            padding: 10px 0;
            border-top: 1px solid #ddd;
        }
        .post-footer .likes-comments {
            display: flex;
            gap: 20px;
        }
        .post-footer .reach {
            font-family: 'Source Code Pro', monospace;
            color: #555;
        }
        .comment-section {
            margin-top: 20px;
        }
        .comment-section h2 {
            font-family: 'Epilogue', sans-serif;
            font-size: 2rem;
            margin-bottom: 10px;
        }
        .comment-section textarea {
            width: 100%;
            padding: 10px;
            font-family: 'Source Code Pro', monospace;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .comment-section button {
            padding: 10px 20px;
            font-family: 'Source Code Pro', monospace;
            font-size: 1rem;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
        }
        .like-button {
            border: none;
            background: none;
            cursor: pointer;
            color: #007bff;
        }
        .like-button i {
            font-size: 1.5rem;
        }
        .edge-image {
            position: fixed;
            width: 150px;
            height: auto;
            opacity: 0;
            transition: opacity 0.5s;
        }
        .edge-image.left {
            left: 0;
            bottom: 10%;
        }
        .edge-image.right {
            right: 0;
            bottom: 10%;
        }
        .visible {
            opacity: 1;
        }
        .comment {
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        .comment .comment-author {
            font-weight: bold;
        }
        .comment .comment-time {
            color: #999;
            font-size: 0.9rem;
        }
        .reply-button {
            cursor: pointer;
            background: none;
            border: none;
            color: #007bff;
            margin-top: 10px;
        }
    </style>
</head>
<body>
  <%@ include file="navbar.jsp" %>

  <div class="container">
    <!-- Breadcrumb Navigation -->
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
        <li class="breadcrumb-item"><a href="alumniAdventures.jsp">Alumni Adventures</a></li>
        <li class="breadcrumb-item active" aria-current="page">Post Details</li>
      </ol>
    </nav>
    
    <!-- Post Content -->
    <div class="post-container">
      <%
        int postId = Integer.parseInt(request.getParameter("id"));
        String title = "";
        String content = "";
        String image = "";
        int likes = 0;
        int commentsCount = 0;
        int reach = 0;
        String postTime = "";

        try {
          Connection con = ConnectionProviderClass.getCon();
          String query = "SELECT * FROM posts WHERE post_id=?";
          PreparedStatement ps = con.prepareStatement(query);
          ps.setInt(1, postId);
          ResultSet rs = ps.executeQuery();
          if (rs.next()) {
            title = rs.getString("title");
            content = rs.getString("post_content");
            image = rs.getString("post_image");
            likes = rs.getInt("likes");
            postTime = rs.getString("post_time");
            // Assuming you have a reach column in your posts table
            reach = rs.getInt("reach");
          }
          rs.close();

          String commentsQuery = "SELECT COUNT(*) AS count FROM comments WHERE post_id=?";
          ps = con.prepareStatement(commentsQuery);
          ps.setInt(1, postId);
          rs = ps.executeQuery();
          if (rs.next()) {
            commentsCount = rs.getInt("count");
          }
          rs.close();
          ps.close();
          con.close();
        } catch (Exception e) {
          e.printStackTrace();
        }
      %>
      <div class="post-image">
        <img src="<%= image %>" alt="<%= title %>">
      </div>
      <div class="post-content">
        <h1><%= title %></h1>
        <p class="post-date">Posted on: <%= postTime %></p>
        <p><%= content %></p>
      </div>
    </div>

    <!-- Post Footer -->
    <div class="post-footer">
      <div class="likes-comments">
        <button class="like-button" onclick="toggleLike()"><i class="far fa-heart"></i> <span id="like-count"><%= likes %></span> Likes</button>
        <span><i class="far fa-comments"></i> <%= commentsCount %> Comments</span>
      </div>
      <div class="reach">
        <span>Reached <%= reach %> people</span>
      </div>
    </div>

<!-- Comment Section -->
<div class="comment-section">
  <h2>Comments</h2>
  <div id="comments-container">
    <%
      try {
        Connection con = ConnectionProviderClass.getCon();
        String commentsQuery = "SELECT * FROM comments WHERE post_id=? ORDER BY comment_time DESC";
        PreparedStatement ps = con.prepareStatement(commentsQuery);
        ps.setInt(1, postId);
        ResultSet rs = ps.executeQuery();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        while (rs.next()) {
          String commentText = rs.getString("comment_text");
          String commentAuthor = rs.getString("user_email");
          Date commentTime = dateFormat.parse(rs.getString("comment_time"));
          long duration = now.getTime() - commentTime.getTime();
          String timeAgo = "";
          long diffInSeconds = TimeUnit.MILLISECONDS.toSeconds(duration);
          long diffInMinutes = TimeUnit.MILLISECONDS.toMinutes(duration);
          long diffInHours = TimeUnit.MILLISECONDS.toHours(duration);
          long diffInDays = TimeUnit.MILLISECONDS.toDays(duration);
          if (diffInSeconds < 60) {
            timeAgo = diffInSeconds + " seconds ago";
          } else if (diffInMinutes < 60) {
            timeAgo = diffInMinutes + " minutes ago";
          } else if (diffInHours < 24) {
            timeAgo = diffInHours + " hours ago";
          } else {
            timeAgo = diffInDays + " days ago";
          }
    %>
    <div class="comment">
      <p class="comment-author"><%= commentAuthor %></p>
      <p class="comment-time"><%= timeAgo %></p>
      <p><%= commentText %></p>
      <button class="reply-button" onclick="showReplyForm(<%= rs.getInt("comment_id") %>)">Reply</button>
      <div id="reply-form-<%= rs.getInt("comment_id") %>" style="display: none;">
        <textarea id="reply-text-<%= rs.getInt("comment_id") %>" rows="2" placeholder="Write your reply here..."></textarea>
        <button onclick="submitReply(<%= rs.getInt("comment_id") %>)">Submit Reply</button>
      </div>
    </div>
    <%
        }
        rs.close();
        ps.close();
        con.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    %>
  </div>
  <button id="show-comment-form" onclick="showCommentForm()">Leave a Comment</button>
  <div id="comment-form-container" style="display: none;">
    <textarea id="comment-text" rows="4" placeholder="Write your comment here..."></textarea>
    <button id="comment-button" onclick="submitComment()">Submit Comment</button>
  </div>
</div>

<script>
  function showReplyForm(commentId) {
    document.getElementById('reply-form-' + commentId).style.display = 'block';
  }

  function showCommentForm() {
    document.getElementById('show-comment-form').style.display = 'none';
    document.getElementById('comment-form-container').style.display = 'block';
  }

  function submitComment() {
    var commentText = document.getElementById('comment-text').value;
    if (commentText) {
      var commentData = {
        postId: <%= postId %>,
        commentText: commentText,
        userEmail: '<%= request.getUserPrincipal().getName() %>' // Assuming the user is logged in and their email is available
      };

      $.ajax({
        type: 'POST',
        url: 'submitComment.jsp',
        data: commentData,
        success: function(response) {
          var res = JSON.parse(response);
          if (res.status === 'success') {
            // Add the comment to the comments container
            var commentHtml = '<div class="comment"><p class="comment-author">' + commentData.userEmail + '</p><p class="comment-time">Just now</p><p>' + commentData.commentText + '</p><button class="reply-button" onclick="showReplyForm(' + res.commentId + ')">Reply</button><div id="reply-form-' + res.commentId + '" style="display: none;"><textarea id="reply-text-' + res.commentId + '" rows="2" placeholder="Write your reply here..."></textarea><button onclick="submitReply(' + res.commentId + ')">Submit Reply</button></div></div>';
            document.getElementById('comments-container').insertAdjacentHTML('afterbegin', commentHtml);
            document.getElementById('comment-text').value = '';
          } else {
            alert('Failed to submit comment.');
          }
        }
      });
    }
  }

  function submitReply(commentId) {
    var replyText = document.getElementById('reply-text-' + commentId).value;
    if (replyText) {
      var replyData = {
        postId: <%= postId %>,
        commentText: replyText,
        userEmail: '<%= request.getUserPrincipal().getName() %>', // Assuming the user is logged in and their email is available
        replyTo: commentId
      };

      $.ajax({
        type: 'POST',
        url: 'submitComment.jsp',
        data: replyData,
        success: function(response) {
          var res = JSON.parse(response);
          if (res.status === 'success') {
            // Add the reply to the comment
            var replyHtml = '<div class="comment reply"><p class="comment-author">' + replyData.userEmail + '</p><p class="comment-time">Just now</p><p>' + replyData.commentText + '</p></div>';
            document.getElementById('reply-form-' + commentId).insertAdjacentHTML('beforebegin', replyHtml);
            document.getElementById('reply-form-' + commentId).style.display = 'none';
            document.getElementById('reply-text-' + commentId).value = '';
          } else {
            alert('Failed to submit reply.');
          }
        }
      });
    }
  }
</script>

    function toggleLike() {
      var likeCountElement = document.getElementById('like-count');
      var likeCount = parseInt(likeCountElement.textContent);
      var likeButton = document.querySelector('.like-button i');

      if (likeButton.classList.contains('far')) {
        likeButton.classList.remove('far');
        likeButton.classList.add('fas');
        likeCount++;
      } else {
        likeButton.classList.remove('fas');
        likeButton.classList.add('far');
        likeCount--;
      }
      likeCountElement.textContent = likeCount;

      // Here you can send an AJAX request to the server to update the like count in the database
    }

    function submitComment() {
      var commentText = document.getElementById('comment-text').value;
      if (commentText) {
        var commentData = {
          postId: <%= postId %>,
          commentText: commentText,
          userEmail: '<%= request.getUserPrincipal().getName() %>' // Assuming the user is logged in and their email is available
        };

        $.ajax({
          type: 'POST',
          url: 'submitComment.jsp',
          data: commentData,
          success: function(response) {
            var res = JSON.parse(response);
            if (res.status === 'success') {
              // Add the comment to the comments container
              var commentHtml = '<div class="comment"><p class="comment-author">' + commentData.userEmail + '</p><p class="comment-time">Just now</p><p>' + commentData.commentText + '</p><button class="reply-button" onclick="showReplyForm(' + res.commentId + ')">Reply</button><div id="reply-form-' + res.commentId + '" style="display: none;"><textarea id="reply-text-' + res.commentId + '" rows="2" placeholder="Write your reply here..."></textarea><button onclick="submitReply(' + res.commentId + ')">Submit Reply</button></div></div>';
              document.getElementById('comments-container').insertAdjacentHTML('afterbegin', commentHtml);
              document.getElementById('comment-text').value = '';
            } else {
              alert('Failed to submit comment.');
            }
          }
        });
      }
    }

    function showReplyForm(commentId) {
      document.getElementById('reply-form-' + commentId).style.display = 'block';
    }

    function submitReply(commentId) {
      var replyText = document.getElementById('reply-text-' + commentId).value;
      if (replyText) {
        var replyData = {
          postId: <%= postId %>,
          commentText: replyText,
          userEmail: '<%= request.getUserPrincipal().getName() %>', // Assuming the user is logged in and their email is available
          replyTo: commentId
        };

        $.ajax({
          type: 'POST',
          url: 'submitComment.jsp',
          data: replyData,
          success: function(response) {
            var res = JSON.parse(response);
            if (res.status === 'success') {
              // Add the reply to the comment
              var replyHtml = '<div class="comment reply"><p class="comment-author">' + replyData.userEmail + '</p><p class="comment-time">Just now</p><p>' + replyData.commentText + '</p></div>';
              document.getElementById('reply-form-' + commentId).insertAdjacentHTML('beforebegin', replyHtml);
              document.getElementById('reply-form-' + commentId).style.display = 'none';
              document.getElementById('reply-text-' + commentId).value = '';
            } else {
              alert('Failed to submit reply.');
            }
          }
        });
      }
    }

    window.addEventListener('scroll', function() {
      var edgeImages = document.querySelectorAll('.edge-image');
      if (window.scrollY > 100) {
        edgeImages.forEach(function(img) {
          img.classList.add('visible');
        });
      } else {
        edgeImages.forEach(function(img) {
          img.classList.remove('visible');
        });
      }
    });
  </script>
</body>
</html>
