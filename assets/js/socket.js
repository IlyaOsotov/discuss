import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})
socket.connect()

const createSocket = (topicId) => {
  let channel = socket.channel(`comments:${topicId}`, {})
  channel.join()
    .receive("ok", resp => {
      renderComments(resp.comments);
    })
    .receive("error", resp => {
      console.log("Unable to join", resp);
    });

  channel.on(`comments:${topicId}:new`, renderComment)

  document.getElementById('submit-comment').addEventListener('click', () => {
    const content = document.getElementById('new-comment').value;
    document.getElementById('new-comment').value = '';

    channel.push('comment:add', { content: content });
  });
}

function renderComment(event) {
  const renderedComment = commentTemplate(event.comment);

  document.querySelector('.collection').innerHTML += renderedComment;
}

function commentTemplate(comment) {
  let nickname = 'Anonymous';
  if (comment.user) {
    nickname = comment.user.nickname;
  }
  
  return `
    <li class="collection-item">
      ${comment.content}
      <div class="secondary-content">
        ${nickname}
      </div>
    </li>
  `;
}

function renderComments(comments) {
  const renderedComments = comments.map(comment => {
    return commentTemplate(comment);
  });

  document.querySelector('.collection').innerHTML = renderedComments.join('')
};

window.createSocket = createSocket;
