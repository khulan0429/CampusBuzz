<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Min's Story - Alumni Adventures</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Source+Code+Pro:wght@400;500&display=swap" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Epilogue:wght@400;700&display=swap" />
    <link rel="stylesheet" href="middle.css" />
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
    </style>
</head>
<body>
  <%@ include file="navbar.jsp" %>

  <div class="container">
    <!-- Breadcrumb Navigation -->
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.jsp">Alumni Adventures</a></li>
        <li class="breadcrumb-item active" aria-current="page">Study room Locations</li>
      </ol>
    </nav>
    
    <!-- Post Content -->
    <div class="post-container">
      <div class="post-image">
        <img src="images/as.png" alt="Min's Image">
      </div>
      <div class="post-content">
        <h1>Study room locations</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ac libero et mauris tristique blandit at ut metus. Nulla facilisi. Duis efficitur urna at scelerisque dictum. Sed nec orci eros. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer sit amet est non eros commodo cursus. Maecenas at leo ex. In hac habitasse platea dictumst.</p>
        <p>Quisque vel urna eu turpis vulputate auctor. Vivamus quis dolor magna. Nunc interdum, ligula nec egestas vehicula, nulla purus facilisis urna, nec feugiat mi erat sed risus. Sed sit amet diam tellus. Duis sit amet varius lorem. In vel ante sit amet neque sodales consequat. Nulla facilisi. Duis tempus lacus non ex cursus, ut tincidunt dui convallis.</p>
      </div>
    </div>

    <!-- Post Footer -->
    <div class="post-footer">
      <div class="likes-comments">
        <button class="like-button"><i class="far fa-heart"></i> <span id="like-count">33</span> Likes</button>
        <span><i class="far fa-comments"></i> 10 Comments</span>
      </div>
      <div class="reach">
        <span>Reached 100 people</span>
      </div>
    </div>

    <!-- Comment Section -->
    <div class="comment-section">
      <h2>Leave a Comment</h2>
      <textarea id="comment-text" rows="4" placeholder="Write your comment here..."></textarea>
      <button id="comment-button">Submit Comment</button>
    </div>
  </div>

  <!-- Edge Images -->
  <img src="images/a.png" class="edge-image left" alt="Left Decorative Image">
  <img src="images/b.png" class="edge-image right" alt="Right Decorative Image">



  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

  <script>
    document.getElementById('comment-button').addEventListener('click', function() {
      var commentText = document.getElementById('comment-text').value;
      if (commentText) {
        alert('Comment submitted: ' + commentText);
        document.getElementById('comment-text').value = '';
      }
    });

    document.querySelector('.like-button').addEventListener('click', function() {
      var likeCountElement = document.getElementById('like-count');
      var likeCount = parseInt(likeCountElement.textContent);
      if (this.querySelector('i').classList.contains('far')) {
        this.querySelector('i').classList.remove('far');
        this.querySelector('i').classList.add('fas');
        likeCount++;
      } else {
        this.querySelector('i').classList.remove('fas');
        this.querySelector('i').classList.add('far');
        likeCount--;
      }
      likeCountElement.textContent = likeCount;
    });

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
